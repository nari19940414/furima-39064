class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :new, :create]

  def index
    @order = Order.new
    redirect_to root_path if current_user == @item.user || !@item.order.nil?
  end

  def new
    @order = Order.new
  end

  def create
    
    @order = Order.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
      else
       render :index
    end
  end

  private
   
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :product_price)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: pay_item,
      card: order_params[:token],
      currency: 'jpy'
    )
    
    
    @order = Order.new(order_params)
     if @order.save
      redirect_to root_path
     else
      render :new
     end
  end
end
