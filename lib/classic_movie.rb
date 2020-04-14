require "movie"

class ClassicMovie < Movie
    def price(days_rented)
        2
    end

    def points(days_rented)
        p = 1
        if days_rented >= 3
          p += 1
        end
          p
    end
end