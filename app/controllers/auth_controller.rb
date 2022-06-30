class AuthController < ApplicationController

    def form_register 
        @user = User.new
    end

    def register
        @user = User.new(user_params)
        if @user.save
            redirect_to form_register_path, notice: "Akun Berhasil Dibuat!"
        else
            render :form_register
        end
    end


    
    def login
        email = params[:email]
        password = params[:password]

        user = User.find_by(email:  email)
        if user
            if user.authenticate(password)
                session[:user_id] = user.id
                redirect_to home_index_path, notice: "Selamat Datang #{user.name}"
            else
                redirect_to form_login_path, alert: "Password tidak sesuai"
            end
        else
            redirect_to form_login_path, alert:"email tidak ditemukan"
        end 
    end

    def form_login
    end


    private
    def user_params
        params.require(:user).permit(:name, :phone, :addres, :email, :password)
    end

    

end
