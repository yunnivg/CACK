LuaQ  <   @H:\yuenanl_60512\01_Client\lua\form_common\form_common.lua              $      $@  @  $    $Ŕ  Ŕ  $    $@ @ $  $Ŕ Ŕ         util_open_common    on_main_form_init    on_main_form_open    on_main_form_close    on_btn_jump_click    on_btn_activate_click    on_cbtn_info_checked_changed    is_need_remind                
1   E   @    \    Ŕ   Ŕ @  @    Á  @  A  Ŕ AA  ĹA  Ü  B   @  Á  @  A   Á    I  AÂ EÁ \ 	AĂ 	ĂI ÄAÄ A I   @      	   nx_value    nx_current    is_need_remind    nx_is_valid    nx_execute 	   util_gui    util_get_form    nx_null 
   type_info    mltbox_info 	   HtmlText    nx_widestr 
   cbtn_info    Checked     event_name    common_wait_event 
   ShowModal     1                        	   	   
   
                                                                                                                        
   type_info     0      form    0      is_show    0      text    0           !   #                     #         self                 %   '                     '         self                 )   +        E      \@         nx_destroy        *   *   *   +         self                .   4     
   F @ @  Ĺ  Ü ÁŔ A @ @Á @         ParentForm    nx_gen_event    nx_null    event_name    jump    Close     
   /   1   1   1   1   1   1   3   3   4         self     	      form    	           7   9        E   @  Á  \@        nx_function    ext_open_url    http://anquan.woniu.com        8   8   8   8   9         self                <   J     	   E   @  \ Ŕ   Á  Ŕ I @Á  @  @ Á @ ŔA Ë Â FAB ĹÁ C  Ü Ü@  ËÁ Ü@ Ĺ@   Ü@      
   nx_create    IniDocument 	   FileName    nx_resource_path    ini\form\common_form_info.ini    LoadFromFile    SaveToFile    ParentForm    WriteString 
   type_info    show 
   nx_string    Checked    nx_destroy        =   =   =   >   >   >   >   >   @   @   @   @   A   A   D   F   F   F   F   F   F   F   F   G   G   I   I   I   J         cbtn           ini          form               M   d     5   E   @  \ Ŕ   Á  Ŕ I @Á  @    Ŕ  @      ŔÁ    A A Ĺ   Ü  AA   @Ĺ   Ü@ Â   Ţ  ËŔÁ @  Á Á Ü @ A  @Ĺ   Ü@ Â   Ţ       
   nx_create    IniDocument 	   FileName    nx_resource_path    ini\form\common_form_info.ini    LoadFromFile    nx_destroy    ReadString    show    false 
   nx_string    text    no     5   N   N   N   O   O   O   O   O   Q   Q   Q   Q   R   R   R   T   T   W   W   W   W   W   Y   Y   Y   Y   Y   Y   Y   Y   Z   Z   Z   [   [   [   ]   ]   ]   ]   ]   ^   ^   ^   _   _   _   b   b   b   c   c   d      
   type_info     4      ini    4      value    4      text )   /                #   !   '   %   +   )   4   .   9   7   J   <   d   M   d           