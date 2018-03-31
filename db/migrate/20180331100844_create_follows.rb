class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.string :name
      t.string :nickname
      t.string :image

      t.timestamps
    end
  end
end
