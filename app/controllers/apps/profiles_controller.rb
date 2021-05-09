class Apps::ProfilesController < Apps::ApplicationController

  def show
    @profile = current_user.profile
  end

  def edit
    # @profile = current_user.profile || current_user.build_profile 
    @profile = current_user.prepare_profile
  end

  def update
    # @profile = current_user.build_profile(profiles_params)
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profiles_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィールを更新'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profiles_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :gender,
      :birthday,
      :subscribed,
      :avatar
    )
  end
end