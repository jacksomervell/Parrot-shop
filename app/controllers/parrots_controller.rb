class ParrotsController < ApplicationController

  def index
    @parrots = Parrot.all.order('created_at DESC')
  end

  def new
    @parrot = Parrot.new
  end

  def create
    parrot = Parrot.new(parrot_params)
    
    if parrot.save
      flash[:notice] = 'Parrot created successfully!'
      redirect_to parrot
    else
      flash.now[:error] = "Error: #{parrot.errors.full_messages}"
      render :new
    end
  end

  def show
    @parrot = Parrot.find(params[:id])
  end

  def edit
    @parrot = Parrot.find(params[:id])
  end

  def update
    parrot = Parrot.find(params[:id])

    if parrot.update(parrot_params)
      redirect_to parrot
    else
      render :edit
    end
  end

  def destroy
    parrot = Parrot.find(params[:id]).destroy

    redirect_to root_path
  end

  private
  def parrot_params
    params.require(:parrot).permit(:name, :type, :colour, :price)
  end

end