class OrderController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :buy_limit

  def index
    @item = Item.find(params[:item_id])
    @history_address = HistoryAddress.new
  end

  def create
    @history_address = HistoryAddress.new(history_address_params)
    if @history_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price.to_s,
        card: history_address_params[:token],
        currency: 'jpy'
      )
      @history_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def history_address_params
    params.require(:history_address).permit(:post_number , :prefecture_id , :city ,:building_number , :building_name ,:phone_number).merge(user_id: current_user.id , item_id: params[:item_id] , token: params[:token])
  end


  # 同じ処理を使用する頻度が高いものをまとめたもの、単品だけで呼ぶことはまずない↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  # 誤って単品だけで呼ぶ処理を作成したときにわかりやすくするためコメントアウトは残しておいてください

  # paramから該当するItemを探すための処理
  # なんの処理かわかるようにするためにコメントアウトは残しておいてください
  def find_item
    @item = Item.find(params[:item_id])
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

  def buy_limit
    if only_confirm_same_user || only_confirm_item_sold
      redirect_to root_path
    end
  end
  
end
