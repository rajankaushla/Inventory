require 'rails_helper'
# https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
RSpec.describe Order, :type => :model do 
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.brand = "Anything"
    subject.category = "Anything"
    subject.quantity = "Anything"
    subject.order_date = Date.now 
    subject.manager = "Anything"
    expect(subject).to be_valid
  end

  it "is not valid without a brand" do
    expect(subject).to_not be_valid
  end
  it "is not valid without a category" do
    expect(subject).to_not be_valid
  end

	it "is not valid without a quantity" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a order_date" do
    subject.title = "Anything"
    subject.order_date = Date.now
    expect(subject).to_not be_valid
  end
	it "is not valid without a manager" do
    expect(subject).to_not be_valid
  end
  
  end
end