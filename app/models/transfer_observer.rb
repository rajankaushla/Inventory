require'my_logger'
class TransferObserver < ActiveRecord::Observer
	
	# transfer Update 
def after_update(record)	@logger = MyLogger.instance
# use the logger to log/record a message about the updated transfer
	@logger.logInformation("###############Observer Transfer:#")
	@logger.logInformation("+++ TransferObserver: The transfer of
	#{record.brand} #{record.category}
	has been updated ")
	end


	# Transfer Destroy 
	def after_destroy(record)
	@logger = MyLogger.instance
# use the logger to log/record a message about the updated transfer
	@logger.logInformation("###############Observer Transfer:#")
	@logger.logInformation("--- TransferObserver: The transfer of
	#{record.brand} #{record.category}
	has been destroy  ")
	@logger.logInformation("##############################")
	end

end