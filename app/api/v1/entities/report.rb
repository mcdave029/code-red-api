module V1
	module Entities
		module Report
			class View < Grape::Entity
				expose :name, :documentation => {:type => "string", :desc => "Emergency contact name"}
			end
		end
	end
end