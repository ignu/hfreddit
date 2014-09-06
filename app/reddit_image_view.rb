class RedditImageView < UIView
  def drawRect(rect)
    super rect
  end

  def setImage(image)
    url = image["url"]

    data = NSData.dataWithContentsOfURL(NSURL.URLWithString(url))
    image = FLAnimatedImage.alloc.initWithAnimatedGIFData data

    image_view = FLAnimatedImageView.alloc.init

    image_view.frame = self.frame
    image_view.animatedImage = image
    self.addSubview image_view
  end
end
__END__
FLAnimatedImage *image = [[FLAnimatedImage alloc] initWithAnimatedGIFData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://raphaelschaad.com/static/nyan.gif"]]];
FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
imageView.animatedImage = image;
imageView.frame = CGRectMake(0.0, 0.0, 100.0, 100.0);

