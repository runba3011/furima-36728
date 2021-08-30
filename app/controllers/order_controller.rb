class OrderController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @history_address = HistoryAddress.new
  end

  def create
    @history_address = HistoryAddress.new(history_address_param)
    binding.pry
    if @history_address.valid?
      @history_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :show
    end
  end

  private
  def history_address_param
    params.require(:history_address).permit(:post_number , :prefecture_id , :city ,:building_number , :building_name ,:phone_number).merge(user_id: current_user.id , item_id: params[:item_id])
  end

end
