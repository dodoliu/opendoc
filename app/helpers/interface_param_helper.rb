module InterfaceParamHelper
  def fetch_interface_params(interface_id = nil)
    redis_key = "interface_params_#{interface_id}"
    interface_params = $redis.get(redis_key)
    if interface_params.nil?
      interface_params = InterfaceParam.where(:interface_id => interface_id).to_json
      $redis.set(redis_key, interface_params)
    end
    interface_params
  end
end