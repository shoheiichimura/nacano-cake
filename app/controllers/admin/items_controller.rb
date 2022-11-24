class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).all
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を登録しました！"
      redirect_to admin_item_path(@item.id)
    else
    render :new
    end
  end

  def show
    @item =Item.find(params[:id])

  end

  def edit
    @item =Item.find(params[:id])
  end

  def update
    @item =Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "商品を更新しました！"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :genre_id, :price, :status)
  end
end
