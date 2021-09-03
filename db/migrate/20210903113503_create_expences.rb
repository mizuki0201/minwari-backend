class CreateExpences < ActiveRecord::Migration[6.0]
  def change
    create_table :expences do |t|
      t.string :title, null: false
      t.text :description
      t.integer :price, null: false
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
