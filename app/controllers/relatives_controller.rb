class RelativesController < ApplicationController
  def create
    respond_with Relative.create(relative_params)
  end

  def relative_params
    params.require(:relative).permit(:elder_id, :child_id)
  end
end
