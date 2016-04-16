module V1
	class ResponderReportLists < Grape::API
		
		helpers do
			def responder_params
	      ActionController::Parameters.new(params).require(:responder).permit(:eta,:contact)
	    end
	  end

		resource :list_of_reports do
			desc 'List reports by location'
			get do
        present Report.location_sort(params[:lat],params[:lng]), with: V1::Entities::Report::View
      end

      desc 'Create responders to report'
      post '/:id/respond' do
      	report = Report.find(params[:id])
      	report.responders.build(responder_params).save
      	present report, with: V1::Entities::Report::View
	    end
		end

	end
end