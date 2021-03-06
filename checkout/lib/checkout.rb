require 'promotional_rules'
require 'product_range'

class Checkout
	attr_reader :product_range, :promotional_rules, :basket

	def initialize(product_range = ProductRange.new, promotional_rules = PromotionalRules.new)
		@product_range = product_range.items
		@promotional_rules = promotional_rules
		@basket = []
	end

	def scan product_code
		basket << product_code
	end

	def total
		total = 0
		basket.map{ |item| total += product_range[item][1] }
		total = promotional_rules.apply_promotions(total, basket)
		apply_currency_formatting(total)
	end

	def apply_currency_formatting total
		"£" + (sprintf "%.2f", total)
	end
end
