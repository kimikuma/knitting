class SearchesController < ApplicationController
  def search
    @model=params[:model]
    @search=params[:search]
    @word=params[:word]

     if @model=="user"
       @users=User.search_for(@search,@word)
     else
       @posts=Post.search_for(@search,@word)
       
     end
  end

end
