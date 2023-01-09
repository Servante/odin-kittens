class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
