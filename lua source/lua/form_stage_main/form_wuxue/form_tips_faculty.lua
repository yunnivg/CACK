LuaQ  Q   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_wuxue\form_tips_faculty.lua           	D      A@  @    A  @    AÀ  @    A  @    A@ @  AÀ   Á@  AÁ  Ê B É  É Â É ÉB É É$  Â $B   $  B $Â   $ Â $B  $ B $Â  $                  Â $B       $ B $Â          require 	   util_gui    util_functions    util_static_data    share\view_define    player_state\state_input       ð?       @      @      @      @      @      @   VIEWPORT_NEIGONG    VIEWPORT_SKILL    VIEWPORT_QINGGONG    VIEWPORT_ZHENFA    VIEWPORT_SHOUFA    VIEWPORT_JINGMAI    main_form_init    on_main_form_open    on_main_form_close    on_Faculty_wuxue_change    on_cur_level_change    on_FillSpeed_change    on_Faculty_change    on_FillValue_change    get_cur_wuxue_static_data    get_cur_wuxue_id    refresh_time    refresh_speed        $   )        	@@	À@        Fixed     wuxue_name            %   (   )         self                ,   7     	9   E   @  \   À      ÀÀÀ  AA   Å Ü Â @ÀÀ  AA   Å Ü B @ÀÀ  AA   Å Ü Â @ÀÀ  AA   Å Ü Â @ÀÀ A AA   Å Ü  @ÀÀ Á AA   Å Ü  @     	   nx_value    data_binder    nx_is_valid    AddRolePropertyBind    FacultyName    int    nx_current    on_Faculty_wuxue_change    Faculty    on_Faculty_change    TotalFillValue    on_FillValue_change    CurFillValue 	   CurLevel    on_cur_level_change 
   FillSpeed    on_FillSpeed_change     9   .   .   .   /   /   /   /   /   0   0   0   0   0   0   0   0   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   4   4   4   4   4   4   4   4   5   5   5   5   5   5   5   5   7         self     8      databinder    8           :   F     "   E   @  \ À Á  @  @ À  @  @ À A @  @ À  @  @ À Á @  @ À  @  @ @Â    @ À   @      	   nx_value    data_binder    DelRolePropertyBind    FacultyName    Faculty    TotalFillValue    CurFillValue 	   CurLevel 
   FillSpeed    DelViewBind    nx_destroy     "   <   <   <   =   =   =   =   >   >   >   >   ?   ?   ?   ?   @   @   @   @   A   A   A   A   B   B   B   B   C   C   C   E   E   E   F         self     !      data_binder    !           L   p     I   E      \ Z@      E@    \ ÀÀ  Ë AAA ÜÁ @ 	 B E Á À \  	A @  A FC KÁÃÁ Â @  A B Á \AEA  Á \ ÅA ÅA  AÂ A À Ü  @ B      Á AB Â À  UF Å Ã @ Ü  Â        nx_is_valid 	   nx_value    game_client 
   GetPlayer 
   QueryProp    FacultyName    wuxue_name 
   nx_string    lbl_wuxue_name    Text    nx_widestr 
   util_text    get_cur_wuxue_static_data    Photo    imagegrid_wuxue    AddItem               ð?      ð¿   faculty_query    GetType    nx_execute +   form_stage_main\form_wuxue\form_wuxue_util    get_wuxue_object    WuXing    ui_wuxue_prop_    lbl_property     I   M   M   M   M   M   N   R   R   R   S   S   V   V   V   W   W   W   W   Z   Z   Z   Z   Z   Z   Z   ]   ]   ]   ]   ^   ^   ^   ^   ^   ^   ^   ^   ^   ^   a   a   a   b   b   b   c   c   d   d   d   c   f   f   f   f   f   g   k   k   k   n   n   n   n   n   o   o   o   o   o   o   o   p   
      form     H      game_client 	   H      client_player    H      wuxue_name    H      photo    H      faculty_query *   H      wuxue_type -   H   
   wuxue_obj 3   H   	   property <   H   	   type_str A   H           s        -   E      \ Z@  @ B   ^  E@    \ @  ÁÀ   Ë AÜ AÁ FÁA A Å Â E  \ BÜ   IEA  \ A Á  FÁA A Å Â Ü   I        nx_is_valid 	   nx_value    gui    game_client 
   GetPlayer 
   QueryProp 	   CurLevel 
   lbl_level    Text    nx_widestr 
   util_text    ui_wuxue_level_ 
   nx_string    nx_int            ui_train_level     -   u   u   u   u   u   v   v   z   z   z   {   {   {   |   |                                                                                                   form     ,      gui 
   ,      game_client    ,      client_player    ,   
   cur_level    ,                      E      \ Z@  @ B   ^  E@     \@ E     \@         nx_is_valid    refresh_speed    refresh_time                                                        form                   ¥        E      \ Z@  @ B   ^  E@    \ ÀÀ  Ë AAA ÜA E \ 	AA @  A   
      nx_is_valid 	   nx_value    game_client 
   GetPlayer 
   QueryProp    Faculty    lbl_faculty    Text    nx_widestr    refresh_speed                                                        ¡   ¡   ¡   ¡   ¡   ¤   ¤   ¤   ¥         form           game_client 
         client_player          cur_faculty               ¨   À        E      \ Z@  @ B   ^  E@    \ ÀÀ  Ë AAA ÜA     FÁA IÁ FÁA IE   \A         nx_is_valid 	   nx_value    game_client 
   GetPlayer 
   QueryProp    TotalFillValue    CurFillValue 
   pbar_fill    Maximum    Value    refresh_time        ©   ©   ©   ©   ©   ª   ª   ®   ®   ®   ¯   ¯   ²   ²   ²   ³   ³   ³   ¶   ¶   ·   »   »   ¼   ¼   ¿   ¿   ¿   À         form           game_client 
         client_player          level_faculty          cur_fillvalue               Å   ÿ    v      À    @      W@À À  À   Å  Á  Ü À       À    Å     Ü Ú@      Ã A A  KÁAÆB \A À ÅA   Ü À@ Å  A À ÅA  Ü À@ ÅÀ 	A À ÅA  Ü À@ Å   A À ÅA Ü À@ Å@ A À ÅA  Ü À@ Å  A À ÅA Ü À  ÅÀ @À    A Á  Å    Ü ÚA      ËADA ÜÂDB À ÅB  Ü            nx_is_valid  
   nx_string        get_cur_wuxue_id 	   nx_value    faculty_query    GetType    wuxue_name    nx_int    STATIC_DATA_SKILL_STATIC    STATIC_DATA_NEIGONG    STATIC_DATA_QGSKILL    STATIC_DATA_ZHENFA    STATIC_DATA_JINGMAI    STATIC_DATA_SHOUFA    data_query_manager 
   QueryProp    StaticData    Query     v   Ç   Ç   Ç   Ç   Ç   È   Ì   Ì   Í   Í   Í   Í   Í   Í   Í   Í   Î   Ò   Ò   Ò   Ó   Ó   Ó   Ó   Ó   Ô   Ø   Û   Û   Û   Ü   Ü   Ü   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   ß   ß   á   á   á   á   á   á   á   á   â   â   ä   ä   ä   ä   ä   ä   ä   ä   å   å   ç   ç   ç   ç   ç   ç   ç   ç   è   è   ê   ê   ê   ê   ê   ê   ê   ê   ë   ë   í   í   í   í   í   í   í   í   î   ò   ò   ó   ÷   ÷   ÷   ø   ø   ø   ø   ø   ù   û   û   û   ü   ü   ü   ü   ü   ü   ü   ü   ü   þ   ÿ   	      form     u   
   prop_name     u   	   wuxue_id    u   
   Data_Type    u      faculty_query    u      wuxue_type !   u      data_query b   u      staticdata k   u      prop t   u         WUXUE_SKILL    WUXUE_NEIGONG    WUXUE_QGSKILL    WUXUE_ZHENFA    WUXUE_JINGMAI    WUXUE_ANQI       &   R   E      \ Z@   E@  ]  ^   E  À  \  Á AA Å   Ü  AÁ  Y ÀÅ   Ü  D   YÀ ÀÅ  AA Ü  AA    Å@  Ý  Þ   Å   Ü ÁÂ Ä Æ   E   \ ZA   EA  ] ^  KC\ A ÀÀËCAÃ Ü @ E CA \ @   ¡  @üA             nx_is_valid    nx_null 	   nx_value    faculty_query    GetType    wuxue_name    nx_int         
   nx_string        game_client    GetView    GetViewObjList    ipairs 
   QueryProp 	   ConfigID     R                   	  	  	  
  
  
                                                                                                                                    !    "  %  %  %  &        form     Q      faculty_query    Q      wuxue_type    Q      game_client ,   Q      view 2   Q   	   view_lst <   Q      (for generator) ?   N      (for state) ?   N      (for control) ?   N      _ @   L   	   wuxue_id @   L   
   temp_name C   L      
   WUXUE_MAX    WUXUE_VIEW     )  ]       E   @  \ À  ËÀ@A ÜÁ@A M À Å Â Ü À  AÁ Á@ Å   Ü  AÂ   @ Â  Þ ÅA ÆÂÜ  OÂÂ E B CÀÃ BC\  ÅB ÆÃC C@Ã AC Ü  Á  @  E Ã \  ÀÃ @ EÃ  \ Ã Å D Ü   Õ @ E Ã \  ÀÃ @ EÃ \ Ã Å  Ü   Õ @  E Ã \  ÀÃ @ EÃ  \ Ã Å Ä Ü   Õ @ E Ã \ @ Ã A  EÃ  ÁÃ  \  ÕBCE EÃ \ 	C       	   nx_value    game_client 
   GetPlayer 
   QueryProp    TotalFillValue    CurFillValue    nx_int         
   FillSpeed    math    ceil      @   mod       N@       nx_widestr 
   util_text    ui_day 	   ui_hourx    ui_min    0 	   lbl_time    Text        +  +  +  ,  ,  /  /  /  0  0  0  1  3  3  3  3  3  3  3  3  4  8  8  8  9  9  9  9  9  9  9  9  :  :  >  >  >  >  ?  ?  ?  @  @  @  @  @  @  @  @  A  A  A  A  A  A  A  A  A  A  A  D  G  G  G  G  G  G  G  G  H  H  H  H  H  H  H  H  H  H  H  H  L  L  L  L  L  L  L  L  M  M  M  M  M  M  M  M  M  M  M  M  Q  Q  Q  Q  Q  Q  Q  Q  R  R  R  R  R  R  R  R  R  R  R  R  U  U  U  U  U  U  U  U  V  V  V  V  V  V  V  V  V  Z  Z  Z  Z  Z  \  \  ]        form           game_client          client_player          level_faculty          cur_fillvalue          leave_faculty          speed          time &         day )         hour 1         min <      
   time_text =              `         E   @  \    Á   ËÀ@Ü ÁA KÁÁ \ÁÁ B @  ËÁAB ÜÁ AÂ  À Å  Ü ÀÀ AB C Ä À Å   Ü ÀÀ AB C Ä	 À Å   Ü ÀÀ A C ÂÄ À Å EÜ ÀÀ AB C Å À Å ÃEÜ ÀÀ A C BÆ A C ÂÆÇ B ÅB  AÃ B À Ü @ C      ÁC AÃ WÀB@È  @  @  Å   Ü  AÄ  W ÀÅ	 D	 Ü 	 E	 Ä	 Å
   Ü Ä	\   E	 D
 \ UCC Å	 	 E	 \   E	 \ DÜ Ã  +   	   nx_value    faculty_query    game_client 
   GetPlayer 
   QueryProp 	   CurLevel 
   FillSpeed    GetFillSpeed    wuxue_name    Faculty    CurPlaceList        nx_int    ui_train_speed_0 
   lbl_speed 
   ForeColor    255,255,0,0    ui_train_speed_1    ui_train_speed_2    255,0,176,80 =
×£p=ò?   ui_train_speed_3    255,0,176,240        @   ui_train_speed_4    255,112,48,160    ui_train_speed_5    255,255,136,0    GetType    nx_execute +   form_stage_main\form_wuxue\form_wuxue_util    get_wuxue_object    nx_is_valid    WuXing    GetSpeedAdd            nx_widestr    ( 
   util_text    ui_faculty_place_ 
   nx_string    )    Text        b  b  b  c  c  c  d  d  g  g  g  h  h  h  i  i  i  i  l  l  l  m  m  m  p  q  q  q  q  q  q  q  q  r  s  s  s  u  u  u  u  u  u  u  u  v  w  w  w  x  x  x  x  x  x  x  x  y  z  z  z  {  {  {  {  {  {  {  {  |  }  }  }  ~  ~  ~  ~  ~  ~  ~  ~                                                                                                                                                        form           faculty_query          game_client          client_player       
   cur_level          fill_speed          base_speed          cur_faculty       
   cur_place          speed_text          wuxue_type [      
   wuxue_obj a      	   property j         place_text k      
   place_add s          D                     	   	   	   
   
   
                                                                        )   $   7   ,   F   :   p   L      s         ¥      À   ¨   ÿ   ÿ   ÿ   ÿ   ÿ   ÿ   ÿ   Å   &  &  &    ]  )    `          WUXUE_NEIGONG    C      WUXUE_SKILL    C      WUXUE_QGSKILL    C      WUXUE_ZHENFA    C      WUXUE_ANQI    C      WUXUE_JINGMAI    C   
   WUXUE_MAX    C      WUXUE_VIEW #   C       