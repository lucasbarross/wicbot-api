require 'test_helper'

class ChampionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @champion = champions(:one)
  end

  test "should get index" do
    get champions_url, as: :json
    assert_response :success
  end

  test "should create champion" do
    assert_difference('Champion.count') do
      post champions_url, params: { champion: { name: @champion.name, representation: @champion.representation } }, as: :json
    end

    assert_response 201
  end

  test "should show champion" do
    get champion_url(@champion), as: :json
    assert_response :success
  end

  test "should update champion" do
    patch champion_url(@champion), params: { champion: { name: @champion.name, representation: @champion.representation } }, as: :json
    assert_response 200
  end

  test "should destroy champion" do
    assert_difference('Champion.count', -1) do
      delete champion_url(@champion), as: :json
    end

    assert_response 204
  end
end
