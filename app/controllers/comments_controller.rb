class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create(comment_params)
      redirect_to @post,
        notice: 'Comment was successfully created.'
    else
      # Check this if error with comments
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end
end
