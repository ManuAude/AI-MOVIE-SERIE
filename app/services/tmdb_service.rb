
class TmdbService
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
    @bearer_token = ENV['TMDB_API_KEY']
  end

  def search_movies(query)
    return [] if query.blank?

    response = self.class.get('/search/movie', {
      query: {
        query: query,
        language: 'fr-FR'
      },
      headers: {
        'Authorization' => "Bearer #{@bearer_token}"
      }
    })

    response['results'] || []
  end
end
