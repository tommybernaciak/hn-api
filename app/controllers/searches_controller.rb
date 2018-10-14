class SearchesController < ApplicationController
  def search
    perform_search
    render_success([{id: 1}, {id: 2}])
  end

  private

  def perform_search
    # HackerNewsSearcher.new(query, page).call
  end

  def query
    @query ||= params[:query] || raise(Errors::BadRequest, 'query parameter missing')
  end

  def page
    @page ||= params[:page]
  end
end
