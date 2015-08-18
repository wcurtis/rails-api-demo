class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  def record_not_found_error
    render_error "This is not the resource you're looking for *jedi hand wave*", :not_found
  end

  # Returns pagination info for collections
  def meta_for_collection collection
    {
      :total_pages    => collection.total_pages,
      :current_page   => collection.current_page,
      :page_size      => collection.per_page,
      :total_entries  => collection.total_entries 
    }
  end

  def authenticate_user_from_token
    authenticate_with_http_token do |token, options|
      @authenticated_user = User.find_by(auth_token: token)
    end

    if @authenticated_user.blank?
      render_error "Please provide a valid auth token", :unauthorized
    end
  end

  # Format errors in our error object
  def render_error message, status
    error = {
      error: {
        message: message
      }
    }
    render json: error, status: status
  end
end
