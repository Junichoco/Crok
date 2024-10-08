class MedicalRecordsController < ApplicationController

  def index
    @dog = Dog.find(params[:dog_id])
    @medical_records = MedicalRecord.where(dog: @dog).order(date: :desc)
  end

  def new
    @medical_record = MedicalRecord.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @medical_record = MedicalRecord.new(record_params)
    @dog = Dog.find(params[:dog_id])
    @medical_record.dog = @dog
    if @medical_record.save
      redirect_to dog_medical_records_path(params[:dog_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dog = Dog.find(params[:dog_id])
    @medical_record = @dog.medical_records.find(params[:id])
  end

  def edit
    @medical_record = MedicalRecord.find(params[:id])
    @dog = @medical_record.dog
    # raise
  end

  def update
    # raise
    @medical_record = MedicalRecord.find(params[:id])
    if @medical_record.update(record_params)
      redirect_to dog_medical_records_path(@medical_record.dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @medical_record = MedicalRecord.find(params[:id])
    @medical_record.destroy!
    redirect_to dog_medical_records_path(@medical_record.dog)
  end

  private

  def record_params
    params.require(:medical_record).permit(:date, :description, :vet_contact, photos: [])
  end
end
