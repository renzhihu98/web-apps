class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :classification
      t.string :genre
      t.string :edition
      t.text :description

      t.timestamps
    end
  end
end
