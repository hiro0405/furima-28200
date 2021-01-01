require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "新規商品出品の登録" do
    context "新規商品出品の登録ができる場合" do
      it "ログインしているユーザーだけが出品できる" do
        @item.user_id = "1"
        expect(@item).to be_valid
      end

      it "name,image,description,category_id,status_id,shipping_charge_id,shipping_area_id,estimated_shipping_date,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "価格の範囲が¥300〜¥9,999,999の間であれば登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end

      it "販売価格は半角数字のみ登録できる" do
        @item.price = "11111"
        expect(@item).to be_valid
      end
    end

    context "新規商品出品の登録ができない場合" do
      it "画像が空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空だと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idがないと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "status_idがないと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it "shipping_charge_idがないと出品できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end

      it "shipping_area_idがないと出品できない" do
        @item.shipping_area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end

      it "estimated_shipping_date_idがないと出品できない" do
        @item.estimated_shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date is not a number")
      end

      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角では出品できない" do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが半角英字では登録できない" do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格の範囲が¥300未満であれば出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格の範囲が¥10,000,000以上であれば出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end