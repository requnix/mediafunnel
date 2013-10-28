class FeedsController < ApplicationController

  def user_feed
    @user = User.find params[:id]
    @releases = []

    @user.subscriptions.each do |subscription|
      subscription.show.episodes.each do |episode|
        release = episode.releases.where(resolution: subscription.resolution, source: subscription.source).order_by(created_at: :desc).first
        @releases << release if release
      end
    end

    respond_to do |format|
      format.rss { render 'feed', layout: false }
    end
  end

  def show_feed
    @show = Show.find_by trakt: "http://trakt.tv/show/#{ params[:slug] }"
    @releases = []

    @show.episodes.each do |episode|
      release = episode.releases.where(resolution: params[:resolution] || '480p', source: params[:source] || 'HDTV').order_by(created_at: :desc).first
      @releases << release if release
    end

    respond_to do |format|
      format.rss { render 'feed', layout: false }
    end
  end
end