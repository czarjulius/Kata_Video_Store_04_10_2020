require 'rspec'
require 'customer'
require 'movie'
require 'rental'
require "regular_movie"
require  "new_release_movie"
require "children_movie"
require "classic_movie"

describe Customer do
  before(:each) do
    @customer = Customer.new("Test Man")
  end
  
  it "should have an empty statement" do
    expected_statement = <<STATEMENT_END
Rental Record for Test Man
Amount owed is 0
You earned 0 frequent renter points
STATEMENT_END

    @customer.statement.should == expected_statement
  end

  it "should have statement with 1 Regular movie for 1 day" do  
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(RegularMovie, 2, 1)
  end

  it "should have statement with 1 Regular movie for 3 days" do
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(RegularMovie, 3.5, 3)
  end

  it "should have a statement with a new release" do
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(NewReleaseMovie, 3, 1)
  end

  it "should have a statement for a childrens movie for 1 day" do
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(ChildrenMovie, 1.5, 1)
  end

  it "should have a statement for a childrens movie for 4 days" do
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(ChildrenMovie, 3.0, 4)
  end

  it "should give an additional frequent renter point for new release rented for 2 days" do
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(NewReleaseMovie, 6, 2, 2)
  end


  it "should have statement with 1 Classic movie for 1 day" do  
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(ClassicMovie, 2, 1)
  end
  it "should have statement with 1 Classic movie for 5 day" do  
    rental = verifyStatementForMovieTypeAndAmountOwedAndRentalLength(ClassicMovie, 2, 5,2)
  end


  def verifyStatementForMovieTypeAndAmountOwedAndRentalLength movie_class, amount_owed, rental_length, frequent_renter_points=1
    expected_statement = <<STATEMENT_END
Rental Record for Test Man
	A New Smash hit	#{amount_owed}
Amount owed is #{amount_owed}
You earned #{frequent_renter_points} frequent renter points
STATEMENT_END

    movie = movie_class.new("A New Smash hit")
    rental = Rental.new(movie, rental_length)

    @customer.add_rental(rental)

    @customer.statement.should == expected_statement
  end
  
end