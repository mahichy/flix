class Movie < ApplicationRecord

  def flop?
    total_gross == 0 || total_gross < 255000000
  end
end
