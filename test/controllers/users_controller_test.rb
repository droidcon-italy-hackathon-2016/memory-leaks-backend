require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test '#create' do
    assert_difference('User.count') do
      post :create, params: { name: 'Name'}, format: :json
    end
  end
end
