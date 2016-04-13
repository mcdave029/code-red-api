class AddIsReportAndChangeAttr < ActiveRecord::Migration
  def change
  	remove_column :reports, :status, 		:string
  	add_column 		:reports, :is_report, :boolean, default: false
  	add_column 		:reports, :status, 		:integer, default: 0
  end
end
