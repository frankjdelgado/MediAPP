class MedicationController < ApplicationController

	before_action :detect_mobile, :validate_user
  before_action :validate_admin, except: [:medications, :autocomplete]
  # GET /medications
  # GET /medications.json
  def index
    @medications = Medication.all
  end

  # GET /medications/1
  # GET /medications/1.json
  def show
  end

	# GET /medications/new	
	def new

		@medication = Medication.new

	end


  # GET /medications/1/edit
  def edit
  
  end

  # POST /medications
  # POST /medications.json
  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      redirect_to controller: :medication, action: :index
    else
      redirect_to controller: :medication, action: :index
    end

  end

  # PATCH/PUT /medications/1
  # PATCH/PUT /medications/1.json
  def update
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to @medication, notice: 'Medication was successfully updated.' }
        format.json { render :show, status: :ok, location: @medication }
				# redirect_to controller: :nombre_controller, action: :nombre_action
      else
        format.html { render :edit }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
				# redirect_to controller: :nombre_controller, action: :nombre_action
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.json
  def destroy
    respond_to do |format|
      if Medication.find(params[:id]).destroy
        format.json { render status: :ok, json:"Medication Deleted." }
      else
        format.json { render status: :bad_request, json: "Medication couldnt be deleted" }
      end
    end
  end

  def autocomplete
    respond_to do |format|
      meds = Medication.search(params[:q])
      format.json { render status: :ok, json: meds.to_json }
    end
  end

  def medications
    @medications = Medication.all
  end

	private
    # Use callbacks to share common setup or constraints between actions.
		def set_medication
			@medication = Medication.find(params[:id])
		end

		def medication_params
			params.require(:medication).permit(:name, :description)
		end

end
