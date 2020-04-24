class CreateColorthemes < ActiveRecord::Migration[5.2]
  def change
    create_table :colorthemes do |t|
      t.string :clr_main
      t.string :clr_sub
      t.string :clr_list_i
      t.string :clr_list_ii
      t.string :clr_font

      t.timestamps
    end
  end
end
