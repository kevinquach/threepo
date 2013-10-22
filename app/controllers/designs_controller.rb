class DesignsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @query = Design.search(params[:q])
    @designs = @query.result(distinct: true)
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user
    save_design
  end

  def show
    @design = Design.find(params[:id])
  end

  def destroy
    design = Design.find(params[:id])
    design.destroy
    redirect_to designs_path
  end

  private

  def design_params
    params.require(:design).permit(:title, :description, :image, :file)
  end

  def save_design
    if @design.save
      redirect_to @design, notice: "Successfully uploaded design"
    else
      render 'new'
    end
  end

end
