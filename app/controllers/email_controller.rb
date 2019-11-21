class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def create
    @email = Email.new(object: Faker::Superhero.power, body: Faker::Lorem.sentence)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def update
  end

  def edit
   
  end

  def new
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
