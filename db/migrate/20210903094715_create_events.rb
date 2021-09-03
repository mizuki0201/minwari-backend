class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.date :date, null: false
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
