class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @emails = Email.all
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
    @email.update(read: true)
  end

  def create
    @email = Email.new(object: Faker::Superhero.power, body: Faker::Lorem.sentence, read: false)
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
    @emails = Email.all
    @email = Email.find(params[:id])
    @email.update(read: false)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
    flash[:notice] = "Email edited"

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
