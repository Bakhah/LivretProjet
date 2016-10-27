class MonthlySelfExaminationsController < ApplicationController
    before_action :set_monthly_self_examination, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    # GET /monthly_self_examinations
    # GET /monthly_self_examinations.json
    def index
      @users = User.all
      if current_user.has_role? :student
        @monthly_self_examinations = MonthlySelfExamination.where(user_id: current_user.id)
      elsif current_user.has_role? :teacher
        @monthly_self_examinations = MonthlySelfExamination.where(user_id: User.where(teacher_id: current_user.id))
      elsif current_user.has_role? :tutor
        @monthly_self_examinations = MonthlySelfExamination.where(user_id: User.where(tutor_id: current_user.id))
      else
        @monthly_self_examinations = MonthlySelfExamination.all
      end
    end

    # GET /monthly_self_examinations/1
    # GET /monthly_self_examinations/1.json
    def show
    end

    def student_index
      @student = User.find(params[:id])
      @student_examinations = MonthlySelfExamination.where(user_id: @student.id)
    end

    # GET /monthly_self_examinations/new
    def new
        @monthly_self_examination = MonthlySelfExamination.new
    end

    # GET /monthly_self_examinations/1/edit
    def edit
    end

    # POST /monthly_self_examinations
    # POST /monthly_self_examinations.json
    def create
        if user_signed_in?
            @monthly_self_examination = MonthlySelfExamination.new(monthly_self_examination_params)
            @monthly_self_examination.user = current_user
        end

        respond_to do |format|
            if @monthly_self_examination.save
                format.html { redirect_to @monthly_self_examination, notice: 'Votre auto-évaluation a bien été créée.' }
                format.json { render :show, status: :created, location: @monthly_self_examination }
            else
                format.html { render :new }
                format.json { render json: @monthly_self_examination.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /monthly_self_examinations/1
    # PATCH/PUT /monthly_self_examinations/1.json
    def update
        respond_to do |format|
            if @monthly_self_examination.update(monthly_self_examination_params)
                format.html { redirect_to @monthly_self_examination, notice: 'Votre auto-évaluation a bien été mise à jour.' }
                format.json { render :show, status: :ok, location: @monthly_self_examination }
            else
                format.html { render :edit }
                format.json { render json: @monthly_self_examination.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /monthly_self_examinations/1
    # DELETE /monthly_self_examinations/1.json
    def destroy
        @monthly_self_examination.destroy
        respond_to do |format|
            format.html { redirect_to monthly_self_examinations_url, notice: 'Votre auto-évaluation a bien été supprimée.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_self_examination
        @monthly_self_examination = MonthlySelfExamination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_self_examination_params
        params.require(:monthly_self_examination).permit(:periode, :what_ive_done, :what_ive_learnt, :what_ive_felt)
    end
end
