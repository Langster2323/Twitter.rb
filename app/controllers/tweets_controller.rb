class TweetsController < ApplicationController
    def index
      render template: 'tweet/index.html.erb', locals: {
        tweets: Tweet.all,

      }
    end

    def new
      render locals: {
        tweet: Tweet.new
      }
    end

    def edit
      render locals: {
        tweet: Tweet.find(params[:id])
      }
    end

    def show
      if Tweet.exists?(params[:id])
        tweet = Tweet.find(params[:id])
        render template: 'tweet/show.html.erb', locals: {
          body: body
        }
      else
        render html: "Tweet Not Found", status: 404
      end
    end



    def create
      tweet = Tweet.new
      tweet.body = params[:tweet][:body]
      if tweet.save
        redirect_to_tweet_path(tweet)
      else
        flash[:alert] = "Could not be saved due to errors."
        render template: '/tweet/new.html.erb', locals: {
          tweet: tweet
        }
      end
    end


    def update
      tweet = Tweet.find(params[:id])
      tweet.body = params[:tweet][:body] if params[:tweet][:body].present?
      if tweet.save
        redirect_to_tweet_path(tweet)
      else
        render template: '/tweet/new.html.erb', locals: {
          tweet: tweet
        }
      end
    end
end
