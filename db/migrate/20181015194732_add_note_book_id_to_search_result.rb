class AddNoteBookIdToSearchResult < ActiveRecord::Migration[5.1]
  def change
    add_column :search_results, :search_note_book_id, :integer
  end
end
