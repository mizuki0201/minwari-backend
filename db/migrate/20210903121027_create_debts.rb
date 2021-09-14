class CreateDebts < ActiveRecord::Migration[6.0]
  def change
    create_table :debts do |t|
      t.integer :price, null: false
      t.references :from, foreign_key: { to_table: :users }
      t.references :to, foreign_key: { to_table: :users }
      t.references :group, foreign_key: true
      t.references :event, foreign_key: true
      t.references :expence, foreign_key: true
      t.timestamps
    end
  end
end
