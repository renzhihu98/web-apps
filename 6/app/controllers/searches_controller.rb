#created by Celia Tang: April 13th, 2019
# controller for search functionality
# edited by Celia Tang 4-13-19: added if statement for population of results and parameter
# edited by Celia Tang 4-14-19: changed so that is using Ransack gem to search, calling ransack using
#                               :q param from Ransack and populating a variable with results and using build condition to
#                               created dynamic search, made all accesses to ransack object q global so that header has access to it
# edited by Celia Tang 4-15-19: ransack object changed back to instance var
# edited by Celia Tang 4-16-19: added methods for entertainment and education pages
class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @q = Book.ransack(params[:q])
    @results = @q.result(distinct:true)
    @q.build_condition
  end

  def entertainment_search
    @q = Book.ransack({"classification_cont"=>"Entertainment"})
    @results = @q.result(distinct:true)
  end

  def education_search
    @q = Book.ransack({classification_cont: "Education"})
    @results = @q.result(distinct:true)
  end

end
