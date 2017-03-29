module Backend
  class GroupsMembersController < BaseController
    authorize_resource :member, :group
    before_action :find_member, only: [:index, :create]
    before_action :find_group, only: [:create]

    def index
      groups_members = @member.groups
      respond_to do |format|      
        format.json { render json: groups_members.map { |e| e.id } }
      end
    end

    def create
      success = false
      if !@member.blank? and !@group.blank?
        @member.groups << @group     
        success = true if @member.save!
      end
      respond_to do |format|
        format.json { render json: { success: "#{success}" } }
      end    
    end

    def destroy
      success = false
      if params[:group_id].to_i > 0 and params[:member_id].to_i > 0
        sql = "delete from groups_members where group_id=#{params[:group_id]} and member_id=#{params[:member_id]}"
        success = true if execute_statement(sql)
      end
      respond_to do |format|
        format.json { render json: { success: "#{success}"} }
      end
    end

    private
      def find_member
        @member = Member.find(params[:member_id])
      end
      def find_group
        @group = Group.find(params[:group_id])
      end
  end
end