require "test_helper"

class ThecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thecomment = thecomments(:one)
  end

  test "should get index" do
    get thecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_thecomment_url
    assert_response :success
  end

  test "should create thecomment" do
    assert_difference("Thecomment.count") do
      post thecomments_url, params: { thecomment: {  } }
    end

    assert_redirected_to thecomment_url(Thecomment.last)
  end

  test "should show thecomment" do
    get thecomment_url(@thecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_thecomment_url(@thecomment)
    assert_response :success
  end

  test "should update thecomment" do
    patch thecomment_url(@thecomment), params: { thecomment: {  } }
    assert_redirected_to thecomment_url(@thecomment)
  end

  test "should destroy thecomment" do
    assert_difference("Thecomment.count", -1) do
      delete thecomment_url(@thecomment)
    end

    assert_redirected_to thecomments_url
  end
end
