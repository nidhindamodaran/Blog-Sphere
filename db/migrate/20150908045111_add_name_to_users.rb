class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mob, :string
    add_column :users, :age, :string
  end
end
