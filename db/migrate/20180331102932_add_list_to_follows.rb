class AddListToFollows < ActiveRecord::Migration[5.1]
  def change
    add_column :follows, :list, :string
  end
end
