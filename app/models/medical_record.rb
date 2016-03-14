# == Schema Information
#
# Table name: medical_records
#
#  blood_type         :string
#  created_at         :datetime         not null
#  id                 :integer          not null, primary key
#  medical_conditions :text
#  updated_at         :datetime         not null
#  user_id            :integer
#
# Indexes
#
#  index_medical_records_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_80702377c3  (user_id => users.id)
#

class MedicalRecord < ActiveRecord::Base
	belongs_to :user
end
