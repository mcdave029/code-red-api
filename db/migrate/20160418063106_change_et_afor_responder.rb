class ChangeEtAforResponder < ActiveRecord::Migration
  def change
    remove_column :responders, :eta, :datetime
    add_column :responders, :eta, :integer
  end
end
