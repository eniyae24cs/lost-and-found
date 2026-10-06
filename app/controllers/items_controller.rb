class ItemsController < ApplicationController

  def index
    @items = Item.all.order(created_at: :desc)

    if params[:status].present?
      @items = @items.where(status: params[:status])
    end

    if params[:search].present?
      search = "%#{params[:search]}%"
      @items = @items.where(
        "title LIKE ? OR category LIKE ? OR location LIKE ?",
        search, search, search
      )
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: "Item reported successfully!"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item, notice: "Item updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, notice: "Item deleted successfully!"
  end
  def claim
    @item = Item.find(params[:id])

    if @item.status == "Found"
      @item.update(status: "Claimed")
      redirect_to @item, notice: "Item claimed successfully!"
    else
      redirect_to @item, alert: "Only Found items can be claimed!"
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :title,
      :description,
      :category,
      :location,
      :date_lost_found,
      :status,
      :contact_name,
      :contact_email,
      :image
    )
  end

end
