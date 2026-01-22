class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
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

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :price,
      :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id
    ).merge(user_id: current_user.id)
  end
end
