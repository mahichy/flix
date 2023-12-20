class Movie < ApplicationRecord

  def self.relesed
    Movie.where("released_on < ?", Time.now).order("released_on desc")
  end

  def flop?
    total_gross == 0 || total_gross < 255000000
  end
end
