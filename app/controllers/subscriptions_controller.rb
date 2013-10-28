class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @user.subscriptions.includes(:show)

    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
  end

  def create
    subscription = Subscription.new subscription_params
    subscription.user = @user
    subscription.upsert
    redirect_to show_path(subscription.show.slug)
  end

  def destroy
    subscription = Subscription.find params[:id]
    redirect_to show_path(subscription.show.slug)
    subscription.destroy
  end

private

  def subscription_params
    params.require(:subscription).permit(:show_id, :source, :resolution)
  end
end
