class Admin::UserProfilesController < AdminController


    before_action :find_user_and_profile

    def edit
    end

    def update
      if @profile.update(profile_params)
        redirect_to admin_users_path
      else
        render "edit"
    end
  end

  protected

  def find_user_and_profile
    @user =User.find(params[:user_id])
    # 因為新建的用戶並沒有profile，所以這邊先檢查是否有 @user.profile， 如果沒有的話就用 @user.create_profile 新建進數據庫
    @profile =@user.profile || @user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:legal_name,:birthday, :location, :education, :occupation, :bio, :specialty)
  end
end
