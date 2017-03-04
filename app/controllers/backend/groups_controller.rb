class Backend::GroupsController < Backend::ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @groups = Group.name_like(params[:q])
    else
      @groups = Group.all
    end
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.set_attribute group_params
    respond_to do |format|
      if @group.save
        format.html { redirect_to backend_groups_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to backend_groups_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Group.delete(@group)
    respond_to do |format|
      format.html { redirect_to backend_groups_url, notice: '删除成功!' }
    end
  end

  private
    def set_group
      @group = Group.friendly.find(params[:id])
    end
    def group_params
      params.require(:group).permit(:group_name, :memo)
    end
end
