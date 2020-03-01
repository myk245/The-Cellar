class User < ApplicationRecord
   has_many :transactions
   has_many :reviews
   has_many :wines, through: :transactions
end
