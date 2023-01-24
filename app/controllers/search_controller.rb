class SearchController < ApplicationController
  def index
    @query = Cooperative.ransack(params[:q])
    @cooperatives = @query.result(distinct: true).paginate(page: params[:page], per_page: 25)
  end
end
