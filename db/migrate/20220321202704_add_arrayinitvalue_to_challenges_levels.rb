class AddArrayinitvalueToChallengesLevels < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :levels_finished, :string, array: true, default: []
    change_column :users, :levels_started, :string, array: true, default: []
  end
end
