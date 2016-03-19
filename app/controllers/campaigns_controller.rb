class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :gross, :volunteer]
  before_action :set_user, only: [:new, :create, :show]
  helper_method :gross
  helper_method :percentage
  helper_method :user_nu
  helper_method :volunteer
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
    @user = User.find(1)
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = @user.campaigns.build
    @categories = Category.all
  end

  def gross
    @gross = Payment.select("sum(amount) AS amount").where(campaign_id: @campaign.id)
    @gross.each { |e| return e.amount  }
  end

  def percentage
    return (gross.to_f/@campaign.cost.to_f)*100
  end

  def user_nu
    @suer_nu = Payment.select("user_id").where(campaign_id: @campaign.id)
    return @suer_nu.count
  end

  def volunteer
    @v = Payment.select("user_id").distinct.where(campaign_id: @campaign.id)
    return @v.count
  end

  # GET /campaigns/1/edit
  def edit
    @categories = Category.all
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    # @campaign = Campaign.new(campaign_params)
    @campaign = @user.campaigns.build(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { render :show, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.require(:campaign).permit(:user_id, :name, :goal, :cost, :upload, :display, category_ids: [])
  end
end
