class UserStocksController < ApplicationController
  def create
    stock = Stock.new_lookup(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end  
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "The #{stock.name} was added succesfully in your portfolio"
    redirect_to my_portfolio_path
  end  

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy
    flash[:notice] = "#{stock.ticker} was successfully deleted"
    redirect_to my_portfolio_path
  end
end
