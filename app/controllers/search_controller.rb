class SearchController < ApplicationController
  def search
    search_text = params[:search_text]
    @select_model = params[:select_model]
    select_part = params[:select_part]
    @books = Book.search(search_text,@select_model,select_part)
    @users = User.search(search_text,@select_model,select_part)
  end
end
