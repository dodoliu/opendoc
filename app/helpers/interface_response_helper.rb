module InterfaceResponseHelper
  def fetch_interface_responses(interface_id = nil)
    redis_key = "interface_responses_#{interface_id}"
    interface_responses = $redis.get(redis_key)
    if interface_responses.blank?
      interface_responses = InterfaceResponse.where(:interface_id => interface_id).to_json
      $redis.set(redis_key,interface_responses, :ex => 86400)
    end
    interface_responses
  end
end