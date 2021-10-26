class PropertiesController < ApplicationController
  load_and_authorize_resource

  # GET /properties or /properties.json
  def index
    # @properties = current_user.properties.order(created_at: :desc).page(params[:page]).includes(:user)
    @properties = Property.order(created_at: :desc).page(params[:page])
    @properties = Property.order(type_of_property: :asc).page(params[:page]).includes(:user) if params[:sort_type]
    @properties = Property.order(status: :asc).page(params[:page]).includes(:user) if params[:sort_status]


    if params[:type_of_property].present?
			if params[:status].present? 
				@properties = Property.type_of_property_search(params[:type_of_property]).status_search(params[:status]).page params[:page]
			else
				@properties = Property.type_of_property_search(params[:type_of_property]).page(params[:page])
			end
		else
      if params[:status].present?
			  @properties = Property.status_search(params[:status]).page(params[:page])
      end
		end

  end

  # GET /properties/1 or /properties/1.json
  def show
    @comments = @property.comments
    @comment = @property.comments.build
    # @images = @property.images.all
  end

  # GET /properties/new
  def new
    @property = Property.new
    # @image = @property.images.build
    # @property.images.build
    
  end

  # GET /properties/1/edit
  def edit
    # @images = @property.images.build
  end

  # POST /properties or /properties.json
  def create

    @property = current_user.properties.build(property_params)
    # property.images.attach(params[:property][:images])
    respond_to do |format|
      if @property.save
        # params[:images]['illustration'].each do |a|
        #     @image = @property.images.create!(:illustration => a, :property_id => @property.id, :title => @title)
        # end
        # params[:property][:images].each do |a|
        #   @property = @property.images.create!(:images =>a)
        # end
          flash[:success] = t("properties.created")
          format.html { redirect_to @property }
          format.js { render :index }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js { render :index }
      end
    end

  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        flash[:success] = t("properties.updated") 
        format.html { redirect_to @property }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      flash[:danger] = t("properties.destroyed")
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_property
    #   @property = Property.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :type_of_property, :description, :address, :price, :status, images: [])
    end
end
