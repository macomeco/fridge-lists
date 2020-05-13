class AddThemeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :theme, :bigint
  end
end
