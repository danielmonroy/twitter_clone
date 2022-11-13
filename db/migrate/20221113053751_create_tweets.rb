class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.boolean :retweet
      t.bigint :original_tweet_id

      t.timestamps
    end
  end
end
