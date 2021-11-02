class Api::SessionsController < Api::BaseController
    before_action :ensure_and_set_current_user
    def destroy
      sign_out @current_user
    end
  
end
  