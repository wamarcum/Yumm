class TicketsController < ApplicationController
  before_action :set_table
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  def new
    @ticket = @table.tickets.build
  end

  def create
    @ticket = @table.tickets.build(ticket_params) if ticket_params.any?
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@table, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render "new"
    end
  end

  def show
    @item = @ticket.items.build
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@table, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been destroyed."
    redirect_to @table
  end

  private
  def set_table
    @table = Table.find(params[:table_id])
  end
  def set_ticket
    @ticket = @table.tickets.find(params[:id])
  end
  def ticket_params
    params.require(:ticket).permit(:togo)
  end
end

