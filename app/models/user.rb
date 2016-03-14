# == Schema Information
#
# Table name: users
#
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  contact             :string
#  created_at          :datetime         not null
#  id                  :integer          not null, primary key
#  name                :string
#  updated_at          :datetime         not null
#  user_type           :string
#

class User < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ 

	has_many :emergency_contacts, class_name: "Contact" , dependent: :destroy
	has_one :medical_record, dependent: :destroy

	USER_TYPES = %w{
    Responder
    Respondee
  }

  USER_TYPES.each do |type|
    define_method "#{type.downcase}?".to_sym do
      self.user_type == type
    end
  end

end
