class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :super, except: [:new, :create]
  
  layout "public", only: [:new, :create]

  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @user = User.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @user = @account.users.build(user_params)
    
    #cookies[:auth_token] = @user.auth_token
      
    if @account.save and @user.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  
  end  

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, :slug)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
