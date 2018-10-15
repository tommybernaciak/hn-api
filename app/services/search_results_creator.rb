class SearchResultsCreator
  def initialize(notebook_id, result)
    @notebook_id = notebook_id
    @result = result
  end

  def call
    create
  end

  private

  attr_reader :notebook_id, :result

  def create
    notebook.search_results.create(
      author: result['author'],
      author_karma_points: result['points'],
      tags: result['tags'],
      url: result['url']
    )
  end

  def notebook
    @notebook ||= SearchNoteBook.find(notebook_id) || raise(Errors::BadRequest, 'notebook_id parameter missing')
  end
end
