# frozen_string_literal: true

class AddColumnsToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :name, :string, null: false
    add_column :challenges, :description, :text, null: false
    add_column :challenges, :start_date, :datetime, null: false
    add_column :challenges, :end_date, :datetime, null: false
    add_column :challenges, :unit, :string, null: false

    add_reference :challenges, :user, foreign_key: true
  end
end
