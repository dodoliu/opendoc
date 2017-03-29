new Vue
  el: '#vue_div'
  methods:
    add_role: (target) ->
      user_id = $(target.target).data('id')
      if !user_id
        alert('缺少标识')
      else 
        $.ajax({
          url: window.urls.add_role,
          type: 'POST'
          data: {u_id: user_id}
          success: (result) ->
            if !result.success
              alert('操作失败!')
            else
              alert('操作成功!')
          })
  ready: () ->
    self = @