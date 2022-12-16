class ItemsController < ApplicationController
  before_action :set_item, except: %i(index new create)
  before_action :authenticate_user!, except: %i(index show)
  before_action :move_to_index, only: %i(edit update destroy)


  def index
    @items = Item.order(created_at: :desc).with_attached_image
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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
    params.require(:item).permit(
      :name,
      :info,
      :category_id,
      :status_id,
      :shipping_fee_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

  def set_item
    begin
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def move_to_index
    return redirect_to root_path if current_user != @item.user
  end
end
