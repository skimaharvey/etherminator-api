class AddContractlevelsinfosToChallenges < ActiveRecord::Migration[7.0]
  def change
    change_table :challenges do |t|
      t.text :contract_abi
    end
  end
end
