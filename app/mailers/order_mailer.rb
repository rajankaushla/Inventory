class OrderMailer < ActionMailer::Base

	# default from: 'rajankshl@gmail.com'
	def order_created(user)
		mail(to: user.email, 
			from: "rajankshl@gmail.com",
			subject: "Order Created",
			body: "New Order Has Been Created by!"
			)
	end
end