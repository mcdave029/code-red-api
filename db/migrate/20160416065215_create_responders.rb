class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.references :report, index: true, foreign_key: true
      t.datetime :eta
      t.string :contact

      t.timestamps null: false
    end
  end
end
