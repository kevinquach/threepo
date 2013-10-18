class CommentsController < ApplicationController
before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @design = Design.find(params[:design_id])
    @design.user = current_user
    @comment = @design.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment successfully added."
      redirect_to design_path(@design)
    else
      flash[:notice] = "Comment did not save."
      redirect_to design_path(@design)
    end
  end

  def destroy
    @design = Design.find(params[:design_id])
    @comment = @design.comments.find(params[:id])
    @comment.destroy
    redirect_to design_path(@design)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

