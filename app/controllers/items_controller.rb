class ItemsController < ApplicationController
 def index
 end

#  def new
#   @user = User.new
#  end

def items_params
  params.require(:item).permit(:image, :name, :explanation,
    :category_id, :condition_id , :delivery_fee_id,
    :region_delivery_id, :days_to_deliver_id, :price, 
  ).merge(user_id: current_user.id)
end

end
