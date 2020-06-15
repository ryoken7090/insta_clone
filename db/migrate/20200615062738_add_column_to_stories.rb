class AddColumnToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :created_at, :datetime, nill: true

    Story.update_all(created_at: Time.current)

    change_column :stories, :created_at, :datetime, nill: false
    
  end
end
