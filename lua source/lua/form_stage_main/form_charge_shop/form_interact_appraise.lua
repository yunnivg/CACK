LuaQ  \   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_charge_shop\form_interact_appraise.lua                  A@  @    A  @    AĀ  @ $     $@  @ $   $Ā  Ā $    $@ @ $  $Ā Ā $    $@ @ $          require    util_functions    custom_sender    share\client_custom_define    on_main_form_init    on_main_form_open    on_main_form_close    on_btn_give_flower_click    on_btn_give_egg_click    on_btn_close_click    show_interact_appraise    on_btn_give_flower_get_capture     on_btn_give_flower_lost_capture    on_btn_give_egg_get_capture    on_btn_give_egg_lost_capture           
        A   ^             ð?       	   	   
         self                           E   @  \ 	Ā@@Á Æ@A Ā A	  Â Æ B Ā A	@     
   	   nx_value    gui    Fixed     Left    Width        @   Top    Height       ð?                                                                form           gui                          E   @  Á  \@EĀ     \@         nx_execute 
   tips_game 	   hide_tip    nx_destroy                                      form                    $        F @ @  Á  Á  A AÁ A@ĀÁ @         ParentForm    nx_execute 4   form_stage_main\form_charge_shop\form_interact_item    show_interact_item       ð?	   ipt_name    Text    Close        !   "   "   "   "   "   "   "   #   #   $         btn     
      form    
           '   +        F @ @  Á  Á  A AÁ A@ĀÁ @         ParentForm    nx_execute 4   form_stage_main\form_charge_shop\form_interact_item    show_interact_item        @	   ipt_name    Text    Close        (   )   )   )   )   )   )   )   *   *   +         btn     
      form    
           -   0        F @ @Ā @         ParentForm    Close        .   /   /   0         btn           form               2   :        E   @  Á  Á  B   \   Ā      @Á @ Á Å     Ü Ā  	      nx_execute 	   util_gui    util_get_form 8   form_stage_main\form_charge_shop\form_interact_appraise    nx_is_valid    Show 	   ipt_name    Text    nx_widestr        4   4   4   4   4   4   4   6   6   6   6   6   7   7   8   8   8   8   8   :         name           form               <   D     
   F @ @@ L @ ÆĀ@ Ā Å  A A  Ü  Á A A Ā  @ A   
      AbsLeft    Width    AbsTop    Height    nx_widestr 
   util_text    ui_give_flower_info    nx_execute 
   tips_game    show_text_tip        >   >   >   ?   ?   ?   A   A   A   A   A   C   C   C   C   C   C   C   D         btn           x          y       	   tip_text               F   H        E   @  Á  \@        nx_execute 
   tips_game 	   hide_tip        G   G   G   G   H         btn                J   S     
   F @ @@ L @ ÆĀ@ Ā Å  A A  Ü  Á A A Ā  @ A   
      AbsLeft    Width    AbsTop    Height    nx_widestr 
   util_text    ui_give_egg_info    nx_execute 
   tips_game    show_text_tip        L   L   L   M   M   M   O   O   O   O   O   R   R   R   R   R   R   R   S         btn           x          y       	   tip_text               U   W        E   @  Á  \@        nx_execute 
   tips_game 	   hide_tip        V   V   V   V   W         btn                                           
                  $       +   '   0   -   :   2   D   <   H   F   S   J   W   U   W           