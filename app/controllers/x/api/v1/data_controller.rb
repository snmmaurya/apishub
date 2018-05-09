class X::Api::V1::DataController < XbaseController
  before_action :set_category, only: [:positions_by_category]

  def categories
    render json: Xcategory.active.collect{|xc|Json::XcategoryJson.new(xc).map}
  end

  def positions
    render json: Xposition.active.collect{|xp|Json::XpositionJson.new(xp).map}
  end

  def positions_by_category
    render json: @category.xpositions.active.collect{|xp|Json::XpositionJson.new(xp).map}
  end


  private
    def set_category
      @category = Xcategory.active.find(params[:category_id]) 
    end
end