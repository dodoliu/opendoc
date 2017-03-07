module ApplicationHelper
  def find_status(status)
    status_enum = {active: :启用, archived: :归档}
    status_enum.each{ |item|  return item[1] if item[0].to_s.eql?(status) }
  end

  #请求类型枚举
  def request_type_enum
    %w{ get post }
  end
  #返回值格式
  def response_type_enum
    %w{ json string xml }
  end
  #参数类型
  def param_type_enum
    %w{ string number bool array list hash any }
  end
  #是否必须参数
  def param_must_enum
    { "true": '必须',  "false": '非必须' }
  end
  def find_must_enum(m)

    param_must_enum.each {|item| return item[1] if item[0].to_s.eql?(m.to_s) }
  end


  #站点地图
  def site_map(name)
    site_paths = [
    {e_name: 'interfaces', c_name: '接口文档管理'},
    {e_name: 'interface_params', c_name: '接口参数管理'},
    {e_name: 'interface_responses', c_name: '接口返回参数管理'},
    {e_name: 'members', c_name: '用户管理'}
    ]

    result = ''
    site_paths.each {|e| result = e[:c_name] if e[:e_name].to_s.eql? name }
    result
  end

  def find_parent_site_map
    site_map find_parent_controller_name
  end

  def find_parent_controller_name
      url_splits = request.url.split('/')
      url_splits[4] if url_splits.length > 5
  end

  #为接口参数和接口返回值添加固定的url参数
  def append_param(param)
    "?group_id=#{param}"
  end

end
