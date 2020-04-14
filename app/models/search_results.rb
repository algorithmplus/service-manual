class SearchResults
  attr_reader :results
  def self.transform(results)
    new(results).transform
  end
  def initialize(results)
    @results = results
  end
  def transform
    results.map do |result|
      {
          link: {
              text: result.heading,
              path: result.path,
              description: result.description
          },
          metadata: {
              public_updated_at: result.updated_at
          }
      }
    end
  end
end

