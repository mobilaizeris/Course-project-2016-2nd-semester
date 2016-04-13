class ConfirmController < ApplicationController
	def index
		
	end

	def answer
		#render json: "Ping success", time: @timeis, status: :ok
		@string = params[:string] 
		render json: {
			sting: @string,
			time: timestamp
		}
	end

	def timestamp
		@timeis = DateTime.now.getutc
	end
end