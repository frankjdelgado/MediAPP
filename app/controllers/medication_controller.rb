class MedicationController < ApplicationController

	before_action :detect_mobile, :validate_user

  # GET /medications
  # GET /medications.json
  def index
    @medications = current_user.treatments rescue nil
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

    respond_to do |format|
      if @medication.save
        # medimailer.pill_time_email(@medication).deliver
        format.html { redirect_to @medication, notice: 'Medication was successfully created.' }
        format.json { render :show, status: :created, location: @medication }
				# redirect_to controller: :nombre_controller, action: :nombre_action
      else
        format.html { render :new }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
				# redirect_to controller: :nombre_controller, action: :nombre_action
      end
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
    @medication.destroy
    respond_to do |format|
      format.html { redirect_to medications_url, notice: 'Medication was successfully destroyed.' }
      format.json { head :no_content }
			# redirect_to controller: :nombre_controller, action: :nombre_action

    end
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
