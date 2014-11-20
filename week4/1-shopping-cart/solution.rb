require 'bigdecimal'
require 'bigdecimal/util'

class Integer
  def ordinal
    cardinal = self.abs
    digit = cardinal%10
    if (1..3).include?(digit) and not (11..13).include?(cardinal%100)
      self.to_s << %w{st nd rd}[digit-1]
    else
      self.to_s << 'th'
    end
  end
end

module InvoicePrintForShoppingCart
  def invoice
    invoice_message, grid, @prices = '', '+' + ('-' * 48) + '+' + ('-' * 10) + '+', []
    invoice_message += grid + sprintf("\n| Name%-39sqty |    price |\n#{grid}", '')
    invoice_message += invoice_add_products_to_string
    invoice_message += invoice_coupon_to_string(
      @prices.reduce { |current, next_one| current + next_one }, grid)
    invoice_message += sprintf("\n#{grid}\n| TOTAL%41s |", '') + \
      ('%.2f' % @prices.reduce { |prices_sum, next_price| prices_sum += next_price })
      .rjust(9) + " |\n#{grid}\n"
  end

  def invoice_add_products_check_promo(promo_data, product_price, product_count, product_name)
    @prices << (product_price * product_count).to_f
    product_message = sprintf(
      "\n| %-40s#{product_count.to_s.rjust(6)} |%9.2f |", product_name, @prices.last)
    unless promo_data.nil?
      promo_name = promo_data.keys[0]
      @prices << - (product_price * product_count - calculate_promotion(
        product_name, product_count, product_price, promo_data)).to_f
      product_message += "\n|   #{invoice_promo_to_string(promo_name, @prices.last, product_name, promo_data[promo_name])}"
    end
    product_message
  end

  def invoice_add_products_to_string
    products_message = ''
    @products_in_cart.each do |product_name, product_count|
      promo_data, product_price = @promo[product_name], @products[product_name]
      products_message +=
        invoice_add_products_check_promo(promo_data, product_price, product_count, product_name)
    end
    products_message
  end

  def invoice_promo_to_string(promo_type, promo_sum, product_name, promo_value)
    case promo_type
      when :get_one_free then sprintf("%-45s", "(buy #{promo_value - 1}, get 1 free)")
      when :package
        sprintf("%-45s", "(get #{promo_value.values[0]}% off for every #{promo_value.keys[0]})")
      else
        sprintf("%-45s", "(#{promo_value.values[0]}% off of every after the #{promo_value.keys[0].ordinal})")
      end + \
      sprintf("| %8s |", ('%.2f' %  promo_sum.to_f))
  end

  def invoice_coupon_to_string(total_price_without_coupons, grid)
    unless @coupon_name.nil?
      coupon_message = "\n| Coupon #{@coupon_name} - "
      if @coupons[@coupon_name].has_key? :percent
        coupon_message += ("#{@coupons[@coupon_name][:percent]}% off").ljust(37 - @coupon_name.length)
      elsif @coupons[@coupon_name].has_key? :amount
        coupon_message += sprintf("%.2f off %19s", @coupons[@coupon_name][:amount].to_f, '')
      end
      @prices << - (total_price_without_coupons.to_f - use_coupon(total_price_without_coupons)).to_f
      coupon_message += sprintf("|%4s%.2f |", '', @prices.last)
    end.to_s
  end
end

class Inventory

  def initialize
    @products = {}
    @promo    = {}
    @coupons  = {}
  end

  def register(product_name, product_price, get_one_free: nil, package: nil, threshold: nil)
    if product_name.length > 40 or @products.has_key? product_name or
       not BigDecimal(product_price).between? BigDecimal('0.01') , BigDecimal('999.99')
      raise 'Invalid parameters passed.'
    else
      @products[product_name] = BigDecimal(product_price)
    end
    @promo[product_name] = { get_one_free: get_one_free } unless get_one_free.nil?
    @promo[product_name] = { package: package }           unless package.nil?
    @promo[product_name] = { threshold: threshold }       unless threshold.nil?
  end

  def register_coupon(coupon_name, coupon_hash)
    @coupons[coupon_name] = coupon_hash
  end

  def new_cart
    new_cart = Cart.new(@products, @promo, @coupons)
  end

end

class Cart
  include InvoicePrintForShoppingCart

  def initialize(products, promo, coupons)
    @products_in_cart = {}
    @products = products
    @promo = promo
    @coupons = coupons
    @coupon_name = nil
  end

  def add(product_name, product_quantity = 1)
    if not @products.include? product_name or not product_quantity.between? 1, 99
      raise 'Invalid parameters passed.'
    elsif not @products_in_cart.has_key? product_name
      @products_in_cart[product_name] = product_quantity
    else
      @products_in_cart[product_name] += product_quantity
    end
    
  end

  def calculate_promotion(product_name, product_quantity, product_price, promo_data)
    return product_price * product_quantity if @promo.size.zero?
    case promo_type = promo_data.keys[0]
      when :get_one_free
        (product_quantity - (product_quantity.to_i / promo_data.values[0].to_i))
      else
        promo_value    = 1 - promo_data[promo_type].values[0] / 100.to_d
        package_or_threshold_promo(product_price, product_quantity, promo_value, promo_data)
    end \
    * product_price
  end

  def package_or_threshold_promo(product_price, product_quantity, promo_value, promo_data)
    promo_quantity = promo_data[promo_data.keys[0]].keys[0]
    case promo_type = promo_data.keys[0]
      when :package
        (product_quantity % promo_quantity.to_d + promo_value *
        promo_quantity * (product_quantity / promo_quantity).to_i)
      when :threshold
        ([product_quantity, promo_quantity].min + promo_value *
        [0, (product_quantity - promo_quantity).to_i].max)
    end
  end

  def use(coupon_name)
    @coupon_name = coupon_name
  end

  def use_coupon(total_price)
    return total_price if @coupon_name.nil?
    coupon_type  = @coupons[@coupon_name].keys[0]
    coupon_value = @coupons[@coupon_name].values[0]
    if coupon_type == :percent
      total_price * (1 - coupon_value / 100.to_d)
    elsif coupon_type == :amount
      [0, total_price - coupon_value.to_d].max
    end
  end

  def total
    @products_in_cart.map do |product|
      product_name = product[0]
      product_quantity = @products_in_cart[product_name].to_d
      product_price = @products[product_name]
      promo_data = @promo[product_name]
      use_coupon(
        calculate_promotion(product_name, product_quantity, product_price, promo_data)
      )
    end
      .reduce { |sum, product_quantity| sum + product_quantity }
  end
end
