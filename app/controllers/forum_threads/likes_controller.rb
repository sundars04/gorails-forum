class ForumThreads::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread
  
  def create
    @forum_thread.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @forum_thread}
      format.js
    end
  end

  def destroy
    @forum_thread.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @forum_thread}
      format.js
    end
    
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.find(params[:forum_thread_id])
    end
end