class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET posts/1/comments
  def index
    @comments = @post.comments
  end

  # GET posts/1/comments/1
  def show
  end

  # GET posts/1/comments/new
  def new
    @comments = @post.comments
    @comment = @post.comments.build
  end

  # GET posts/1/comments/1/edit
  def edit
  end

  # POST posts/1/comments
  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id #or whatever is you session name

    if @comment.save
      redirect_to([@comment.post, @comment], notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT posts/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to([@comment.post, @comment], notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE posts/1/comments/1
  def destroy
    @comment.destroy

    redirect_to post_comments_url(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
