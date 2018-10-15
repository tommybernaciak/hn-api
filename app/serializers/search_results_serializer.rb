class SearchResultsSerializer

  def self.serialize(results)
    {
      results: results.map(&method(:serialize_result)),
      page: 0
    }
  end

  def self.serialize_result(result)
    ResultSerializer.serialize(result)
  end
end
