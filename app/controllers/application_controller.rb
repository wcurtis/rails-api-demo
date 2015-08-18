class ApplicationController < ActionController::API

  def meta_for_collection collection
    {
      :total_pages    => collection.total_pages,
      :current_page   => collection.current_page,
      :page_size      => collection.per_page,
      :total_entries  => collection.total_entries 
    }
  end 
end
