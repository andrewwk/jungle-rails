module ApplicationHelper

  def format_price(price)
    @price = price/100.00
    "$#{number_with_delimiter(@price)}"
  end

  def calculate_tax(price)
    @tax = price * 0.13
    "#{format_price(@tax)}"
  end

end
