class ChangeDatatypeThemeOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :theme, :string
  end
end
