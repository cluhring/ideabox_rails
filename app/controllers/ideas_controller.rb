class IdeasController < ApplicationController
  include ApplicationHelper

  def index
    @ideas = Idea.all
  end

  # def show
  #   @idea = Idea.find(params[:id])
  # end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.new
    @idea.user_id = @idea.id
  end

  # def create
  #   @idea = Idea.new(idea_params)
  #   @idea.save
  #   redirect_to user_path(@idea.user.id)
  # end
  #
  # def destroy
  #   @idea = Idea.find(params[:id])
  #   @idea.delete
  #   flash.notice = "Idea '#{idea.name}' Destroyed!"
  #   redirect_to user_path(@idea.user.id)
  # end

end
