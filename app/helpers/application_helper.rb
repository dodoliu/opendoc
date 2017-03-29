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
    {e_name: 'members', c_name: '接口调用者管理'}
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

  #定义自定义的bootstrap控件
  %w{ text_field select text_area }.each do |item|
    define_method("bootstrap_#{item}") do |tag, tag_field, field_name, *args|
      bootstrap_field(tag, tag_field, field_name) do
        case item
        when 'text_field'
          tag.send(item, tag_field, class: 'form-control', placeholder: args[0])
        when 'select'
          tag.send(item, tag_field, args[0] , {}, { class: 'form-control' })
        when 'text_area'
          tag.send(item, tag_field, rows: 10, class: 'form-control')
        end       
      end
    end
  end

  def bootstrap_commit_back_button(tag, url)
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'col-sm-10 edit_button_style' do
        tag.button('提交', class: 'btn btn-default') + ' ' +
        link_to('返回', url, class: 'btn btn-default')
      end
    end
  end

  private
    def bootstrap_field(tag, tag_field, field_name, &block)
      content_tag :div, class: 'form-group' do
        tag.label(tag_field, field_name, class: 'col-sm-1 control-label') +
        content_tag(:div, class: 'col-sm-10') do
          yield
        end
      end
    end



end
