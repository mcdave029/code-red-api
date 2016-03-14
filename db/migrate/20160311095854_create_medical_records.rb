class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.references :user, index: true, foreign_key: true
      t.string :blood_type
      t.text :medical_conditions

      t.timestamps null: false
    end
  end
end
