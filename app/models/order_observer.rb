require'my_logger'
class OrderObserver < ActiveRecord::Observer
	
	# order Update 
def after_update(record)
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated order
	@logger.logInformation("###############Observer Order:#")
	@logger.logInformation("+++ OrderObserver: The order of
	#{record.brand} #{record.category}
	has been updated ")
	end


	# Order Destroy 
	def after_destroy(record)
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated order
	@logger.logInformation("###############Observer Order:#")
	@logger.logInformation("--- OrderObserver: The order of
	#{record.brand} #{record.category}
	has been destroy  ")
	@logger.logInformation("##############################")
	end

end