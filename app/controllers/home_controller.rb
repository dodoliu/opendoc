class HomeController < ApplicationController
  include InterfaceHelper
  include InterfaceParamHelper
  include InterfaceResponseHelper

  def index; end

  def interface_info
    sid = params[:sid]
    interface = fetch_interface(sid)
    interface_obj = !interface.eql?('null') ? JSON.parse(interface) :interface 
    interface_id = interface_obj['id']
    
    interface_params = fetch_interface_params(interface_id)
    interface_responses = fetch_interface_responses(interface_id)

    interface_params_obj = !interface_params.eql?('null') ? JSON.parse(interface_params) : interface_params
    interface_responses_obj = !interface_responses.eql?('null') ? JSON.parse(interface_responses) : interface_responses
    respond_to do |format|
      format.json {render json: {interface: interface_obj, interface_params: interface_params_obj, interface_responses: interface_responses_obj } }
    end
  end

  def interfaces
    sid = params[:sid]
    @member = Member.select(:id).find_by(:sid => sid)
    @groups = @member.groups.select(:id, :group_name)
    @interfaces = Interface.select(:sid,:interface_name, :group_id).where(group_id: @groups.ids)
  end
end
