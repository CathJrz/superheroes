class PagesController < ApplicationController
  def index
    @q = params[:q]
# Solamente si mi usario sí tiene contenido (si alguien sí tecleó información),
# se va a crear el usuario:
    unless params[:q].blank?
      @user = User.new(name: @q)
      @user.save
    end
  end

  def about
  end

  def contact
  end

  def save_user
    # Esto guarda mi usuario:
    User.create(name: params[:q])

    # Esto me lleva a mi página elegida:
    redirect_to pages_index_path, notice: "El usuario se creó correctamente."
  end

  def see_users
    @users = User.all
  end
end
