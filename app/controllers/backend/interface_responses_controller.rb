class Backend::InterfaceResponsesController < Backend::ApplicationController
  before_action :set_interface_response, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @interface_responses = Interface_response.name_like(params[:q])
    else
      @interface_responses = Interface_response.all
    end
  end

  def new
    @interface_response = Interface_response.new
  end

  def edit
  end

  def create
    @interface_response = Interface_response.set_attribute interface_response_params
    respond_to do |format|
      if @interface_response.save
        format.html { redirect_to backend_interface_responses_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @interface_response.update(interface_response_params)
        format.html { redirect_to backend_interface_responses_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Interface_response.delete(@interface_response)
    respond_to do |format|
      format.html { redirect_to backend_interface_responses_url, notice: '删除成功!' }
    end
  end

  private
    def set_interface_response
      @interface_response = Interface_response.friendly.find(params[:id])
    end
    def interface_response_params
      params.require(:interface_response).permit(:TODO, :TODO)
    end
end
