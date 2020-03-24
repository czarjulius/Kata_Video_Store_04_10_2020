class Rental
  attr_reader :movie, :days_rented
  
  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def price
    @movie.price(@days_rented)
  end

  def points
    @movie.points(@days_rented)
  end
end
