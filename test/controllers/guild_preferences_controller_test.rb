require 'test_helper'

class GuildPreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guild_preference = guild_preferences(:one)
  end

  test "should get index" do
    get guild_preferences_url, as: :json
    assert_response :success
  end

  test "should create guild_preference" do
    assert_difference('GuildPreference.count') do
      post guild_preferences_url, params: { guild_preference: { guild_id: @guild_preference.guild_id, lang: @guild_preference.lang } }, as: :json
    end

    assert_response 201
  end

  test "should show guild_preference" do
    get guild_preference_url(@guild_preference), as: :json
    assert_response :success
  end

  test "should update guild_preference" do
    patch guild_preference_url(@guild_preference), params: { guild_preference: { guild_id: @guild_preference.guild_id, lang: @guild_preference.lang } }, as: :json
    assert_response 200
  end

  test "should destroy guild_preference" do
    assert_difference('GuildPreference.count', -1) do
      delete guild_preference_url(@guild_preference), as: :json
    end

    assert_response 204
  end
end
