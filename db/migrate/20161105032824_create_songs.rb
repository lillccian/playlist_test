class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :link
      t.string :user

      t.timestamps
    end
  end
end
