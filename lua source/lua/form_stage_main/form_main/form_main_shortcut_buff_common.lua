LuaQ  ]   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_main\form_main_shortcut_buff_common.lua           S      A@  @    A  @    AÀ  @    A  @    A@ @    A @    A  @    AÀ @    A  @    A  @    A@ @    A  @    A@  @    A @    AÀ @   A@ ¤    ¤@  À ¤    ¤À  @ ¤   ¤@    À ¤   ¤À @ ¤   ¤@ À ¤   ¤À @ ¤   ¤@ À ¤   ¤À @ ¤           require    define\gamehand_type    util_static_data    share\client_custom_define    goods_grid    share\view_define    util_functions 	   util_gui    player_state\state_input    tips_func_skill %   form_stage_main\switch\switch_define    share\itemtype_define       $@9   form_stage_main\form_main\form_main_shortcut_buff_common    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_skill_change    delay_show_form    on_show_skillgrid    refresh_shortcut_key    on_close_common_skill_grid    on_select_changed    on_rightclick_grid    show_circle_select    use_circle_select_skill    get_ini_value    on_mousein_grid    on_mouseout_grid    shortcut_buff_common_view           $        	@@	À@A  ^          Fixed     no_need_motion_alpha       ð?           !   #   #   $         self                '   V     I   E   @  \   À   @         ÁÀ   Å    Ü Ú@      Å    Ü AÁE Á \  ÁA ÁIÂ A  À Á ÀA   ÃB A Â ËÃAB  ÁÂ ÜÀCÀÀÃ@BÄ FBD BD	 ÂÄ EFE BFBEFÅB	 @ 		ÀÂ @B 	ÀE	ÀE     	   nx_value    gui    nx_is_valid -   form_stage_main\form_main\form_main_shortcut    game_config    login_account 
   nx_create    IniDocument 	   FileName    \shortcut.ini    LoadFromFile    nx_destroy    ReadInteger    shortcut_buff_common    Left            Top    Width        @   Desktop    Height    groupbox_shortcut_1    isshortcut_grid       ð?   isitemskill_grid     I   +   +   +   -   -   -   -   -   .   1   1   1   3   3   3   3   3   4   7   7   7   8   9   9   9   <   <   <   <   =   =   =   =   >   >   >   ?   B   B   B   B   B   C   C   C   C   C   E   E   E   E   F   F   F   F   F   H   H   H   H   H   H   H   H   H   J   K   P   P   P   T   U   V         self     H      gui    H      shortcut_grid    H      game_config    H      account    H      ini    H      left *   H      top /   H           Y   u     	.   	@@	@@	 ÁE@  \ ÀÁ Å  A Ü   AÁ AÉ Ã A  À A @A   ÃÁ Á D AÃÁ ÁA BD AÄA A @A Á @      A @  A         isshortcut_grid       ð?   isitemskill_grid    isclose_shortgrid       ð¿	   nx_value    game_config    login_account 
   nx_create    IniDocument 	   FileName    \shortcut.ini    LoadFromFile    nx_destroy    WriteInteger    shortcut_buff_common    Left    Top    SaveToFile    nx_is_valid     .   [   \   ]   _   _   _   `   a   a   a   c   c   c   c   d   d   d   d   e   e   e   f   i   i   i   i   i   j   j   j   j   j   l   l   n   n   n   q   q   q   q   q   r   r   r   u         form     -      game_config    -      account    -      ini 
   -           w   ~        F @ @  À      Àÿ        ParentForm    nx_is_valid        y   {   {   {   {   {   ~         btn           form                  §     T     AA   K@ÅÁ   Ü \  AÁÂ  @   Å   Ü ÚA      Å  Â Ü  @ B      BB A ÂB CÁ `BKCÃÀ    \  À C   	Ã ÀD   CÂÅÃ    Ü Ä  KBÁD \   ÀËBA ÜWÂ@ @ÄD Ä À  Â D @D Ä À  Â  D _ô     	   nx_value    game_client    GetView 
   nx_string    VIEWPORT_SKILLITEM_BOX    GetViewObj    nx_is_valid 
   GoodsGrid 
   QueryProp 	   ConfigID         	   ClomnNum       ð?   GetItemData    nx_is_null    nx_find_custom    CanUse     ChangeItemImageToBW    nx_int     T                                                                                                                                                                                                                                       ¡   ¡   ¡   ¡   ¡   ¡      §         grid     S      optype     S      view_ident     S      index     S      game_client    S      view    S      viewobj    S   
   GoodsGrid    S   	   configid    S      (for index) #   S      (for limit) #   S      (for step) #   S      i $   R      item (   R      skillid 4   R      canuse A   R           ©   J  #     À    @      @  @À   ÆÀ@  AA  E   \ Z   KAÀ\AE Á \   À A      ÂB E    Å    Ü ÚA      ËÁBÜ ÂB Å    E   \ ZB   EB   Â  \B  KCÁÂ \ À Å C Ü WÀ  	ÀDEC B   B Ä    B  EC @D ÅB   B  ÜB  ÁB Ã @ Ã  CFD ÍÄÅE AÄ ÁÄ `ÄKEFÍÅE
\E À  ÅE Ã
 Ü  ÀÅÆÆÅE Ç
\ E    ËEÇ
Ü  @À KÃ
À \E!  @þ KÃ
Á \Æ  KÃ
Á \F  AF  E   \ Z   E Æ Å	 Ü \   À  ÅG	  @ ÜG ¡   þI MÇÅFKÃ
ÁÆ	 \W@Ä@  ÊFÊ MÇÅ B F @FÊ MÇÅ B  F ÌÂÅ_çåÃ@ NÃÊ	CK FÃ@ FÊLCË	CK FK FÊLÃË	CK JÃK	 D @DÀ A  E C \   À    @LÀL@ 	@D  	ÃL  À   @ÌÀL@ 	@Ä  IÃL AÃ C Á  C  9      nx_is_valid    table    getn    imagegrid_1 	   nx_value 
   GoodsGrid 
   GridClear    game_client    GetView 
   nx_string    VIEWPORT_SKILLITEM_BOX    GetViewObjCount    VIEWPORT_USING_BUFF_BOX    util_show_form 
   QueryProp    IsCloseOtherGrid    nx_int            isclose_shortgrid       ð¿   FindRecord    usingbuff_skillid    GetRecordRows       ð?   QueryRecord    GetViewObjByIndex 	   ConfigID    SetBindIndex    Ident    GetPropList    pairs    CoolDownCategory    skill_static_query_by_id    CoolDownTeam 
   nx_create 
   ArrayList    nx_current    nx_set_custom    GridAddItem    CanUse     ChangeItemImageToBW    Width       H@   lbl_s_back      Q@   gbox_skill       D@-   form_stage_main\form_main\form_main_shortcut 7   form_stage_main\form_main\form_main_shortcut_itemskill    Visible     isshortcut_grid    isitemskill_grid    nx_execute 	   util_gui 9   form_stage_main\form_main\form_main_shortcut_buff_common       «   «   «   «   «   ¬   ¯   ¯   ¯   ¯   ·   ¹   ¹   ¹   º   º   º   º   º   »   »   »   ¾   ¾   ¾   À   À   À   À   À   Á   Å   Å   Å   Å   Å   Ç   Ç   Ç   Ç   Ç   È   Ë   Ë   Ï   Ï   Ï   Ï   Ï   Ð   Ð   Ð   Ð   Ð   Ó   Ó   Ó   Ó   Ô   Ú   Ú   Ú   Û   Û   Û   Û   Û   Û   Û   Û   Ü   à   à   à   à   à   ã   ã   ã   ã   ä   é   é   é   ê   ê   í   í   í   í   î   ò   ó   ó   ó   ó   ö   ö   ö   ö   ö   ø   ø   ø   ø   ù   ù   ù   ú   ú   ú   ú   ú   ú   ú   ú   ú   ú   ü   ü   ü   ü   ü   ü   ÿ                                                         
  
  
                                                                                              !  ø   ó   (  (  (  )  )  )  )  )  -  -  -  -  -  .  .  .  .  1  1  1  3  3  3  4  4  4  6  6  6  6  6  7  7  7  8  8  ;  ?  ?  ?  ?  ?  @  @  @  A  A  C  H  H  H  H  H  H  J  '   $   form_main_shortcut_common_skillgrid          arg          nCount 
        grid      
   GoodsGrid         game_client         view $        skill_count ,        view_skill 1     	   is_close >        rows T        index \        (for index) _   Ë      (for limit) _   Ë      (for step) _   Ë      i `   Ê   	   skill_id e   Ê      (for index) h   Ê      (for limit) h   Ê      (for step) h   Ê      j i   É      skill l   É      prop_table }   É   	   proplist    É      (for generator)          (for state)          (for control)          i          prop       
   GoodsGrid    É   
   item_data ¤   ´      (for generator) §   ¯      (for state) §   ¯      (for control) §   ¯      prop ¨   ­      value ¨   ­      canuse ·   É      shortcut_grid â   û      itemskill_shortcut_grid å   û         FORM_BUFF_SKILL     M  w    	8   F @ @  Á   ÅÀ    Ü Ú@      @ Å@ AÜ A A  W   ÀAÅ  A Ü  A  A  ÀEÁ \ Á Á  WÀEA  \A E A \ À E  \  @úEÁ  Å    Ü \A             ð?   util_get_form 9   form_stage_main\form_main\form_main_shortcut_buff_common    nx_is_valid    isclose_shortgrid    nx_int               ð¿	   nx_value    stage_main    loading 
   nx_string    success 	   nx_pause       à?   delay_show_form    unpack     8   N  Q  Q  Q  Q  S  S  S  S  S  T  W  Y  Y  Y  Y  Y  Y  Y  Y  Z  a  a  a  b  b  b  d  d  d  d  d  d  d  d  d  d  e  e  e  f  f  f  f  g  g  g  g  g  j  j  j  j  j  j  w        arg     7      Isshow_other_grid    7   $   form_main_shortcut_common_skillgrid    7      stage_main_flag    7      loading_flag    7           z       Y      A@   E     \ Z@      E   À  \   À   @       A Å ÁÁ  Ü  À@B Å ÁÁ  Ü  ÀÀB Å ÁÁ  Ü  À@C Å ÁÁ  Ü  ÀÀC Å ÁÁ  Ü  À@D Å ÁÁ  Ü  ÀÀD Å ÁÁ  Ü  À@E Å ÁÁ  Ü  ÀÀE Å ÁÁ  Ü  À@F Å ÁÁ  Ü  À     	   nx_value 9   form_stage_main\form_main\form_main_shortcut_buff_common    nx_is_valid    ShortcutKey    lbl_1    Text    nx_widestr    GetKeyNameByKeyID    Key_MainShortcutGrid_Index1    lbl_2    Key_MainShortcutGrid_Index2    lbl_3    Key_MainShortcutGrid_Index3    lbl_4    Key_MainShortcutGrid_Index4    lbl_5    Key_MainShortcutGrid_Index5    lbl_6    Key_MainShortcutGrid_Index6    lbl_7    Key_MainShortcutGrid_Index7    lbl_8    Key_MainShortcutGrid_Index8    lbl_9    Key_MainShortcutGrid_Index9    lbl_10    Key_MainShortcutGrid_Index10     Y   {  {  {  |  |  |  |  |  }                                                                                                                                                                        form    X      shortcut_keys    X             ­     #      A@    E     \ Z@      EÀ    \ À  Á@  Å    Ü Ú     IÀAÅ    Ü Ú     ÀA	@BÆB ËÀÂÜ@ Ë C Ü@         util_get_form 9   form_stage_main\form_main\form_main_shortcut_buff_common    nx_is_valid 	   nx_value -   form_stage_main\form_main\form_main_shortcut 7   form_stage_main\form_main\form_main_shortcut_itemskill    Visible    isclose_shortgrid       ð¿   imagegrid_1    Clear    Close     #                                               £  £  £  £  £  ¤  ¨  ª  ª  ª  «  «  ­     $   form_main_shortcut_common_skillgrid    "      shortcut_grid    "      itemskill_shortcut_grid    "           °  ²          À     @        on_rightclick_grid        ±  ±  ±  ±  ²        grid           index                µ      c    @ Å@    Ü Ú@      Å  Á  Ü ÁA Å    EA   \ ZA      KÁA À \BB @   ÅA    Ü ÚA      	ËBAÂ Ü EB  ÀÃ A \  EB  Á \ÀÄ   Á  ÅB    Ü ÚB      ËBE@ ÜWÅ@ ÀÅ  ÀC @  ÀE C À À \CÀ  ÁÂ  ÅB    Ü Ú  ÀËGEC  \ C À ÜB          ParentForm    nx_is_valid 	   nx_value    game_client    GetView 
   nx_string    VIEWPORT_SKILLITEM_BOX    GetBindIndex    GetViewObj    right_click_itemskill 
   QueryProp 	   ConfigID 
   nx_number    get_ini_value    share\Skill\skill_new.ini    StaticData    0    skill_static_query    TargetType       ð?   fight    GetReplayeSkillID         CoolDownCategory    skillid    show_circle_select    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_USE_ITEMSKILL     c   ·  ¸  ¸  ¸  ¸  ¸  ¹  ¼  ¼  ¼  ¾  ¾  ¾  ¾  ¾  ¿  ¿  ¿  ¿  ¿  À  Ã  Ã  Ã  Ä  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Æ  É  Ê  Ê  Ê  Ì  Ì  Ì  Ì  Ì  Ì  Ì  Ì  Í  Í  Í  Í  Ï  Ï  Ñ  Ñ  Ñ  Ò  Ò  Ò  Ò  Ò  Ó  Ö  Ö  Ö  ×  ×  ×  ×  Ù  Ü  Ü  Ü  Ü  Þ  ß  ß  ß  ß  ß  ß  ß  á  á  á  â  â  â  â  â  ã  ã  ã  ã  ã  ã  ã  ã          grid     b      index     b      form    b      game_client 
   b      view    b      skillident    b      skill    b      skillid '   b      static_data /   b      target_type 3   b      fight 8   Q      replace_id A   Q   
   cool_type J   Q      game_visual U   b             C    y      Á@   Å    Ü Ú@      ÆÀ@Ë ÁEA  \ A Á  Ü  Ú     AÁ  E   \ Z  @KBÅA  Ü Â \A   C	Ã  AÁ  E   \ Z  À KADÀ  \G A Á Å  C  A A ÅA  @  Â Á Ü  ÅÁ B @  Ü  B EB ÅÂ  Ü  AC \  EB B ÀÃ @ A C \    ÁÂ  Å    Ü ÚB      ËHEC Ã À  Á ÜHÃ ÅÃ  Ü 	 EC	 	 ÁÃ	 ÄÂ@  \C   (   	   nx_value    gui    nx_is_valid    CoolManager 
   IsCooling    nx_int       ð¿   SystemCenterInfo    ShowSystemCenterInfo 
   util_text    8029        @	   GameHand    wait_buff_skill       ð?   SkillQuery    skill_type    GetSkillType #   share\Skill\skill_lock_varprop.ini 
   nx_number %   share\Skill\skill_normal_varprop.ini    get_ini_value    share\Skill\skill_new.ini    StaticData    0    skill_static_query    MinVarPropNo 
   nx_string    HitShapePkg    -1    TargetShapePkg    data_query_manager    Query    STATIC_DATA_SKILL_HITSHAPE    HitShapePara2    STATIC_DATA_SKILL_TARGETSHAPE    TargetShapePara2    nx_execute    game_effect    add_ground_pick_effect     y                                                                         #  #  &  &  &  '  '  '  '  '  (  (  (  (  ,  -  -  -  -  -  .  2  2  2  2  2  2  2  2  5  5  5  5  5  5  7  7  7  7  7  7  7  7  7  7  8  8  8  8  8  8  8  8  8  8  :  :  :  ;  ;  ;  ;  ;  <  ?  ?  ?  ?  ?  ?  ?  @  @  @  @  @  @  @  B  B  B  B  B  B  B  C     	   skill_id     x   
   cool_type     x      gui    x      is_cool    x      SystemCenterInfo    #      skill_query (   x      varprop_paht 2   x      static_data @   x      var_pkg F   x      hit_shape_pak P   x      target_shape_pak Z   x      data_query ]   x   
   hit_shape j   x      target_shape q   x           F  ^     4      A@     E     \ Z@      EÀ     Á  \Z@      F A W@Á @ Á     À Á   Å    Ü Ú@      ÅÀ A Ü   @   ÂÁ Å  ÅA   Ü CFÂCDA        util_get_form 9   form_stage_main\form_main\form_main_shortcut_buff_common    nx_is_valid    nx_find_custom    skillid      	   nx_value    ground_pick_decal    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_USE_ITEMSKILL 
   nx_string    PosX    PosY    PosZ     4   G  G  G  G  H  H  H  H  H  I  L  L  L  L  L  L  M  P  Q  Q  Q  Q  R  U  U  U  V  V  V  V  V  W  Z  Z  Z  [  [  [  [  [  \  \  \  \  \  \  \  \  \  \  \  ^        form    3      skillid    3      decal    3      game_visual #   3           a  m         @   EA   \ ZA    Þ  K@À \ÀÀ  Þ  A @           get_ini    nx_is_valid    FindSectionIndex            ReadString        b  b  b  b  c  c  c  c  c  d  g  g  g  h  h  i  l  l  l  l  l  l  m     	   ini_path           section           key           defaut           ini          index               o  }           Á@   Å    Ü Ú@      ËÀ@@   Ü   @ A       AA  ÀÂA  KB \ B ÁB B A     	   nx_value 
   GoodsGrid    nx_is_valid    GetItemData    nx_execute 
   tips_game    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop       @@   ParentForm         p  p  p  q  q  q  q  q  r  t  t  t  t  v  v  v  v  v  w  {  {  {  {  |  |  |  |  |  |  |  {  }        grid           index        
   GoodsGrid       
   item_data                           Á@    FÁ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm                          grid           index                       
      A@   E  @  ÁÀ   AA \@     	   nx_value 9   form_stage_main\form_main\form_main_shortcut_buff_common    nx_execute    on_show_skillgrid                 
                             form_buff_common    	       S   	   	   	   
   
   
                                                                                                                              $      V   '   u   Y   ~   w   §      J  J  ©   w  M    z  ­    ²  °    µ  C    ^  F  m  a  }  o                  MAXGRIDSIZE .   R      FORM_BUFF_SKILL /   R       