class ItemsController < ApplicationController
  before_action :set_ticket

  def create
    @item = @ticket.items.build(item_params) if item_params.any?
    if @item.save
      flash[:notice] = "Item has been added."
      redirect_to [@ticket.table, @ticket]
    else
      flash[:alert] = "Item has not been added."
      render template: "tickets/show"
    end
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :comment)
  end
end
