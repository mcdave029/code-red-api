module V1
	class Login < Grape::API
		
		resource :login do
			desc 'Login endpoint'
			params do
				requires :email, type: String
				requires :password, type: String
			end
			post do
				user = User.find_by_email(params[:email])
				if user.present? && user.valid_password?(params[:password])
					user.id
				else
					error!("Invalid email or password for #{params[:email]}", 401)
				end
			end
		end

	end
end