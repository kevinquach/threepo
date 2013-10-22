class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @design = Design.find(params[:design_id])
    @design.user = current_user
    @comment = @design.comments.new(comment_params)
    save_comment
  end

  def destroy
    design = Design.find(params[:design_id])
    comment = design.comments.find(params[:id])
    comment.destroy
    redirect_to design_path(design)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def save_comment
    if @comment.save
      redirect_to design_path(@design), notice: "Comment successfully added."
    else
      redirect_to design_path(@design), notice: "There was an error. Your comment did not save."
    end
  end

end

