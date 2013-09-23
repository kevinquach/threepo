class DesignsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]

  def index
   @designs = Design.all
  end

  def new
  end

  def create
    @design = Design.new(params[:design].permit(:title, :description))
    @design.user = current_user

    if @design.save
      flash[:notice] = "Successfully uploaded design"
      redirect_to @design
    else
      render 'new'
    end

  end

  def show
    @design = Design.find(params[:id])

  end
end
