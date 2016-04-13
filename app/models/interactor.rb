# == Schema Information
#
# Table name: interactors
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  report_id  :integer
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_interactors_on_report_id  (report_id)
#  index_interactors_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_146a12f223  (report_id => reports.id)
#  fk_rails_f3806fd3c2  (user_id => users.id)
#

class Interactor < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
end
