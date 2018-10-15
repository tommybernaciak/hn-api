class SearchNoteBook < ApplicationRecord
  has_many :search_results, dependent: :destroy
end
