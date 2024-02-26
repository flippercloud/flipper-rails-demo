class AddCategoryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :category, :integer, default: 0
  end
end
