require 'pry'

class CashRegister
  attr_accessor :total, :discount, :quantity, :last_transaction

  @items = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def items
    @items
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    quantity.times {@items << title}
    @last_transaction = (price * quantity)
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      money_from_total = @total * (discount * 0.01)
      @total -= money_from_total
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end


end
