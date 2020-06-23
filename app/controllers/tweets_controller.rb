class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show]   
    before_action :move_to_index, except: [:index, :show]    

    def index
        @tweets = Tweet.includes(:user)
    end

    def new
        @tweet = Tweet.new
    end

    def create
        Tweet.create(tweet_params)
    end
    
    def show
    end

    private
    def tweet_params
        params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
    end
    
    def set_tweet
        @tweet = Tweet.find(params[:id])
    end
      
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end    
end
