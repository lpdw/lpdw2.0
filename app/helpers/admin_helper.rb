module AdminHelper
    def flash_class(type)
        case type
            when "notice" then "alert-info"
            when "success" then "alert-success"
            when "error" then "alert-error"
            when "alert" then "alert-alert"
        end
    end

    def on_name_option_for_key(key)
        @on_name_setting_for_key = ""

        case key
        when "setting_route_apply"
            @on_name_setting_for_key = "Candidatures ouvertes"
        end

    end

    def on_option_value(value)
        @on_option_value
        case value
        when "true"
            @on_name_setting_for_key = true
        when "false"
            @on_name_setting_for_key = false
        else
            @on_name_setting_for_key = value
        end
    end

    def status_applicant(status)
        @status_applicant = ""
        if @status.is_refused == true
            @status_applicant = '<span class="badge badge-alert">Dossier refusé</span>'.html_safe
        elsif @status.applicant_response == 1
            @status_applicant = '<span class="badge badge-success">Admis en licence</span>'.html_safe
        elsif @status.interview_result == 1
            @status_applicant = '<span class="badge badge-danger">Entretien positif</span>'.html_safe
        elsif @status.interview_result == 2
            @status_applicant = '<span class="badge badge-red"Entretien Négatif</span>'.html_safe
        elsif @status.interview_result == 3
            @status_applicant = '<span class="badge badge-yellow">Etudiant absent à l\'entretien</span>'.html_safe
        else
            if @status.is_finish == true
                if @status.is_complete == 0
                    @status_applicant = "Dossier finit par l'étudiant, en attente d'une validation par l'administrateur"
                elsif @status.is_complete == 1
                    @status_applicant = '<span class="badge badge-blue">Dossier complet, votes ouverts</span>'.html_safe
                    if @status.ok_for_interview == true
                        @status_applicant = "Dossier apte à passer l'entretien, en attente d'une date"
                        if @status.interview_date != nil
                            @status_applicant = '<span class="badge badge-default">Entretien prévu le ' + @status.interview_date.to_time.strftime("%d/%m/%Y à %Hh%M") + '</span>'.html_safe
                        end
                    end
                end
            else
                @status_applicant = "Dossier non finit par l'étudiant"
            end
        end

        p @status_applicant.html_safe
    end
end
