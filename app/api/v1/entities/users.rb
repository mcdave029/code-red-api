module V1
	module Entities
		module Users
			class	RegistrationCredentials < Grape::Entity
				expose :uid, :documentation => {:type => "integer", :desc => "The numeric id of the User"}
				expose :email, :documentation => {:type => "string", :desc => "User email"}
				expose :name, :documentation => {:type => "string", :desc => "User Fullname"}
				expose :contact, :documentation => {:type => "string", :desc => "User Contact"}
				expose :avatar, :documentation => {:type => "string", :desc => "Profile image url"}
				expose :medical_record, using: V1::Entities::Medical::Records
				expose :emergency_contacts, using: V1::Entities::Emergency::Contacts
				
				def avatar
					URI.join(ActionController::Base.asset_host, object.avatar.url).to_s
				end
			end
		end
	end
end
