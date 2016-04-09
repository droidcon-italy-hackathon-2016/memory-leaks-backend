require 'test_helper'

class RelativesControllerTest < ActionController::TestCase
  setup do
    @elder = User.create(name: 'Elder')
    @child = User.create(name: 'Child')
  end

  test '#create' do
    assert_difference('Relative.count') do
      post :create, params: { relative: { elder_id: @elder.id, child_id: @child.id } }, format: :json
    end
  end
end
