class DeviseCustomed::RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end

  def create
    super do |resource|
      resource.status = 1
    end
  end

  # def update
  #   super
  # end
end