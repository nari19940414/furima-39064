class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]#[, :update, :destroy]後から追加する。
    def index
      @items = Item.all.order("created_at DESC")
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
    
    def edit
      redirect_to root_path unless @item.order.nil?
    end

    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
    
  
  
    private
    def item_params
      params.require(:item).permit(:product_name, :image, :product_price, :product_description, :category_id,
         :condition_id , :delivery_pay_id, :city_id, :delivery_span_id).merge(user_id: current_user.id)
    end
    
    
end
