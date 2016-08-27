class UsersController < ApplicationController
    def my_portfolio
        @user_stocks = current_user.stocks
        @user = current_user
    end
    
    def my_friends
        #returns all the friends for a certain user
        #this can be used to render the appropriate page (display friends or tell user to get some)
        @friendships = current_user.friends
    end
end