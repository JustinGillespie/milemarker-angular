module Api
	module V1
    class ProjectsController < Api::BaseController
			  		
  		def index
  			@projects = account.projects.all
  		end

			def edit
			end

      def show
        @project = account.projects.find(params[:id])
      end

			def create
        @project = account.projects.build(project_params)
        render(:json => { :errors => @project.errors.full_messages }, :status => 422) if !@project.save
     	end

      def update
      end

      def destroy
      end

    private

      def project_params
        params.require(:project).permit(:name, :description, :account_id)
      end

		end #ProjectsController
  end # V1
end # Api
