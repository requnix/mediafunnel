class ShowsController < ApplicationController
  before_filter :create_guest_user

  def index
    @shows = Release.where(releasable_type: 'Episode').map(&:releasable).map(&:show).uniq
    if params[:genre].present?
      @shows = @shows.select { |show| show.genres.include? params[:genre] }
    end

    @genres = []

    Show.each do |show|
      @genres |= show.genres
    end

    @genres = @genres.sort
    @genres[0] = ['All', '']
  end

  def show
    @show = Show.find_by trakt: "http://trakt.tv/show/#{ params[:id] }"
  end
end
