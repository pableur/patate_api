Rails.application.routes.draw do
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	
	# Defines the root path route ("/")
	# Commented because not requested in the statement
	#root "patate_items#index"
	#get '/patate_items/byId/:id', to: 'patate_items#byId'
	get '/patate_items/stockPricePerDay/:time', to: 'patate_items#stockPricePerDay'
	get '/patate_items/bestEarningsPerDay/:time', to: 'patate_items#bestEarningsPerDay'
end
