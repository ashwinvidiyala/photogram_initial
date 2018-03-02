class ImagesController < ApplicationController
  def create
    image = Image.create(image_params)
    if image.valid?
      return redirect_to user_path current_user
    end

    flash[:errors] = image.errors.full_messages
    # redirect_back(fallback_location: user_path current_user) why doesn't this work?
    redirect_back(fallback_location: "/users/#{current_user.id}")
  end

  private

  def image_params
    params.require(:image).permit(:image).merge(user: current_user)
  end
end
