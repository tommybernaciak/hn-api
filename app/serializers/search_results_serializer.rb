class SearchResultsSerializer

  def self.serialize(results)
    {
      results: results.hits.map(&method(:serialize_result)),
      page: results.page
    }
  end

  def self.serialize_result(result)
    ResultSerializer.serialize(result)
  end
end
