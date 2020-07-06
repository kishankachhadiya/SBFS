class ApplicationController < ActionController::Base
  before_action :set_featured
  helper_method :is_admin!
  before_action :set_current_user
  def set_featured
    # Grab makes that are featured to true and show them by newest
    @featured = Listing.where(featured: true).order('created_at ASC')
  end

  def is_admin!
    unless current_user&.admin
      redirect_to new_user_registration_path
    end
  end

  def set_current_user
    #create a new use if there is no logged in user
    #or you could probably load a default user
    current_user = User.new unless user_signed_in?  
  end 

end
