# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    payload = decoded_payload
    return nil if !token || !payload

    User.find_by(id: payload[0]['user_id'])
  end

  def verify_authenticated(kind = 'all_user')
    @user = current_user
    return @user if @user && (@user.kind == kind || auth_user(kind, @user))

    render(json: { message: "You aren't authenticated." }, status: :unauthorized)
  end

  def token
    request.headers['token']
  end

  def decoded_payload
    JsonWebToken::Base.decode(token)
  end

  private

  def auth_user(kind, user)
    return true if kind == 'all_user' && (user.user? || user.adm?)
  end
end
