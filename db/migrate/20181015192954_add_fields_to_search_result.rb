class AddFieldsToSearchResult < ActiveRecord::Migration[5.1]
  def change
    add_column :search_results, :url, :text
    add_column :search_results, :creation_date, :string
    add_column :search_results, :tags, :text
  end
end
