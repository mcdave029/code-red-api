module V1
	module Entities
		module Medical
			class Records < Grape::Entity
				expose :blood_type, :documentation => {:type => "string", :desc => "User blood type"}
				expose :medical_conditions, :documentation => {:type => "string", :desc => "User medical conditions"}

				private
					def medical_conditions
						object.medical_conditions.split(';').map{|m| m.gsub(/^\s|\s$/,'') } unless  object.medical_conditions.nil?
					end
			end
		end
	end
end