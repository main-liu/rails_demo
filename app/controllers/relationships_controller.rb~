class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  respond_to :html, :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    #respond_with @user
    respond_to do |format| 
      format.html { redirect_to @user }
      format.js
    end
    #respond_to 方法，根据接到的请求类型不同,只有一行会被执行（依据请求的类型而定）
    #在处理Ajax 请求时，Rails 会自动调用文件名和动作名一样的“含有JavaScript 的ERb（JavaScript Embedded Ruby）”
    #文件（扩展名为 .js.erb），例如 create.js.erb 和 destroy.js.erb。你可能已经猜到了，这种文件是可以
    #包含JavaScript 和Ruby 代码的，可以用来处理当前页面的内容。在关注用户和取消关注用户时，更新用户资料页面的内容就需要创建这种文件。
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end
