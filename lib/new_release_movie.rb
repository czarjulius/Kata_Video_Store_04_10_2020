require 'movie'


class NewReleaseMovie < Movie
    def price(days_rented)
        (days_rented * 3)
    end

    def points(days_rented)
        frenquent_points = 1
        if days_rented > 1
            frenquent_points += 1
        end
        frenquent_points
    end
end