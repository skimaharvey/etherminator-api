class AddTitletodescriptionsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :description_title, :string
  end
end
