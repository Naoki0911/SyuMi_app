require "test_helper"

class SakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sake = sakes(:one)
  end

  test "should get index" do
    get sakes_url
    assert_response :success
  end

  test "should get new" do
    get new_sake_url
    assert_response :success
  end

  test "should create sake" do
    assert_difference('Sake.count') do
      post sakes_url, params: { sake: { content: @sake.content, feeling: @sake.feeling, flavor: @sake.flavor, name: @sake.name, place: @sake.place, rich: @sake.rich, sour: @sake.sour, sweetness: @sake.sweetness, user_id: @sake.user_id } }
    end

    assert_redirected_to sake_url(Sake.last)
  end

  test "should show sake" do
    get sake_url(@sake)
    assert_response :success
  end

  test "should get edit" do
    get edit_sake_url(@sake)
    assert_response :success
  end

  test "should update sake" do
    patch sake_url(@sake), params: { sake: { content: @sake.content, feeling: @sake.feeling, flavor: @sake.flavor, name: @sake.name, place: @sake.place, rich: @sake.rich, sour: @sake.sour, sweetness: @sake.sweetness, user_id: @sake.user_id } }
    assert_redirected_to sake_url(@sake)
  end

  test "should destroy sake" do
    assert_difference('Sake.count', -1) do
      delete sake_url(@sake)
    end

    assert_redirected_to sakes_url
  end
end
