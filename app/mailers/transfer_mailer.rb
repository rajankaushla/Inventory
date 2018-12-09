class TransferMailer < ActionMailer::Base 

	# default from: 'rajankshl@gmail.com'
	def transfer_created(user)
		mail(to: user.email, 
			from: "rajankshl@gmail.com",
			subject: "Transfer Created",
			body: "New Transfer Has Been Created by!"
			)
	end
end