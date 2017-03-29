module Backend
  class UsersRolesController < BaseController
    authorize_resource :user
    before_action :find_user, only: [:create]

    def create
      result = 'success' if @user.add_role(:manager)
      respond_to do |format|
        format.json {render json: { success: "#{result}" } }
      end
    end

    private
      def find_user
        @user = User.find(params[:u_id])
      end
  end
end