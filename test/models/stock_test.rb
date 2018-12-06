require 'test_helper'

class StockTest < ActiveSupport::TestCase
	test "must not save stock if brand contains digits" do
		stock = Stock.new(band: "Nike",
						  category: "Shoes",
						   quantity: "123456",

	assert( !stock.save, "saved the stock, even though
	the quantity is not valid!")
	end
  	test "must allow only letters in brand and category" do
		stock = Stock.new(brand: "Nike",
						  category: "Shoes",
					      quantity: "123456",
	assert_equal(false, stock.save, "saved the stock even
					though brand name contains !")
		end
 	end
end
