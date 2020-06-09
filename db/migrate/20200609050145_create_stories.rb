class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.text :image
      t.text :content
    end
  end
end
