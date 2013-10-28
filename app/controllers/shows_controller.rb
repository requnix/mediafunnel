class ShowsController < ApplicationController
  before_filter :create_guest_user

  def index
    @shows = Show.paginate(page: params[:page], per_page: 18)
    @shows = Show.where(genres: params[:genre]).paginate(page: params[:page], per_page: 18) if params[:genre].present?

    @genres = []

    Show.each do |show|
      @genres << show.genres
    end

    @genres = @genres.collect(&:first).uniq.reject(&:empty?).sort.insert(0, ["All", ""])
  end

  def show
    @show = Show.find_by trakt: "http://trakt.tv/show/#{ params[:id] }"
  end
end
