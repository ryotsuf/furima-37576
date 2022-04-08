class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

 def index
  @items = Item.order("created_at DESC")
 end

 def new
  @item = Item.new
 end

 def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation,
      :category_id, :condition_id , :delivery_fee_id,
      :region_delivery_id, :days_to_deliver_id, :price, 
    ).merge(user_id: current_user.id)
  end

end
