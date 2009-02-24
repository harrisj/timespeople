require File.dirname(__FILE__) + '/../test_helper.rb'

class TestTimesPeople::TestBase < Test::Unit::TestCase
	include TimesPeople
	
	context "Base.build_request_url" do
	end
	
	context "Base.invoke" do
		setup do
			init_test_key
		end
		
		context "when the API key has not been set" do
			setup do
				Base.api_key = nil
			end
			
			should_eventually "raise an AuthenticationError" do
				assert_raise(AuthenticationError) do
					Base.invoke
				end
			end			
		end
		
		context "when the Articles API returns a 403 forbidden error (API key issue)" do
			setup do
				FakeWeb.register_uri(api_url_for, :status => ["403", "Forbidden"])
			end
			
			should_eventually "raise an AuthenticationError" do
				assert_raise(AuthenticationError) do
					Base.invoke
				end
			end
		end
		
		context "when the Articles API returns a 400 bad request error" do
			setup do
				FakeWeb.register_uri(api_url_for, :status => ["400", "Bad Request"])
			end
			
			should_eventually "raise an BadRequestError" do
				assert_raise(BadRequestError) do
					Base.invoke
				end
			end
		end
		
		context "When calling the Articles API returns a 500 server error" do
			setup do
				FakeWeb.register_uri(api_url_for, :status => ["500", "Server Error"])
			end
			
			should_eventually "raise an ServerError" do
				assert_raise(ServerError) do
					Base.invoke
				end
			end
		end
		
		context "when the Articles API returns any other HTTP error" do
			setup do
				FakeWeb.register_uri(api_url_for, :status => ["502", "Random Error"])
			end
			
			should_eventually "raise an ConnectionError" do
				assert_raise(ConnectionError) do
					Base.invoke
				end
			end
		end
		
		context "When the Articles API returns JSON that can't be parsed" do
			setup do
				FakeWeb.register_uri(api_url_for, :text => "e2131421212121221 => 3i109sdfvinp;2 112")
			end
			
			should_eventually "raise an BadResponseError" do
				assert_raise(BadResponseError) do
					Base.invoke
				end
			end
		end
	end
end