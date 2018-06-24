class PullRequestsController < ApplicationController
  before_action :set_pull_request, only: %i(update destroy)
  # TODO : admin::pullrequestsControllerを作ってupdateとdestroyは移す？

  def create
    @pull_request = PullRequest.new(pull_request_params)
    if @pull_request.save
      render json: @pull_request, status: :created
    else
      render json:  @pull_request.errors, status: :unprocessable_entity
    end
  end

  def update
    # TODO : 該当するカリキュラムの文言の修正する処理 && pullrequestがmergedっていう感じのstatus作り
    if @pull_request.update
      render json: @pull_request
    else
      render json:  @pull_request.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # TODO : pullrequestのstatusをclosedにする処理
  end

  private

  def set_pull_request
    @pull_request = PullRequest.find(params[:id])
  end

  def pull_request_params
    params.require(:pull_request).permit(:message, :title, :body)
    # .merge(curriculum_id: params[:curriculum_id])
  end

end
