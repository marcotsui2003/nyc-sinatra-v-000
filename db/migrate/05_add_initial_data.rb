class AddInitialData < ActiveRecord::Migration

	figure_list = [
		"Robert Moses",
    "Al Smith",
		"Theodore Roosevelt",
		"Peter Stuyvesant",
		"Boss Tweed",
		"Michael Bloomberg",
		"Ed Koch",
		"Fiorello LaGuardia",
		"Jimmy Walker",
		"Belle Moskowitz"
	]

	figure_list.each do |name|
	  p = Figure.new
	  p.name = name
	  p.save
	end

	landmarks_list = {
    "BQE" => {
    	:figure_id =>1,
      :year_completed => "1947"
    },
    "Holland Tunnel" => {
    	:figure_id =>5,
      :year_completed => "50 B.C."
    },
    "Wall Street Wall" => {
    	:figure_id =>3,
      :year_completed => "1684"
    },
    "Brooklyn Battery Tunnel" => {
    	:figure_id =>10,
      :year_completed => "1973"
    }
  }

	landmarks_list.each do |name, landmark_hash|
	  p = Landmark.new
	  p.name = name
	  landmark_hash.each do |attribute, value|
	      p[attribute] = value
	  end
	  p.save
	end


	title_list = [
		"Mayor",
		"President",
		"Govenor",
		"NYC Parks commissioner"
		]

	title_list.each do |name|
	  p = Title.new
	  p.name = name
	  p.save
	end

	figure_title_array=[
		 {
		  title_id: 3 ,
		 figure_id: 2
		 },
		 {
		 	title_id: 3,
		 figure_id: 3
		 },
		 {
		 	title_id: 2,
		 figure_id: 3
		 },
		 {
		 	title_id: 1,
		 figure_id: 9
		 },
		 {
		 	title_id: 4,
		 figure_id: 1
		 }
		]

	figure_title_array.each do |hash|
		p= FigureTitle.new
		hash.each do |attribute,value|
			p[attribute]= value
		end
		p.save
	end

end


	

