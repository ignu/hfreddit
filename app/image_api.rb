class ImageApi
  def fetch(&block)
    AFMotion::JSON.get(url_for("gifs")) do |result|
      results = result.object.first[1]["children"].map do |object|
        object["data"]
      end

      block.call(results)
    end
  end

  private

  def url_for(subreddit)
    "http://www.reddit.com/r/#{subreddit}.json"
  end

  def self.get_image(url)
    ns_url = NSURL.URLWithString(url)
    NSData.dataWithContentsOfURL ns_url
  end

  def self.animated?(url)
    data = get_image(url)
    data.to_s[0..12].include? "GIF89a"
  end
end

