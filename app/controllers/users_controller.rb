class UsersController < ApplicationController
before_action :authenticate_user!
before_action :find_user
def edit
 # 跟剛才後台情況一樣，如果沒有 @user.profile，要先新建一個
 # 除非 @user.profile 等同於 if !@user.profile 或 if @user.prodfile.nil?
 @user.create_profile unless @user.profile
end

def update
 if @user.update(user_params)
   flash[:notice] = '修改成功'
   redirect_to edit_user_path
 else
   render "edit"
  end
 end

 def show
 end

 protected

 def find_user
   @user = current_user
   @user.create_profile unless @user.profile
 end
 def user_params
   params.require(:user).permit(:time_zone, :profile_attributes => [:id, :legal_name, :birthday, :location, :education, :occupation, :bio, :specialty])
  end

end
