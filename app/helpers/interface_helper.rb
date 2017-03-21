module InterfaceHelper
  def fetch_interface(sid)
    redis_key = "interface_#{sid}"
    interface = $redis.get(redis_key)
    if interface.nil?
      interface = Interface.find_by(sid: sid).to_json
      $redis.set(redis_key, interface)
    end
    interface
  end
end