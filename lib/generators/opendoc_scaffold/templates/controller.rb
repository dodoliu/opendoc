class Backend::<%=  class_name %>Controller < Backend::ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @<%=  singular_name %> = <%= singular_table_name.capitalize %>.name_like(params[:q])
    else
      @<%= singular_name %> = <%= singular_table_name.capitalize %>.all
    end
  end

  def new
    @<%= singular_table_name %> = <%= singular_table_name.capitalize %>.new
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= singular_table_name.capitalize %>.set_attribute <%= singular_table_name %>_params
    respond_to do |format|
      if @<%= singular_table_name %>.save
        format.html { redirect_to backend_<%=  singular_name %>_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @<%= singular_table_name %>.update(<%= singular_table_name %>_params)
        format.html { redirect_to backend_<%=  singular_name %>_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    <%= singular_table_name.capitalize %>.delete(@<%= singular_table_name %>)
    respond_to do |format|
      format.html { redirect_to backend_<%=  singular_name %>_url, notice: '删除成功!' }
    end
  end

  private
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= singular_table_name.capitalize %>.friendly.find(params[:id])
    end
    def <%= singular_table_name %>_params
      params.require(:<%= singular_table_name %>).permit(:TODO, :TODO)
    end
end
