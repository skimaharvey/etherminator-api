class ChangeUsersLevelsattToArrays < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :levels_started, "varchar[] USING (string_to_array(levels_started, ','))"
    change_column :users, :levels_finished, "varchar[] USING (string_to_array(levels_finished, ','))"
  end
end
