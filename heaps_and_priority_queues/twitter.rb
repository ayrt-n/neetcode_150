# frozen_string_literal: true

require 'rubygems'
require 'algorithms'
require 'set'

# HEAP SOLUTION
# Time complexity: Post O(1), Follow O(1), Unfollow O(1), Get news feed O(k) where k is number of followees
# Space compelxity: O(n)
class Twitter
  def initialize
    @follows = Hash.new { |h, k| h[k] = Set.new([k]) }
    @tweets = Hash.new { |h, k| h[k] = [] }
    @tweet_count = 0
  end

  def post_tweet(user_id, tweet_id)
    @tweets[user_id] << [@tweet_count, tweet_id]
    @tweet_count += 1
  end

  def get_news_feed(user_id)
    res = []
    max_heap = []

    @follows[user_id].each do |f_id|
      next if @tweets[f_id].empty?

      index = @tweets[f_id].length - 1
      count, tweet_id = @tweets[f_id][index]
      max_heap << [count, tweet_id, f_id, index - 1]
    end

    max_heap = Containers::MaxHeap.new(max_heap)

    until max_heap.empty? || res.length >= 10
      count, tweet_id, f_id, index = max_heap.pop
      res << tweet_id
      next if index.negative?

      count, tweet_id = @tweets[f_id][index]
      max_heap.push([count, tweet_id, f_id, index - 1])
    end

    res
  end

  def follow(follower_id, followee_id)
    @follows[follower_id] << followee_id
  end

  def unfollow(follower_id, followee_id)
    @follows[follower_id].delete(followee_id)
  end
end

# ORIGINAL SOLUTION
# Time complexity: Post O(1), Follow O(n), Unfollow O(n), Get news feed O(n)
# Space complexity: O(n)
# class Twitter
#   def initialize
#     @follows = Hash.new { |h, k| h[k] = [k] }
#     @tweets = Hash.new { {} }
#   end

#   def post_tweet(user_id, tweet_id)
#     @tweets[user_id] = @tweets[user_id].merge({ Time.now => tweet_id })
#   end

#   def get_news_feed(user_id)
#     following = @follows[user_id]
#     tweets = following.reduce({}) do |twts, f_id|
#       twts.merge(@tweets[f_id])
#     end

#     tweets.max(10).map { |twt| twt[1] }
#   end

#   def follow(follower_id, followee_id)
#     @follows[follower_id] << followee_id
#   end

#   def unfollow(follower_id, followee_id)
#     @follows[follower_id].delete(followee_id)
#   end
# end
