class SearchNoteBooksController < ApplicationController
  def index
    render_success(notebooks)
  end

  def show
    render_success(notebook_with_results)
  end

  def create
    render_success(notebooks_creator.call)
  end

  def destroy
    render_failure unless notebook.delete
    render_success('ok')
  end

  private

  def notebooks
    @notebooks ||= SearchNoteBook.all
  end

  def notebook
    @notebook ||= SearchNoteBook.find(params[:id])
  end

  def notebook_with_results
    {
      notebook: notebook,
      results: serialize(notebook.search_results)
    }
  end

  def notebooks_creator
    @notebooks_creator ||= NotebooksCreator.new(params[:title])
  end

  def serialize(results)
    SearchResultsSerializer.serialize(results)
  end
end
