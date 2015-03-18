module PagesHelper
    def on_show_route_apply

        option = Option.find_by(key: "setting_route_apply")
        if option != nil
            case option.value
            when "true"
                @on_show_route_apply = true
            when "false"
                @on_show_route_apply = false
            else
                @on_show_route_apply = value
            end
        else
            @on_show_route_apply = false
        end
    end
end
