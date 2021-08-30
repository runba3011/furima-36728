class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :confirm_same_user , only: :edit

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
  end

  def update
    
  end

  private



  def item_params
    params.require(:item).permit(:category_id, :image, :name, :explain, :category_id, :status_id, :send_cost_id,
                                  :prefecture_id, :send_limit_id, :price).merge(user_id: current_user.id)
  end

  def confirm_same_user
    # 出品したユーザーと同じユーザーであるかを確認する
    if user_signed_in?
      @item = Item.find(params[:id])
      if @item.user.id != current_user.id
        redirect_to item_path
      end
    end
  end
end
