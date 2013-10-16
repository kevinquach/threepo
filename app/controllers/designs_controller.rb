class DesignsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @q = Design.search(params[:q])
    @designs = @q.result(distinct: true)
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user

    if @design.save
      redirect_to @design
      flash[:notice] = "Successfully uploaded design"
    else
      render 'new'
    end
  end

  def show
    @design = Design.find(params[:id])
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy

    redirect_to designs_path
  end

  protected

  def design_params
    params.require(:design).permit(:title, :description, :image)
  end

end
