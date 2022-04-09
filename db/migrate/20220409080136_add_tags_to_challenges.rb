class AddTagsToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :tags, :integer, array: true, default: []
  end
end
