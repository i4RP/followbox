class CreateUserContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_contacts do |t|
      t.string :twitter_id
      t.string :name
      t.string :nickname
      t.string :image
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
