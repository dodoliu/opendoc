class Backend::RolesController < Backend::ApplicationController
  before_action :set_role, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    p = params[:page]
    if !q.blank?
      @roles = Role.page(p).name_like(params[:q])
    else
      @roles = Role.page(p)
    end
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.set_attribute role_params
    respond_to do |format|
      if @role.save
        format.html { redirect_to backend_roles_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to backend_roles_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Role.delete(@role)
    respond_to do |format|
      format.html { redirect_to backend_roles_url, notice: '删除成功!' }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end
    def role_params
      params.require(:role).permit(:name)
    end
end
