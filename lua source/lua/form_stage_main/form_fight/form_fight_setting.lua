LuaQ  R   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_fight\form_fight_setting.lua           -      A@  @    A  @    AÀ  @    A  @    A@ @  AÀ  Á  A A ¢@ä   ÇÀ ä@  Ç  ä  Ç@ äÀ  Ç ä  ÇÀ ä@ Ç  ä    Ç@ äÀ     Ç ä  ÇÀ ä@ Ç          require    utils 	   util_gui    const_define    custom_sender    util_functions       @.   form_stage_main\form_fight\form_fight_setting    combobox_player_1    combobox_player_2    combobox_referee    main_form_init    on_main_form_open    on_main_form_close    on_main_form_shut    on_btn_ok_click    on_btn_close_click    open_form_by_param    init_form_data    get_arena_param    update_time 
                  	@@	À@	@AA ^          Fixed     target_scene_id         
   life_time      f@      ð?                               form                   ,     #   E   @  \ ÀÀ ÆÀ@ À  A	 Á ÆA À  A	À À   @    Å   Å@   Ü Ú   @ËBAÁ  ÅA Ü  @   Á Ü@     	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height    init_form_data    GAME_TIMER    nx_is_valid 	   Register      @@      ð¿   nx_current    update_time     #            !   !   !   !   !   "   "   "   "   "   %   %   %   (   (   (   )   )   )   )   )   *   *   *   *   *   *   *   *   *   *   ,         form     "      gui    "      timer    "           /   6        E   @  \   À      @ÀÀ   AA   @ À   @      	   nx_value    GAME_TIMER    nx_is_valid    UnRegister    nx_current    update_time    nx_destroy        0   0   0   1   1   1   1   1   2   2   2   2   2   2   5   5   5   6         form           timer               9   :                     :         form                 =   V     <   F @ @  À   @        À  ÀÂ  @ EÂ   \ W@ÀÂ  @ EÂ  \ W@ÀÂ  @  EÂ  \ @ AB  EB   \ Z  @KAÅÂ  Ü C \B    @ À  @ BÂÂ B         ParentForm    nx_is_valid    get_arena_param 
   nx_string 	   nx_value    SystemCenterInfo    ShowSystemCenterInfo 
   util_text    88009        @   custom_arena_init    Close     <   >   ?   ?   ?   ?   ?   @   D   D   D   G   G   G   G   G   G   G   G   H   H   H   H   H   H   H   H   I   I   I   I   I   I   I   I   J   J   J   K   K   K   K   K   L   L   L   L   L   L   O   S   S   S   S   S   S   S   S   U   U   V   	      btn     ;      form    ;      mode 
   ;      total 
   ;      win 
   ;      p1 
   ;      p2 
   ;      referee 
   ;      SystemCenterInfo %   1           Y   ^     	   F @ @  À      @ À @         ParentForm    nx_is_valid    Close     	   Z   [   [   [   [   [   \   \   ^         btn           form               c   o        E   @  Á    B \À  À   @       Á Å Á A A À   U Ü  ÀÂ Á  A @   AA Õ@À        nx_execute 	   util_gui    util_show_form    nx_is_valid    lbl_scene_name    Text    nx_widestr 
   util_text    arena_scene_name_ 
   nx_string    lbl_scene_image 
   BackImage    gui\special\leitai\fight_    .png         e   e   e   e   e   e   f   f   f   f   f   g   k   k   k   k   k   k   k   k   k   k   k   n   n   n   n   n   n   n   n   o         selected_scene_id           form_fight_setting             FORM_FIGHT_SETTING     r       [   E   @  \ À  ËÀ@Ü  T  ÂKBAÁ \Z   KÂAÁ \ÂA ÅB   Ü C A   ÆÂB ÆÃËBÃ@ÜBÆC ÆÃËBÃ@ÜBÆÂC ÆÃËBÃ@ÜBÁö  A  FAD ÁDEB IA   Á `FE FÃKBÃÅÂ   Ü \B  _ÁýFE Á Á  IE  A  \ AÆ Å   Ü Ú  ÆÁC Â KÂAÁ \  É     	   nx_value    game_client 	   GetScene    GetSceneObjList       ð?	   FindProp    Name 
   QueryProp    Type    nx_int        @   combobox_player_1    DropListBox 
   AddString    combobox_player_2    combobox_referee    gui    lbl_scene_name    Text    TextManager    GetText    area_scene02_TYXJ_taiyitai    combobox_mode    nx_widestr    2 
   GetPlayer    nx_is_valid     [   s   s   s   u   u   x   x   {   {   {   {   |   ~   ~   ~   ~   ~                                                                                          {                                                                                                                                             form     Z      game_client    Z      game_scene    Z      table_client_obj    Z      (for index) 
   /      (for limit) 
   /      (for step) 
   /      i    .      client_obj    .      name    .   	   obj_type    .      gui 2   Z      (for index) ;   D      (for limit) ;   D      (for step) ;   D      i <   C      game_client L   Z      client_player N   Z         ARENA_MODE_MAX_COUNT         ©        F @ F@À @ @@ÆÀ@ Æ@À FAA FAÀ NAMÁÁÁ À  @  À        combobox_player_1    Text    combobox_player_2    combobox_referee    nx_int    combobox_mode        @      ð?       ¡   ¡   ¢   ¢   £   £   ¥   ¥   ¥   ¥   ¦   ¦   ¨   ¨   ¨   ¨   ¨   ¨   ¨   ©         form        	   player_1       	   player_2          referee       
   win_count 
         total_count               ¬   ¸     	#   E      \ Z@      E@  @ \ @  ÁÀ     K A \@  F@ M@Á 	@ E À \  B Å ÁÂ CA ÅA  @ Ü   Ü  À        nx_is_valid    nx_int 
   life_time            Close       ð?	   nx_value    gui    lbl_life_time    Text    nx_widestr    TextManager    GetFormatText    ui_arena_life_time     #   ­   ­   ­   ­   ­   ®   ±   ±   ±   ±   ±   ±   ±   ±   ²   ²   ²   ´   ´   ´   µ   µ   µ   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¸         form     "      gui    "       -                                                                           ,      6   /   :   9   V   =   ^   Y   o   o   c         r   ©       ¸   ¬   ¸         ARENA_MODE_MAX_COUNT    ,      FORM_FIGHT_SETTING    ,      combobox_list    ,       