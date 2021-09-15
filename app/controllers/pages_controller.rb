class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @listings = Listing.all.first(16)
    render 'listings/index'
  end
end
