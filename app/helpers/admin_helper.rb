module AdminHelper
    def flash_class(type)
        case type
            when "notice" then "alert-info"
            when "success" then "alert-success"
            when "error" then "alert-error"
            when "alert" then "alert-alert"
        end
    end
end
