class InspectionsController < ApplicationController
  def index
    @inspections = Inspection.where(restaurant_id: params[:restaurant_id])
    render json: @inspections
  end

  def show
    @inspection = Inspection.find(params[:id])
    render json: @inspection, include: :violations
  end
end
