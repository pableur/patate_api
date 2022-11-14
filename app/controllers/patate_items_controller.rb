require 'date'

class PatateItemsController < ApplicationController
	# Commented because not requested in the statement
	'''
	def index
        @patateItems = PatateItem.select(:id, :time, :value)
        render json: @patateItems
    end
	'''
	
	# Commented because not requested in the statement
	'''
	def byId
        @patateItems = PatateItem.find(params[:id])
        render json: @patateItems
    end
	'''
	
	def stockPricePerDay
		# check that the date is in day month year format
		begin
			format = '%Y-%m-%d'
			DateTime.strptime(params[:time], format)
			
			# the SQL query retrieves the identifier, the date and the price of the potato for a given day.
			@patateItems = PatateItem.where('DATE(patate_items.time) = DATE(?) ', params[:time]).order('time').select(:id, :time, :value)
			render json: @patateItems, status: :ok # symbole for http code 200
		
		rescue ArgumentError
			render json: [] ,status: :bad_request # symbole for http code 400
		end
		
		
	end
	
	def bestEarningsPerDay
		# check that the date is in day month year format
		begin
			format = '%Y-%m-%d'
			DateTime.strptime(params[:time], format)
			
			# array with all the prices of the potato
			patateItems = []
			
			# records in the table the prices of potatoes
			# the SQL query retrieves only the value of the potatoes for a given day and sorts them by date.
			for patate in PatateItem.where('DATE(patate_items.time) = DATE(?) ', params[:time]).order('time').select(:value).to_a do
				patateItems.append(patate.value)
			end
			
			'''
			keep it simple" method but long because itinerary N times the price of potatoes
			could be improved
			'''
			
			# best gain in the day
			best_earnings_day = 0.0
			
			# best gain in a period of the day
			best_earnings_periode = 0.0
			
			# browse all the prices in the table
			for index in 0..patateItems.length()-1 do
				# calculates the difference between the maximum price of the remaining period and the price at the tested time
				# use to_d instead of to_f for the Floating-point arithmetic error
				best_earnings_periode= patateItems[index+1..].max.to_d - patateItems[index]
				
				# if it's the best price range, remember it 
				if best_earnings_periode>best_earnings_day
					best_earnings_day = best_earnings_periode
				end
			end
			
			# since this is the best price range, I buy 100 tons. There is no stock limitation in the statement
			render json: best_earnings_day*100, status: :ok # symbole for http code 200
			
		rescue ArgumentError
			render json: [] ,status: :bad_request # symbole for http code 400
		end
	end
end
