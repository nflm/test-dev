class UploadController <  ActionController::Base
  def index
  end

  def upload
    params.permit(:picture)

    if !params.key?(:picture) || params[:picture].blank?
      redirect_to upload_index_url, notice: "Empty file"
    else

      uploaded_io = params[:picture]

      s3 = Aws::S3::Resource.new(region: ENV['aws_region'], credentials: Aws::Credentials.new(ENV['aws_access_key_id'], ENV['aws_secret_access_key']))
      bucket = s3.bucket(ENV['bucket_name'])

      name = File.basename uploaded_io.tempfile

      if !bucket.object(name).exists?
        obj = bucket.object(name)
        obj.upload_file(uploaded_io.tempfile)
        redirect_to upload_index_url, notice: "File uploaded S3"
      end

      # File.open(Rails.root.join('uploads', uploaded_io.original_filename), 'wb') do |file|
      #   file.write(uploaded_io.read)
      # end

    end
  end

end
