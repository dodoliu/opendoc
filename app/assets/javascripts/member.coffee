new Vue
  el: '#vue_div'
  data:
    groups: []
  methods:
    open_layer: (id,title) ->
      layer.open
        type: 1
        title: title 
        skin: 'layui-layer-rim'
        area: ['800px', '600px']
        content: $("#"+id)
    set_member_id: (id) ->
      $('#member_id').val(id)    
    #获取所有品牌
    add_groups: (target) ->
      @open_layer('div_groups','选择品牌(勾选即生效)')
      @set_member_id($(target.target).data('id'))
      @get_groups()      
    get_groups: () ->
      self = @
      $.getJSON window.urls.groups_json,{all: true},(result) ->
        self.$data.groups = result       
        self.get_groups_members()
        return
    #添加用户和品牌关联
    add_group: (target,b) ->
      group_id = $(target.target).attr('id').split('_')[2]
      member_id = $('#member_id').val()
      if $(target.target).attr('checked') is 'checked'
        @destory_group(group_id,member_id)
      else
        $.ajax({
          url: window.urls.groups_members,
          type: 'POST'
          data: {member_id: member_id, group_id: group_id}
          success: (result) ->
            if !result.success
              alert('操作失败!')
          })

    get_groups_members: () ->
      $.getJSON window.urls.groups_members+'.json', { member_id: $("#member_id").val() }, (result) ->
        if result.length > 0
          $(result).each((index,item) ->
            $("#ck_group_"+item).attr('checked',true)            
          )
    open_api: (target) ->
      sid = $(target.target).data('sid')
      window.open(window.urls.home_index+"?sid=" + sid)
    #删除用户和品牌关联
    destory_group: (group_id,member_id) ->
      $.ajax({
        url: window.urls.groups_members + "/1.json"
        type: 'DELETE'
        data: {member_id: member_id, group_id: group_id}
        success: (result) ->
          if !result.success
            alert('操作失败!')
      })
    
    

  ready: () ->
    self = @