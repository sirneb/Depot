class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else 
      @products = Product.find_all_by_locale
      @cart = current_cart
      @checking_out = false
      index_count_inc       # session store index page count
      @count = session[:store_index_count] 
    end
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
