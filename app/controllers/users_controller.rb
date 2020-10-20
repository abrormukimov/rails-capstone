class UsersController < ApplicationController
  helper_method :sum_deals
  helper_method :sum_external_deals

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def make_deals
    @user = current_user
    @deals = Deal.all
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id).includes(groups: :icon_attachment).to_a
    @sum = @user.deals.sum(:amount)
    sum_deals
  end

  def external
    @user = current_user
    @sum = @user.deals.sum(:amount)
    @deals = Deal.all
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id)
    @external = current_user.deals - @user_deals
    sum_external_deals
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, { group_ids: [] })
  end

  def sum_deals
    @user_deals_value = 0
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id)
    @user_deals.each do |a|
      @user_deals_value += a.amount
    end
    @user_deals_value
  end

  def sum_external_deals
    @user_deals_value = 0
    @user_deals = Deal.joins(:dealings).where(author_id: current_user.id)
    @external = current_user.deals - @user_deals
    @external.each do |a|
      @user_deals_value += a.amount
    end
    @user_deals_value
  end
end
