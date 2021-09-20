class PagesController < ApplicationController
  include Pagy::Backend

  skip_before_action :authenticate_user!, only: :home
  def home
    all_query
    @listings = Listing.all
    search_check
    @pagy, @records = pagy(@listings)
    # binding.pry
    render 'listings/index'
  end

  private

  def all_query
    @query = params[:query]
    @size = [params[:size_type], params[:size]].join(' ')
    @gender = params[:gender]
    @price_range = [params[:price_more_than], params[:price_less_than]].join(' – ')
  end

  def search_check
    if @query
      query = "brand @@ :query OR sneaker_model_name @@ :query"
      @listings = @listings.where(query, query: "%#{@query}%")
    end
    # if params[:size]
    #   query = "size @@ :query"
    #   @listings = @listings.where(query, query: "%#{@size}%")
    # end
  end
end
