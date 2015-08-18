class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  def record_not_found_error
    error = {
      error: {
        message: "This is not the resource you're looking for *jedi hand wave*"
      }
    }
    render json: error, status: :not_found
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
end
