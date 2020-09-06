class SearchesController < ApplicationController
  def search
  	@word = params[:word]
  	@search_model = params[:search_model]
  	@search_how = params[:search_how]

  	  if @search_model == "user"
  	  	@user = User.search(search,word)
  	  else
  	  	@book = Book.search(search,word)
  	  end
  end

  def index
  	@word = params[:word]
  	@search_model = params[:search_model]
  	@search_how = params[:search_how]

  	  if @search_model == "user"
  	  	@user = User.search(search,word)
  	  else
  	  	@book = Book.search(search,word)
  	  end
  end

end
