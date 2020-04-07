class CreateThings < ActiveRecord::Migration[5.2]
  def change
    create_table :things do |t|
      t.string :content
      t.date :deadline
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
