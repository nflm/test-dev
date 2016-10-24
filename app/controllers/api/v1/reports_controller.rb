class Api::V1::ReportsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :validate_params, :prepare_params

  def create_report
    if @errors.empty?
      GenReportJob.perform_later prepare_params.to_h
      render json: {"message":"Report generation started"}, status: :ok
    else
      render json: {"errors":@errors}, status: :unprocessable_entity
    end

  end

  def prepare_params
    params.permit(:start_date, :end_date, :email)
  end

  def validate_params
    @errors = {}
    @errors[:start_date] = "can't be blank" if !params.key?(:start_date) || params[:start_date].blank?
    @errors[:end_date] = "can't be blank" if !params.key?(:end_date) || params[:end_date].blank?
    @errors[:email] = "can't be blank" if !params.key?(:email) || params[:email].blank?
  end

end