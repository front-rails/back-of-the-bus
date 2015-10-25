json.alert "User successfully logged out"
json.extract! @user, :id, :name, :email, :auth_token
