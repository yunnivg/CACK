LuaQ  O   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_task\form_juqingjieju.lua           0      A@  @    A  @    Aΐ  @    A  @    A@ @    A @    Aΐ @ @   $    $@  ΐ $    $ΐ  @ $   $@ ΐ $   $ΐ @ $   $@ ΐ $   $ΐ @         require 	   util_gui    custom_sender    util_functions 
   menu_game    define\object_type_define    share\view_define &   form_stage_main\form_task\task_define    SHARE_JH_EXPLORE_AWARD *   share\Rule\JHExplore\jh_explore_award.ini    main_form_init    on_main_form_open    on_main_form_close    on_btn_3_click    on_server_msg    show_juqingjieju_form    hide_ani_ctrl    refresh_back_img    on_btn_show_jq_detail_click    on_ani_2_animation_end    on_ani_2_animation_start    on_ani_2_animation_loop                   	@@A  ^          Fixed        π?                         self                   "        E   @  \ ΐΐ Ζΐ@ ΐ  A	 Α ΖA ΐ  A	ΐA @B  
   	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height    ani_2    Visible                                                !   !   "         form           gui               %   '        E      \@         nx_destroy        &   &   &   '         form                *   0        F @ @  ΐ   @  @     ΐΐ @         ParentForm    nx_is_valid            Close        +   ,   ,   ,   ,   ,   -   -   /   /   0         btn     
      form    
           3   Y    ;      ΐ    Ε@  Wΐ @     ΐ  Α  @ @ Α   Ε   ά Ϊ@  @ Α  ή  Εΐ Ζ Β  ά @Β@ Α  ή  Ε   Β ά ΑBEA Γ \ 	AΑCEA AΒ \ 	A @   ΖΒ  Ε  BΔ ά   FΓ  E  BΒ \ A       
   nx_number #   SERVER_SUB_CUSTOMMSG_JH_AWARD_OPEN            util_auto_show_hide_form +   form_stage_main\form_task\form_juqingjieju    util_get_form    nx_is_valid    table    getn       @      π?   lbl_5    Text    nx_widestr       @   lbl_8    refresh_back_img        @    ;   5   5   5   5   5   5   6   6   :   :   :   <   <   <   <   =   =   =   =   =   >   >   A   A   A   A   A   A   B   B   E   E   E   F   F   F   F   F   G   G   G   G   G   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   Y         type     :      arg     :      form    :   	   end_type !   :           \   k        E   @  \   ΐ   @  @ ΐ       Ε    ά Ϊ@  @ Αΐ  ή  @AΛΑ EΑ \  ΐ  ά@  	   	   nx_value    timer_game    nx_is_valid            Visible     UnRegister    nx_current    show_juqingjieju_form        ]   ]   ]   ^   ^   ^   ^   ^   _   _   b   c   c   c   c   c   d   d   g   i   i   i   i   i   i   k         self           timer          form               n   |        E   @  \   ΐ   @  @ ΐ       Ε    ά Ϊ@  @ Αΐ  ή  Ζ AΙΑΛΐΑ E \ A ΐ  ά@  
   	   nx_value    timer_game    nx_is_valid            ani_2    Visible     UnRegister    nx_current    hide_ani_ctrl        o   o   o   p   p   p   p   p   q   q   t   u   u   u   u   u   v   v   y   y   {   {   {   {   {   {   |         self           timer          form                  ―     w   E  A  Α  Β  \  ΐ A      A Α  Ε   ά ΪA      ΐΑ  ΖB ΙΒ@ ΖB ΙΑΒΖB ΙACΖB ΛΓάA ΖB ΛΑΓάA ΛΔAB άΔΑΒ  E FBΕ \ Β ΐΓ   ΕΓ Dά  Ε ΖCΕ  ά ΐΕ ΔFά ΐ@Ε Gά ΐ  Ε DGά ΐΐ	Ε Gά ΐΕ ΔGά  @Ε Hά ΐ ΖCH Δ FΔH ΙΖI Δ FDI ΙΖIΛΓΙEΔ DF\ ά  J DJD J JΑΔ
 D   Βξ  ,      nx_execute    util_functions    get_ini    SHARE_JH_EXPLORE_AWARD    nx_is_valid 	   nx_value    gui       π?   ani_2    AnimationImage    yqd9    yqd12    Visible    Stop    Play    FindSectionIndex 
   calculate    GetItemValueList    r    table    getn    util_split_string 
   nx_string    ,       &@
   nx_number        @      @      @      @      @      @   lbl_3 
   BackImage       "@   lbl_1       $@   TextManager    GetText 	   mltbox_3    Clear    AddHtmlText       πΏ    w                                                                                                                                                                                                                                     ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ’   ’   ’   ’   ’   ’   ’   ’   ’   ’   €   €   €   €   €   ₯   ₯   ₯   ₯   ₯   ¦   ¦   ¦   ¦   ¦   ¦   §   §   §   ¨   ¨   ¨   ¨   ¨   ©      ―         form     v   	   end_type     v   
   pass_type     v      renown     v   
   favorable     v      ini    v      gui    v   
   sec_index &   v      r_tab *   v      r_count .   v      (for index) 1   v      (for limit) 1   v      (for step) 1   v      i 2   u      r_info 8   u   
   html_text l   u           ²   Α        F @ @  ΐ   @  @     ΐ  Α   Ε@    ά Ϊ@  @ Α  ή  Λ@AE Α \  Ε  ά@  Λ@Β ά@   
      ParentForm    nx_is_valid         	   nx_value    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_JIANGHU_MEET    CUSTOMMSG_JIANGHU_MEET_AWARD    Close        ΄   ΅   ΅   ΅   ΅   ΅   Ά   Ά   Ή   Ή   Ή   Ί   Ί   Ί   Ί   Ί   »   »   Ύ   Ύ   Ύ   Ύ   Ύ   Ύ   Ύ   Ύ   ΐ   ΐ   Α         btn           form          game_visual               Δ   Ζ        	@@        Visible         Ε   Ζ         ani           name                Ι   Λ                     Λ         ani            name                 Ξ   Π        	@@        Visible         Ο   Π         ani           name            0                     	   	   	   
   
   
                                          "      '   %   0   *   Y   3   k   \   |   n   ―      Α   ²   Ζ   Δ   Λ   Ι   Π   Ξ   Π           