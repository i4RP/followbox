class ListsController < ApplicationController

  def index

  end

  def show
    @path = request.path[1..-1]
    if user_signed_in?
      if List.exists?(name: @path)
        @nickname = current_user.nickname
        if Follow.exists?(nickname: @nickname, list: @path)
          #条件を全てクリア
        else
          redirect_to new_follow_path, notice: "リストにあなたのコンタクトが存在していません。リストにあなたのコンタクトを追加してください。"
        end
      else
        redirect_to new_list_path, notice: "リストが存在しません。新しくリストを作成するか、URLを確認してください"
      end
    else
      redirect_to user_twitter_omniauth_authorize_path
    end
  end

  def new
    if user_signed_in?
      @list = List.new
    else
      redirect_to user_twitter_omniauth_authorize_path
    end
  end

  def create
    # パラメーター(リストの名前)と共にリスト作成
    @name = :name
    @list = List.new(list_params)
    if @list.save then
      redirect_to list_path(@list.name), notice: "リスティングを作成・保存をしました"
    else
      redirect_to new_list_path, notice: "リスティングを作成・保存出来ませんでした"
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
