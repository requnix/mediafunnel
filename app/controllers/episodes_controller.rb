class EpisodesController < ApplicationController

  def index
    @show = Show.find_by trakt: "http://trakt.tv/show/#{ params[:show_id] }"

    respond_to do |format|
      format.json
    end
  end

end
