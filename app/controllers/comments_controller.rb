class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to root_path, notice: 'Comment was successfully created.'
      else
        redirect_to root_path, alert: 'Error creating comment.'
      end
    end

   def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if @comment.destroy
        redirect_to root_path, notice: 'You delete this post.'
      else
        redirect_to root_path, alert: 'Unable to delete this post.'
      end
   end

    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  