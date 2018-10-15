class SearchNoteBooksController < ApplicationController
  def index
    render_success(notebooks)
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

  def notebooks_creator
    puts params
    @notebooks_creator ||= begin
      NotebooksCreator.new(params[:title])
    end
  end
end
