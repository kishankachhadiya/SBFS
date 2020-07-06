class ApplicationController < ActionController::Base
  before_action :set_featured
  helper_method :is_admin!
  before_action :authenticate_user!
  def set_featured
    # Grab makes that are featured to true and show them by newest
    @featured = Listing.where(featured: true).order('created_at ASC')
  end

  def is_admin!
    current_user&.admin
  end

end
