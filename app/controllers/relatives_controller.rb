class RelativesController < ApplicationController
  def index
    response = { relatives: serialized_relatives }
    respond_with response
  end

  def create
    respond_with Relative.create(elder_id: elder.id, child_id: params[:child_id], relation: params[:relation])
  end

  private

  def elder
    User.all.select { |user| user.id.slice(0, 4) == params[:elder_id] }[0]
  end

  def serialized_relatives
    relatives.map(&:elder).map { |user| UserSerializer.new(user).serializable_hash }
  end

  def relatives
    Relative.where(child_id: params[:user_id])
  end

  def relative_params
    params.permit(:elder_id, :child_id, :relation)
  end
end
