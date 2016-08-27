class Friendship < ActiveRecord::Base
    belongs_to :user
    #since we don't have a class friend we need to point it in the right direction 
    belongs_to :friend, :class_name => 'User'
end
