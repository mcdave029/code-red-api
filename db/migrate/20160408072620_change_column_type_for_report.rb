class ChangeColumnTypeForReport < ActiveRecord::Migration
  def change
  	remove_column :reports, :lat, :string
  	remove_column :reports, :lng, :string
  	add_column 		:reports, :lat, :float
  	add_column 		:reports, :lng, :float
  end
end
