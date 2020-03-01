class Wine < ApplicationRecord
   has_many :reviews
   has_many :transactions
   has_many :users, through: :transactions 
end
