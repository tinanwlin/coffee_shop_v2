class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #def authorize
  #  redirect_to "login" unless current_user
  #end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private
  
  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
  
end
