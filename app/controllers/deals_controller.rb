class DealsController < ApplicationController
  before_action :set_deal, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all.includes(:author).order('created_at DESC')
    @sum = @deals.sum(:amount)
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @groups = Group.all
    @user = current_user
    @sum = current_user.deals.sum(:amount)
    @comment = Comment.new
    @comment.deal_id = @deal.id
  end

  # GET /deals/new
  def new
    @deal = current_user.deals.build
    @groups = Group.all
  end

  # GET /deals/1/edit
  def edit; end

  # POST /deals
  # POST /deals.json
  def create
    @deal = current_user.deals.build(deal_params)
    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount, { group_ids: [] })
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :deal_id)
  end
end
