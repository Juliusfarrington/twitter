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
              if tweet.user_id == f
                  @following_tweets.push(tweet)
              end
          end
      end
  end

  def show_user
  	@user = User.find(params[:id])
  end

   def now_following
    @user = User.find(params[:follow_id])
    current_user.following.push(params[:follow_id].to_i)
    current_user.save
  end

  def unfollow
    @user = User.find(params[:unfollow_id])
    current_user.following.delete(params[:unfollow_id].to_i)
    current_user.save
  end
end
