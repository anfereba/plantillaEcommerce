class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :producto
  belongs_to :user, optional: true

  before_save :set_unit_price
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      producto.precio
    end
  end


  def total
    unit_price*quantity
  end


  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total * quantity
  end

  def current_order
    if session[:order_id].nil? && user_signed_in? && current_user.orders != []
      #if there is no command and the user is logged in and user already has a current command
      Order.find(session[:order_id] = current_user.orders.last.id)
    elsif !session[:order_id].nil? && user_signed_in? && current_user.orders != [] && current_user.orders.last.id != session[:order_id]
      #if there is a current command and the user is logged in and the user already has a command and the id of his command is different from the id of the session
      current_user.orders.last.order_items += Order.find(session[:order_id]).order_items
      Order.find(session[:order_id]).destroy!
      Order.find(session[:order_id] = current_user.orders.last.id)
    elsif !session[:order_id].nil? && user_signed_in? && current_user.orders == [] && Order.find(session[:order_id]).user_id.nil?
      #if there is a current command and the user is logged in and the user has no command and the command does not have user_id
      pan = Order.find(session[:order_id])
      pan.user_id = current_user.id
      pan.save
      Order.find(session[:order_id])
    elsif !session[:order_id].nil?
      #if there is no user login but there is a command
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
