class RedditImageController < UIViewController
  def loadView
    self.view = RedditImageView.new
  end

  def viewDidLoad
    load_images
    super
  end

  def load_images
    ImageApi.new.fetch do |results|
      self.view.setImage results.first
    end
  end
end
