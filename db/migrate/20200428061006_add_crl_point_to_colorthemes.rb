class AddCrlPointToColorthemes < ActiveRecord::Migration[5.2]
  def change
    add_column :colorthemes, :clr_point, :string
  end
end
