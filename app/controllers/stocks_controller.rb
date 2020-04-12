class StocksController < ApplicationController

   def search_stocks
        if params[:stock].blank?
            flash.now[:danger] = "You have entered an empty string"
        else    
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
        end    
        respond_to do |format|
            format.js { render partial: 'users/result'}
        end    
    end 


   private
   def stock_params
    params.require(:stock).permit(:name, :ticker, :last_price)
   end 
end    