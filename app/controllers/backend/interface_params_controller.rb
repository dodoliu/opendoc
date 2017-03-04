class Backend::InterfaceParamsController < Backend::ApplicationController
  before_action :set_interface_param, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @interface_params = Interface_param.name_like(params[:q])
    else
      @interface_params = Interface_param.all
    end
  end

  def new
    @interface_param = Interface_param.new
  end

  def edit
  end

  def create
    @interface_param = Interface_param.set_attribute interface_param_params
    respond_to do |format|
      if @interface_param.save
        format.html { redirect_to backend_interface_params_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface_param.update(interface_param_params)
        format.html { redirect_to backend_interface_params_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Interface_param.delete(@interface_param)
    respond_to do |format|
      format.html { redirect_to backend_interface_params_url, notice: '删除成功!' }
    end
  end

  private
    def set_interface_param
      @interface_param = Interface_param.friendly.find(params[:id])
    end
    def interface_param_params
      params.require(:interface_param).permit(:TODO, :TODO)
    end
end
