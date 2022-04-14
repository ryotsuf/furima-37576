class BuyLogsController < ApplicationController
  before_action :authenticate_user!

  
  def index
    @item = Item.find(params[:item_id])
    @buy_log_address = BuyLogAddress.new
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif @item.buy_log.present?
      redirect_to root_path
    end
    
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_log_address = BuyLogAddress.new(buy_log_address_params)
    if @buy_log_address.valid?
      pay_item
      @buy_log_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_log_address_params
    params.require(:buy_log_address).permit(
      :postcode, :region_delivery_id, :city, :street_address, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: params[:token],    
        currency: 'jpy'                 
      )
  end
end
