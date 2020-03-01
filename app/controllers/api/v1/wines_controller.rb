class Api::V1::WinesController < ApplicationController
   def index
      wines = Wine.all 
      render(json: wines)
   end 

   def show
      wine = Wine.find_by(id: params[:id])
   end 

   def update 
   end 
end
