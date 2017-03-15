new Vue
  el: '#vue_div'
  data:
    ice: {}
  methods:
    get_interface: (target) ->
      self = @
      interfacesid = $(target.target).data('interfacesid')
      $.getJSON window.urls.home_interface+".json", {sid: interfacesid}, (result) ->
        console.log result
        self.$data.ice = result

      return
      
      
  
    
  ready: () ->
    self = @