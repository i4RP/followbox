class RenameEditability < ActiveRecord::Migration[5.1]
  def change
    rename_table :editabilities, :contacts #この行を追加！
  end
end
