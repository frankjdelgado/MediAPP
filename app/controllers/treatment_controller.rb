class TreatmentController < ApplicationController

	before_action :validate_user

	def index
  		@treatments = current_user.treatments
  	end

  	def new
		@treatment = Treatment.new
	end

  	def create
		@treatment = Treatment.new
		@treatment.start = params[:treatment][:start].to_date.strftime("%Y-%m-%d")
		@treatment.finish = params[:treatment][:start].to_date.strftime("%Y-%m-%d")
		@treatment.hour = params[:treatment][:hour]
		@treatment.frequency_quantity = params[:treatment][:frequency_quantity].to_i
		@treatment.frequency_id = params[:treatment][:frequency_id]
		@treatment.user_id = params[:treatment][:user_id]
		@treatment.medication_id = params[:treatment][:medication_id]
		if @treatment.save
			# flash[:notice] = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, vitae?"
			redirect_to controller: :treatment, action: :index
		else
			# flash[:warning] = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio, vitae?"
			redirect_to controller: :treatment, action: :index
		end
	end

	def destroy

		if Treatment.find(params[:id]).destroy
			redirect_to controller: :treatment, action: :index
		else
			redirect_to controller: :treatment, action: :index
		end
		
	end

	private

	def treatment_params
		params.require(:treatment).permit(:start, :finish, :hour, :frequency, :frequency_id, :user_id, :medication_id)
	end

end
