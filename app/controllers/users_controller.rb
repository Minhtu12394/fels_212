class UsersController < ApplicationController
  before_action :load_user, only: %i(show following followers)
  def show
    @unfollow_user = current_user.active_relationships.find_by followed_id: @user.id
    @follow_user = current_user.active_relationships.build
  end

  def following
    @title = t :following
    @users = @user.following.page(params[:page])
    render "show_follow"
  end

  def followers
    @title = t :followers
    @users = @user.followers.page(params[:page])
    render "show_follow"
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t :not_found
    redirect_to user_path
  end
end
