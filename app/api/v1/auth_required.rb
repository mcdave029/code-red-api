module V1
	class AuthRequired < Grape::API
		
		helpers do
			def authenticate!
        # return if Rails.env.development?
        auth_header = headers['Authorization']

        # Check if Authorization header is present, else return 401
        error!("401 Error: Missing Authorization header", 401) if auth_header.blank?
      end
			def current_user
				auth = headers['Authorization']	

				if @current_user
					@current_user
				else
					@current_user = begin 
														User.respondees.find(auth)
													rescue ActiveRecord::RecordNotFound => e
														nil
													end
				end
			end
		end

		before do
      authenticate!
    end

    mount V1::Reports

	end
end