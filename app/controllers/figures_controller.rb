class FiguresController < Sinatra::Base
	set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures/new' do 
  	@titles= Title.all
  	@landmarks= Landmark.all
  	erb :'figures/new'
  end

  post '/figures' do
  	@figure = Figure.create(name: params[:figure][:name])
  	
  	if params[:landmark][:name]!=""
  		@figure.landmarks<< Landmark.create(name: params[:landmark][:name] )
  	end
    
    if !params[:figure][:landmark_ids].nil?
	  	params[:figure][:landmark_ids].each do |id|
	  		@figure.landmarks << Landmark.find(id.to_i)
	  	end
	  end
  	
  	if params[:title][:name]!=""
  		@figure.titles<< Title.create(name: params[:title][:name] )
  	end
  	
  	if !params[:figure][:title_ids].nil?
	  	params[:figure][:title_ids].each do |id|
	  		@figure.titles << Title.find(id.to_i)
	  	end
	  end

  	@figure.save

  	redirect "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
  	@figure =Figure.find(params[:id])
  	erb :"figures/show"
	end

	get '/figures' do
		@figures= Figure.all
		erb :'figures/index'
	end

	get '/figures/:id/edit' do 
		@figure= Figure.find(params[:id])
		erb :'figures/edit'
	end

	patch '/figures/:id' do
		
		@figure = Figure.find(params[:id])
		@figure.name= params[:figure][:name]
		@figure.landmarks.create(name: params[:landmark])
		@figure.save

		redirect "/figures/#{params[:id]}"
	end




end