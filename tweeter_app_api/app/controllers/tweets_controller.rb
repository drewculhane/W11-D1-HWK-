class TweetsController < ApplicationController 
    def index 
        tweets = Tweet.all 
        render json: {status: 200, tweets: tweets}
    end 
    def show 
        found_tweet = Tweet.find(params[:id])
        render json: {status: 200, tweet: found_tweet }
    end 
    def create 
        tweet = Tweet.new(tweet_params)
    if tweet.save 
        render(status: 201, json: {status: 201, tweet: tweet})
    else 
        render(status: 422, json: {status: 422, tweet: tweet.errors})
    end 
    end 
    def destroy 
        tweet = Tweet.destroy(params[:id])
        render(json: {status: 204})
    end 
    def update 
        tweet = Tweet.find(params[:id])
        tweet.update(tweet_params)
        render(status: 201, json: {status: 201, tweet: tweet})
    end 
    private 
    def tweet_params 
    params.require(:tweet).permit(:title, :content, :author)
    end 
end 