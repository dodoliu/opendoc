class Backend::InterfaceResponsesController < Backend::ApplicationController
  before_action :set_interface_response, only: [:edit, :update, :destroy]
  before_action :find_interface, onley: [:create]

  include ApplicationHelper

  def index
    q = params[:q]
    p = params[:page]
    if !q.blank?
      @interface_responses = InterfaceResponse.page(p).where(interface_id: params[:interface_id]).name_like(params[:q])
    else
      @interface_responses = InterfaceResponse.page(p).where(interface_id: params[:interface_id])
    end
  end

  def new
    @interface_response = InterfaceResponse.new
  end

  def edit
  end

  def create
    @interface_response =  @interface.interface_responses.set_attribute interface_response_params
    respond_to do |format|
      if @interface_response.save
        format.html { redirect_to backend_interface_interface_responses_url+ append_param(params[:group_id]), notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface_response.update(interface_response_params)
        format.html { redirect_to backend_interface_interface_responses_url+ append_param(params[:group_id]), notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    InterfaceResponse.delete(@interface_response)
    respond_to do |format|
      format.html { redirect_to backend_interface_interface_responses_url+ append_param(params[:group_id]), notice: '删除成功!' }
    end
  end

  private
    def find_interface
      @interface = Interface.find(params[:interface_id])
    end
    def set_interface_response
      @interface_response = InterfaceResponse.find(params[:id])
    end
    def interface_response_params
      params.require(:interface_response).permit(:response_name, :response_type, :response_desc)
    end
end
