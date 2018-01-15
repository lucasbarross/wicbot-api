require 'test_helper'

class LocalizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @localization = localizations(:one)
  end

  test "should get index" do
    get localizations_url, as: :json
    assert_response :success
  end

  test "should create localization" do
    assert_difference('Localization.count') do
      post localizations_url, params: { localization: { hash: @localization.hash, lang: @localization.lang, text: @localization.text } }, as: :json
    end

    assert_response 201
  end

  test "should show localization" do
    get localization_url(@localization), as: :json
    assert_response :success
  end

  test "should update localization" do
    patch localization_url(@localization), params: { localization: { hash: @localization.hash, lang: @localization.lang, text: @localization.text } }, as: :json
    assert_response 200
  end

  test "should destroy localization" do
    assert_difference('Localization.count', -1) do
      delete localization_url(@localization), as: :json
    end

    assert_response 204
  end
end
