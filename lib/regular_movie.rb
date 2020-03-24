require "movie"

class RegularMovie < Movie
  def price(days_rented)
    amount = 2
      if days_rented > 2
        amount += (days_rented - 2) * 1.5
      end
    amount
  end

  def points(days_rented)
    1
  end
end