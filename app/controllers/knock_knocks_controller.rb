class KnockKnocksController < ApplicationController
  def create
    if relative?
      NotificationService.new(knock_knock_params).send
      render status: :ok
    else
      render status: :unauthorized
    end
  end

  private

  def knock_knock_params
    params.require(:knock).permit(:elder_id, :child_id)
  end

  def relative?
    Relative.find_by(knock_knock_params).present?
  end
end
