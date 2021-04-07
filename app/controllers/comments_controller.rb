class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'コメントを送信しました'
      redirect_to topics_path
    else
      flash[:danger] = 'コメントを送信できませんでした'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:description, :user_id, :topic_id)
  end
end
