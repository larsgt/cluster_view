# Responsible for handling requests related to Batch instances, this controller is the main hub
# of the application.
#
# Supports the following actions:
#
#   thumbnail => sends back the image thumbnail data for image_id
#   image     => sends back the original image data for image_id
class BatchesController < ApplicationController
  before_filter :require_user
  before_filter :needs_batch_from_id, :only => [ :show, :update ]
  before_filter :needs_events, :only => [ :show, :update ]
  before_filter :needs_image_from_image_id, :only => [ :image, :thumbnail ]
  
  public :send_data  # Open #send_data so that it can called from Image.
  
  def index
    # Do nothing and fall through to the view
  end

  def show
    # Do nothing and fall through to the view
  end
  
  def update
    @batch.update_attributes(params[ :batch ]) do |event,image|
      @events.push(translate("batches.messages.image_upload.#{ event }", :data_file_name => image.data_file_name))
    end
    render :show
  end

  def thumbnail
    @image.send_thumbnail_data_via(self, :disposition => 'inline')
  end

  def image
    @image.send_image_data_via(self)
  end
  
private

  def needs_batch_from_id
    @batch = Batch.find(batch_id = params[:id])
  rescue ActiveResource::ResourceNotFound => exception
    flash[:error] = translate('batches.errors.batch_not_found', :batch_id => batch_id)
    redirect_to batches_path
  end

  def needs_events
    @events = []
  end

  def needs_image_from_image_id
    @image = Image.find(image_id = params[:image_id])
  rescue ActiveRecord::RecordNotFound => exception
    # Because the image is sent back to the browser we cannot simply redirect like we normally would
    # so we have to send back a simple '404 Not Found' response.
    render :text => ' ', :status => :not_found
  end
end
