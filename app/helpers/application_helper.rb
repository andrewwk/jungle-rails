module ApplicationHelper

  def format_price(price)
    @price = '%.2f' % (price / 100.00)
    "$#{number_with_delimiter(@price)}"
  end

  def calculate_tax(price)
    @tax = price * 0.13
    "#{format_price(@tax)}"
  end

  def calculate_total(price)
    @total = price * 1.13
    "#{format_price(@total)}"
  end

end
