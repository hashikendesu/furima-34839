class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  before_action :ensure_current_user, only: [:new, :create, :edit, :update]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :statu_id, :charge_id, :area_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_current_user
    item = Item.find(params[:id])
    if user_signed_in?
      if item.user_id != current_user.id 
        redirect_to action: :index
      end
    else
      redirect_to action: :new
    end
    
  end
end
