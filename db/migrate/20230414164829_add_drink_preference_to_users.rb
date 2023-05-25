class AddDrinkPreferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :beverage, :integer, default: 0, index: true
  end
end
