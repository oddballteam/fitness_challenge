class AddColumnsToJwtBlacklist < ActiveRecord::Migration[6.0]
  def change
    add_column :jwt_blacklist, :jti, :string, null: false
    add_column :jwt_blacklist, :exp, :datetime, null: false

    add_index :jwt_blacklist, :jti
  end
end
