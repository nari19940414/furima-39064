class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
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
  
    private
    def item_params
      params.require(:item).permit(:product_name, :image, :product_price, :product_description, :category_id, :condition_id , :delivery_pay_id, :city_id, :delivery_span_id).merge(user_id: current_user.id)
    end
end
