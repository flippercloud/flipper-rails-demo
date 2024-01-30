class AddNameRemoveCredsOnUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      t.remove "email", :string
      t.remove "password_digest", :string

      t.string "name"
    end
  end
end
