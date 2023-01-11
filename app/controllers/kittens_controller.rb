class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save  
      flash[:notice] = "Congrats! New Kitten Created!"
      redirect_to @kitten    
    else
      flash.now[:error] = "Kitten not saved. Check your errors you dolt!"
      render :new, status: :unprocessable_entity
    end   
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:notice] = "Congrats! You updated Mr. Kitty!"
      redirect_to @kitten
    else
      flash.now[:error] = "Kitten not updated. Check your errors you dolt!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "Congrats! You er.. deleted #{@kitten.name.capitalize}!"
    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
