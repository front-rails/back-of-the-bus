json.extract! @question, :id, :user_id, :query, :description, :upvotes, :downvotes, :votes_quality, :votes_count
if @answers
json.answers @answers, :id, :user_id, :question_id, :description, :upvotes, :downvotes, :accepted, :votes_quality, :votes_count
end
