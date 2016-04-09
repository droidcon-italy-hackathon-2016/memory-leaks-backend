class RelativesController < ApplicationController
  def index
    response = { relatives: serialized_relatives }
    respond_with response
  end

  def create
    respond_with Relative.create(relative_params)
  end

  private

  def serialized_relatives
    relatives.map(&:elder).map { |user| UserSerializer.new(user).serializable_hash }
  end

  def relatives
    Relative.where(child_id: params[:user_id])
  end

  def relative_params
    params.require(:relative).permit(:elder_id, :child_id)
  end
end
