class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  # TODO: User Login과 결합하기
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    
    redirect_to memo_path(params[:memo_id])
  end
    
  def destroy
    @comment.destroy
    redirect_to memo_path(params[:memo_id])
  end
    
  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:content, :user_id, :memo_id)
    end
end
