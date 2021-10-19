class CommentsController < ApplicationController
  before_action :set_property, only: [:create, :edit, :update]

  def create

    # Search Property from the parameter value and build it as comments associated with Property.
    
    @comment = @property.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.html { redirect_to property_path(@property) }
      else
        format.html { redirect_to property_path(@property), notice: 'Could not post...' }
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
          flash.now[:notice] = 'Comment edited'
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Comment deleted'
      format.js { render :index }
    end
  end
  

  private
  # Strong parameters
  def comment_params
    params.require(:comment).permit(:property_id, :user_id,:content)
  end
  def set_property
    @property = Property.find(params[:property_id])
  end

end