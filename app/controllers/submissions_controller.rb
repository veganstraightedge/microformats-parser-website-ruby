class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:index, :edit, :update, :destroy]

  # GET /submissions
  def index; end

  # GET /submissions/1
  def show; end

  # GET /submissions/new
  def new
    @submission = Submission.new
  end

  # GET /submissions/1/edit
  def edit; end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    doc  = Microformats.parse(@submission.html, base: @submission.base_url)
    json = JSON.pretty_generate(doc.to_h)

    @submission.json = json

    if @submission.save_html?
      if @submission.save
        redirect_to @submission, notice: 'Submission was successfully created.'
      else
        render :new
      end
    else
      render :show
    end
  end

  # PATCH/PUT /submissions/1
  def update; end

  # DELETE /submissions/1
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  def redirect_to_root
    redirect_to root_path
  end

  # Only allow a trusted parameter "white list" through.
  def submission_params
    params.expect(submission: [:url, :html, :base_url, :save_html, :render_html_in_page])
  end
end
