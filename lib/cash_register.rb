require 'pry'

# class CashRegister
#     attr_accessor :discount, :total, :add_item

#     def initialize(discount = 0)
#         @discount = discount
#         @total = 0
#     end

#     def total
#         @total
#     end

#     def add_item(title, price, quantity = 1)
#         @title = title
#         subtotal = (price * quantity)
#         @total =  subtotal + @total
#     end

#     def apply_discount
#         the_discount = (@discount.to_i / 100) * @total
#         @total = @total - the_discount.to_i
#     end
# end





class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, quantity = 1)
      self.last_transaction = amount * quantity
      self.total += self.last_transaction
      quantity.times do
        self.items << title
      end
    end
  
    def apply_discount
      if self.discount != 0
        discount_as_percent = (100.0 - self.discount.to_f) / 100
        self.total = (self.total * discount_as_percent).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
    end
  end