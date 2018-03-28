class ListsController < ApplicationController

  def index

  end

  def show
    @path = request.path
        if user_signed_in?
          # if nil == Contact.find_by(nickname: current_user.nickname) then
          #   if @usercontact = UserContact.create(
          #     twitter_id: current_user.nickname,
          #     name: current_user.name,
          #     image: current_user.image,
          #     nickname: current_user.nickname,
          #     list_id: request.path[1..-1]
          #     )
          #     redirect_to new_list_path, notice: "リスティングの中にコンタクトを作成しました"
          #   else
          #     redirect_to new_list_path, notice: "リスティングの中にコンタクトを作成出来ませんでした"
          #   end
          # end

        else
        redirect_to user_twitter_omniauth_authorize_path
        end
  end

  def new
    @list = List.new
  end

  def create
    # パラメーター(リストの名前)と共にリスト作成
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.name), notice: "リスティングおよびコンタクトを作成・保存をしました"
    else
      redirect_to new_list_path, notice: "リスティングおよびコンタクトを作成・保存出来ませんでした"
    end
  end

  def edit
  end

  def update
  end

  def share
    @path = request.path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
