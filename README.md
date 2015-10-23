## Current API Endpoints

POST /sessions - Create a new session (Log in)

DELETE /sessions - Destroy a session (Log out)

Parameters MUST have the following format:

email: "email@example.com"

password: "password"

...

========================================

POST /users - Create a new user

GET /users/id - Show a user's info

PATCH /users/id - Update a user's info

DELETE /users/id - Destroy a user

Parameters MUST have the following format:

user[name]: "name"

user[email]: "email@example.com"

...

========================================

GET /questions - Show all questions

POST /questions - Create a new question

GET /questions/id - Show a question's info

PATCH /questions/id - Update a question's info

DELETE /questions/id - Destroy a question

GET /questions/id/search - Search questions and answers

PATCH /questions/id/upvote - Upvote a question

PATCH /questions/id/downvote - Downvote a question

Parameters MUST have the following format:

question[query]: "query"

question[description]: "description"

...

========================================

GET /answers - Show all answers

POST /answers - Create a new answer

GET /answers/id - Show an answer's info

PATCH /answers/id - Update an answer's info

DELETE /answers/id - Destroy an answer

PATCH /answers/id/upvote - Upvote an answer

PATCH /answers/id/downvote - Downvote an answer

PATCH /answers/id/accept - Toggle accepted answer

Parameters MUST have the following format:

answer[description]: "description"

answer[accepted]: true

...

# Rails Back End of Q&A Website

We are creating the API of a Q&A website. Users may post questions and answers, and vote up or down on them.

We are a pair of Rails developers teamed with a pair of front end developers to create this app.
