require 'memory_leaks_responder'

class ApplicationController < ActionController::API
  self.responder = MemoryLeaksResponder

  respond_to :json
end
