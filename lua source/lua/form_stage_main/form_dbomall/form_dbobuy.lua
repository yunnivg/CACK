LuaQ  M   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_dbomall\form_dbobuy.lua                 A@  @   d   Gΐ  d@  G  d  G@ dΐ  G d  Gΐ d@ G  d G@ dΐ G d      Gΐ         require    utils )   form_stage_main\form_dbomall\form_dbobuy    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_cancel_click    on_btn_ok_click    on_grid_main_mousein_grid    on_grid_main_mouseout_grid    change_form_size 	                  	@@        Fixed                     form                           E   \@         change_form_size                       form                   "        E      Α@  \Z   ΐE  @@ \   Αΐ    ΐE     Α@ Α  E Α \ \@  E     \@   	      nx_find_custom    close_type 
   nx_string    cancel    nx_gen_event    dbobuy_confirm_return    nx_widestr        nx_destroy                                                                          !   !   !   "         form                %   +     
   F @ @  ΐ       Iΐ@ Α @         ParentForm    nx_is_valid    close_type    cancel    Close     
   &   '   '   '   '   '   (   )   )   +         btn     	      form    	           .   0        E      \@         on_btn_close_click        /   /   /   0         btn                3   :        F @ @  ΐ      Iΐ@  ΐ  A AΑ   ΑΑ  @   Β @   	      ParentForm    nx_is_valid    close_type    ok    nx_gen_event    dbobuy_confirm_return    nx_widestr        Close        4   5   5   5   5   5   6   7   7   7   7   7   7   7   7   8   8   :         btn           form               =   W     >   F @ @  ΐ     @      @ Εΐ    ά Α  A       Ε@  ά ΑΑΑ A Α  ΕA   ά ΪA      Ε Β A άΙΒCΒ  Ε  Α  ΙΒCΒ  Ε  ΑB  Ι AΒ  ΐ  @Γ ΑΓ   B        ParentForm    nx_find_custom 
   config_id 
   nx_string     	   nx_value    gui    GetCursorPosition 
   ItemQuery    nx_is_valid    nx_execute 
   tips_game    get_tips_ArrayList 	   ConfigID 	   ItemType    GetItemPropByConfigID 	   configid    BindStatus    show_goods_tip             >   >   @   @   @   @   @   @   A   D   E   E   E   E   E   E   E   E   F   J   J   J   K   K   M   M   M   N   N   N   N   N   O   R   R   R   R   S   T   T   T   T   T   T   T   U   U   U   U   U   U   U   V   V   V   V   V   V   V   V   V   V   W         grid     =      form    =   
   config_id 	   =      gui    =      x    =      y    =   
   ItemQuery    =      item $   =           Z   \        E   @  Α  Α@ \@         nx_execute 
   tips_game 	   hide_tip    ParentForm        [   [   [   [   [   \         grid                a   j           D    E@     \ Z@      E     \  Α Ζ A ΐ @A	ΐΑ ΖΐA ΐ @A	      	   nx_value    nx_is_valid    gui    Left    Width        @   Top    Height        b   b   b   c   c   c   c   c   d   g   g   g   h   h   h   h   h   i   i   i   i   i   j         form          gui             FORM_DBOBUY    	   	   	                  "      +   %   0   .   :   3   W   =   \   Z   j   j   a   j         FORM_DBOBUY           