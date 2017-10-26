class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :is_owner?, only: [:destroy]
  # TODO: User Login과 결합하기 [DONE]
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to memo_path(params[:memo_id]), notice: "댓글을 작성 하였습니다."
    else
      flash[:danger] = "댓글을 입력하세요."
      redirect_to :back
    end
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
    def is_owner?
      redirect_to root_path unless current_user == @memo.user
    end
end
