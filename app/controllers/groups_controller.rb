class GroupsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :authenticate_user!
  helper_method :sum_of_deals

  def index
    @groups = Group.all.order('name ASC').includes(icon_attachment: :blob)
    @user = current_user
  end

  def show
    @group = Group.find(params[:id])
    @group_deals = @group.deals.includes(:author)
  end

  def new
    @group = current_user.groups.build
  end

  def edit; end

  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(deal_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_deal
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def sum_of_deals
    @user_deals_value = 0
    @group_deals = @group.deals
    @group_deals.each do |a|
      @user_deals_value += a.amount
    end
    @user_deals_value
  end
end
