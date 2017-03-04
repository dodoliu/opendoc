class Backend::MembersController < Backend::ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    q = params[:q]
    if !q.blank?
      @members = Member.name_like(params[:q])
    else
      @members = Member.all
    end
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.set_attribute member_params
    respond_to do |format|
      if @member.save
        format.html { redirect_to backend_members_url, notice: '新增成功!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to backend_members_url, notice: '修改成功!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    Member.delete(@member)
    respond_to do |format|
      format.html { redirect_to backend_members_url, notice: '删除成功!' }
    end
  end

  private
    def set_member
      @member = Member.friendly.find(params[:id])
    end
    def member_params
      params.require(:member).permit(:TODO, :TODO)
    end
end
