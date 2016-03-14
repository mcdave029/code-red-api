module V1
	class Users < Grape::API
		resource :users do
			desc "List of Respondees"

			get do
				User.all
			end

			desc "Create User Respondee"

			# curl -X POST -H "Content-Type: application/json" localhost:3000/api/v1/users.json -d '{"name":"sample","emergency_contacts":{"classification":1, "name":"sample contact person", "contact":"123123123"},"medical_record":{"blood_type":"h20", "medical_conditions":"wat!"}}' command line code for creating user

			params do
				requires :name, type: String
				requires :emergency_contacts, type: Hash do
					requires :classification, type: Integer
					requires :name, type: String
					requires :contact, type: String
				end
				requires :medical_record, type: Hash do
					requires :blood_type, type: String
					optional :medical_conditions, type: String
				end
			end

			post do
				@user = User.create({name: params[:name], user_type: "Respondee"});
				@emergency_contacts = @user.emergency_contacts.build(
					classification: params[:emergency_contacts][:classification],
					name: params[:emergency_contacts][:name],
					contact: params[:emergency_contacts][:contact]
				)
				@medical_record = @user.build_medical_record(
					blood_type: params[:medical_record][:blood_type],
					medical_conditions: params[:medical_record][:medical_conditions]
				);
				@medical_record.save
				@emergency_contacts.save
			end

		end
	end
end


