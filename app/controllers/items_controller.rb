class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :image, :name, :explain, :category_id, :status_id, :send_cost_id,
                                 :prefecture_id, :send_limit_id, :price).merge(user_id: current_user.id)
  end
end
