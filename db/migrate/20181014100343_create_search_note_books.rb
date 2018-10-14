class CreateSearchNoteBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :search_note_books do |t|
      t.string :title

      t.timestamps
    end
  end
end
