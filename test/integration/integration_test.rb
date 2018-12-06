# https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara
require 'test_helper'

class FlowTest < Capybara::Rails::TestCase
  def setup
  	
    @one = stocks :one
    @two = stocks :two
  end

  test 'stock index' do
    visit stocks_path

    assert page.has_content?(@one.brand)
    assert page.has_content?(@two.category)
  end
end