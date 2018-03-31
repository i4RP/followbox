class FollowsController < ApplicationController
  def index
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)
        if @follow.save then
          redirect_to list_path(@follow.list), notice: "コンタクトを作成・保存をしました"
        else
          redirect_to new_contact_path, notice: "コンタクトを作成・保存出来ませんでした"
        end
  end

  def edit
  end

  def delete
  end

  def show
  end

  def update
  end

  private

  def follow_params
    params.require(:follow).permit(:name, :nickname, :image, :list)
  end

end
