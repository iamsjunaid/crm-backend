class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      render json: customer
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
end