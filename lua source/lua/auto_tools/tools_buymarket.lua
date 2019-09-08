require("const_define")
require("util_gui")
require("util_functions")
require("share\\server_custom_define")
require("define\\sysinfo_define")
require("share\\chat_define")
require("auto_tools\\tool_libs")

local THIS_FORM = "auto_tools\\tools_buymarket"
local auto_is_running = false

function auto_run()
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        set_stop()
        return false
    end
    -- Số lần mua
    local buytotal = nx_number(form.buytotal.Text)
    -- Số lượt mua hiện tại
    local steptotal = 0
	while auto_is_running == true do
        local form = nx_value(THIS_FORM)
        if nx_is_valid(form) then
            steptotal = steptotal + 1
            -- Lượt mua còn lại
            local remainStep = buytotal - steptotal
        
            local formMarket = nx_value("form_stage_main\\form_market\\form_market_stall")
            if nx_is_valid(formMarket) then
                formMarket.sell_grid:SetSelectItemIndex(0)
                nx_execute("form_stage_main\\form_market\\form_market_stall", "on_sell_grid_rightclick_grid", formMarket.sell_grid, nx_int(0))
                local formBuy = nx_value("form_stage_main\\form_shop\\form_trade_buy")
                if nx_is_valid(formBuy) then
                    nx_execute("form_stage_main\\form_shop\\form_trade_buy", "on_btn_confirm_click", formBuy.btn_confirm)
                end
            else
                tools_show_notice(nx_function("ext_utf8_to_widestr", "Hãy chọn shops trước"), 3)
                set_stop()
                return false
            end
            
            -- Xuất lượt mua còn lại
            form.lbl_remain.Text = nx_widestr(remainStep)

            -- Kết thúc
            if remainStep <= 0 then
                set_stop()
                return false
            end
        end
        nx_pause(0.01)
	end
end

function set_stop()
    auto_is_running = false
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    local btn = form.btn_control
    btn.Text = nx_function("ext_utf8_to_widestr", "Mua")
end

function set_start()
    auto_is_running = true
    local form = nx_value(THIS_FORM)
    if not nx_is_valid(form) then
        return false
    end
    local btn = form.btn_control
    btn.Text = nx_function("ext_utf8_to_widestr", "Dừng")
end

function on_form_main_init(form)
	form.Fixed = false
	form.is_minimize = false
end

function on_main_form_open(form)
	change_form_size()
	form.is_minimize = false
	auto_is_running = false
end

function on_main_form_close(form)
	auto_is_running = false
	nx_destroy(form)
end

function on_btn_close_click(btn)
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	on_main_form_close(form)
end

function on_btn_control_click(btn)
	local form = btn.ParentForm
	if not nx_is_valid(form) then
		return
	end
	if auto_is_running then
		set_stop()
	else
		set_start()
		auto_run()
	end
end

function on_buytotal_changed()
    set_stop()
end

function change_form_size()
	local form = nx_value(THIS_FORM)
	if not nx_is_valid(form) then
		return
	end
	local gui = nx_value("gui")
	--form.Left = (gui.Width - form.Width) / 2
	--form.Top = (gui.Height - form.Height) / 2
	form.Left = 100
	form.Top = 140
end
