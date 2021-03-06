class RolesController < ApplicationController
  before_filter :authenticate_user!

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  def new
  end
  


  def create
  end



  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json

  def show
    if @role.users.length == 0
      @assosciated_users = "None"
    else
      @assosciated_users = @role.users.map(&:name).join(", ")
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :description)
  end
end