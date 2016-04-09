class MemoryLeaksResponder < ActionController::Responder
  def initialize(*)
    super
    @options[:location] = nil
  end

  def api_behavior(*args, &block)
    if post?
      display resource, status: :created
    elsif put?
      display resource, status: :ok
    else
      super
    end
  end
end
