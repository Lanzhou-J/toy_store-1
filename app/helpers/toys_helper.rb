module ToysHelper
  def background_image(toy)
    return "
      background: url(#{url_for(toy.picture)});
      height: 100%;
      background-position: center;
      background-size: cover;
    "
  end
end
