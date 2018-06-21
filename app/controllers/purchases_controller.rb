class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @brews = Brew.all
  end

  def create
    purchase = Purchase.new(purchase_params)
    purchase.customer = Customer.find_or_create_by(name: params[:purchase][:customer])

    if purchase.valid?
      purchase.save
      redirect_to purchase.customer
    else
      render :new
    end

  end

  private
  def purchase_params
    params.require(:purchase).permit(:brew_id, :size, :strength)
  end
end
