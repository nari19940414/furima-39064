class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit,:destroy]
  before_action :set_item, only: %i[edit show update destroy]
  before_action :require_permission, only: %i[edit destroy]

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
    
    def show
      
    end

    def edit
      redirect_to root_path unless current_user.id == @item.user_id
    end

    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end
    
    def destroy
      if @item.user == current_user 
        @item.destroy
        redirect_to root_path
       else
        redirect_to root_path
    end    
  end
  
    private
    def item_params
      params.require(:item).permit(:product_name, :image, :product_price, :product_description, :category_id,
         :condition_id , :delivery_pay_id, :city_id, :delivery_span_id).merge(user_id: current_user.id)
    end
    def set_item
      @item = Item.find(params[:id])
    end
    def require_permission
      @item = Item.find(params[:id])
       if @item.order.present?
         redirect_to root_path
       elsif current_user != @item.user
         redirect_to root_path
       end
    end
    
end
