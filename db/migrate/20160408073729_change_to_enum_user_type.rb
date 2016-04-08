class ChangeToEnumUserType < ActiveRecord::Migration
  def change
  	remove_column	:users, :user_type, :string
  	add_column		:users, :user_type, :integer
  end
end
