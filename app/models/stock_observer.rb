require'my_logger'
class StockObserver < ActiveRecord::Observer
	
	# stock Update 
def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated car
	@logger.logInformation("###############Observer Stock:#")
	@logger.logInformation("+++ StockObserver: The stock of
#{record.brand} #{record.category}
has been updated by quantity. #{record.quantity}")
	@logger.logInformation("##############################")
	end


	# Stock Destroy 
	def after_destroy(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated car
	@logger.logInformation("###############Observer Stock:#")
	@logger.logInformation("--- StockObserver: The stock of
#{record.brand} #{record.category}
has been destroy by quantity. #{record.quantity}")
	@logger.logInformation("##############################")
	end

end