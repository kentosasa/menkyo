class ApiController < ApplicationController
  def get_problems
    count = params[:count]
    data = Problem.all.sample(count.to_i)
    render :json => data
  end

  def get_problem
    id = params[:id]
    data = Problem.find(id.to_i)
    render :json => data
  end

  def get_all_problems
    data = Problem.all.shuffle
    render :json => data
  end

  def put_correct
    id = params[:id]
    data = Problem.find(id.to_i)    
    data.update(correct_count: data.correct_count+1)
    render text: "update success"
  end

  def put_miss
    id = params[:id]
    data = Problem.find(id.to_i)    
    data.update(miss_count: data.miss_count+1)
    render text: "update success"
  end

  def get_review_list
    list = params[:list]
    data = []
    list.split(",").each do |id|
      data << Problem.find(id.to_i)
    end
    data =  data.shuffle
    render :json => data
  end
end
