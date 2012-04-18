class TopicsController < ApplicationController

  before_filter :login_required, :except => [:index, :show] 
  before_filter :admin_required, :only => :destroy 
  
  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new(:name => params[:topic][:name], :last_poster_id => current_user.id, :last_post_at => Time.now, :forum_id => params[:forum_id], :user_id => current_user.id)
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      @topic = Topic.new(:name => params[:topic][:name], :last_poster_id => current_user.id, :last_post_at => Time.now, :forum_id => param[:forum_id])
      
      if @topic.save
        flash[:notice] = "Successfully created topic."
        redirect_to "/forums/#{@topic.forum_id}"
      else
        redirect :action => 'new'
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to "/forums/#{@topic.forum_id}" 
  end
end
