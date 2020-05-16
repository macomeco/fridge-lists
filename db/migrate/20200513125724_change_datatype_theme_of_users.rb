class ChangeDatatypeThemeOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :theme, :string
  end
end
