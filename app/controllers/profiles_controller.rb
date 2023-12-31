class ProfilesController < ApplicationController

  def show

    @user = User.find(params[:id])
    @infos = Info.all
    # @users = User.all
    @users_approved = User.where(status: 'approved')
    @users_staff = User.where(member: 'STAFF')
    @chatrooms = []
    @wishes = []
    @requests = []
    # @packages = Package.all
    unless params[:search].blank?
      data_base = User.where.not(id: current_user.id)
      @parameter = params[:search].downcase
      @users = data_base.where("last_name ILIKE :search OR first_name ILIKE :search OR company ILIKE :search OR activity ILIKE :search OR member ILIKE :search OR email ILIKE :search", search: "%#{@parameter}%")
      # pesquisando pelo first_name, last_name, company, activity, member e email
    end
    # Chatroom.where(user_id: current_user.id).each { |chatroom| @chatrooms << chatroom }
    # Chatroom.where(invited_id: current_user.id).each { |chatroom| @chatrooms << chatroom }
    # Wish.where(user_id: current_user.id).each { |wish| @wishes << wish }
    # Wish.where(invited_id: current_user.id).each { |request| @requests << request  }
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.email == 'joa.azria@gmail.com' || current_user.id == @user.user_id
      redirect_to root_path, notice: 'Unauthorized Area'
    end
    
    unless current_user.email == 'dwftung@gmail.com' || current_user.email == 'joa@birds.art.br' || current_user.email == 'patrickzuchowicki@basiclead.com' || current_user.email == 'joa.azria@gmail.com' || current_user.email == 'joa@discop.tv'
      redirect_to root_path, notice: 'Unauthorized Area'
    end
  end

  def update
    @user = User.find(params[:id])
    unless current_user.email == 'dwftung@gmail.com' || current_user.email == 'joa@birds.art.br' || current_user.email == 'patrickzuchowicki@basiclead.com' || current_user.email == 'joa.azria@gmail.com' || current_user.email == 'joa@discop.tv'
      redirect_to root_path, notice: 'Unauthorized Area'
    end

    if @user.update(user_params)
      redirect_to dashboard_path, notice: 'User Updated'
    else
      # render :edit
    end
    # @user.status == "approved" ? send_status_mail : status_not_approved_email
  end

  private

  # def send_status_mail
  #   AdminMailer.with(user: self).status_email(@user).deliver_now
  # end

  # def status_not_approved_email
  #   AdminMailer.with(user: self).status_not_approved_email(@user).deliver_now
  # end

  def user_params
    params.require(:user).permit(:status, :member)
  end
end
