class EpicenterController < ApplicationController
  def feed
  	 # TTS-SLIDE28
    # Create and initialize the array
      @following_tweets = []

      # Get all the tweets
      @tweets = Tweet.all

      # Sort and find the ones with the current user
      @tweets.each do |tweet|
          current_user.following.each do |f|
              if tweet.user_id  == f
                  @following_tweets.push(tweet)
              end
          end
      end
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  end

  def unfollow
  end
end
