
class DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy, :update, :index, :show, :new]
  before_action :authenticate_model!, only: [:new]

  # GET /documents
  # GET /documents.json
  def index
  	@documents = Document.paginate(:page => params[:page], per_page: 2)
  	render json: {status: 'SUCCESS', message:'Loaded documents', data:@documents}, status: :ok
  end
  
  # GET /documents/1
  # GET /documents/1.json
  def show
	@document = Document.find(params[:id])
	render json: {status: 'SUCCESS', message:'Loaded document', data:@document}, status: :ok
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

      if @document.save
        render json: {status: 'SUCCESS', message:'Document created', data:@document}, status: :ok
      else
        render json: {status: 'ERROR', message:'Document not created', data:@document.errors}, status: :unprocessable_entity
      end

  end
  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
  	@document = Document.find(params[:id])
      if @document.update_attributes(document_params)
        render json: {status: 'SUCCESS', message:'Document updated', data:@document}, status: :ok
      else
		render json: {status: 'ERROR', message:'Document not updated', data:@document.errors}, status: :unprocessable_entity
      end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
  	@document = Document.find(params[:id])
    unless @document.blank?
    	if @document.destroy
    		render json: {status: 'SUCCESS', message:'Document deleted', data:@document}, status: :ok
    	else 
    		render json: {status: 'ERROR', message:'Document was not deleted', data:@document}, status: :unprocessable_entity
    	end
    else 
   		render json: {status: 'ERROR', message:'No such document', data:@document}, status: :unprocessable_entity
    end
  end

  private
    def document_params
      params.require(:document).permit(:name, :description, :content)
    end
end
