class AddRankToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :rank_of_appearance, :integer
  end
end
