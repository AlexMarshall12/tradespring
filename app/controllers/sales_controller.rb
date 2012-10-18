class SalesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
    @sales=Sale.search(params[:search])
    @purchases=Purchase.all
  end

  def home 
  	@purchases = Purchase.all
  	@sales = Sale.all
  end

  def create
    @sale = current_user.sales.build(params[:sale])
    if @sale.save
      flash[:success] = "Sale created!"
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end

  def new
    @sale = Sale.new(params[:sale])
  end

  def destroy
    @sale=Sale.find(params[:id])
    @sale.destroy
    redirect_to root_path, :flash => { :success => "Sale deleted!" }
  end

end