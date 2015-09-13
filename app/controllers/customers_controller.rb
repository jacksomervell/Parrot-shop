class CusotmersController < ApplicationController

  def index
    @customers = customer.all.order('created_at DESC')
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.new(customer_params)
    
    if customer.save
      flash[:notice] = 'customer created successfully!'
      redirect_to customer
    else
      flash.now[:error] = "Error: #{customer.errors.full_messages}"
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])

    if customer.update(customer_params)
      redirect_to customer
    else
      render :edit
    end
  end

  def destroy
    customer = Customer.find(params[:id]).destroy

    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :parrot, :quantity, :review)
  end

end