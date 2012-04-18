class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      @topic = Topic.new(:name => params[:topic][:name], :last_poster_id => current_user.id, :last_post_at => Time.now, :forum_id => param[:forum_id])
      
      if @post.save
        flash[:notice] = "Successfully created topic."
        redirect_to "/forums/#{@topic.forum_id}"
      else
        redirect :action => 'new'
      end
    else
      render :action => 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to "/forums/#{@topic.forum_id}" 
    else
      render :action => 'edit'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to "/forums/#{@topic.forum_id}" 
  end
end
