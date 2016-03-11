class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :respondee, index: true, foreign_key: true
      t.string :classification
      t.string :name
      t.string :contact

      t.timestamps null: false
    end
  end
end
