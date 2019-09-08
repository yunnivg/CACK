function auto_init()
	local form_shop = nx_value("form_stage_main\\form_shop\\form_shop")
    if nx_is_valid(form_shop) then
		nx_execute("custom_sender", "custom_open_mount_shop", 0)
    else
		nx_execute("custom_sender", "custom_open_mount_shop", 1)
    end
end
