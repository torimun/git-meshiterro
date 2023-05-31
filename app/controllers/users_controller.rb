class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #下記のコードにエラーが出た場合は、リレーションを使ってモデルから引っ張っているので
    @post_images = @user.post_images
  end

  def edit
  end
end
