require 'movie'
class NewReleaseMovie < Movie

  def price(days_rented)
    (days_rented * 3)
  end

  def points(days_rented)
    p = 1
    if days_rented > 1
      p += 1
    end
      p
  end
end