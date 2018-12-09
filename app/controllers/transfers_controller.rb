class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.transfer
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.transfer
  end

  # GET /transfers/new
  def new
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.build_transfer()
  end

  # GET /transfers/1/edit
  def edit
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.transfer
  end

  # POST /transfers
  # POST /transfers.json
   def create
    @user = current_user
    @stock = Stock.find_by_id(params[:stock_id])
    @transfer = @stock.build_transfer(transfer_params)
    respond_to do |format|
      if @transfer.save
      # for email deliver
      TransferMailer.transfer_created(@user).deliver
      format.html { redirect_to stock_transfer_url(@stock, @transfer),
                  notice:'Transfer was successfully created.'}
      format.json { render :show, status: :created,
      location: @transfer }
    else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.transfer
    respond_to do |format|
    if @transfer.update(transfer_params)
    format.html { redirect_to stock_transfer_url(@stock, @transfer),
    notice:'Transfer was successfully updated.'}
    format.json { render :show, status: :ok, location: @transfer }
    else
    format.html { render :edit }
    format.json { render json: @transfer.errors,
      status: :unprocessable_entity }
    end
  end
end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @stock = Stock.find(params[:stock_id])
    @transfer = @stock.transfer
    @transfer.destroy
    respond_to do |format|
    format.html { redirect_to stock_transfers_url(@stock),
    notice:'Transfer was successfully destroyed.'}
    format.json { head :no_content }
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:brand, :category, :qunatity, :transfer_date, :manager, :stock_id)
    end
end
