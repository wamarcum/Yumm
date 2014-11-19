class Manager::CategoriesController < ApplicationController
  before_action :set_category, only: [:show,:edit,:update,:destroy]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to manager_items_path
    else
      flash[:alert] = "Category has not been created."
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category has been destroyed."
    redirect_to manager_items_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  def set_category
      @category = Category.find(params[:id])
      #Need to see if this rescue is working...
        rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The Category you were looking" +
                        " for could not be found."
        redirect_to categories_path

  end
end

