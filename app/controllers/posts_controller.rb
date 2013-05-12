class PostsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    respond_with(@posts = Post.order('created_at DESC'))
  end

  def show
    respond_with(@post = Post.find(params[:id]))
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json {render :json => @post}
    end
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.')}
        format.json { render :json => @post, :status => :created, :location => @post}
      else
        format.html { render 'new'}
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
