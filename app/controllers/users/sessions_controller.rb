class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]

  def new
    super
  end

  def create
    super
  end

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new
      resource.validate
      render :new
    end
  end
  
end
