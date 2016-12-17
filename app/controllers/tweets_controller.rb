class TweetsController < ApplicationController
  before_action(:authenticate_user!, except: [:index, :show, :full])
  before_action(:get_tweets, only: [:index, :full])
  before_action(:get_tweet, only: [:show, :edit, :update, :destroy])

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    # redirect_to_tweet_if_valid(:new, 'Wow, you created a tweet!')

    if @tweet.valid?
      redirect_to(@tweet, notice: 'Wow, you created a tweet!')
    else
      render(:new)
    end
  end

  def update
    @tweet.update(tweet_params)
    redirect_to_tweet_if_valid(:edit, 'Great, that tweet was updated captain!')
  end

  def destroy
    # @tweet = Tweet.destroy(params[:id])

    @tweet.destroy
    redirect_to(tweets_url, notice: 'Your tweet was deleted!')
  end

  private

  def get_tweets
    @tweets = Tweet.all
  end

  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params[:tweet].permit(:title, :body, :photo)
  end

  def redirect_to_tweet_if_valid(action, notice)
    if @tweet.valid?
      redirect_to_tweet(notice)
    else
      render(action)
    end
  end

  def redirect_to_tweet(notice)
    redirect_to(@tweet, notice: notice)
  end
end