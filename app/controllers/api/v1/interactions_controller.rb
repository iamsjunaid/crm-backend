class Api::V1::InteractionsController < ApplicationController
  def index
    render json: Interaction.all
  end

  def show
    render json: Interaction.find(params[:id])
  end

  def create
    interaction = Interaction.new(interaction_params)
    if interaction.save
      render json: interaction, status: :created
    else
      render json: interaction.errors, status: :unprocessable_entity
    end
  end

  def update
    interaction = Interaction.find(params[:id])
    if interaction.update(interaction_params)
      render json: interaction
    else
      render json: interaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    interaction = Interaction.find(params[:id])
    interaction.destroy
  end

  private

  def interaction_params
    params.require(:interaction).permit(:content, :contact_id)
  end
end