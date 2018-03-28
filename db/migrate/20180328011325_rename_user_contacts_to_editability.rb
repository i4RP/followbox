class RenameUserContactsToEditability < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_contacts, :editabilities #この行を追加！
  end
end
