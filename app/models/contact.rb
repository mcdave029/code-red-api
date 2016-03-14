# == Schema Information
#
# Table name: contacts
#
#  classification :string
#  contact        :string
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  name           :string
#  updated_at     :datetime         not null
#  user_id        :integer
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_8d2134e55e  (user_id => users.id)
#

class Contact < ActiveRecord::Base
	belongs_to :user
end
