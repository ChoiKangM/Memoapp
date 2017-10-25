class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_memo, only: [:show, :edit, :update, :destroy]
  # TODO: User login 과 결합하기
# Create  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(memo_params)
    #debugger
    @memo.save
    
    # redirect_to memo_path(@memo)
    redirect_to @memo
  end
# Read
  def show
    #@memo = Memo.find(params[:id])
    @comment = Comment.new
    @comments = @memo.comments
  end

  def index
    # binding.pry
    @memos = Memo.order(created_at: :DESC).page(params[:page]).per(10)
  end
  
# Update
  def edit
    #@memo = Memo.find(params[:id])
  end
  
  def update
    #@memo = Memo.find(params[:id])
    @memo.update(memo_params)
    redirect_to @memo
  end
# Destroy
  def destroy
    #@memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to root_path
  end
  private
    def find_memo
      @memo = Memo.find(params[:id])
    end
    
    def memo_params
      params.require(:memo).permit(:title, :content, :user_id)
    end
end
