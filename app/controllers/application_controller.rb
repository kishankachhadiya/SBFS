class ApplicationController < ActionController::Base
  before_action :set_featured
  def set_featured
    # Grab makes that are featured to true and show them by newest
    @featured = Listing.where(featured: true).order('created_at ASC')
  end
end
