class SessionsController < ApplicationController
  protect_from_forgery :except => :create

  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user
      if params[:password].blank?
        respond_to do |format|
          format.json {
            new_pass = User.random_string(5)
            user.password = new_pass
            Emailer.pwd_forgotten(user.email, new_pass).deliver if res = user.save(:validate => false)
            render :json => {:error => "New password sent to #{user.email}" }
            #render :json => {:error => "An error occured, contact us to recover your password" }
          }
        end
      elsif user.authenticate(params[:password])
        session[:user_id] = user.id
        respond_to do |format|
          format.html { redirect_to_stored }
          format.json { render :json => {:user => user, :status => "Profile loaded" } }
        end
      else
        respond_to do |format|
          format.html {
            flash.now.alert = "Invalid email or password"
            render "new"
          }
          format.json { render :json => {:error => "This email is already taken"} }
        end
      end
    else
      respond_to do |format|
        format.json {
          if session[:user_id]
            render :json => {:error => "You're already logged in"}
          else
            user = User.new :email => params[:email], :password => params[:password], :game_progress => params[:gameProgress]
            if user.save
              session[:user_id] = user.id
              render :json => {:user => user, :status => "Profile created" }
            else
              render :json => {:error => "Invalid email or password", :details => user.errors.messages}
            end
          end
        }
        format.html {
          if session[:user_id]
            redirect_to root_url, :notice => "You're already logged in"
          else
            user = User.new :email => params[:email], :password => params[:password]
            if user.save
              session[:user_id] = user.id
              redirect_to root_url, :notice => "Profile created for #{params[:email]}"
            else
              redirect_to new_session_path, :notice => "Invalid email or password"
            end
          end
        }
      end
    end
  end

  def delete
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to games_path, :notice => "Logged out!" }
      format.json { render :json => {:notice => "logged out"} }
    end
  end
end
