class ApiController < ApplicationController
  def get_problems
    binding.pry
    count = params[:count]
    data = Problem.all.sample(count.to_i)
    render :json => data
  end

  def get_problem
    id = params[:id]
    data = Problem.find(id.to_i)
    render :json => data
  end

  def get_all_problem
    data = Problem.all
    render :json => data
  end
end
