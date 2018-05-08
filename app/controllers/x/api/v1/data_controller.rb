class X::Api::V1::DataController < XbaseController
  before_action :set_category, only: [:positions]

  def categories
    render json: Xcategory.active.collect{|xc|Json::XcategoryJson.new(xc).map}
  end

  def positions
    render json: @category.xpositions.active.collect{|xp|Json::XpositionJson.new(xp).map}
  end

  private
    def set_category
      @category = Xcategory.active.find(params[:category_id]) 
    end
end