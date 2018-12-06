class Stock < ApplicationRecord
	has_one :order
	has_one :transfer 
	validates :brand, :category, :quantity, presence: true
	validates :quantity, format: { with: /\A[0-9]+\z/, message: "accepts digits only!" }
	validates_each :brand, :category do |record, attr, value|
	record.errors.add(attr,'must contain only letters!') if
	value =~ /[^\A[a-zA-Z]+\z]/
	end
	def self.search(search)
		if search
			where(["brand LIKE ?","%#{search}%"])
		else
			all
		end
	end
end