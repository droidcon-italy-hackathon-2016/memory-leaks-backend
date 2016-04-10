require 'test_helper'

class KnockKnocksControllerTest < ActionController::TestCase
  setup do
    @elder = User.create(name: 'Elder')
    @child = User.create(name: 'Child')
  end

  test '#create when authorized' do
    Relative.create(child_id: @child.id, elder_id: @elder.id)

    post :create, params: { elder_id: @elder.id, child_id: @child.id }, format: :json
    assert_response :ok
  end

  test '#create when unauthorized' do
    post :create, params: { elder_id: @elder.id, child_id: @child.id }, format: :json
    assert_response :unauthorized
  end
end
