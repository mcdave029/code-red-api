# == Schema Information
#
# Table name: contacts
#
#  classification :string
#  contact        :string
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  name           :string
#  respondee_id   :integer
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_contacts_on_respondee_id  (respondee_id)
#
# Foreign Keys
#
#  fk_rails_1025023e16  (respondee_id => respondees.id)
#

class Contact < ActiveRecord::Base
  belongs_to :respondee
end
