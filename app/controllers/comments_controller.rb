class CommentsController < ApplicationController
  before_action :set_property, only: [:create, :edit, :update]
  # before_action :set_comment, only: [:edit, :update]
  
  def create
    @comments = Comment.where(property_id: @property).order("created_at DESC")
    # Search Property from the parameter value and build it as comments associated with Property.
    @comment = @property.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        flash[:succes] = t("comments.created")
        format.html { redirect_to property_path(@property) }
        format.js { render :index }
        # format.json { render :show, status: :created, location: [@servicerequest, @upload] }
      else
        flash[:danger] = 'Could not post...'
        format.html { redirect_to property_path(@property) }
      end
    end
  end

  def edit
    @comment = @property.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Editing comment'
      format.js { render :edit }
    end
  end

  def update
    @comment = @property.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = t("comments.updated")
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comments = Comment.where(property_id: @property).order("created_at DESC")
    @comment.destroy
    respond_to do |format|
      #flash[:danger] = 'Comment was successfully destroyed.'
      format.html { redirect_to property_path(@property) }
      format.js { render :index }
    end
    # @comment = Comment.find(params[:id])
    # @comment.destroy
    # respond_to do |format|
    #   flash.now[:notice] = 'Comment deleted'
    #   format.js { render :index }
    # end
  end
  

  private
  # Strong parameters
  def comment_params
    params.require(:comment).permit(:property_id, :user_id, :content)
  end
  def set_property
    @property = Property.find(params[:property_id])
  end
  # def set_comment
  #   @comment = @property.comments.find(params[:id])
  # end

end