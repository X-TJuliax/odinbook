# app/controllers/follow_requests_controller.rb
class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @requested_user = User.find(params[:user_id])
    @follow_request = current_user.sent_follow_requests.build(requested: @requested_user, status: 'pending')

    if @follow_request.save
      redirect_to @requested_user, notice: 'Follow request sent.'
    else
      redirect_to @requested_user, alert: 'Unable to send follow request.'
    end
  end

  def update
    @follow_request = FollowRequest.find(params[:id])

    if @follow_request.update(follow_request_params)
      redirect_to @follow_request.requester, notice: 'Follow request updated.'
    else
      redirect_to @follow_request.requester, alert: 'Unable to update follow request.'
    end
  end

  private

  def follow_request_params
    params.require(:follow_request).permit(:status)
  end
end
