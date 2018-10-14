class CreateSearchQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :search_queries do |t|
      t.string :query
      t.integer :hits_count

      t.timestamps
    end
  end
end
