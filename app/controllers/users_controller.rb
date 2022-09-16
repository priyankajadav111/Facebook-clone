class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def index
    
  end

    def show
      @user = User.find(params[:id])
    end

  
   def create
      @user = User.create(user_params)
 
      if @user.save
      redirect_to user_path(@user)
      else
        render 'new'
      end
   end
 
private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country)
  end

  def edit
  end
  def home
  end
  
end
