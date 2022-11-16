u1 = User.create(email: "test@test.com", password: "123456", username: "test1", first_name: "John", last_name: "Doe")
u2 = User.create(email: "test2@test.com", password: "123456", username: "test2", first_name: "Mark", last_name: "Zuck")
u3 = User.create(email: "test3@test.com", password: "123456", username: "test3", first_name: "Bill", last_name: "Gate")
u4 = User.create(email: "test4@test.com", password: "123456", username: "test4", first_name: "Jeff", last_name: "Bezo")
u5 = User.create(email: "test5@test.com", password: "123456", username: "test5", first_name: "Niki", last_name: "Laud")

Tweet.create(body: "This is a test tweet", user_id: u1.id)
Tweet.create(body: "This is another test tweet", user_id: u1.id)
nice_tweet = Tweet.create(body: "This is a test in spanish: Si la vida te da limones haz limonada", user_id: u1.id)

t1 = Tweet.create(retweet: true, original_tweet_id: nice_tweet.id, user_id: u2.id)
t2 = Tweet.create(body: "This is another test tweet (hey this is different)", user_id: u2.id)
t3 = Tweet.create(body: "It is almost christmas", user_id: u2.id)

Follow.create(follower_id: u1.id, followed_id: u2.id)
Follow.create(follower_id: u1.id, followed_id: u3.id)
Follow.create(follower_id: u1.id, followed_id: u4.id)
Follow.create(follower_id: u1.id, followed_id: u5.id)

Like.create(user: u3, tweet: t1)
Like.create(user: u3, tweet: t2)
Like.create(user: u3, tweet: t3)
