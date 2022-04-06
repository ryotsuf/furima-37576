require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能'
    context '出品できるとき'
      it 'すべての項目が入力されていれば出品できる'
        expect(@item).to be_valid
      end
    end

    context '出品できない時'
      it 'imageが空では出品できない'
      end 
      it 'nameが空では出品できない'

      end
      it 'nameが41文字以上では出品できない'
      end
      it 'explanationが空では出品できない'
      end
      it 'explanationが1001文字以上だと出品できない'
      end
      
      it 'category_idが1では出品できない'
      end
      it 'condition_idが1では出品できない'
      end
      it 'delivery_fee_idが1では出品できない'
      end
      it 'days_to_deliver_idが1では出品できない'
      end
      it 'region_delivery_idが1では出品できない'
      end
      it 'priceが空では出品できない'
      end
      it 'priceが300未満では出品できない'
      end
      it 'priceが10,000,000以上では出品できない'
      end
      it 'priceに半角数字以外があると保存できない'
      end

  end

  
end
