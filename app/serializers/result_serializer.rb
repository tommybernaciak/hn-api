class ResultSerializer

  def self.serialize(result)
    {
      created_at: result['created_at'],
      title: result['title'],
      url: result['url'],
      author: result['author'],
      points: result['points']
    }
  end
end
