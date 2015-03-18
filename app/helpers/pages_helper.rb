module PagesHelper
    def on_show_route_apply

    option = Option.find_by(key: "setting_route_apply")
        case option.value
        when "true"
            @on_show_route_apply = true
        when "false"
            @on_show_route_apply = false
        else
            @on_show_route_apply = value
        end
    end
end
