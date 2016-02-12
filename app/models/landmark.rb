require 'pry'
class Landmark <ActiveRecord::Base
	belongs_to :figure
	#has_many :titles, through: :figures

  def year_completed
  	#binding.pry
  	results = super
  	year_match = results.match(/(^\d+) *(\w*)/)
  	if year_match[2]==""
  		year_match[1].to_i
  	else
  		year_match
  	end
  end

end
