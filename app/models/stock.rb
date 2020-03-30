class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  def self.new_lookup(ticker)
    #client = IEX::Api::Client.new(publishable_token: 'Tpk_0b1b113041e34abebd0bb46362fcae8e',
                                  #secret_token: 'Tsk_0e977b9338fc41aa902328f60db29834',
                                  #endpoint: 'https://sandbox.iexapis.com/v1'
                                 #)
     
    #client.price(ticker)
    begin
      where(ticker: ticker).first
    rescue => exception
      return nil
    end  
  end
end
