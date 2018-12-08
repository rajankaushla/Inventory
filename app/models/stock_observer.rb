require'my_logger'
class StockObserver < ActiveRecord::Observer
	
	# stock Update 
def after_update(record)

	@logger = MyLogger.instance
# use the logger to log/record a message about the updated stock
	@logger.logInformation("###############Observer Stock:#")
	@logger.logInformation("+++ StockObserver: The stock of
#{record.brand} #{record.category}
has been updated by quantity. #{record.quantity}")
	@logger.logInformation("##############################")
	end


	# Stock Destroy 
	def after_destroy(record)
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated stock
	@logger.logInformation("###############Observer Stock:#")
	@logger.logInformation("--- StockObserver: The stock of
#{record.brand} #{record.category}
has been destroy by quantity. #{record.quantity}")
	@logger.logInformation("##############################")
	end

end