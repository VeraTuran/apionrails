class Api::V1::UsersController < ApplicationController
    # GET /users/1
    def show
        render json: User.find(params[:id])
    end

    test "should show user" do
        get api_v1_user_url(@user), as: :json
        assert_response :success
        # test to ensure response contains the correct email
        json_response = JSON.parse(self.response.body)
        assert_equal @user.email, json_response['email']
    end
end
