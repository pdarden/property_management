class OwnersController < ApplicationController
  helper_method :owners

  def index
  end

  def new
    @owner = Owner.new
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to owners_path,
        notice: 'Owner was successfully created!'
    else
      render :new
    end
  end

  def update
    @owner = Owner.new(owner_params)

    if @owner.update(owner_params)
      redirect_to owner_path(@owner),
        notice: 'Owner was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    Owner.find(params[:id]).destroy
    redirect_to owners_path,
      notice: "Owner was successfully deleted!"
  end

  private
  def owners
    @owners ||= Owner.all
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
