class ItemsController < ApplicationController
  def index
  end

  def create
  end

  def new 
    @item = Item.new
  end
end
