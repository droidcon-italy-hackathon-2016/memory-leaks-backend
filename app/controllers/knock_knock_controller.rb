class KnockKnockController < ApplicationController
  def create
    NotificationService.new(knock_knock_params).send
  end

  private

  def knock_knock_params
    params.require(:knock).permit(:elder_id, :child_id)
  end
end
