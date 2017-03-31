module Backend
  class ApplicationController < BaseController
    # before_action :authenticate_user!
    # protect_from_forgery with: :exception    
    # layout 'backend'
    
    authorize_resource

    #将没有权限的请求全部重定向到404页面
    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to '/404.html'
    # end

    # def execute_statement(sql)
    #   result = ActiveRecord::Base.connection.execute(sql)
    #   # puts result
    #   if result.present?
    #     return result
    #   else
    #     return nil
    #   end
    # end
    

  end
end