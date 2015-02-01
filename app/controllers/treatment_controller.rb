class TreatmentController < ApplicationController

	before_action :validate_user

	def index
  		@treatments = current_user.treatments
  	end

  	def new
		@treatment = Treatment.new
	end

  	def create
		@treatment = Treatment.new(treatment_params)
		@treatment.start = params[:treatment][:start].to_date.strftime("%Y-%m-%d")
		@treatment.finish = params[:treatment][:start].to_date.strftime("%Y-%m-%d")
		if @treatment.save
			redirect_to controller: :treatment, action: :index
		else
			redirect_to controller: :treatment, action: :index
		end
	end

	def destroy
		respond_to do |format|
			if Treatment.find(params[:id]).destroy
				format.json { render status: :ok, json:"Treatment Deleted." }
			else
				format.json { render status: :bad_request, json: "Treatment couldnt be deleted" }
			end
	    end
	end

	private

	def treatment_params
		params.require(:treatment).permit(:start, :finish, :hour, :frequency_quantity, :frequency_id, :user_id, :medication_id)
	end

end
