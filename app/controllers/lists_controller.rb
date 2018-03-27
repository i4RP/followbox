class ListsController < ApplicationController

  def index
  end

  def show
    @path = request.path
  end

  def new
    @newlist = List.new
  end

  def create
    # パラメーター(リストの名前)と共にリスト作成
    @list = List.new(list_params)
    if @list.save
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
