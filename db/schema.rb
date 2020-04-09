# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_200_408_195_724) do
  enable_extension 'plpgsql'

  create_table 'challenges', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description', null: false
    t.datetime 'start_date', null: false
    t.datetime 'end_date', null: false
    t.string 'unit', null: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_challenges_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'],
            name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'challenges', 'users'
end
