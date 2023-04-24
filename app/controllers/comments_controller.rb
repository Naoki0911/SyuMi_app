class CommentsController < ApplicationController
  before_action :find_sake

  def create
    @sake = Sake.find(params[:sake_id])
    @comment = @sake.comments.build(comment_params)
    @comment.user_id = current_user.id
  
    if @comment.save
      redirect_to sake_path(@sake)
    else
      flash[:alert] = @comment.errors.full_messages.to_sentence
      redirect_to sake_path(@sake) # この行を追加してください。
    end
  end

  def destroy
    @comment = @sake.comments.find(params[:id])

    if current_user == @comment.user
      @comment.destroy
      flash[:success] = 'コメントが削除されました'
    else
      flash[:error] = 'コメントの削除権限がありません'
    end

    redirect_to sake_path(@sake)
  end

  private

  def find_sake
    @sake = Sake.find(params[:sake_id])
  end

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
