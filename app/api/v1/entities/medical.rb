module V1
	module Entities
		module Medical
			class Records < Grape::Entity
				expose :blood_type, :documentation => {:type => "string", :desc => "User blood type"}
				expose :medical_conditions, :documentation => {:type => "string", :desc => "User medical conditions"}
			end
		end
	end
end