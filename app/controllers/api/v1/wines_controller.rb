class Api::V1::WinesController < ApplicationController
   def index
      wines = Wine.all 
      render(json: wines)
   end 

   def update 
   end 
end
