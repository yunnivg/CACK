LuaQ  F   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_single_check.lua           "      A@  @ À    @   À  $     $@  @ $   $À  À $    $@ @ $  $À À $    $@ @ $  $À À         require    share\client_custom_define    ESINGLE_CUSTOM_TYPE_MOVE_END       ð?   ESINGLE_CUSTOM_TYPE_CONTINUE        @   ESINGLE_CUSTOM_CHECK_OK       @   open_this_form    on_size_change    form_layout_center    on_main_form_open    on_main_form_close    on_btn_1_click    on_btn_2_click    custom_single_set_form    single_delete_role    single_teach_form    single_player_giveup    single_old_check                       A@   E     \ Z@  EÀ    Á@ A  B \   E @  À   \@KÀA \@ 	@B  
   	   nx_value "   form_stage_main\form_single_check    nx_is_valid    nx_execute 	   util_gui    util_get_form    nx_set_value    Show    Visible        	   	   	   
   
   
   
   
                                                      form                              A@   E     \ Z    EÀ     \@      	   nx_value "   form_stage_main\form_single_check    nx_is_valid    form_layout_center                                                  form                           E   @  \   À   @       Á Æ A À @A	ÀÁ ÆÀA À @A	      	   nx_value    gui    nx_is_valid    Left    Width        @   Top    Height                                                                           form           gui               #   %        E      \@         form_layout_center        $   $   $   %         self                (   *        E      \@         nx_destroy        )   )   )   *         self                -   6        E   @  \   À       ÀÀ  EA  E  ÁÁ  @     Á   Å    Ü Ú   @ Ë@BÜ@   
   	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int    CLIENT_CUSTOMMSG_SINGLE_STEP    ESINGLE_CUSTOM_TYPE_MOVE_END       ð?"   form_stage_main\form_single_check    Close        .   .   .   /   /   /   /   /   0   0   0   0   0   0   0   0   0   2   2   2   3   3   3   3   3   4   4   6         self           game_visual          form               9   C        E   @  \   À       ÀÀ  EA  E  ÁÁ  @     Á   Å    Ü Ú   @ Ë@BÜ@   
   	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int    CLIENT_CUSTOMMSG_SINGLE_STEP    ESINGLE_CUSTOM_TYPE_MOVE_END         "   form_stage_main\form_single_check    Close        :   :   :   ;   ;   ;   ;   ;   <   <   <   <   <   <   <   <   <   >   >   >   ?   ?   ?   ?   ?   @   @   C         self           game_visual          form               F   O        E   @  \   À      @   À@     Æ Á É     	   nx_value $   form_stage_main\form_main\form_main    nx_is_valid       ð?   groupbox_4    Visible        G   G   G   H   H   H   H   H   I   J   J   K   M   M   O         value           form          bshow 	              R   c      &      A@   E     \ Z@      FÀ@ K Á Á@ \@@      @ Å    Ü Á A A À A  AÁ   ÁA  W@C  BA  B ^      	   nx_value 
   game_sock    nx_is_valid 	   Receiver    GetRoleDeleted            gui    nx_execute    client    delete_role    nx_wait_event     ×A   nx_null    succeed     &   S   S   S   T   T   T   T   T   U   X   X   X   X   Y   Y   Z   Z   ^   _   _   _   `   `   `   `   `   a   a   a   a   a   a   b   b   b   b   b   c         sock    %   	   IsDelete    %      role_index    %      gui    %      res     %           f   t     /   @  À     À  ÁÀ   AA  @   @  À     À  ÁÀ   AÁ  @  À@  À       ÁÀ   AA  @   À       ÀÂ @ I@C           ð?
   nx_number    nx_execute 	   util_gui    util_show_form ,   form_stage_main\form_help\form_help_zhaojia        @+   form_stage_main\form_help\form_help_pofang       @+   form_stage_main\form_help\form_help_QiZhen    nx_is_valid    Show    Visible     /   h   h   h   h   h   i   i   i   i   i   i   i   i   j   j   j   j   j   k   k   k   k   k   k   k   k   l   l   l   l   l   m   m   m   m   m   m   m   p   p   p   p   p   q   q   r   t         value     .      form     .           w               A@   E     \ Z@      KÀ@ \   À   @        Á@ @  @      	   nx_value    game_visual    nx_is_valid 
   GetPlayer 	   nx_pause       ð?   single_delete_role        x   x   x   y   y   y   y   y   z   }   }   ~   ~   ~   ~   ~                              game_visual          player                         	<      A@   E     \ Z@      E   À  \   À   @        Á@  AÁ  Â   Å    Ü Ú@  @ Â   Þ  Æ@Â ËÂAÁ Ü AÁ  À  AACA  AÁ  Á  W@D    KD ÅÁ  Ü B \A      	   nx_value    game_visual    nx_is_valid    gui    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    chat    TextManager    GetText    ui_muse_lzh_ts    show_common_text 
   ShowModal    nx_wait_event     ×A   confirm_return    ok    CustomSend    nx_int    CLIENT_CUSTOMMSG_SINGLE_STEP    ESINGLE_CUSTOM_CHECK_OK     <                                                                                                                                                                                              game_visual    ;      gui    ;      dialog    ;      text %   ;      res 2   ;       "                                                 %   #   *   (   6   -   C   9   O   F   c   R   t   f      w                      