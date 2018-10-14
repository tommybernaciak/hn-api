class NotebooksController < ApplicationController
  # rescue_from ::Services::ServiceActionError, with: :render_failure

  def index
    render json: { notebooks: notebooks }
  end

  def create
  end

  def delete
  end

  private

  def notebooks
    @notebooks ||= SearchNoteBook.all
  end
end
