class AddJwtBlacklistTable < ActiveRecord::Migration[6.0]
  def change
    create_table :jwt_blacklist do |t|
    end
  end
end
