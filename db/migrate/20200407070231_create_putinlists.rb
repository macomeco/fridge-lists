class CreatePutinlists < ActiveRecord::Migration[5.2]
  def change
    create_table :putinlists do |t|
      t.references :list, foreign_key: true
      t.references :thing, foreign_key: true

      t.timestamps
    end
  end
end
