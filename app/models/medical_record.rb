# == Schema Information
#
# Table name: medical_records
#
#  blood_type         :string
#  created_at         :datetime         not null
#  id                 :integer          not null, primary key
#  medical_conditions :text
#  respondee_id       :integer
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_medical_records_on_respondee_id  (respondee_id)
#
# Foreign Keys
#
#  fk_rails_31fb048a3f  (respondee_id => respondees.id)
#

class MedicalRecord < ActiveRecord::Base
  belongs_to :respondee
end
