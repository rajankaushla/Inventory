class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @stock = Stock.find(params[:stock_id])
    @order = @stock.order
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @stock = Stock.find(params[:stock_id])
    @order = @stock.order
  end

  # GET /orders/new
  def new
    @stock = Stock.find(params[:stock_id])
    @order = @stock.build_order()
  end

  # GET /orders/1/edit
  def edit
    @stock = Stock.find(params[:stock_id])
    @order = @stock.order
  end

  # POST /orders
  # POST /orders.json
  def create
    # @stock = Stock.find_by_id(params[:stock_id])
    
   
    # @order = @stock.build_order(order_params)
    respond_to do |format|
      if @order.save
      # OrderMailer.order_created(@user).deliver
      format.html { redirect_to stock_order_url(@stock, @order),
                  notice:'Order was successfully created.'}
      format.json { render :show, status: :created,
      location: @order }
    else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @stock = Stock.find(params[:stock_id])
    @order = @stock.order
    respond_to do |format|
    if @order.update(order_params)
    format.html { redirect_to stock_order_url(@stock, @order),
    notice:'Order was successfully updated.'}
    format.json { render :show, status: :ok, location: @order }
    else
    format.html { render :edit }
    format.json { render json: @order.errors,
      status: :unprocessable_entity }
    end
  end
end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @stock = Stock.find(params[:stock_id])
    @order = @stock.order
    @order.destroy
    respond_to do |format|
    format.html { redirect_to stock_orders_url(@stock),
    notice:'Order was successfully destroyed.'}
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:brand, :category, :qunatity, :order_date, :manager, :stock_id)
    end
end
