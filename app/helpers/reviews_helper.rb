module ReviewsHelper

  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag(:strong, "No review")
    else
      # pluralize(movie.average_stars, "star")
      pluralize(number_with_precision(movie.average_stars, precision: 1) , "star")

    end
  end
end
