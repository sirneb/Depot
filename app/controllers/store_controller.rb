class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
    @checking_out = false
    index_count_inc       # session store index page count
    @count = session[:store_index_count] 
  end

  private

  def index_count_inc
    if session[:store_index_count].nil?
      session[:store_index_count] = 1
    else
      session[:store_index_count] += 1

    end
  end

end
