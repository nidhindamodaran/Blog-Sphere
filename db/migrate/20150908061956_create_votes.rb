class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voter
      t.integer :vote
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
