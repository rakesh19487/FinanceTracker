class UserStocksController < ApplicationController
    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.new_from_lookup(params[:stock_ticker])
            stock.save
        end    

        @user_stocks = UserStock.create(user: current_user, stock: stock)

        flash[:success] = "Stock #{@user_stocks.stock.name} was successfully added to you protfolio"
        redirect_to my_portfolio_path
    end    

    def destroy
        stock = Stock.find(params[:id])
        user_stock = UserStock.where(user: current_user, stock: stock).first
        user_stock.delete
        flash[:success] = "Successfully deleted the stock"
        redirect_to my_portfolio_path
    end    
end
