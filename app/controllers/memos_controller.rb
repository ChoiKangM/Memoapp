class MemosController < ApplicationController
# Create  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new
    @memo.title = params[:memo][:title]
    @memo.content = params[:memo][:content]
    @memo.user_id = params[:memo][:user_id]
    #debugger
    @memo.save
    
    # redirect_to memo_path(@memo)
    redirect_to @memo
  end
# Read
  def show
    @memo = Memo.find(params[:id])
  end

  def index
  end
  
# Update
  def edit
  end
  
  def update
    
  end
# Destroy
  def destroy
    
  end
end
