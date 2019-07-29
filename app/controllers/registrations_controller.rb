class RegistrationsController < ApplicationController
  def new
  end

  def new1
    @user = User.new 
  end

  def create1
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:nickname]              = user_params[:nickname]
    session[:firstname]             = user_params[:firstname]
    session[:lastname]              = user_params[:lastname]
    session[:firstname_kana]        = user_params[:firstname_kana]
    session[:lastname_kana]         = user_params[:lastname_kana]
    session[:birthday]              = user_params[:birthday]
    redirect_to new2_registrations_path
  end

  def new2 
    @user = User.new 
  end

  def create2
    session[:tel] = user_params[:tel]
    redirect_to new4_registrations_path
  end

  def new3 
    @user = User.new 
  end

  def create3
    redirect_to new4_registrations_path
  end

  def new4 
    @user = User.new 
    @user.build_address
  end

  def create4
    session[:tel]             = user_params[:tel]
    session[:id]              = user_params[:address_attributes][:id]
    session[:postal_code]     = user_params[:address_attributes][:postal_code]
    session[:prefecture_id]   = user_params[:address_attributes][:prefecture_id]
    session[:city]            = user_params[:address_attributes][:city]
    session[:address_number]  = user_params[:address_attributes][:address_number]
    session[:building_name]   = user_params[:address_attributes][:building_name]

    User.create(email:          session[:email], 
                password:       session[:password], 
                nickname:       session[:nickname], 
                firstname:      session[:firstname], 
                lastname:       session[:lastname], 
                firstname_kana: session[:firstname_kana], 
                lastname_kana:  session[:lastname_kana], 
                birthday:       "2019-07-20", 
                tel:            session[:tel],
                address_attributes:{id:            session[:id],
                                    postal_code:   session[:postal_code],   
                                    prefecture_id: session[:prefecture_id],  
                                    city:          session[:city],           
                                    address_number:session[:address_number], 
                                    building_name: session[:building_name]})  
    
    redirect_to new6_registrations_path
  end

  def new5 
    @user = User.new 
  end

  def create5
    redirect_to new6_registrations_path
  end

  def new6 
  end


  def edit
    @user = User.find(1)
  end

  def update
  end

  private

  def user_params
    params.require(:user)
    .permit(:email, 
            :password, 
            :password_confirmation, 
            :nickname, 
            :firstname, 
            :lastname, 
            :firstname_kana, 
            :lastname_kana, 
            :birthday, 
            :tel, 
            :icon_image, 
            :profile,
            address_attributes:[:id, 
                                :postal_code, 
                                :prefecture_id, 
                                :city, 
                                :address_number, 
                                :building_name])
  end
end