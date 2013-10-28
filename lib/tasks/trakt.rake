namespace :trakt do

  desc 'Pull upcoming Shows from Trakt'
  task calendar: [:environment] do
    trakt = Trakt.new
    trakt.apikey = ENV['trakt_apikey'] || 'd9a29b817e3633a8ded6e09c6d05711a'
    trakt.calendar.shows(3.days.ago.strftime('%Y%m%d')).each do |date_hash|
      date_hash['episodes'].each do |full_hash|
        show_hash = full_hash['show']
        show = Show.find_or_initialize_by trakt: show_hash['url']
        show.attributes = {
          title:      show_hash['title'],
          year:       show_hash['year'],
          country:    show_hash['country'],
          imdb_id:    show_hash['imdb_id'],
          tvdb_id:    show_hash['tvdb_id'],
          tvrage_id:  show_hash['tvrage_id'],
          overview:   show_hash['overview'],
          runtime:    show_hash['runtime'],
          genres:     show_hash['genres'],
          images:     show_hash['images']
        } and show.save unless show.persisted?

        episode_hash = full_hash['episode']
        episode = Episode.find_or_initialize_by trakt: episode_hash['url']
        episode.attributes = {
          show_id: show._id,
          season: episode_hash['season'],
          number: episode_hash['number'],

          title: episode_hash['title'],
          overview: episode_hash['overview'],
          images: episode_hash['images']
        } and episode.save unless episode.persisted?
      end
    end
  end

end
