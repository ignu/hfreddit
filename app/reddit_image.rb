class RedditImage
  def initialize(url)
    @url = url
    ns_url = NSURL.URLWithString(url)
    @data = NSData.dataWithContentsOfURL(ns_url)
  end

  def animated?
    @data.to_s[0..10].include? "GIF89a"
  end

  def get_view(frame)
    if animated?
      p("LOADING ANIMATED VIEW #{@url}")
      get_animated_view(frame)
    else
      p("LOADING STATIC VIEW #{@url}")
      get_image_view(frame)
    end
  end

  private

    def get_animated_view(frame)
      image = FLAnimatedImage.alloc.initWithAnimatedGIFData(@data)
      image_view = FLAnimatedImageView.alloc.init

      image_view.frame = frame
      image_view.animatedImage = image
      image_view
    end

    def get_image_view(frame)
      image_view = UIImageView.alloc.initWithImage(@data)

      image_view.frame = frame
      image_view.image = image
      image_view
    end
end
