require "test_helper"

class CollectionSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_setting = collection_settings(:one)
  end

  test "should get index" do
    get _collection_settings_url
    assert_response :success
  end

  test "should get new" do
    get new__collection_setting_url
    assert_response :success
  end

  test "should create collection_setting" do
    assert_difference("CollectionSetting.count") do
      post _collection_settings_url, params: { collection_setting: {} }
    end

    assert_redirected_to _collection_setting_url(CollectionSetting.last)
  end

  test "should show collection_setting" do
    get _collection_setting_url(@collection_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit__collection_setting_url(@collection_setting)
    assert_response :success
  end

  test "should update collection_setting" do
    patch _collection_setting_url(@collection_setting), params: { collection_setting: {} }
    assert_redirected_to _collection_setting_url(@collection_setting)
  end

  test "should destroy collection_setting" do
    assert_difference("CollectionSetting.count", -1) do
      delete _collection_setting_url(@collection_setting)
    end

    assert_redirected_to _collection_settings_url
  end
end
