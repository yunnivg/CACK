LuaQ  ^   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_avatar_clone\form_invite_friend_help.lua           "      A@  @    A  @    AÀ  @    A  @    A@ @ $    $@  À $    $À  @ $   $@ À $   $À @ $           require    util_functions    share\client_custom_define    const_define 	   util_gui    control_set    console_log    main_form_init    on_main_form_open    on_main_form_close    on_btn_ok_click    on_btn_cancel_click    on_btn_close_click    show_invite_friend_info    form_count_tick 	                  E   @  \   À       ÀÀ    @     	   nx_value    console    nx_is_valid    Log                                                  info           console                          	@@A  ^          Fixed        ð?                         form                   4     (   E   @   Á  \Z    EÀ  @   Á  \@E  @   Á     \@ E@  \ À À   @      @Â BÆB À ÀB	 @Â @CÆ@C À ÀB	         nx_running    nx_current    form_count_tick    nx_kill    nx_execute 	   nx_value    gui    nx_is_valid    AbsLeft    Desktop    Width        @   AbsTop    Height     (   $   $   $   $   $   $   $   %   %   %   %   %   (   (   (   (   (   (   +   +   +   -   -   -   -   -   .   1   1   1   1   1   1   2   2   2   2   2   2   4         form     '      gui    '           7   =        E   @   Á  \Z    EÀ  @   Á  \@E     \@         nx_running    nx_current    form_count_tick    nx_kill    nx_destroy        8   8   8   8   8   8   8   9   9   9   9   9   <   <   <   =         form                @   D     	   F @ @  À    AÁ  @  Á @         Parent    nx_gen_event    invite_friend_request    ok    Close     	   A   B   B   B   B   B   C   C   D         btn           form               G   K     	   F @ @  À    AÁ  @  Á @         Parent    nx_gen_event    invite_friend_request    cancel    Close     	   H   I   I   I   I   I   J   J   K         btn           form               N   R     	   F @ @  À    AÁ  @  Á @         Parent    nx_gen_event    invite_friend_request    cancel    Close     	   O   P   P   P   P   P   Q   Q   R         btn           form               U        L   A   @  Á   ÅÀ    Ü Ú@      Å@   Ü Á  @ A      A A   Â     @  BE  \ 	AÁBA @CCÁCÄAD E   \   ÁÁ A  AA  Á  EA  Á \ Á  À A       F@AÆ EÂ  A   G AÆ EB  A             >@	   nx_value :   form_stage_main\form_avatar_clone\form_invite_friend_help    nx_is_valid    gui    util_get_form    count_tick    invitor_name 	   lbl_time    Text    nx_widestr    Show    Visible    mltbox_help_info    AddHtmlText    TextManager    GetFormatText    ui_xmqy_invite_07       ð¿   nx_wait_event     ×A   invite_friend_request    game_visual    ok    CustomSend    nx_int *   CLIENT_CUSTOMMSG_ACCEPT_HELPER_INVITATION    cancel *   CLIENT_CUSTOMMSG_REFUSE_HELPER_INVITATION     L   V   X   X   X   Z   Z   Z   Z   Z   [   ^   ^   ^   `   `   `   `   `   a   d   d   d   d   d   d   f   h   m   m   m   m   m   o   o   q   u   u   u   u   u   u   u   u   u   u   u   w   w   w   w   w   y   y   y   z   z   z   z   z   {   ~   ~                                                   invitor_name     K      time_count    K      form    K      gui    K      res 3   K      game_visual 6   K                    1   E      \ Z   
E@    \@ E      \ Z@      EÀ     Á  \Z@      E@  A \ MÀ @ À   Å@  Ü À ÀÀ À    AA @ B @   	@ ÀB Å@   Ü À Àó        nx_is_valid 	   nx_pause       ð?   nx_find_custom    count_tick 
   nx_number            nx_gen_event    invite_friend_request    cancel    Close 	   lbl_time    Text    nx_widestr     1                                                                                                                                                             form     0      time    /       "   	   	   	   
   
   
                                          4      =   7   D   @   K   G   R   N      U                      