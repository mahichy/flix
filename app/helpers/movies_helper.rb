module MoviesHelper


  def total_gross(movie)
    if movie.flop?
      "Flop!"
    else
    number_to_currency(movie.total_gross)
    end
  end

  def day_and_time(movie)
    truncate(movie.description, length: 40, seperate: ' ')
  end
end
