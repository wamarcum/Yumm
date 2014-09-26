class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
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

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id]) 
    if @table.update(table_params)
      flash[:notice] = "Table has been updated."
      redirect_to @table
    else
      flash[:alert] = "Table has not been updated."
      render "edit"
    end

  end

  private
  def table_params
    params.require(:table).permit(:number, :guests)
  end
end
