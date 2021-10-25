class HomeController < ApplicationController
  

  def guest_user
    user = User.find_by(email: "guest@gmail.com")
    if user
      sign_in user
      redirect_to properties_path
    else
      redirect_to home_index_path, notice: "User not exist !"
    end
  end

  def guest_admin
    user = User.find_by(email: "admin@gmail.com")
    if user
      sign_in user
      redirect_to rails_admin_path
    else
      redirect_to home_index_path, notice: "User not exist !"
    end
  end


  def index
   
  end
  def contact
    @contact = Home.new(params[:home])
  end

  def create
    @contact = Home.new(params[:home])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Home.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
