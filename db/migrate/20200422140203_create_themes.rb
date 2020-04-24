class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :clr_a
      t.string :clr_b
      t.string :clr_c
      t.string :clr_d
      t.string :clr_e

      t.timestamps
    end
  end
end
