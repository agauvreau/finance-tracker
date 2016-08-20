class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #these 2 lines link the stock and user tables with the user_stock table (a stock can have multiple users and vice versa)
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  
  #the 3 methods bellow will be used with if code in the lookup partial. We use them to show or hide a specific piece of information
  #depending on the user stock portfolio (can he add a stock?, already 10 stock?, already tracking that stock?)
  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
    
  end
  
  def under_stock_limit?
    (user_stocks.count < 10)
  end
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
end
