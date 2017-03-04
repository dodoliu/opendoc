class Backend::InterfacesController < Backend::ApplicationController
  before_action :set_interface, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @interfaces = Interface.name_like(params[:q])
    else
      @interfaces = Interface.all
    end
  end

  def new
    @interface = Interface.new
  end

  def edit
  end

  def create
    @interface = Interface.set_attribute interface_params
    respond_to do |format|
      if @interface.save
        format.html { redirect_to backend_interfaces_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface.update(interface_params)
        format.html { redirect_to backend_interfaces_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Interface.delete(@interface)
    respond_to do |format|
      format.html { redirect_to backend_interfaces_url, notice: '删除成功!' }
    end
  end

  private
    def set_interface
      @interface = Interface.friendly.find(params[:id])
    end
    def interface_params
      params.require(:interface).permit(:TODO, :TODO)
    end
end
