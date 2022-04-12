class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update]

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

  def show
    
  end

  def edit
    
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy

    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation,
      :category_id, :condition_id , :delivery_fee_id,
      :region_delivery_id, :days_to_deliver_id, :price, 
    ).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
