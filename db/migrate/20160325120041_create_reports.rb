class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :lat
      t.string :lng
      t.string :address
      t.string :classification
      t.string :status

      t.timestamps null: false
    end
  end
end
