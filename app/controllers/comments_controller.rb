class CommentsController < ApplicationController
  before_action :find_sake

  def create
    @comment = @sake.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'コメントが投稿されました'
    else
      flash[:error] = 'コメントの投稿に失敗しました'
    end

    redirect_to sake_path(@sake)
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
