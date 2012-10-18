class PurchasesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
    @purchases=Purchase.search(params[:search])
    @sales=Sale.all
  end

  def home 
  	@purchases = Purchase.all
  	@sales = Sale.all
    @user= User.find(params[:id])
  end

  def create
    @purchase = current_user.purchases.build(params[:purchase])
    
    if @purchase.save
      flash[:success] = "Purchase created!"
      redirect_to :back
    else
      render "users#show"
    end
  end

  def new
    @user= User.find(params[:id])
    @purchase = Purchase.new(params[:purchase])
  end

  def destroy
    @purchase=Purchase.find(params[:id])
    @purchase.destroy
    redirect_to :back, :flash => { :success => "Purchase deleted!" }
  end


end