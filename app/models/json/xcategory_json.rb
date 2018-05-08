module Json
  class XcategoryJson

    def initialize xcategory
      @xcategory = xcategory
    end

    def map
      {
        name: @xcategory.name,
        image: @xcategory.get_image_url
      }
    end

  end
end