# == Schema Information
#
# Table name: reports
#
#  address        :string
#  classification :string
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  is_report      :boolean          default(FALSE)
#  latitude       :float
#  longitude      :float
#  name           :string
#  status         :integer          default(0)
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
	after_validation :reverse_geocode
	reverse_geocoded_by :latitude, :longitude, :location => :address
	
	enum status: { open: 0, closed: 1 }
  
  has_many :interactors
  has_many :responders, through: :interactors, source: :user
  belongs_to :respondee, class_name: "User", foreign_key: "user_id"

  def availability
  	responders.count < 3
  end

  def self.location_sort(lat,lng)
  	Report.near([lat, lng], 10) #miles away
  end
end
