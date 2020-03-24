require "movie"

class ChildrenMovie < Movie
    def price(days_rented)
        amount = 1.5
        if days_rented > 3
            amount += (days_rented - 3) * 1.5
        end
        amount
    end

      def points(days_rented)
          1
      end
end