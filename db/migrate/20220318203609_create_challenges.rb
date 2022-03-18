class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :code
      t.text :description
      t.integer :difficulty
      t.string :address
      t.string :author
      t.string :author_github
      t.string :author_email

      t.timestamps
    end
  end
end
