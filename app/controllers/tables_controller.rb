class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params) if table_params.any?
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

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    flash[:notice] = "Table has been destroyed."
    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:number, :guests).reject(&:empty?)
  end
  def set_table
    @table = Table.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Table you were looking for could not be found."
    redirect_to tables_path
  end
end

