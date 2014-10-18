class RedditImageView < UIView
  def drawRect(rect)
    super rect
  end

  def setImage(image_view)
    self.addSubview image_view
  end
end
