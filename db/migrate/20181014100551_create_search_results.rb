class CreateSearchResults < ActiveRecord::Migration[5.1]
  def change
    create_table :search_results do |t|
      t.string :author
      t.integer :author_karma_points

      t.timestamps
    end
  end
end
