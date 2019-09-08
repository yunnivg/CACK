require("util_gui")

function auto_init()
    local dialog = nx_execute("util_gui", "util_get_form", "form_common\\form_confirm", true, false)
    if nx_is_valid(dialog) then
        dialog.mltbox_info.HtmlText = nx_function("ext_utf8_to_widestr", "Sau khi ẩn nút này bạn có thể sẽ phải mở lại Client mới có thể hiện lại")
        dialog:ShowModal()
        local res = nx_wait_event(100000000, dialog, "confirm_return")
        if res ~= "ok" then
            return
        else
            local form = nx_value("form_stage_main\\form_main\\form_main")
            if nx_is_valid(form) then
                form.groupbox_tools.Visible = false
            end
        end
    end
end
