json.extract! @questions, :id, :user_id, :query, :description, :upvotes, :downvotes, :votes_quality, :votes_count
json.answers @questions.answers, :id, :user_id, :question_id, :description, :upvotes, :downvotes, :accepted, :votes_quality, :votes_count
