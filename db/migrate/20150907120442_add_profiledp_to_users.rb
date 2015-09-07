class AddProfiledpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profiledp, :string
  end
end
