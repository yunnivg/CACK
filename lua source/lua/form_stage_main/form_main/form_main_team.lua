LuaQ  M   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_main\form_main_team.lua                  A@  @    A  @    AÀ  @    A  @    A@ @  AÀ   @BÀB@CÀC@DÀD@EÀE@FÀF@GÀG@HÀH@IÀI@JÀJ@KÀK@LÀL@MÁ Á A A Á Â A B Á Ã AC G AÃ G d  G dC  GC d     G dÃ     GÃ d G dC GC d G dÃ GÃ d G dC GC d G dÃ GÃ d G dC       GC d    G dÃ GÃ d    G dC                        GC d    G dÃ GÃ d G dC GC d G dÃ GÃ d G dC GC d G dÃ GÃ d    G dC GC d G dÃ GÃ d G dC    GC d G dÃ        GÃ d	   G dC	 GC d	     G dÃ	        GÃ   l      require    util_functions    define\team_sign_define    util_static_data    define\team_rec_define .   form_stage_main\form_team\team_util_functions )   form_stage_main\form_main\form_main_team 	   team_rec    school_shaolin ,   gui\language\ChineseS\team\team_word_sl.png    school_wudang ,   gui\language\ChineseS\team\team_word_wd.png    school_gaibang ,   gui\language\ChineseS\team\team_word_gb.png    school_tangmen ,   gui\language\ChineseS\team\team_word_tm.png    school_emei ,   gui\language\ChineseS\team\team_word_em.png    school_jinyiwei -   gui\language\ChineseS\team\team_word_jyw.png    school_jilegu -   gui\language\ChineseS\team\team_word_jlg.png    school_junzitang -   gui\language\ChineseS\team\team_word_jzt.png    force_yihua .   gui\language\ChineseS\team\team_world_yhg.png    force_taohua .   gui\language\ChineseS\team\team_world_thd.png    force_xujia .   gui\language\ChineseS\team\team_world_xjz.png    force_wanshou /   gui\language\ChineseS\team\team_world_wssz.png    force_jinzhen .   gui\language\ChineseS\team\team_word_jzsj.png    force_wugen .   gui\language\ChineseS\team\team_world_wgm.png    newschool_gumu -   gui\language\ChineseS\team\team_world_gm.png    newschool_xuedao .   gui\language\ChineseS\team\team_world_xdm.png    newschool_huashan -   gui\language\ChineseS\team\team_world_hs.png    newschool_damo -   gui\language\ChineseS\team\team_world_dm.png    newschool_shenshui -   gui\language\ChineseS\team\team_world_ss.png    newschool_changfeng -   gui\language\ChineseS\team\team_world_cf.png    newschool_nianluo -   gui\language\ChineseS\team\team_world_nl.png    newschool_wuxian -   gui\language\ChineseS\team\team_world_wx.png    ui_None ,   gui\language\ChineseS\team\team_word_wu.png    gui\mainform\pbr_team_hp.png #   gui\mainform\pbr_team_offline1.png    gui\mainform\pbr_team_far1.png    gui\mainform\pbr_team_mp.png #   gui\mainform\pbr_team_offline2.png    gui\mainform\pbr_team_far2.png    gui\mainform\bg_talk.png    255,128,128,128    255,255,255,255       @   HEAD_MAX_WIDTH       d@   HEAD_MAX_HEIGHT       Y@   console_log    form_main_team_init    main_form_open    main_form_close    init_form_main_team_logic    destroy_form_main_team_logic    on_team_captain_changed    on_TeamType_Change    on_team_rec_update    on_team_sub_rec_update    on_del_or_add_teamMember    del_or_add_teamMember    refresh_base_info    on_refresh_base_info    refresh_line_info    refresh_other_info    on_refresh_other_info    refresh_PlayerPhoto_State    get_role_TeamPos    can_refresh_team_panel    show_team_line    on_show_team_menu    on_mouse_right_click    on_group_right_click    set_buff_icon !   on_imagegrid_buffer_mousein_grid "   on_imagegrid_buffer_mouseout_grid    show_nuqi_value    show_member_tips    on_lbl_photo_get_capture    on_lbl_photo_lost_capture    on_lbl_photo_click    select_teamlist_headphoto    get_school_image    is_team_captain_by_name    show_chat_info    set_chat_text    timer_callback    update_team_panel    hide_team_panel (       I   O        E   @  \   À       ÀÀ    @     	   nx_value    console    nx_is_valid    Log        J   J   J   L   L   L   L   L   M   M   M   O         info           console               R   [        	@@	@@E  	@	Á        Fixed    no_need_motion_alpha 
   team_type    TYPE_NORAML_TEAM    selfPosInTeam                S   T   W   W   Z   [         form                ]   p    	3   E   \@ 	ÀEÀ    \ @ À      Á   @  Á  Á @ @Â  AÁ   ÅÁ Ü  @@Â A A   ÅÁ Ü Â @À  Á   Å@   Ü Ú   @Ë@DEÁ \  À  Ü@ÁÀ Þ          init_form_main_team_logic    Visible  	   nx_value    data_binder    nx_is_valid    AddTableBind    nx_current    on_team_rec_update    AddRolePropertyBind    TeamCaptain    widestr    on_team_captain_changed 	   TeamType    int    on_TeamType_Change    team_manager 
   AddBinder    on_team_sub_rec_update       ð?    3   ^   ^   a   c   c   c   d   d   d   d   d   e   e   e   e   e   e   e   f   f   f   f   f   f   f   f   g   g   g   g   g   g   g   g   j   j   j   k   k   k   k   k   l   l   l   l   l   l   o   o   p         form     2      databinder    2      team_manager %   2      	   TEAM_REC     r       %   E   @  \   À      ÀÀÀ   @  @  Á A @  @  Á  @  @    ÁÀ  Å    Ü Ú   @Ë BEA \  À  Ü@ÅÀ Ü@      	   nx_value    data_binder    nx_is_valid    DelTableBind    DelRolePropertyBind    TeamCaptain 	   TeamType    team_manager 
   DelBinder    nx_current    on_team_sub_rec_update    destroy_form_main_team_logic     %   s   s   s   t   t   t   t   t   u   u   u   u   v   v   v   v   w   w   w   w   z   z   z   {   {   {   {   {   |   |   |   |   |   |                  form     $      databinder    $      team_manager    $      	   TEAM_REC                    A@   E     \ Z    EÀ     \@ E  @ \    E @  À   \@     	   nx_value    form_main_team_logic    nx_is_valid    nx_destroy 
   nx_create    form_main_team    nx_set_value                                                                          form_logic                              A@   E     \ Z    EÀ     \@      	   nx_value    form_main_team_logic    nx_is_valid    nx_destroy                                                  form_logic                          E      \@ E@    \ À  À      @  Á @         on_refresh_base_info 	   nx_value 	   HeadGame    nx_is_valid    RefreshAllTeamSignEffect                                                        form        
   head_game                   ¯        E   @  \   À   @      ÀÀ  Å    Ü Ú@      Ë AAA Ü	À Á @  A      	   nx_value    game_client    nx_is_valid 
   GetPlayer 
   QueryProp 	   TeamType 
   team_type    on_refresh_base_info        ¡   ¡   ¡   ¢   ¢   ¢   ¢   ¢   £   ¦   ¦   §   §   §   §   §   ¨   «   «   «   ¬   ®   ®   ®   ¯         form           game_client          client_player       
   team_type               ²   Ô     M   E  @@EA    \ Á  À   @ ÁA FAA ÁÀEÁ W@E W@ÀEA W@ E W@@EÁ W@ E @ EA   \A E  \  ÁÁ   E   \A E  \  ÁA  @E   \A E   \A E  \  ÁÁ  @E   \A E   \A         TEAM_REC_COL_SIGN_STR 	   nx_value 	   HeadGame    nx_is_valid    RefreshAllTeamSignEffect    Visible    TEAM_REC_COL_NAME    TEAM_REC_COL_SCENE    TEAM_REC_COL_TEAMPOSITION    TEAM_REC_COL_TEAMWORK    TEAM_REC_COL_SCHOOL    TEAM_REC_COL_ISOFFLINE    refresh_base_info 
   nx_string    clear    on_refresh_base_info    del    del_or_add_teamMember    add     M   ´   ´   ´   µ   µ   µ   ¶   ¶   ¶   ¶   ¶   ·   ·   »   »   »   ¼   ¼   ¼   ½   ½   ½   ¾   ¾   ¾   ¿   ¿   ¿   À   À   À   Á   Á   Á   Ã   Ã   Ã   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Ç   Ç   Ç   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ë   Ë   Ë   Ì   Ì   Ì   Ï   Ï   Ï   Ï   Ï   Ï   Ï   Ï   Ð   Ð   Ð   Ñ   Ñ   Ñ   Ô         form     L   
   tablename     L      ttype     L      line     L      col     L   
   head_game               ×   è    9   Æ @ Ú@      Å@  ÆÀ  AÁ  Ü AA@ ÅÁ    A   AA@ Å    A  @ AA@ ÅA    A    AA@ Å      Á A  EA  \ Z   KCÀ  \A        Visible    table    concat    ,    string    find 
   nx_string    TEAM_SUB_REC_COL_HPRATIO    TEAM_SUB_REC_COL_MPRATIO    TEAM_SUB_REC_COL_SPRATIO    TEAM_SUB_REC_COL_BUFFERS 	   nx_value    form_main_team_logic    nx_is_valid    RefreshOtherInfo     9   Ø   Ø   Ø   Ù   Ü   Ü   Ü   Ü   Ü   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   ß   ß   ß   ß   ß   ß   ß   ß   ß   à   à   à   à   à   à   à   à   à   ã   ã   ã   ä   ä   ä   ä   ä   å   å   å   è         form     8      opttype     8      arg     8      cols 	   8      form_logic 0   8           ë   ö        E   @  \   À      À ÀÀ @  Á @    Á@  Å    Ü Ú   @ËAEÁ \  À  Ü@  	   	   nx_value 	   HeadGame    nx_is_valid    ClearAllTeamSignEffect    RefreshAllTeamSignEffect    timer_game    UnRegister    nx_current    on_del_or_add_teamMember        ì   ì   ì   í   í   í   í   í   î   î   ï   ï   ò   ò   ò   ó   ó   ó   ó   ó   ô   ô   ô   ô   ô   ô   ö         form        
   head_game          timer               ø   þ        E   @  \   À      ÀÀÀ   AA   @Á Á A   ÁA    A  @  	   	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    on_del_or_add_teamMember 	   Register      @@      ð¿       ù   ù   ù   ú   ú   ú   ú   ú   û   û   û   û   û   û   ü   ü   ü   ü   ü   ü   ü   ü   ü   ü   þ         form           timer                         E   @  \   À      ÀÀÀ   AA   @Á Á A   ÁA    AB B @  
   	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    on_refresh_base_info 	   Register      @@      ð?      ð¿                                                               form           timer               
  M   |   E   @  \   À      @ÀÀ   AA   @  @         ÁÀ  Ë BÜ   @ A       @  	 Á D    B @  Â  B AþC 	Ä	 ÄA @   	Ä	ÄÁ KÅÄ \Á ÍÃ  A  B À   @    B À    B B C B À    B  B ú ÅÁ Ü   Å À@C ÄA Å BB Ü ÏÆ CÆC  AB  À  U É	 Ä  AÁ  E   \ Z  @ KH\A   !   	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    on_refresh_base_info    can_refresh_team_panel    game_client 
   GetPlayer    selfPosInTeam    get_role_TeamPos               ð?   show_team_line    lbl_TeamName    Visible     is_have_team    old_visible    GetRecordRows    refresh_line_info 
   nx_number    get_team_type    TYPE_LARGE_TEAM    nx_int       $@   Text    nx_widestr    @ui_zudui003 
   nx_string 	   HeadGame    ClearAllTeamSignEffect     |                                                                                                  "  "  #  %  %  %  %  %  (  +  -  .  .  .  /  /  /  /  0  0  0  2  2  2  2  2  2  2  3  3  3  3  3  4  4  6  6  6  6  6  /  <  <  <  <  <  <  <  =  =  >  >  >  >  >  >  >  ?  ?  ?  ?  ?  ?  ?  ?  ?  @  E  H  H  H  I  I  I  I  I  J  J  M        form     {      timer    {      game_client    {      client_player    {      (for index) &   -      (for limit) &   -      (for step) &   -      i '   ,      line 8   o   
   row_count ;   o      (for index) >   V      (for limit) >   V      (for step) >   V      i ?   U   	   team_num f   o   
   head_game t   {         MAX_SINGLE_TEAM_MEMBER 	   TEAM_REC     Q  ¤   Å   Å   A  Ü À KÁ@Ä    E \Á@  @ B ËÁ@D   Å ÜÂ@  À Ã KÂ@Ä    E \Â@  @ C B@ Â  Þ ÆÂB   ÆBC WÂ ÆBC Ã@ Â  Þ ÅÂ CC DÜ Ã OD W @ Â  Þ ËBDA ÜÃ @CD     @    CE  ÌÃEÃE  \ ZC  @ B  ^ KCEÁC ÄEÕ\ À     ICCEÄ LÄED@  À    C À  I À Å  Ü Ã À  @ C@Ã À D @ CCD ËCDAD ÜDE ÌÄEÄ	@  @   
Ä @   @Ä @  EÄ  \ @ 	 D    D	 IÀÄB E @Ä @ EÄ 	 \ @Ä @ EÄ Ä	 \ @ 
 I  ICJ    *   	   nx_value    game_client 
   GetPlayer    QueryRecord    TEAM_REC_COL_NAME    TEAM_REC_COL_SCENE    TEAM_REC_COL_TEAMWORK    TEAM_REC_COL_SCHOOL    TEAM_REC_COL_ISOFFLINE    TEAM_REC_COL_TEAMPOSITION  
   team_type    TYPE_LARGE_TEAM    selfPosInTeam            nx_int       $@
   QueryProp    TeamCaptain    nx_ws_equal    Name    Find    group_       ð?   nx_is_valid 
   lbl_name_    Text    lbl_photo_ 
   BackImage    get_school_image 
   nx_number    refresh_PlayerPhoto_State 	   TeamType    TeamPickMode 
   lbl_icon_    is_team_captain_by_name    ICON_COLONEL    ICON_CAPTAIN    TYPE_NORAML_LEADER    TEAM_PICK_MODE_CAPTAIN    ICON_ALLOCATEE         Å   R  R  R  S  S  V  V  V  V  V  W  W  W  W  W  X  X  X  X  X  Y  Y  Y  Y  Y  Z  Z  Z  Z  Z  [  [  [  [  [  ]  ]  ^  ^  b  b  b  b  c  c  c  d  d  d  e  e  i  i  i  i  i  i  i  i  i  j  j  o  o  o  p  p  p  p  p  p  p  p  q  q  u  u  u  u  u  v  v  v  v  v  w  w  {  {  {  {  {  |  |  |  |  |  }                                                                                                                                                                                                  £  £  ¤        form     Ä      row     Ä      line     Ä      game_client    Ä      client_player    Ä      name 
   Ä      scene    Ä      playerwork    Ä      school    Ä      offlineState    Ä   
   playerpos #   Ä      captain A   Ä      group P   Ä      control \   Ä   	   teamtype    Ä   
   pick_mode    Ä      	   TEAM_REC     §  ­       E   @  \   À      ÀÀÀ   AA   @Á Á A   ÁA    AB B @  
   	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    on_refresh_other_info 	   Register      @@      ð?      ð¿       ¨  ¨  ¨  ©  ©  ©  ©  ©  ª  ª  ª  ª  ª  ª  «  «  «  «  «  «  «  «  «  «  ­        form           timer               °  é      E   @  \   À      @ÀÀ   AA   @  @         ÁÀ  Å    Ü Ú@      Á    A à@ËAB A  UÜ  @ B  @    BÂÂ À ÂE   \ Z  ÀE BC\ C ÅÂ ÆÄ  Ü ÀÀÅ ÌÂÆÂÃ BE LÂFCC BËCÂA  UÜ  @   À  @ ÉDÂD À Ä	E   \ Z  À E  \ 	DE À  \D KDÂÁÄ   Õ	\  À     ÆDÇ Å   Ü WÀ	 I À  Dß æ     	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    on_refresh_other_info    is_in_team    team_manager       ð?   Find    group_ 
   lbl_name_    nx_widestr    Text    GetPlayerData    table    getn            TEAM_SUB_REC_COL_HPRATIO    TEAM_SUB_REC_COL_MPRATIO    TEAM_SUB_REC_COL_SPRATIO    TEAM_SUB_REC_COL_BUFFERS 	   pbar_hp_    Value    nx_int 	   pbar_mp_    show_nuqi_value    imagegrid_buffer_ 
   nx_string    DataSource    set_buff_icon        ±  ±  ±  ²  ²  ²  ²  ²  ³  ³  ³  ³  ³  ³  ¶  ¶  ¶  ¶  ·  º  º  º  »  »  »  »  »  ¼  ¿  ¿  ¿  ¿  À  À  À  À  À  Á  Á  Á  Á  Á  Â  Â  Å  Å  Å  Å  Å  Æ  Æ  Æ  Æ  Æ  Ç  Ç  Ç  È  È  È  Ê  Ê  Ê  Ê  Ê  Ê  Ë  Ë  Ë  Ì  Ì  Ì  Í  Í  Í  Î  Î  Î  Ñ  Ñ  Ñ  Ñ  Ñ  Ò  Ò  Ò  Ò  Ò  Ó  Ó  Ó  Ó  ×  ×  ×  ×  ×  Ø  Ø  Ø  Ø  Ø  Ù  Ù  Ù  Ù  Ý  Ý  Ý  Ý  Ý  à  à  à  à  à  á  á  á  á  á  â  â  â  â  â  â  â  â  ã  ä  ä  ä  ä  ¿  é        form           timer          team_manager          (for index)          (for limit)          (for step)          i           group %      	   lbl_name 1         player_name 9         record_table <         hp E         mp H         sp K         buffers N         pbar_hp S         pbar_mp a         imagegrid_buffer t            MAX_SINGLE_TEAM_MEMBER     ì  N  	 ·     @   A  @   A  @EÁ  Á\ A ÁA  FÁÁÁ @ BËÁÁAB  UÜÂÁ À ÂEÂ @ KC Ä  C E ÃC  \  \   Ä@   Â  ËBD D  À Ü  ÅÂ  CD   À   Ü  Ã  @  EÃ  \ @À  @    @    @   @  É  @    @ 	     @    @    @   @ É  @    @  	    E @ @EÂ  BD   @  \  B À ÅB  Ü À  À    @    À   @ É  À    @  	     À    @    À   @  É  À    @ 	          nx_is_valid    string    sub 
   nx_string    Name       ð¿   Parent    Find 
   lbl_name_ 	   pbar_hp_ 	   pbar_mp_    TEAM_REC_COL_SCENE    FindRecordRow    TEAM_REC_COL_NAME    nx_widestr 
   QueryProp            QueryRecord 
   ForeColor    ProgressImage    TEAM_REC_COL_ISOFFLINE 
   nx_number     ·   í  í  í  í  í  î  î  ò  ò  ò  ò  ò  ò  ò  ò  õ  ö  ö  ö  ö  ö  ÷  ÷  ÷  ÷  ÷  ø  ø  ø  ø  ø  û  û  û  ý  ý  ý  þ  þ  þ  þ  þ  ý  ÿ  ÿ                                    	  	  	  	  	  	  	  	                                                                              "  "  "  "  "  #  #  &  &  '  *  *  *  ,  ,  ,  ,  ,  ,  ,  .  .  .  .  .  .  .  .  0  0  0  0  0  1  1  4  4  4  4  4  5  5  8  8  8  8  8  9  9  <  <  <  ?  ?  ?  ?  ?  @  @  C  C  C  C  C  D  D  G  G  G  G  G  H  H  K  K  N        client_player     ¶      col     ¶      line     ¶      control     ¶      num    ¶   	   groupbox    ¶      lblname    ¶      parhp    ¶      parmp    ¶      row +   t      sceneid 6   t      playersceneid =   t      offlineState    ¶   	   	   TEAM_REC    COLOR_DEFAULT    hp_def_img    mp_def_img    COLOR_GRAY    hp_other_img    mp_other_img    hp_gray_img    mp_gray_img     Q  b   $    @ Å@  À  À   ÁÀ  AA à ËAÁ D   Å ÜÂ @ EÂ Â C \  @@BÁ   À   ß@úÀ        
   team_type    TYPE_LARGE_TEAM    GetRecordRows               ð?   QueryRecord    TEAM_REC_COL_NAME 
   nx_string 
   QueryProp    Name    TEAM_REC_COL_TEAMPOSITION       ð¿    $   S  S  S  S  T  T  T  V  V  V  V  W  W  W  W  W  Y  Y  Y  Y  Y  Y  Y  Y  Y  Y  [  [  [  [  [  \  V  a  a  b  	      form     #      client_player     #   
   row_count    !      (for index) 
   !      (for limit) 
   !      (for step) 
   !      i           name           teampos           	   TEAM_REC     e  y           A@    ÁÀ      @ B   ^  E   @  Á   \ Z   @         Á@    AA     @ Â   Þ  Â  Þ          nx_execute 	   util_gui    util_is_form_visible    form_stage_main\form_movie_new "   form_stage_main\form_movie_effect 4   form_stage_main\form_wuxue\form_team_faculty_member        g  g  g  g  g  h  h  i  i  m  m  m  m  m  n  n  o  o  s  s  s  s  s  t  t  u  u  x  x  y        bMovie          bMovieEffect          bTeamFaculty               |         Ë @ AA  À UÜÁ  @     É         Find    group_       ð?   nx_is_valid    Visible        ~  ~  ~  ~  ~                      form           line           visible        
   group_box                     ,      Á@   Å     Ü Á  @ A   AA À   @  ÁÁ A  A  AA A   ÁÁ Â AA A   À  AACÁ C LÂCA     	   nx_value    gui 
   menu_game    nx_is_valid    Create    Menu    nx_bind_script    menu_game_init    nx_set_value    nx_execute    menu_game_reset    team    menu_recompose    GetCursorPosition    TrackPopupMenu       9@    ,                                                                                                 self     +      membername     +      gui    +   
   menu_game    +      x &   +      y &   +                     E   F@À   ÆÀ@  Á   \ @A ËAAÁ  UÜ @   À A @ ÂA        string    sub 
   nx_string    Name       ð¿   Parent    Find 
   lbl_name_    nx_is_valid    on_show_team_menu    Text                                                               self           num       	   groupbox 	         control               ¢  ¨       E   F@À   ÆÀ@  Á   \ @A  @ AÅÀ   Ü Ú   À Å     FABÜ@  
      string    sub 
   nx_string    Name       ð¿   Find 
   lbl_name_    nx_is_valid    on_show_team_menu    Text        £  £  £  £  £  £  £  £  ¤  ¤  ¤  ¤  ¤  ¥  ¥  ¥  ¥  ¥  ¦  ¦  ¦  ¦  ¨        self           num          control               «  Î    h    @ @ @  À    ÅÀ   AA@  Ü   AÁ   Á  A àAÆBB B Î    ÆÇÂ Å ÆBÃÃ A  Ü Ã E \ C EÃ Á \Ã ÀÄ Å  Ü  A  W @Å  Ü  AD  W @	WÅÀA ÀAËÃE @  À  Å  EÅ  Ü   AE ÜCBÀÆ@ËÃE @ À  Å  EÅ  Ü   AE ÜCLÂ ßë	        Clear    util_split_string      
   nx_number    table    getn               @      ð?   RowNum 	   ClomnNum    buff_id    string    sub       À   buff_static_query 
   nx_string    Photo    Visible 	   IsDamage    nx_int         AddItem    nx_widestr       ð¿      (@    h   ­  ­  ®  ®  ®  ®  ¯  ¯  ¯  ¯  ¯  ¯  °  ±  ²  ³  ³  ³  ³  ´  ´  ´  ´  ´  µ  ·  ·  º  º  º  º  º  º  »  »  »  »  »  »  ¾  ¾  ¾  ¾  ¿  ¿  ¿  ¿  À  À  À  À  À  À  À  À  Á  Á  Á  Á  Á  Á  Á  Á  Â  Â  Ã  Ã  Ã  Ã  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Å  Å  Æ  Æ  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  Ç  È  Ê  ³  Í  Î        grid     g   	   buff_ids     g   	   buff_lst    g      count    g      icon_index_up    g      icon_index_down    g      bShow    g      (for index)    f      (for limit)    f      (for step)    f      i    e      tmp_buff_id !   e      photo '   e      buff_visible +   e      buff_damage /   e           Ð  Û    .      Ë@@ @ Ü   Å  ÆÀÀ  A A Ü  @Á W BÀ W@B@  A    E Á \  ÁA  FÂÃKÄÁB   @  Õ\D  ÂDËE Ü ÌÂÄ FCE A      
   nx_string    GetItemName    string    sub               À   buff_static_query    Visible      	   nx_value    gui    nx_execute 
   tips_game    show_text_tip    TextManager    GetText    desc_    GetMouseInItemLeft       @   GetMouseInItemTop    ParentForm     .   Ñ  Ñ  Ñ  Ñ  Ñ  Ò  Ò  Ò  Ò  Ò  Ò  Ó  Ó  Ó  Ó  Ô  Ô  Ô  Ô  Ô  Ô  Õ  Ø  Ø  Ø  Ù  Ù  Ù  Ù  Ù  Ù  Ù  Ù  Ù  Ù  Ù  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ù  Û        grid     -      index     -      buff_id    -      tmp_buff_id    -      buff_visible    -      gui    -           Þ  à          Á@    FÁ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm        ß  ß  ß  ß  ß  à        grid           index                ã      `   Å      Ü Ú@      Å@  À Ü Á  @ À   Á  Á@ À   Á   CÁ Á ÀÀ @  C E  \ Ã Å ÁÜ ÁC  @   @     IÁÂúÀÀÁA    C E  \ Ã Å ÁÜ ÁC  @   @     IÂú À@    Â KC ÁB  @  A ÕB\  À     I        nx_is_valid    nx_int       @
   nx_number       ð?               gui\mainform\zudui_nv3.png    gui\mainform\zudui_nv4.png    lbl_nv 
   nx_string    _    Find 
   BackImage    gui\mainform\zudui_nv2.png    gui\mainform\zudui_nv1.png    _1     `   ä  ä  ä  ä  ä  å  è  è  è  é  é  é  é  ê  ê  ë  î  î  ï  ò  ó  ô  õ  ö  ö  ÷  ÷  ÷  ÷  ø  ø  ø  ø  ø  ø  ø  ø  ø  ù  ù  ù  ù  ú  ú  ú  ú  ú  û  ÷                                                                                                        group     _      value     _      index     _      num 	   _      name    _      lbl    _      close_image    _      open_image    _      (for index)    1      (for limit)    1      (for step)    1      i    0      (for index) 6   K      (for limit) 6   K      (for step) 6   K      i 7   J      photo L   _      control Y   _             b   þ   E   @  \   ÁÀ   Å    Ü AÁ KAÁÁ \A ËABD   Å     Ü Ü  ÀÂ    C  ÀC KCÄ   E \C  @Ã ËCD  Å ÜC  ÀD FÄ KÃÄÁ \CFÄ KCÅÀ  \C@   ÆÄ ËÅÜ   Å  Ä Ü ÀAÃ   Å     Ü   @      Ä CF @  E Ä \ @  D    D @   À Å  Ü À@Ä CFÄ @  À Å  Ü À@Ä CFD @  Ä CF @ Ä ÃDÄ CÄ CE C Å  Ä E Ü    AÄ   Ã  W IÀÅC	   Ü D	 AÄ    @ÆÄ ËCÆA	 Ü ÆÄ ËCÆ@ ÜÆÄ ËÃÄAÄ	 ÜCÆÄ ËCÅ@ ÜCÀ   FÄ KÅ\   E  Ä \ @ÆÄ ËCÆA
 D	 À  UÜÄ ÄDD
 DÄ DED  E  Ä E	 \    ÁÄ  Ä DF FÄ KÄÄÁ
 \DFÄ KDÅÀ \D@   ÆÄ ËÅ	Ü   KÄÊ \Ä Å   Ü E @	    Ë	  À  À  	AÆ  E  1   	   nx_value    gui    nx_widestr        game_client 
   GetPlayer 
   QueryProp    TeamCaptain 	   TeamType    FindRecordRow    TEAM_REC_COL_NAME            QueryRecord    TEAM_REC_COL_SCENE    TEAM_REC_COL_TEAMWORK    TEAM_REC_COL_LEVELTITLE    TEAM_REC_COL_ISOFFLINE    TEAM_REC_COL_SCHOOL    TextManager    Format_SetIDName    tips_team_player_name    Format_AddParam    Format_GetText    <br/>    nx_ws_equal    GetText    nx_int    TYPE_LARGE_TEAM    ui_team_work_tuanzhang    ui_team_work_duizhang    TYPE_NORAML_LEADER    ui_team_work_fenpeiduizhang    TYPE_NORAML_ASSIST    ui_team_work_zhuli    ui_team_work_none    tips_team_player_work  
   nx_string    ui_none    tips_team_player_school    desc_    tips_team_player_leveltitle    tips_team_player_scene    GetCursorPosition    tips_manager    nx_is_valid    ShowTextTips       ð¿   0-0     þ                           !  !  !  "  "  "  #  #  #  #  #  #  #  $  $  %  )  )  )  )  )  *  *  *  *  *  +  +  +  +  +  ,  ,  ,  ,  ,  -  -  -  -  -  0  0  0  0  1  1  1  1  2  2  2  2  2  2  2  2  2  2  5  6  6  6  6  6  6  6  6  6  6  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  8  8  8  8  8  8  8  8  9  9  9  9  9  9  :  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  =  =  =  =  =  ?  ?  ?  ?  @  @  @  @  A  A  A  A  A  A  A  A  A  A  D  E  E  E  E  E  E  E  E  E  E  F  F  F  F  F  F  H  H  H  H  H  J  J  J  J  K  K  K  K  L  L  L  L  L  L  L  L  L  L  O  O  O  O  O  O  O  O  P  P  P  P  Q  Q  Q  Q  R  R  R  R  R  R  R  R  R  R  U  U  U  U  V  V  V  V  W  W  W  W  X  X  X  X  X  X  X  [  [  ^  ^  ^  _  _  _  _  _  `  `  `  `  `  `  `  `  `  b        player_name     ý      gui    ý   	   out_text    ý      game_client 	   ý      client_player    ý      captain_name    ý   
   team_type    ý      row    ý      scene     ý      playerwork %   ý      leveltitle *   ý      OffLinetime /   ý      school 4   ý   
   work_name G   ý      school_name    ý      title_name Å   ý      scene_name Û   ý      x ì   ý      y ì   ý      tips_manager ï   ý      	   TEAM_REC     e  q       E   @@ \   À@À    A@    Æ@A ÁÁ À ÁE  \ ZA      EA B\A      
   nx_string    Name    string    sub    len    Parent    Find 
   lbl_name_    nx_is_valid    show_member_tips    Text        f  f  f  g  g  g  g  g  g  g  g  i  j  j  j  j  j  k  k  k  k  k  l  p  p  p  q        label        
   labelname          index       	   groupbox       	   lbl_name               t  v       E   @  Á  \@        nx_execute 
   tips_game 	   hide_tip        u  u  u  u  v        label                y         E   @@ \   À@À    A@    Æ@A ÁÁ À ÁE  \ Z   EA B\A      
   nx_string    Name    string    sub    len    Parent    Find 
   lbl_name_    nx_is_valid    select_teamlist_headphoto    Text        z  z  z  {  {  {  {  {  {  {  {  }  ~  ~  ~  ~  ~                          label        
   labelname          index       	   groupbox       	   lbl_name                     2   E   @  \    Á   ËÀ@Ü Á EA  \  À B      Â Å    Ü  KCÂÁ \      ÂÂ ÃÅ   Ü Ú  Å  C Ü Ã C  a   ÷     	   nx_value    game_visual    game_client 	   GetScene    GetSceneObjList    ipairs    nx_is_valid    nx_ws_equal    nx_widestr 
   QueryProp    Name    GetSceneObj    Ident    fight    SelectTarget     2                                                                                                             player_name     1      game_visual    1      game_client    1      scene    1      scene_obj_table 
   1      (for generator)    1      (for state)    1      (for control)    1      i    /      val    /      target_obj #   /      fight +   /             «      W @ ÀE@     \ @  Á      À  D   F   À     À@  ^        
   nx_string        ui_None                                    ¡  ¤  ¤  ¦  ¦  §  §  §  ª  «        school           pic             schoolimage     ®  ¸       E   @  \ À  ËÀ@A ÜA @ EA   \ @   @         	   nx_value    game_client 
   GetPlayer 
   QueryProp    TeamCaptain 
   nx_string        ¯  ¯  ¯  °  °  ±  ±  ±  ³  ³  ³  ³  ³  ³  ³  ³  ´  ´  ´  ¶  ¶  ¸        name           game_client          client_player          TeamCaptain               »  è   k      Á@   Å    AÁ   Ü A @ EA  \ @      D   EÁ  \ ZA      E   \ Á À A      AÂ ÅÁ   Ü ÚA      ËBAÂ Ü @ E   \ @     D   BCC ÀÃEÃ  \ Z  ÀFÃCZ   KCCÁ  Õ\Ã À    ÆCÄ Å    Ü ÀCC @DÅÃ   Ü Ú   ÅÃ   @  ÜC ô     	   nx_value    game_config_info    util_get_property_key    show_team_chat_info       ð?   nx_int            nx_is_valid    game_client 
   GetPlayer 
   QueryProp    Name 
   nx_string    Find    group_    Visible 
   lbl_name_    Text    MultiTextBox_    set_chat_text     k   ½  ½  ½  ¾  ¾  ¾  ¾  ¾  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  À  Ä  Ä  Ä  Å  Å  Å  Å  Å  Æ  É  É  É  Ê  Ê  Ê  Ê  Ê  Ë  Î  Î  Ï  Ï  Ï  Ï  Ï  Ð  Ô  Ô  Ô  ×  ×  ×  ×  ×  ×  ×  ×  Ø  Ü  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Ý  Þ  Þ  Þ  Þ  Þ  Þ  Þ  Þ  ß  ß  ß  ß  ß  à  à  à  à  à  à  à  à  à  à  à  à  à  á  á  á  á  á  â  â  â  â  â  ã  ã  ã  ã  ã  Ü  è        name     j      info     j      game_config_info    j      show_team_chat_info    j      form    j      game_client    j      client_player %   j      playername .   j      (for index) :   j      (for limit) :   j      (for step) :   j      i ;   i   	   groupbox @   i      lblname M   i      mltbox _   i         FORM_MAIN_TEAM    MAX_SINGLE_TEAM_MEMBER     ë  #   s   Å@  IÀ ÅÀ  IÀ Á@ A  AAÁ Á  AÕIÀ I@BIÀBIÀBÄ   IÀIÀCI@DIÀDÅ@   Ü IÀ ËÅ Ü ÌÀIÀ Ë Æ Ü ÌÀIÀ Æ À X@Æ ÆÀ Æ 	Æ À ÍÀÀ AÁ Á ÀÆ@ A  I@FÏÇLÁÀF@ A  IFÏGÁÅ  AÂ  ÁÂ Å  CAÃ Æ  Ü IÀ ÁÀ Å  AÁ Æ  ÕIÀ Æ H Ì@ÈÀ Í IÀ IÀBÅÀ 	 Ü A	 @   ÀÉÁ	  Á
   AAÊ
 ÁÁ Â	  A
  ÁÂ
 Ã
 A  ,      Width    HEAD_MAX_WIDTH    Height    HEAD_MAX_HEIGHT 	   ViewRect    10,10,       $@   , 
   BackColor 
   100,0,0,0    NoFrame    Solid 
   BackImage    Font    HEIT12 
   TextColor 
   255,0,0,0    LineHeight       ð?	   HtmlText    nx_widestr    GetContentWidth       4@   GetContentHeight       N@      E@               @      @
   nx_string    10,7,    Top       D@   Visible 	   nx_value    GAME_TIMER    nx_is_valid    UnRegister    nx_current    timer_callback 	   Register      ³@      ð¿    s   ì  ì  í  í  î  î  î  î  î  î  î  î  ð  ñ  ò  ô  ô  õ  ö  ÷  ú  ú  ú  ú  ý  ý  ý  ý  þ  þ  þ  þ                                  	  
  
                                                                                                                  !  !  !  !  !  !  !  !  !  !  #     	   groupbox     r      mltbox     r      info     r   
   gap_Width (   J      gap_Height *   J   
   draw_left +   J   	   draw_top ,   J      timer ]   r         chat_backimg     &  (       	@@        Visible         '  (        mltbox           param1           param2                +  M    	C      A@   E     \ Z@      KÀ@ \   À   @         Ä    Å    Ü Ú@  Å  A A   Â   Ü  Å    Ü Ú@       ÂË@Â A ÜÁ @ EÁ  \ @    A @ A   A  E   \ Z   KÁCÀ \A     	   nx_value    game_client    nx_is_valid 
   GetPlayer    nx_execute 	   util_gui    util_get_form    Visible  
   QueryProp    TeamID    nx_int            refresh_base_info    form_main_team_logic    RefreshOtherInfo     C   ,  ,  ,  -  -  -  -  -  .  1  1  2  2  2  2  2  3  6  6  6  7  7  7  7  7  8  8  8  8  8  8  8  8  9  9  9  9  9  :  =  @  @  @  A  A  A  A  A  A  A  A  C  G  G  G  I  I  I  J  J  J  J  J  K  K  K  M        game_client    B   
   game_role    B      form    B      team_id +   B      form_logic :   B         FORM_MAIN_TEAM     P  [    	      D    E@     \ Z@      A    ÁÀ  ` E   À   \A _@þ	Á     	   nx_value    nx_is_valid               ð?   show_team_line    Visible         Q  Q  Q  R  R  R  R  R  S  V  V  V  V  W  W  W  W  W  V  Z  [        form          (for index)          (for limit)          (for step)          i             FORM_MAIN_TEAM    MAX_SINGLE_TEAM_MEMBER     	   	   	   
   
   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   1   2   3   6   7   8   ;   >   @   C   F   F   G   G   O   I   [   R   p   p   ]         r                     ¯       Ô   ²   è   ×   ö   ë   þ   ø        M  M  M  
  ¤  ¤  Q  ­  §  é  é  °  N  N  N  N  N  N  N  N  N  N  ì  b  b  Q  y  e    |           ¨  ¢  Î  «  Û  Ð  à  Þ    ã  b  b    q  e  v  t    y      «  «    ¸  ®  è  è  è  »  #  #  ë  (  &  M  M  +  [  [  [  P  [        FORM_MAIN_TEAM       	   TEAM_REC          schoolimage )         hp_def_img *         hp_gray_img +         hp_other_img ,         mp_def_img -         mp_gray_img .         mp_other_img /         chat_backimg 0         COLOR_GRAY 1         COLOR_DEFAULT 2         MAX_SINGLE_TEAM_MEMBER 3          