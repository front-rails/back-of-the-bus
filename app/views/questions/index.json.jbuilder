json.array! @questions do |q|
  json.extract! q, :id, :user_id, :query, :description, :upvotes, :downvotes, :votes_quality, :votes_count
  json.answers q.answers, :id, :user_id, :question_id, :description, :upvotes, :downvotes, :accepted, :votes_quality, :votes_count
end
