class AppointmentsController < ApplicationController
load_and_authorize_resource

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.order(created_at: :desc).page(params[:page])
  end

  def me
    @appointments = current_user.appointments.order(created_at: :desc).page(params[:page]).includes(:user)
    render :index
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = current_user.appointments.build(appointment_params)

    respond_to do |format|
      if @appointment.save
        AppointmentMailer.appointment_mailer(current_user).deliver
        flash[:success] = t("appointments.created")
        format.html { redirect_to @appointment }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)

        flash[:success] = t("appointments.updated")
        format.html { redirect_to @appointment }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      flash[:danger] = t("appointments.destroyed")
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_appointment
    #   @appointment = Appointment.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:description, :status, :date)
    end
end
