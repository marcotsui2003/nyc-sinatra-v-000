class LandmarksController < Sinatra::Base
	set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

	get '/landmarks/new' do
		erb :"/landmarks/new"
	end

	post '/landmarks' do
		puts params
		info=params[:landmark]
		@landmark= Landmark.create(name: info[:name],year_completed: info[:year_completed])
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks' do
  	@landmarks = Landmark.all
  	erb :"/landmarks/index"
  end

  get '/landmarks/:id' do
  	@landmark = Landmark.find(params[:id])
  	erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
  	@landmark= Landmark.find(params[:id])
  	erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
  	
  	@landmark=Landmark.find(params[:id])
  	@landmark.name= params[:name]
  	@landmark.year_completed =params[:year_completed]
  	@landmark.save
  	redirect to "/landmarks/#{@landmark.id}"
  end







end
