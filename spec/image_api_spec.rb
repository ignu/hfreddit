describe "ImageApi" do
  before do
    @animated = "https://i.imgur.com/5nHQvhc.jpg"
    @jpg = "https://i.imgur.com/njV1gB6.jpg"
  end

  it "can determine if an image is an animated gif" do
    ImageApi.animated?(@jpg).should == false
    ImageApi.animated?(@animated).should == true
  end
end
