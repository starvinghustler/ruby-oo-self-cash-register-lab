class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times do
        items << title     #because if only left as @items << title, the return on array will only be one multiple of each item, however we need each individual item
        end
        self.last_transaction = price * quantity #sets up the void_last... method
    end

    def apply_discount
        if discount != 0
            self.total = (total * ((100 - discount.to_f)/100)).to_i     #.to_f converts number into float, used for more precision
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end
