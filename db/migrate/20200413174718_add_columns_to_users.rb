class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :provider, :string, null: false
    add_column :users, :uid, :string, null: false
    add_column :users, :remember_token, :string, null: false

    add_index :users, [:uid, :provider], unique: true
  end
end
