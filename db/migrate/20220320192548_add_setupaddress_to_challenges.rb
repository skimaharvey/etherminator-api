class AddSetupaddressToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :setup_address, :string
  end
end
