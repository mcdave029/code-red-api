class ChangeReportLatLng < ActiveRecord::Migration
  def change
  	remove_column	:reports, :lat, :float
  	remove_column	:reports, :lng, :float
  	add_column		:reports, :longitude, :float
  	add_column		:reports, :latitude, :float
  end
end
