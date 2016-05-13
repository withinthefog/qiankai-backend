class Api::V1::TagCategoriesController < ApiController
  def index
    @tag_categories = TagCategory.includes(:tags).all
  end
end
