module V1
	class Users < Grape::API
		helpers do
			def user_params
	      ActionController::Parameters.new(params).require(:user).permit(:email,:password,:name,:contact,:avatar, medical_record_attributes: [:blood_type,:medical_conditions])
	    end
	  end

		resource :user do
			get ':id'	do
				present User.find(params[:id]), with: V1::Entities::Users::RegistrationCredentials
			end

			# http://localhost:3000/api/v1/users/registration.json
			desc "Create User Respondee"

			post 'registration' do
				user = User.new(user_params);
				if params[:avatar]
					avatar = params[:avatar]
					attachment = {
	            :filename => avatar[:filename],
	            :type => avatar[:type],
	            :headers => avatar[:head],
	            :tempfile => avatar[:tempfile]
	        }
					user.avatar = ActionDispatch::Http::UploadedFile.new(attachment)
				end
				if user.valid?
          user.save
          user.respondee!
          params[:classification].each_with_index do |c, i|
          	@emergency_contact = user.emergency_contacts.build({
          												classification: c,
          												name: params[:name][i],
          												contact: params[:contact][i]
          											})
          	@emergency_contact.save
          end
          present user, with: V1::Entities::Users::RegistrationCredentials
        else
        	err = []
        	user.errors.messages.each do |k, v|
        		err << "#{k} #{v[0]}"
        	end
        error!({:error_code => 404, :error_message => "#{err[0]}."}, 401)
        end
			end

			put '/:id/update' do
				user = User.find params[:id];
				user.update(user_params)
				if params[:avatar]
					avatar = params[:avatar]
					attachment = {
	            :filename => avatar[:filename],
	            :type => avatar[:type],
	            :headers => avatar[:head],
	            :tempfile => avatar[:tempfile]
	        }
					user.avatar = ActionDispatch::Http::UploadedFile.new(attachment)
				end
				if user.valid?
          user.save
          user.respondee!
          user.emergency_contacts.delete_all
          params[:classification].each_with_index do |c, i|
          	@emergency_contact = user.emergency_contacts.build({
          												classification: c,
          												name: params[:name][i],
          												contact: params[:contact][i]
          											})
          	@emergency_contact.save
          end
          present user, with: V1::Entities::Users::RegistrationCredentials
        else
        	err = []
        	user.errors.messages.each do |k, v|
        		err << "#{k} #{v[0]}"
        	end
        error!({:error_code => 404, :error_message => "#{err[0]}."}, 401)
        end
			end

		end

	end
end


