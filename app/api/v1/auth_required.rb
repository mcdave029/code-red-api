module V1
	class AuthRequired < Grape::API
		
		helpers do
			def authenticate!
        # return if Rails.env.development?
        uid = headers['Authorization']

        # Check if Authorization header is present, else return 401
        if @current_user
					@current_user
				else
					@current_user = begin 
														User.respondees.find_by_uid(uid)
													rescue ActiveRecord::RecordNotFound => e
														nil
													end
				end
        error!("401 Error: Missing Authorization header", 401) if uid.blank? || @current_user.nil?
      end
			def current_user
				@current_user
			end
		end

		before do
      authenticate!
    end

    mount V1::Reports

	end
end