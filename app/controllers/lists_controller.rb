class ListsController < ApplicationController

  def index
    @list = List.new
  end

  def show
    @path = request.path[1..-1]
    if user_signed_in?
      if List.exists?(name: @path)
        @nickname = current_user.nickname
        if Follow.exists?(nickname: @nickname, list: @path)
          #条件を全てクリア

        else
          @follow = Follow.new(
            name: current_user.name,
            nickname: current_user.nickname,
            image: current_user.image,
            list: @path
           )
          if @follow.save then
            redirect_to list_path(@follow.list), notice: "あなたのコンタクトを作成・追加しました"
          else
            redirect_to lists_path, notice: "コンタクトを作成・保存出来ませんでした"
          end
        end
      else
        redirect_to lists_path, notice: "フォローボックスが存在しません。新しくフォローボックスを作成するか、URLを確認してください"
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
    # パラメーター(フォローボックスの名前)と共にフォローボックス作成
    # @name = :name
    @list = List.new(list_params)
    if List.exists?(name: @list.name)
      redirect_to list_path(@list.name), notice: "フォローボックスが見つかりました"
    else
      if @list.save then
        redirect_to list_path(@list.name), notice: "フォローボックスを作成・保存をしました"
      else
        redirect_to new_list_path, notice: "フォローボックスを作成・保存出来ませんでした"
      end
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
