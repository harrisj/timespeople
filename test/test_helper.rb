require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
gem 'chrisk-fakeweb'
require 'fake_web'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'timespeople'

class Test::Unit::TestCase
	API_KEY = '13e234323232222'

	def init_test_key
		TimesPeople::Base.api_key = API_KEY
	end
end

module TestTimesPeople
end
