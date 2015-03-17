module AdminHelper
    def flash_class(type)
        case type
            when "notice" then "alert-info"
            when "success" then "alert-success"
            when "error" then "alert-error"
            when "alert" then "alert-alert"
        end
    end

    def status_applicant(status)
        @status_applicant = ""
        if @status.is_refused == true
            @status_applicant = '<span class="badge badge-alert">Dossier refusé</span>'.html_safe
        else
            if @status.is_finish == true
                if @status.is_complete == 0
                    @status_applicant = "Dossier finit par l'étudiant, en attente d'une validation par l'administrateur"
                elsif @status.is_complete == 1
                    @status_applicant = '<span class="badge badge-blue">Dossier complet, votes ouverts</span>'.html_safe
                    if @status.ok_for_interview == true
                        @status_applicant = "Dossier apte à passer l'entretien, en attente d'une date"
                        if @status.interview_date != nil
                            @status_applicant = "Entretien prévu le " + @status.interview_date.to_time.strftime("%d/%m/%Y à %Hh%M")
                            if @status.interview_result == 1
                                @status_applicant = "Entretien positif, en attente de la réponse de l'étudiant"
                                if @status.applicant_response == 1
                                    @status_applicant = '<span class="badge badge-success">Admis en licence</span>'.html_safe
                                elsif @status.applicant_response == 2
                                    @status_applicant = "L'étudiant ne viendra pas dans la licence"
                                end
                            elsif @status.interview_result == 2
                                @status_applicant = "L'entretien à été négatif"
                            elsif @status.interview_result == 3
                                @status_applicant = '<span class="badge badge-yellow">Etudiant absent à l\'entretien</span>'.html_safe
                            end
                        end
                    end
                end
            else
                @status_applicant = "Dossier non finit par l'étudiant"
            end
        end

        p @status_applicant
    end
end
