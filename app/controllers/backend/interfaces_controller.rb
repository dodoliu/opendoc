class Backend::InterfacesController < Backend::ApplicationController
  before_action :set_interface, only: [:edit, :update, :destroy]
  before_action :find_group, only: [ :create ]

  def index
    q = params[:q]
    p = params[:page]
    if !q.blank?
      @interfaces = Interface.page(p).where(group_id: params[:group_id]).name_like(params[:q])
    else
      @interfaces = Interface.page(p).where(group_id: params[:group_id])
    end
  end

  def new
    @interface = Interface.new
  end

  def edit
  end

  def create
    @interface = @group.interfaces.set_attribute interface_params
    respond_to do |format|
      if @interface.save
        format.html { redirect_to backend_group_interfaces_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface.update(interface_params)
        format.html { redirect_to backend_group_interfaces_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Interface.delete(@interface)
    respond_to do |format|
      format.html { redirect_to backend_group_interfaces_url, notice: '删除成功!' }
    end
  end

  private
    def find_group
      @group = Group.find(params[:group_id])
    end
    def set_interface
      @interface = Interface.find(params[:id])
    end
    def interface_params
      params.require(:interface).permit(:interface_name, :domain, :product_url, :test_url, :request_type, :response_type, :response_content, :demo)
    end
end