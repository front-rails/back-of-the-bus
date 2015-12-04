json.array! @users do |u|
	json.extract! u, :id, :name, :email
end
