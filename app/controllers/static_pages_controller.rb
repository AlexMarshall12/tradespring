class StaticPagesController < ApplicationController
  def home
  	@purchase = current_user.purchases.build if signed_in?
  	@sale = current_user.sales.build if signed_in?
  	@purchases=Purchase.all
  	@sales=Sale.all
  	
  end

  def about
  end
end
