class SingersController < ApplicationController
  before_action :set_singer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # before_action :authorized_only

  # GET /singers or /singers.json
  def index
    @singers = Singer.order(active: :desc, first_name: :asc, last_name: :asc)

  end

  # GET /singers/1 or /singers/1.json
  def show
  end

  # GET /singers/new
  def new
    @singer = Singer.new
  end

  # GET /singers/1/edit
  def edit
  end

  # POST /singers or /singers.json
  def create
    @singer = Singer.new(singer_params)

    respond_to do |format|
      if @singer.save
        format.html { redirect_to @singer, notice: "Singer was successfully created." }
        format.json { render :show, status: :created, location: @singer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /singers/1 or /singers/1.json
  def update
    respond_to do |format|
      if @singer.update(singer_params)
        format.html { redirect_to @singer, notice: "Singer was successfully updated." }
        format.json { render :show, status: :ok, location: @singer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /singers/1 or /singers/1.json
  def destroy
    @singer.destroy
    respond_to do |format|
      format.html { redirect_to singers_url, notice: "Singer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def text
    @singers = Singer.all
    render :text_form
  end

  def send_text
    account_sid = Rails.application.credentials.twilio[:account_sid]
    auth_token = Rails.application.credentials.twilio[:auth_token]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    params["recipient"]["ids"].reject(&:empty?).each do |id|
      singer = Singer.find_by(id: id)
      from = Rails.application.credentials.twilio[:phone_number]
      to = singer.phone_number
      message = params["message"].gsub("{FIRSTNAME}", singer.first_name)
      if send_text? # set on ApplicationController
        client.messages.create(
          from: from,
          to: to,
          body: message
          )
      else
        print(
          """
            To:  #{to}\n
            From: #{from}\n
            Message: #{message}\n
          """
        )
        end
    end
    flash[:notice] = "Message sent successfully."
    redirect_to singers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_singer
      @singer = Singer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def singer_params
      params.require(:singer).permit(:first_name, :last_name, :phone_number, :pronoun, :birthday, :active)
    end
end
