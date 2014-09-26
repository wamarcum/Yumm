class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(project_params)
    if @table.save
      flash[:notice] = "Table has been seated!"
      redirect_to @table
    else
      flash[:alert] = "Table has not been seated."
      render "new"
    end
  end

  def show
    @table = Table.find(params[:id])
  end

  private
  def project_params
    params.require(:table).permit(:number, :guests)
  end
end
