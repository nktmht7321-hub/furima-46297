class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    # 保存できた場合とできなかった場合で条件分岐
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :price,
      :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
