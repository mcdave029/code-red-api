module V1
	class Users < Grape::API
		helpers do
			def user_params
	      ActionController::Parameters.new(params).require(:user).permit(:email,:password,:name, :user_type, :contact, :avatar)
	    end
	  end

		resource :users do
			get ':id'	do
				return present User.find(params[:id]), with: V1::Entities::Users::RegistrationCredentials
			end

			# http://localhost:3000/api/v1/users/registration.json
			desc "Create User Respondee"

			params do
				requires :blood_type, type: String
				requires :medical_conditions, type: String
				requires :user, type: Hash do
					requires :email, type: String
					requires :password, type: String
					requires :name, type: String
					requires :user_type, type: String
					requires :contact, type: String
				end
			end

			post 'registration' do
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
				if user.valid?
          user.save
          @medical_record = user.build_medical_record({
															blood_type: params[:blood_type],
															medical_conditions: params[:medical_conditions]
														})
					@medical_record.save
          params[:classification].each_with_index do |c, i|
          	@emergency_contact = user.emergency_contacts.build({
          												classification: c,
          												name: params[:name][i],
          												contact: params[:contact][i]
          											})
          	@emergency_contact.save
          end
          return present user, with: V1::Entities::Users::RegistrationCredentials
        else
        error!({:error_code => 404, :error_message => "Invalid email or password."}, 401)
        end
			end

		end

	end
end


