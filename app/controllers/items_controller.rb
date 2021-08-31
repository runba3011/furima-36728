class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]
  before_action :find_item , only: [:show,:edit,:update , :destroy]
  before_action :edit_limit, only: [:edit , :update, :destroy]

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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :image, :name, :explain, :category_id, :status_id, :send_cost_id,
                                  :prefecture_id, :send_limit_id, :price).merge(user_id: current_user.id)
  end

  # 同じ処理を使用する頻度が高いものをまとめたもの、単品だけで呼ぶことはまずない↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  # 誤って単品だけで呼ぶ処理を作成したときにわかりやすくするためコメントアウトは残しておいてください

  # paramから該当するItemを探すための処理
  # なんの処理かわかるようにするためにコメントアウトは残しておいてください
  def find_item
    @item = Item.find(params[:id])
  end

  # itemの出品者と、現在ログインしているユーザーが同じであればtrueを返す処理
  # なんの処理かわかるようにするためにコメントアウトは残しておいてください
  def only_confirm_same_user
    @item.user.id == current_user.id
  end

  # Itemが売れているならtrueを返す処理
  # なんの処理かわかるようにするためにコメントアウトは残しておいてください
  def only_confirm_item_sold
    @item.history != nil
  end

  # ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


  def edit_limit
    if !only_confirm_same_user || only_confirm_item_sold
      redirect_to root_path
    end
  end
end
