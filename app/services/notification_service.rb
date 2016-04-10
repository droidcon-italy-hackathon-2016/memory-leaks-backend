require 'gcm'

class NotificationService
  def initialize(params)
    @params = params
    @child_id = params[:child_id]
    @elder_id = params[:elder_id]
  end

  def send
    gcm.send([elder.device_token], options)
  end

  private

  def gcm
    GCM.new(ENV['GCM_API_KEY'])
  end

  def options
    { data: { child: serialized_child } }
  end

  def serialized_child
    UserSerializer.new(child).serializable_hash.merge(relation: relative.relation)
  end

  def child
    User.find(@child_id)
  end

  def elder
    User.find(@elder_id)
  end

  def relative
    Relative.find_by(@params)
  end
end
