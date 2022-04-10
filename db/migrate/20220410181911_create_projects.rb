class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :emoji
      t.string :emojiColor
      t.text :description 
      t.string :stack,  array: true, default: []
      t.string :tagsTitles, array: true, default: []
      t.string :tagsUrls, array: true, default: []
      t.string :tagsColor 
      t.timestamps
    end
  end
end
