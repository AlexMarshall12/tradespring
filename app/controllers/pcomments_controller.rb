class PcommentsController < ApplicationController
  before_filter :signed_in_user
  def create
    @purchase = Purchase.find(params[:purchase_id])
    @pcomment = @purchase.pcomments.build(params[:pcomment])
    @pcomment.user_id = current_user.id
    @pcomment.purchase = @purchase
   
    if @pcomment.save
       flash[:success] = "Offer submited!"
       redirect_to :back
    else
      render 'shared/_pcomment_form'
    end
  end

  def new
    @pcomment=purchase.pcomments.new
   
  end
   
  
end
