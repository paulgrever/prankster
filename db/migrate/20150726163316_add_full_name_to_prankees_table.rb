class AddFullNameToPrankeesTable < ActiveRecord::Migration
  def change
    add_column :prankees, :full_name, :string
  end
end
