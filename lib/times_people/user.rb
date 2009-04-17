require 'digest/md5'

module TimesPeople
	class User < Base
		attr_reader :user_id, :display_name, :location, :picture_url, :following_count, :followers_count
		
		def initialize(hash)
			@user_id = hash[:user_id]
			@display_name = hash[:display_name]
			@location = hash[:location]
			@picture_url = hash[:picture_url]
			@following_count = hash[:following_count]
			@followers_count = hash[:followers_count]
		end
		
		# http://api.nytimes.com/svc/timespeople/api/{version}/user/{hash}/id{.response-format}?api-key={your-API-key}
		def self.find(email_addr)
			digest = Digest::MD5.hexdigest(email_addr.downcase)
			
			begin
				reply = invoke("user/#{digest}/id")
				if reply.nil?
					raise UserNotFoundError, "No user with that email address was found in TimesPeople"
				end
				
			rescue ServerError
				raise UserNotFoundError, "No user with that email address was found in TimesPeople"
			end
			
			# http://api.nytimes.com/svc/timespeople/api/{version}/user/{user-id}/{data-type}{.response-format}?api-key={your-API-key}
			unless reply['results'].nil? || reply['results']['user_id'].nil?
				user_id = reply['results']['user_id']
				reply = invoke("user/#{user_id}/profile")
				init_from_api(reply['results'])
			end
		end
		
		def self.init_from_api(api_hash)
			new :user_id => api_hash['user_id'],
					:display_name => api_hash['user_displayname'],
					:location => api_hash['location'],
					:picture_url => api_hash['user_pic_url'],
					:following_count => api_hash['following_count'],
					:followers_count => api_hash['followers_count']
		end
	end
end
