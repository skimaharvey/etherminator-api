class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :address
      t.string :levels_started
      t.string :levels_finished

      t.timestamps
    end
  end
end
