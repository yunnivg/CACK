LuaQ  h   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_league.lua           -      A@  @   AÀ    Á@  d  GÁ dA  G d  GA dÁ  G d GÁ dA G d GA dÁ G d    GÁ dA    G d     GA dÁ   G d    GÁ dA    G d GA         require B   form_stage_main\form_relation\form_relation_guild\form_guild_util       C@     D@      E@     E@      G@   main_form_init    on_main_form_open    on_main_form_close    reset_grid_data    request_league_guild_list    request_enemy_guild_list    show_league_guild_list    show_enemy_guild_list    on_btn_over_league_click    on_btn_over_enemy_click    on_btn_league_click    on_btn_enemy_click    on_grid_league_select_row    on_grid_enemy_select_row    get_league_guild_info                   	@@B  ^          Fixed                          form                   $     
   E      \@ E@  \@ E  \@ AÀ  ^          reset_grid_data    request_league_guild_list    request_enemy_guild_list       ð?    
                    !   !   #   #   $         form     	           '   *        A   ^             ð?       )   )   *         form                -   L     	B   E   @  \ @ À@@ @ @A@ A@ @ ÀA EA Â ÁB \  @  @ ÀAA EA Â ÁB \  @  @ ÀC@  D À@@  D @A D A@  D ÀA EA Â ÁB \  @   D ÀAA EA Â ÁBB \  @   D ÀC@      	   nx_value    gui    textgrid_league    BeginUpdate 	   ColCount        @	   ClearRow    SetColTitle            nx_widestr    TextManager    GetText    ui_FormBangPai       ð?   ui_guild_league_time 
   EndUpdate    textgrid_enemy    ui_guild_enemy_time     B   /   /   /   2   2   2   5   5   7   7   7   :   :   :   :   :   :   :   :   :   :   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   =   =   =   @   @   @   C   C   E   E   E   H   H   H   H   H   H   H   H   H   H   I   I   I   I   I   I   I   I   I   I   K   K   K   L         form     A      gui    A           O   W            A@   E     \ Z@  @ AÀ  ^  K A Å@  Ü A AÁ  \@       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int      °@     C@       Q   Q   Q   R   R   R   R   R   S   S   V   V   V   V   V   V   V   V   W         game_visual               Z   b            A@   E     \ Z@  @ AÀ  ^  K A Å@  Ü A AÁ  \@       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int      °@      D@       \   \   \   ]   ]   ]   ]   ]   ^   ^   a   a   a   a   a   a   a   a   b         game_visual               e        C   E   @  \    Á   ÅÀ    Ü Ú@  @ Â   Þ  Æ AË@ÁÜ@ Å ÆÀÁ   Ü Y Â AÂW B@    AÂA  Á `MBNBÂAÂB ÌÂÆÂ CÂ FAKCÃÀ  E \ \C  FAKCÃÀ  E  \ \C  FAKÃÃÀ  @ \C  _A÷     	   nx_value    gui D   form_stage_main\form_relation\form_relation_guild\form_guild_league    nx_is_valid    textgrid_league 	   ClearRow    table    getn                @      ð?
   InsertRow       ð¿   SetGridText    nx_widestr    SetRowTitle     C   g   g   g   i   i   i   j   j   j   j   j   k   k   o   o   o   r   r   r   r   t   t   t   t   t   u   u   y   |   |   |   |   }   }                                                                                                |            arg     B      gui    B      form    B      size    B      rows    B      (for index)    B      (for limit)    B      (for step)    B      i     A      index "   A      row &   A      guild_name (   A      op_time *   A              À     Q   E   @  \    Á   ÅÀ    Ü Ú@  @ Â   Þ  Å  A A Á Á Ü@Æ@BËÂÜ@ ÅÀ Æ Ã   Ü YÀÁ AÃWÀA@    AÃA  Á `
MCNBÃBBÂC ÌÃÆÂ CÃ FCBKCÄÀ Ä E \ \C  FCBKCÄÀ  E  \ \C  FCBKÃÄÀ  @ \C  E C Á  E \ \C  _Aõ     	   nx_value    gui D   form_stage_main\form_relation\form_relation_guild\form_guild_league    nx_is_valid    nx_execute (   form_stage_main\form_main\form_main_map    GuildEnemyList                 textgrid_enemy 	   ClearRow    table    getn        @      ð?
   InsertRow       ð¿   SetGridText    nx_widestr    SetRowTitle     Q                                                                     ¡   ¡   ¡   ¡   £   £   £   £   £   ¤   ¤   ¨   «   «   «   «   ¬   ¬   ®   ®   ®   ®   ±   ±   ´   ´   ·   ·   ·   ·   ·   ·   ·   ·   ¹   ¹   ¹   ¹   ¹   ¹   ¹   ¹   »   »   »   »   »   »   »   ¾   ¾   ¾   ¾   ¾   ¾   ¾   ¾   «   À         arg     P      gui    P      form    P      size    P      rows "   P      (for index) %   P      (for limit) %   P      (for step) %   P      i &   O      index (   O      row ,   O      guild_name .   O      op_time 0   O           Ã   Ü    (   F @ @À Æ@Á  KAÀ\  W@AÀ WA@ ÀA@ B  ^ E A \  À A  @    ÁÂ AB  E   \ Â  À  A            ParentForm    textgrid_league    RowSelectIndex    nx_widestr    GetRowTitle              	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int      °@    (   Å   È   Ê   Ì   Ì   Ì   Ì   Ì   Î   Î   Î   Î   Î   Î   Ï   Ï   Ó   Ó   Ó   Ô   Ô   Ô   Ô   Ô   Õ   Õ   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Û   Û   Ü         btn     '      form    '      grid    '      row    '      guild_name    '      game_visual    '         SUB_CUSTOMMSG_OFF_GUILD_LEAGUE     ß   ü    0   F @ @À Æ@Á  KAÀ\  W@AÀ WA@ ÀA@ B  ^ E A \  À A  @    ÁÂ AB  E   \ Â  À  A   ÁÁ  AB Â  À  A            ParentForm    textgrid_enemy    RowSelectIndex    nx_widestr    GetRowTitle              	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int      °@   nx_execute (   form_stage_main\form_main\form_main_map    GuildEnemyList        @    0   á   ä   æ   è   è   è   è   è   ê   ê   ê   ê   ê   ê   ë   ë   ï   ï   ï   ð   ð   ð   ð   ð   ñ   ñ   õ   õ   õ   õ   õ   õ   õ   õ   õ   õ   õ   ù   ù   ù   ù   ù   ù   ù   ù   û   û   ü         btn     /      form    /      grid    /      row    /      guild_name    /      game_visual    /         SUB_CUSTOMMSG_OFF_GUILD_ENEMY     ÿ         F @ @À Æ@Á  A  EA  \ ZA  @ B  ^ KAÅÁ  Ü Â D   EB \ \A  B ^   
      ParentForm 
   ipt_guild    Text 	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int      °@   nx_widestr              	  	  	  
  
  
  
  
                                        btn           form          ipt          guild_name          game_visual          #   SUB_CUSTOMMSG_REQUEST_LEAGUE_GUILD       (      F @ @À Æ@Á  A  EA  \ ZA  @ B  ^ KAÅÁ  Ü Â D   EB \ \A  B ^   
      ParentForm 
   ipt_guild    Text 	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int      °@   nx_widestr                                   !  !  %  %  %  %  %  %  %  %  %  %  %  '  '  (        btn           form          ipt          guild_name          game_visual             SUB_CUSTOMMSG_ADD_GUILD_ENEMY     +  D   3      Á@   Å  Á@  Á  Ü    AA  E  \ ZA  @ B  ^ KÁAÅ B Ü  D   E \ \A  E  A  \   ÁÁ  Å   Ü ÚA  @ Â  Þ ÆC @ ÉÂ Þ      	   nx_value    gui 
   nx_string    GetGridText            game_visual    nx_is_valid    CustomSend    nx_int      °@   nx_widestr D   form_stage_main\form_relation\form_relation_guild\form_guild_league    redit_guild_name    Text     3   ,  ,  ,  .  .  .  .  .  .  1  1  1  2  2  2  2  2  3  3  7  7  7  7  7  7  7  7  7  7  7  :  :  :  <  <  <  =  =  =  =  =  >  >  A  A  A  A  A  C  C  D        grid     2      row     2      gui    2      guild_name 	   2      game_visual    2      gui !   2      form $   2      "   SUB_CUSTOMMSG_REQUEST_LEAGUE_INFO     G  `   3      Á@   Å  Á@  Á  Ü    AA  E  \ ZA  @ B  ^ KÁAÅ B Ü  D   E \ \A  E  A  \   ÁÁ  Å   Ü ÚA  @ Â  Þ ÆC @ ÉÂ Þ      	   nx_value    gui 
   nx_string    GetGridText            game_visual    nx_is_valid    CustomSend    nx_int      °@   nx_widestr D   form_stage_main\form_relation\form_relation_guild\form_guild_league    redit_guild_name    Text     3   H  H  H  J  J  J  J  J  J  M  M  M  N  N  N  N  N  O  O  S  S  S  S  S  S  S  S  S  S  S  V  V  V  X  X  X  Y  Y  Y  Y  Y  Z  Z  ]  ]  ]  ]  ]  _  _  `        grid     2      row     2      gui    2      guild_name 	   2      game_visual    2      gui !   2      form $   2      "   SUB_CUSTOMMSG_REQUEST_LEAGUE_INFO     c     ]   Å   A  Ü   A   EÁ   \ ZA  @ B  ^ FAIÁFÁAIÂFABIÁBE   ÁA \ ÁCÀ  D AÁA ÄÕÁÁAÁÁ ÅÕÁABÆÄÁA Å   Ü   ÀEÀFÅ  AÂ  Ü  Á FÅ   Ü ÁGAGA  ÁCÀ  ÀE ÆGËÇFÂÇKÈÁB \ÜA  Â  Þ Á   A àÆGGCßAþÂ Þ   "   	   nx_value    gui D   form_stage_main\form_relation\form_relation_guild\form_guild_league    nx_is_valid 
   pic_frame    Image        pic_guild_logo    gui\guild\formback\bg_logo.png    groupbox_logo 
   BackColor    0,255,255,255    util_split_string    #    table    getn       @   gui\guild\frame\       ð?   gui\guild\logo\        @   nx_ws_length    nx_widestr            mltbox_guild_purpose 	   HtmlText    guild_util_get_text    ui_None    listbox_guild_league    ClearString 
   AddString    TextManager    GetFormatText    ui_guild_alliance_none     ]   e  e  e  g  g  g  h  h  h  h  h  i  i  k  k  l  l  m  m  n  n  n  n  o  o  o  o  o  o  p  p  p  p  p  q  q  q  q  q  r  r  r  w  w  w  w  w  w  w  x  x  x  x  x  x  x  x  z  z  z  z  z  }  }  }                                                                logo     \      purpose     \      arg     \      gui    \      form    \   
   logo_info    \      size E   \      (for index) S   Z      (for limit) S   Z      (for step) S   Z      i T   Y      guild_name U   Y       -            	   
                  $      *   '   L   -   W   O   b   Z      e   À      Ü   Ü   Ã   ü   ü   ß       ÿ   (  (    D  D  +  `  `  G    c       #   SUB_CUSTOMMSG_REQUEST_LEAGUE_GUILD    ,      SUB_CUSTOMMSG_OFF_GUILD_LEAGUE    ,      SUB_CUSTOMMSG_OFF_GUILD_ENEMY    ,      SUB_CUSTOMMSG_ADD_GUILD_ENEMY    ,   "   SUB_CUSTOMMSG_REQUEST_LEAGUE_INFO    ,       