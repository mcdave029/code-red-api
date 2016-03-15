module V1
	class Users < Grape::API
		helpers do
			def user_params
	      ActionController::Parameters.new(params).require(:user).permit(:name, :user_type, :contact, :avatar)
	    end
	  end

		resource :users do
			desc "List of Respondees"

			get do
				User.all
			end

			desc "Create User Respondee"

			params do
				requires :blood_type, type: String
				requires :medical_conditions, type: String
				requires :user, type: Hash do
					requires :name, type: String
					requires :user_type, type: String
					requires :contact, type: String
				end
			end

			post do
				avatar = params[:avatar]
				attachment = {
            :filename => avatar[:filename],
            :type => avatar[:type],
            :headers => avatar[:head],
            :tempfile => avatar[:tempfile]
        }

				user = User.new(user_params);
				user.avatar = ActionDispatch::Http::UploadedFile.new(attachment)
				user.save
				@medical_record = user.build_medical_record({
						blood_type: params[:blood_type],
						medical_conditions: params[:medical_conditions]
					})
				@medical_record.save
			end

		end

	end
end


