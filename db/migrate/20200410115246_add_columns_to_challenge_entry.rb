class AddColumnsToChallengeEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :challenge_entries, :amount, :string, null: false
    add_column :challenge_entries, :completed_date, :datetime, null: false

    add_reference :challenge_entries, :user, foreign_key: true
    add_reference :challenge_entries, :challenge, foreign_key: true
  end
end
