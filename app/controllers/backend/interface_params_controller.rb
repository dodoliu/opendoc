class Backend::InterfaceParamsController < Backend::ApplicationController
  before_action :set_interface_param, only: [:edit, :update, :destroy]
  before_action :find_interface, only: [:create]

  include ApplicationHelper

  def index
    q = params[:q]
    p = params[:page]
    if !q.blank?
      @interface_params = InterfaceParam.page(p).where(interface_id: params[:interface_id]).name_like(params[:q])
    else
      @interface_params = InterfaceParam.page(p).where(interface_id: params[:interface_id])
    end
  end

  def new
    @interface_param = InterfaceParam.new
  end

  def edit
  end

  def create
    @interface_param = @interface.interface_params.set_attribute interface_param_params
    respond_to do |format|
      if @interface_param.save
        format.html { redirect_to backend_interface_interface_params_url + append_param(params[:group_id]), notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface_param.update(interface_param_params)
        format.html { redirect_to backend_interface_interface_params_url+ append_param(params[:group_id]), notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    InterfaceParam.delete(@interface_param)
    respond_to do |format|
      format.html { redirect_to backend_interface_interface_params_url+ append_param(params[:group_id]), notice: '删除成功!' }
    end
  end

  private
    def find_interface
      @interface = Interface.find(params[:interface_id])
    end
    def set_interface_param
      @interface_param = InterfaceParam.find(params[:id])
    end
    def interface_param_params
      params.require(:interface_param).permit(:param_name, :param_type, :param_must, :param_desc)
    end
end
