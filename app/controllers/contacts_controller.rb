class ContactsController < ApplicationController
  def index
  end

  def new
      @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
        if @contact.save then
          redirect_to list_path(@contact.list_name), notice: "コンタクトを作成・保存をしました"
        else
          redirect_to new_contact_path, notice: "コンタクトを作成・保存出来ませんでした"
        end
  end

  def edit
  end

  def show
  end

  def update
  end
  private

  def contact_params
    params.require(:contact).permit(:twitter_id, :name, :nickname, :image, :list_id)
  end
end
