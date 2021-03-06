User.create(display_name: '超级管理员', email: 'admin@admin.com', password: 'admin!=123456', status: 1, confirmed_at: Time.now)
Role.create(name: 'admin', status: 1)
user = User.first
user.add_role(:admin)

if %w{test development}.include? Rails.env
  Group.create(group_name: '康师傅集团', status: 1, sid: 'o8-v-s4s-rVFhOhzj4a8RIUA3Xoc')
  Group.create(group_name: '哇哈哈集团', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7RTo')
  Interface.create(interface_name: '接口A', status: 1, sid:'o8-v-s_NHxG6ivelgvG_ErFcc0jg', group_id: 1)
  Interface.create(interface_name: '接口B', status: 1, sid:'o8-v-s_NHxG6ivelgvG_ErFcc0jb', group_id: 1)
  Interface.create(interface_name: '接口C', status: 1, sid:'o8-v-s_NHxG6ivelgvG_ErFcc0jc', group_id: 2)
  Interface.create(interface_name: '接口D', status: 1, sid:'o8-v-s_NHxG6ivelgvG_ErFcc0jd', group_id: 2)
  InterfaceParam.create(param_name: '参数A', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb1', interface_id: 1, param_must: true)
  InterfaceParam.create(param_name: '参数B', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb2', interface_id: 1, param_must: false)
  InterfaceParam.create(param_name: '参数C', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb3', interface_id: 2, param_must: true)
  InterfaceParam.create(param_name: '参数D', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb4', interface_id: 2, param_must: true)
  InterfaceParam.create(param_name: '参数E', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb5', interface_id: 3, param_must: false)
  InterfaceParam.create(param_name: '参数F', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb6', interface_id: 3, param_must: true)
  InterfaceParam.create(param_name: '参数G', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb7', interface_id: 4, param_must: true)
  InterfaceParam.create(param_name: '参数H', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rb8', interface_id: 4, param_must: true)
  InterfaceResponse.create(response_name: '参数AA', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re1', interface_id: 1)
  InterfaceResponse.create(response_name: '参数BB', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re2', interface_id: 1)
  InterfaceResponse.create(response_name: '参数CC', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re3', interface_id: 1)
  InterfaceResponse.create(response_name: '参数DD', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re4', interface_id: 1)
  InterfaceResponse.create(response_name: '参数EE', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re5', interface_id: 2)
  InterfaceResponse.create(response_name: '参数FF', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re6', interface_id: 2)
  InterfaceResponse.create(response_name: '参数GG', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Re7', interface_id: 2)
  Member.create(display_name: '用户A', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rg1')
  Member.create(display_name: '用户B', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rg2')
  Member.create(display_name: '用户C', status: 1, sid: 'o8-v-s4GGaq_3fqrW8tEir6J7Rg3')
else 

end