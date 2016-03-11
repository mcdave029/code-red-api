class CreateRespondees < ActiveRecord::Migration
  def change
    create_table :respondees do |t|

      t.timestamps null: false
    end
  end
end
