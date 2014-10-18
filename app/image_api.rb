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
end

