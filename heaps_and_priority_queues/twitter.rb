# frozen_string_literal: true

# Time complexity: Post O(1), Follow O(n), Unfollow O(n), Get news feed O(n)
# Space complexity: O(n)
class Twitter
  def initialize
    @follows = Hash.new { |h, k| h[k] = [k] }
    @tweets = Hash.new { {} }
  end

  def post_tweet(user_id, tweet_id)
    @tweets[user_id] = @tweets[user_id].merge({ Time.now => tweet_id })
  end

  def get_news_feed(user_id)
    following = @follows[user_id]
    tweets = following.reduce({}) do |twts, f_id|
      twts.merge(@tweets[f_id])
    end

    tweets.max(10).map { |twt| twt[1] }
  end

  def follow(follower_id, followee_id)
    @follows[follower_id] << followee_id
  end

  def unfollow(follower_id, followee_id)
    @follows[follower_id].delete(followee_id)
  end
end
