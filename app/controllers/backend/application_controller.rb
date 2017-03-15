module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'backend'

    def execute_statement(sql)
      result = ActiveRecord::Base.connection.execute(sql)
      puts result
      if result.present?
        return result
      else
        return nil
      end
    end
  end
end