class AddEtaToUser < ActiveRecord::Migration
  def change
    add_column :users, :estimated_time_of_arrival, :datetime
  end
end
