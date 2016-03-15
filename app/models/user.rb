# == Schema Information
#
# Table name: users
#
#  avatar_content_type    :string
#  avatar_file_name       :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  contact                :string
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :integer          not null, primary key
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  updated_at             :datetime         not null
#  user_type              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ 

	has_many :emergency_contacts, class_name: "Contact" , dependent: :destroy
	has_one :medical_record, dependent: :destroy

	USER_TYPES = %w{
    Responder
    Respondee
  }
  
  validates :user_type, presence: true, inclusion: { in: USER_TYPES }

  USER_TYPES.each do |type|
    define_method "#{type.downcase}?".to_sym do
      self.user_type == type
    end
  end

end
