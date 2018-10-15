class SearchResultsController < ApplicationController

  def create
    render_success(search_result_creator.call)
  end

  def destroy
    render_failure unless search_result.delete
    render_success('ok')
  end

  def search
    results = perform_search
    render_success(serialize(results.hits))
  end

  private

  def search_result
    @search_result ||= SearchResult.find(params[:id])
  end

  def search_result_creator
    @search_result_creator ||= begin
      SearchResultsCreator.new(params[:notebook_id], params[:result])
    end
  end

  def perform_search
    HackerNewsSearcher.new(query, page).call
  end

  def serialize(results)
    SearchResultsSerializer.serialize(results)
  end

  def query
    @query ||= params[:query] || raise(Errors::BadRequest, 'query parameter missing')
  end

  def page
    @page ||= params[:page]
  end
end
