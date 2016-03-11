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
#

class User < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
	self.inheritance_column = :user_type

	def self.user_types
		%w{Responder Respondee}
	end

	validates :user_type, :inclusion => { :in => self.user_types }
end
