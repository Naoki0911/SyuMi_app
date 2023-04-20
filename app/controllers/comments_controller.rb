class CommentsController < ApplicationController
  def create
    @sake = Sake.find(params[:sake_id])
    @comment = @sake.comments.create(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to sake_path(@sake)
    else
      render 'sakes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
