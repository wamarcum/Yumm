class Manager::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    params = item_params.dup
    @item = Item.new(params)
    if @item.save
      flash[:notice] = "Item has been created."
      redirect_to manager_items_path
    else
      flash[:alert] = "Item has not been created."
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :quantity, :cost, :comment, :category_id)
  end

end

