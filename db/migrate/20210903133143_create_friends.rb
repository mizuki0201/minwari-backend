class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :from, foreign_key: { to_table: :users }
      t.references :to, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
