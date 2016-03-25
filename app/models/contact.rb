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
  scope :criminal_contacts, -> { where(:classification => 'Criminal' ) }
  scope :medical_contacts, -> { where(:classification => 'Medical' ) }
	belongs_to :user
	
  CLASSIFICATIONS = %w{
    Criminal
    Medical
  }
  
  validates :classification, presence: true, inclusion: { in: CLASSIFICATIONS }

  CLASSIFICATIONS.each do |c|
    define_method "#{c.downcase}?".to_sym do
      self.classification == c
    end
  end

end
