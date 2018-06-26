class PullRequestsController < ApplicationController
  before_action :set_pull_request, only: %i(update destroy)
  # TODO : admin::pullrequestsControllerを作ってupdateとdestroyは移す？

  def index
    @pull_requests = PullRequest.where(curriculum_id: params[:curriculum_id], status: 0)
    render json: @pull_requests
  end

  def create
    @pull_request = PullRequest.new(pull_request_params)
    if @pull_request.save
      render json: @pull_request, status: :created
    else
      render json:  @pull_request.errors, status: :unprocessable_entity
    end
  end

  def update
    @curriculum = @pull_request.curriculum
    # 正規表現でoriginal_textに合致する部分をmessageで置き換える
    @curriculum.body.sub!(@pull_request.original_text, @pull_request.message)
    @pull_request.update(status: 1)
    @curriculum.save
    @pull_request.save
  end

  def destroy
    # TODO : pullrequestのstatusをclosedにする処理
  end

  private

  def set_pull_request
    @pull_request = PullRequest.find(params[:id])
  end

  def pull_request_params
    params.require(:pull_request).permit(:message, :title, :original_text).merge(curriculum_id: params[:curriculum_id])
  end

end
