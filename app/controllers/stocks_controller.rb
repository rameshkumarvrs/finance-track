class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end  
        
      else
        flash[:danger] = "please Enter the valid ticker symbol"
        redirect_to my_portfolio_path
      end  
    else
      flash[:danger] = "Please Enter the ticker symbol to Search"
      redirect_to my_portfolio_path
    end  
  end
end
