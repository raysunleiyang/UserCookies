class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:create,:update,:destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/uuid
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/uuid
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/uuid
  def destroy
    @user.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    
    #Return Json result
    def return_json(object)
      respond_to do |format|
      format.any{render json: object}
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
      :email, :dueDate,
      :originalReferringUrl,
      :userId, :createdDate,
      :createdBy, :modifitedDate,
      :modifitedBy)
    end
end
