class Backend::UsersController < Backend::ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    p = params[:page]
    if !q.blank?
      @users = User.page(p).name_like(params[:q])
    else
      @users = User.page(p)
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.set_attribute user_params
    respond_to do |format|
      if @user.save
        format.html { redirect_to backend_users_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to backend_users_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    User.delete(@user)
    respond_to do |format|
      format.html { redirect_to backend_users_url, notice: '禁用成功!' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:email, :display_name, :password)
    end
end
