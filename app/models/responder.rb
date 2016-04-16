# == Schema Information
#
# Table name: responders
#
#  contact    :string
#  created_at :datetime         not null
#  eta        :datetime
#  id         :integer          not null, primary key
#  report_id  :integer
#  updated_at :datetime         not null
#
# Indexes
#
#  index_responders_on_report_id  (report_id)
#
# Foreign Keys
#
#  fk_rails_0aac4665c1  (report_id => reports.id)
#

class Responder < ActiveRecord::Base
  belongs_to :report
end
