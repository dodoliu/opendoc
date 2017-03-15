class HomeController < ApplicationController
  def index
    sid = params[:sid]
    @member = Member.select(:id).find_by(:sid => sid)
    @groups = @member.groups.select(:id, :group_name)
    @interfaces = Interface.select(:sid,:interface_name, :group_id).where(group_id: @groups.ids)
  end

  def interface_info
    sid = params[:sid]
    interface = Interface.find_by(sid: sid)
    interface_params = interface.interface_params
    interface_responses = interface.interface_responses

    respond_to do |format|
      format.json {render json: {interface: interface, interface_params: interface_params, interface_responses: interface_responses} }
    end
  end
end
