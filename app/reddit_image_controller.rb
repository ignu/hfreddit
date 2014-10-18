class RedditImageController < UIViewController
  def loadView
    self.view = RedditImageView.new
  end

  def viewDidLoad
    @current_image ||= -1
    @image_views ||= []

    load_images
    super
  end

  def load_images
    ImageApi.new.fetch do |images|
      @images = images
      self.draw_next
    end
  end

  def draw_next
    @current_image = @current_image + 1
    image = @images[@current_image]
    @image_views[@current_image] ||= get_image_view image["url"]
    self.view.setImage @image_views[@current_image]
    self.preload
  end

  def preload
    image = @images[@current_image + 1]
    @image_views[@current_image + 1] ||= get_image_view image["url"]
  end

  def prefersStatusBarHidden
    true
  end

  def touchesEnded(touches, withEvent: event)
    self.draw_next
  end

  def get_image_view(url)
    RedditImage.new(url).get_view(self.view.frame)
  end
end
