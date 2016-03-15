module V1
	module Entities
		module Emergency
			class Contacts < Grape::Entity
				expose :name, :documentation => {:type => "string", :desc => "Emergency contact name"}
				expose :contact, :documentation => {:type => "string", :desc => "Emergency contact number"}
			end
		end
	end
end