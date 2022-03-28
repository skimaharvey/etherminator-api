class AddValueToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :value, :integer
  end
end
