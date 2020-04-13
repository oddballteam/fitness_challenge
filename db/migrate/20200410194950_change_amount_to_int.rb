class ChangeAmountToInt < ActiveRecord::Migration[6.0]
  def up
    change_column :challenge_entries, :amount, 'float USING CAST(amount AS float)'
  end

  def down
    change_column :challenge_entries, :amount, 'string USING CAST(amount AS string)'
  end
end
