class CreateInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :instances do |t|
      t.references :challenge, null: false, foreign_key: true
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
