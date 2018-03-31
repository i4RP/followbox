class ChangeListIdOnContacts < ActiveRecord::Migration[5.1]
  def change
    change_table :contacts do |t|
  t.change :list_id, :string
    end
  end
end
