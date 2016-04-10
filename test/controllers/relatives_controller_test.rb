require 'test_helper'

class RelativesControllerTest < ActionController::TestCase
  setup do
    @elder = User.create(name: 'Elder')
    @child = User.create(name: 'Child')
  end

  test '#create' do
    assert_difference('Relative.count') do
      post :create, params: { elder_id: @elder.id.slice(0, 4), child_id: @child.id }, format: :json
    end
  end

  test '#index' do
    Relative.create(child_id: @child.id, elder_id: @elder.id)

    get :index, params: { user_id: @child.id }, format: :json

    expected_relatives = {relatives: [UserSerializer.new(@elder).serializable_hash]}.to_json
    assert @response.body == expected_relatives
  end
end
