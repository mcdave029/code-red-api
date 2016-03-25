# == Schema Information
#
# Table name: reports
#
#  address        :string
#  classification :string
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  lat            :string
#  lng            :string
#  name           :string
#  status         :string
#  updated_at     :datetime         not null
#  user_id        :integer
#
# Indexes
#
#  index_reports_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_c7699d537d  (user_id => users.id)
#

class Report < ActiveRecord::Base
  belongs_to :user
end
