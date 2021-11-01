module AuthenticationService
  class Authenticate
    prepend SimpleCommand

    def initialize(email, password)
      @email = email
      @password = password
      @user = nil
    end

    def call
      if valid?
        if find_user && @user.valid_password?(@password)
            jwt = {
              'sub': @user.id,
              'email': @user.email,
            }

            value = {
              token_type: "Bearer",
              access_token: Auth.issue(jwt),
            }
            return value
          
        else
          errors.add(:user, 'Wrong credentials')
          nil
        end

      end
      nil
    end

    private

    def valid?
      flag = true
      if @password.blank?
        errors.add(:password, 'Empty password')
        flag = false
      end

      if @email.blank?
        errors.add(:email, 'Empty email')
        flag = false
      end

      flag
    end

    def find_user
      @user = User.find_by(email: @email.downcase)
    end
  end
end
