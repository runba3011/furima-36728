class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item , only: [:show,:edit,:update]
  before_action :confirm_same_user, only: [:edit , :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
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

  def edit
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
    params.require(:item).permit(:category_id, :image, :name, :explain, :category_id, :status_id, :send_cost_id,
                                  :prefecture_id, :send_limit_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def confirm_same_user
    redirect_to root_path if @item.user.id != current_user.id
  end
end
