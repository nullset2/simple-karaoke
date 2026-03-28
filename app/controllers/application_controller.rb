class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def update_name
    user = current_or_guest_user
    if user.update_columns(name: params[:name]) && !params[:name].blank? && params[:name].length <= 30
      redirect_back fallback_location: root_path, notice: "Name updated!"
    else
      redirect_back fallback_location: root_path, alert: "Enter 1 to 30 characters."
    end
  end
end
