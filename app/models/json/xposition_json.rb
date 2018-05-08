module Json
  class XpositionJson

    def initialize xposition
      @xposition = xposition
    end

    def map
      {
        category: @xposition.xcategory.name,
        title: @xposition.title,
        description: @xposition.description,
        image: @xposition.get_image_url
      }
    end

  end
end