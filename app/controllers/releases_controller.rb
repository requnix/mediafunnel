class ReleasesController < ApplicationController
  before_filter :create_guest_user
  def index
    @release = Release.new
    @releases = Release.order_by(created_at: :desc)

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  def create
    @release = Release.new release_params

    if @release.valid?
      @release.save
      redirect_to action: :index
    else
      @releases = Release.order_by(created_at: :desc)
      render 'index'
    end
  end

private

  def release_params
    params.require(:release).permit(:source, :resolution, :releasable_id, :releasable_type, :group, :magnet)
  end
end
