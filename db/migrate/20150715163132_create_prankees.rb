class CreatePrankees < ActiveRecord::Migration
  def change
    create_table :prankees do |t|
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.timestamps null: false
    end
  end
end
