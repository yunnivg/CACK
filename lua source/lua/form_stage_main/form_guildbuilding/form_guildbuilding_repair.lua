LuaQ  a   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_guildbuilding\form_guildbuilding_repair.lua           ?      A@  @    A  @    AÀ  @    A  @    A@ @    A @ À d   G  d@      G@ d  G dÀ  GÀ d  G  d@ G@ d G dÀ GÀ d  G  d@ G@ d G dÀ GÀ d  G  d@     G@ d     G dÀ GÀ d      G  d@ G@ d     G         require 	   util_gui    util_functions    share\view_define    share\client_custom_define 0   form_stage_main\form_guild_war\form_guild_chase 6   form_stage_main\form_guildbuilding\sub_command_define =   form_stage_main\form_guildbuilding\form_guildbuilding_repair    on_main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_repair_click    on_btn_max_repair_value_click    on_btn_Minus_click    on_btn_Add_click    on_ipt_1_changed    on_MaterialGrid_mousein_grid    on_MaterialGrid_mouseout_grid    read_repairinfo    read_build_damage_info    get_num_string    refresh_material_num    refresh_capital_num    refresh_endure_info    manage_capital    get_max_repair_value                   	@@        Fixed                     form                   C    L   F @   ÁÀ   I	@A	ÀAE     \@ E@    \@ E À \ @Ã Æ@C À C	  Ä Æ D À C		ÄÀ @  Á   Å@   Ü Ú   @ËEAÁ  Å Ü Â @   Á Ü@Å A Ü A @   ÀÆÁ Á    D  B AÆ Á    D  B AÁÇ À    AB A   "      ipt_1    Text    nx_widestr            DamageStateRate       à?   RuinStateRate ¹?   read_repairinfo    read_build_damage_info 	   nx_value    gui    Left    Width        @   Top    Height    EndureValue       ð¿   refresh_endure_info    timer_game    nx_is_valid 	   Register      @@   nx_current    data_binder    AddRolePropertyBind    CapitalType0    int    refresh_capital_num    CapitalType1    AddViewBind    VIEWPORT_MATERIAL_TOOL    refresh_material_num     L                        "   "   "   %   %   %   (   (   (   +   +   +   +   +   ,   ,   ,   ,   ,   -   0   0   3   3   3   5   5   5   5   5   6   6   6   6   6   6   6   6   6   6   9   9   9   ;   ;   ;   ;   ;   =   =   =   =   =   =   =   >   >   >   >   >   >   >   A   A   A   A   A   A   C         form     K      gui    K      game_timer     K      databinder 2   K      
   FORM_NAME     F   L        E   @   Á  \Z    EÀ  @   Á  \@E     \@         nx_running    nx_current    refresh_endure_info    nx_kill    nx_destroy        G   G   G   G   G   G   G   H   H   H   H   H   K   K   K   L         form                O   U     	   F @ @  À      @ À @         ParentForm    nx_is_valid    Close     	   P   R   R   R   R   R   S   S   U         self           form               X   v     D   F @ @  À   @  @     À  Á   ÅÀ  A Ü A  @ A  @     FÁÁ FÂ E  \  ÅA Ü   @E Á Á B B   \ CÁC Å B AB Å   Ü ÜA  ËÁÄÜA Á  Þ KÅÅ B Ü  E  FÂÅ  \A         ParentForm    nx_is_valid         	   nx_value    gui    game_visual    nx_int    ipt_1    Text    get_max_repair_value    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    TextManager    GetFormatText    ui_guild_repair_unlimit    show_common_text    nx_widestr 
   ShowModal    CustomSend    CLIENT_CUSTOMMSG_GUILDBUILDING    CLIENT_SUBMSG_REPAIR_ENDURE 	   building     D   Y   \   \   \   \   \   ]   ]   `   `   `   b   b   b   c   c   c   c   c   d   d   g   g   g   g   i   i   i   i   i   i   i   i   i   k   k   k   k   k   k   k   l   l   l   l   m   m   m   m   m   m   m   m   p   p   r   r   u   u   u   u   u   u   u   u   u   u   v         self     C      form    C      gui    C      game_visual    C      num    C   	   warn_dlg )   9      text -   9           y        
0   F @ @  À   @      À Å  A  Ü  À ÆÀ ÆÀÀ ÆÀÁ À Æ Â  E Á À  \    É Å À Á@Ü AÃ Î Ã E  ÅÁ  AÂ Ü  \  	A A         ParentForm    nx_is_valid    ipt_1    Text    nx_widestr    get_max_repair_value 
   nx_number    CapitalType0    mltbox_jinzi 	   HtmlText 
   nx_string    manage_capital            CapitalType1    mltbox_yinzi       ð?   refresh_material_num     0   z   |   |   |   |   |   }                                                                                                                                    self     /      form    /      capital    /   	   capital1 #   /                   
9   F @ @  À   @        ÆÀÀ Æ Á  
ÀÀ Å   FÁÀ FÁ ÁAÜ À   ÆÀÀ Æ Á Æ Â À Æ@Â  EÁ  À B \    É Å  ÁÀ AÜ AÃ Î Ã E Á Å  AÂ Ü  \  	AÀ @         ParentForm    nx_is_valid 
   nx_number    ipt_1    Text            nx_widestr       ð?   CapitalType0    mltbox_jinzi 	   HtmlText 
   nx_string    manage_capital    CapitalType1    mltbox_yinzi    refresh_material_num     9                                                                                                                                                                                    self     8      form    8      capital    6   	   capital1 ,   6           ¢   ´     
=   F @ @  À   @        ÆÀÀ Æ Á Å  A  Ü  À  
ÀÀ Å   FÁÀ FÁ ÁAÜ À   ÆÀÀ Æ Á Æ Â À Æ@Â  EÁ  À B \    É Å  ÁÀ AÜ Ã Î ÁÃ E Á Å  AÂ Ü  \  	A  @         ParentForm    nx_is_valid 
   nx_number    ipt_1    Text    get_max_repair_value    nx_widestr       ð?   CapitalType0    mltbox_jinzi 	   HtmlText 
   nx_string    manage_capital            CapitalType1    mltbox_yinzi    refresh_material_num     =   £   ¦   ¦   ¦   ¦   ¦   §   ª   ª   ª   ª   ª   ª   ª   ª   ª   ª   «   «   «   «   «   «   «   «   «   ¬   ¬   ¬   ¬   ¬   ¬   ­   ­   ­   ­   ­   ­   ­   ­   ­   ­   ¯   ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   °   °   °   ³   ³   ´         self     <      form    <      capital     :   	   capital1 0   :           ·   Û     j   F @ @  Á   ÅÀ    Ü Ú@      Æ A A AEÁ \ Á Á  Á  W@B Â Å Â EB  Á \  Ü  ÁÁÃ Å Â EB  Á \  Ü  Á Á  	  A À ÅA Ä Ü ÀÁ ÆÄ  À   À 	Á A Å Å B E \   Ü  Á ÆA  ÆÁÅ ÁÆÂ  EÂ B À  \    ÉÅ Æ AÜ BÆ ÎÂÃ E Â ÅB  A Ü  \  	B        ParentForm 	   nx_value    gui    nx_is_valid    Text    string    find 
   nx_string    -     mltbox_jinzi 	   HtmlText    nx_widestr    manage_capital            mltbox_yinzi    0    nx_int    MaxRepairValue    refresh_material_num    lbl_BurnPointTime    get_format_time 
   nx_number    CapitalType0    ipt_1    CapitalType1       ð?    j   ¸   ¹   ¹   ¹   ¼   ¼   ¼   ¼   ¼   ½   À   Â   Â   Â   Â   Â   Â   Â   Â   Â   Ä   Ä   Å   Å   Å   Å   Å   Å   Å   Å   Å   Å   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Ç   Ç   Ç   Ç   È   Ë   Ë   Ë   Ë   Ë   Ë   Ë   Ë   Ì   Ì   Ì   Ì   Í   Í   Í   Í   Ñ   Ñ   Ô   Ô   Ô   Ô   Ô   Ô   Ô   Ô   Ô   Ö   Ö   Ö   Ö   Ö   ×   ×   ×   ×   ×   ×   ×   ×   ×   ×   Ù   Ù   Ù   Ù   Ù   Ù   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Û         self     i      form    i      gui    i      ipt_str    i      start_index    i   
   end_index    i      capital O   i   	   capital1 _   i           Þ   ð     4    @ Å@    Ü Ú@      Å    AÁ  ÜÚ@      ÆÀ@À @Å  A Ü ÁÁBA Á  ÅA Â @  ÅB CÃ Ü ÂÜ  Á  AÁ  ÅA  Ü D  KÂD \  ÁB A         ParentForm    nx_is_valid    nx_find_custom    mark_material_num 	   nx_value    gui 
   tips_text    TextManager    GetFormatText 
   nx_string    desc_ 
   nx_custom 	   material       ð?   nx_execute 
   tips_game    show_text_tip    nx_widestr    GetMouseInItemLeft    GetMouseInItemTop      Àb@      @@    4   ß   â   â   â   â   â   ã   æ   æ   æ   æ   æ   æ   ç   ê   ê   ê   ë   ë   ë   í   í   í   í   í   í   í   í   í   í   í   í   í   í   í   í   í   í   î   î   î   î   î   î   î   î   î   î   î   î   î   ð         grid     3      index     3      form    3      gui    3           ó   õ           Á@    @        nx_execute 
   tips_game 	   hide_tip        ô   ô   ô   ô   õ         grid           index                ù   g    "=  E      \ Z@      E@    ÁÀ   \    À   @  À@ Á Á A  Õ @   @ Á  ËÀBE AC \ Ü    @      @  A       KÃÁÁ \  E Ã \   ËÃAB Ü  ËÄ Ü  AÂ ÅÁ `BKCÅ À \ KÅ À Ä AÄ \ KÅ À  AÄ \@ÀKÅ À  AÄ \    _ùKBÆ À \ÀÄ    ÂÆ  A Ã 	ÂÆ  A Ã 	ÂÆ  AC Ã 	Å  A Ã 	ÂG ÅB  KÅ ÀÄ AÄ \  Ü  ÂÅ  A	 Ã WÀE ÆBI   AÃ	 CÉÆJ C FCG  ÉÅB
 F Ü ÀÄÀÅB
 G Ü ÀÄÆJ ÉËÆBK ÉËÆÂK ÆÌÃK KÌÌBÌ	ÀÆL K FL FÌCFÃL FÌCMÉ   ÅB    ÜB ÆG ÀÅÀÆBK ÉËÆJ ÆÌJ KÌÌBÌ	ÀÆL K FL FÌCFÃL FÌCMÉ  ÆG  @Ã EC  \ C ÁC  ÆN ËÃÎÜC ÅC    AÄ   Ü D @ ÀE  
Á \FÅ
 À 
 ÅOW Ð
ÀÅE    A  À	 U
ÜE ÅE    AÆ  À	 U ÜE 	À¢ËEÆ@
ÜÀÀ
F AF  EF Å AÇ Ç \  F Á  FN KÆÑÍÅ	 KÅÀ	 AÈ \  EG Ç \ Ç Á \FFN KFÒÍÅ	Ç EG  \ \F  FN KÒÍÅ	Ç B \F!  @ëÄ D   L      nx_is_valid    nx_execute    util_functions    get_ini %   share\Rule\guild_building_repair.ini 
   nx_msgbox &   share\Rule\guild_building_repair.ini     get_msg_str    msg_120 	   nx_value    game_client    GetSceneObj 
   nx_string 	   building 
   QueryProp 	   MainType    SubType 	   CurLevel    GetSectionCount               ð?   GetSectionByIndex    ReadString        Level    FindSectionIndex    CapitalType0    ReadInteger    CapitalType1 
   MaxEndure    Needed_Item_Num 	   lbl_Name    Text    nx_widestr 
   util_text    Name    Photo    lbl_buliding_photo 
   BackImage    .png    lbl_MaxEndure 
   nx_number    groupbox_3    Visible     groupbox_4    Height    groupbox_2    Top       I@   lbl_bg_main    lbl_line_2       $@   refresh_capital_num    util_split_string    ;    gui 
   GoodsGrid    MaterialGrid    Clear    share\Item\tool_item.ini    ipairs    :        @    nx_set_custom 	   material    materialnum    mark_material_num 	   <center> 
   </center>    AddItem       ð¿   SetItemAddInfo    ShowItemAddInfo    refresh_material_num     =  û   û   û   û   û   ü   ÿ   ÿ   ÿ   ÿ   ÿ                                             
  
  
  
  
  
  
  
  
  
                                                                                                                   #  #  #  #  #  #  $  $  $  $  $  $  %  %  %  %  %  %  &  &  &  &  &  &  )  )  )  )  )  )  )  )  )  )  )  ,  ,  ,  ,  ,  -  -  .  .  .  .  .  1  1  1  1  1  4  4  4  4  4  4  4  4  4  4  5  5  6  6  7  7  7  7  7  7  7  9  9  9  9  9  9  9  9  9  9  :  :  <  <  <  @  @  @  A  A  B  B  B  B  B  B  B  E  E  E  E  E  E  E  E  E  E  G  J  K  K  K  K  M  M  M  N  N  N  O  O  O  Q  Q  Q  Q  Q  R  R  R  R  S  S  S  S  S  T  T  T  T  T  V  V  X  X  X  X  X  X  X  X  X  Y  Y  Y  Y  Y  Y  Y  Y  Y  Z  [  [  [  \  \  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  _  _  _  _  _  _  _  _  `  `  `  `  `  `  R  b  f  f  g        form     <     ini    <     game_client    <     build_object     <  	   mainType 0   <     subType 5   <     level :   <  
   sec_count <   <     sect =   <     (for index) @   \      (for limit) @   \      (for step) @   \      i A   [      index _   <     guild_photo    <     material_str Ò   <     str_lst Ö   <     gui Ù   <     goods_grid Ü   <  	   ini_item ä   <     (for generator) ç   :     (for state) ç   :     (for control) ç   :     i è   8     v è   8     material_id í   8     material_num ò   8     index1 
  8     name   8          j  ~    +   E      \ Z@      E@    ÁÀ   \    À   @  À@ Á Á A  Õ @   @Â  ÀB    Ë@Ã @  Á Ü	À Ë@Ã @ Á Á Ü	À        nx_is_valid    nx_execute    util_functions    get_ini (   share\InterActive\Arsonist\arsonist.ini 
   nx_msgbox )   share\InterActive\Arsonist\arsonist.ini     get_msg_str    msg_120    FindSectionIndex    build            DamageStateRate 
   ReadFloat       à?   RuinStateRate ¹?    +   l  l  l  l  l  m  p  p  p  p  p  r  r  r  r  r  s  s  s  s  s  s  s  t  w  w  w  x  x  y  |  |  |  |  |  |  }  }  }  }  }  }  ~        form     *      ini    *      index    *                
:      Ä    Å@    Ü Á  @  A    Þ  @   EA   \ A  À   Õ EA  A \ A  Á  ÅA    Ü B  AÂ  Õ Þ   EA   \ A  À   ÅA   Ü ÕÀ EA   \ A  ÁÁ  ÕÞ    	   	   nx_value    nx_widestr        nx_is_valid    <center><font color="#FF0000">    </font>    / 
   </center> 	   <center>     :                                                                                                                             bag_num     9      repair_need_num     9      form    9      return_str    9      
   FORM_NAME       ³    J      D    E@     \ Z@      E     \ @  À   @      À  À    @      @ Æ A A  
Á Â E   ÁB Ã @ Õ\    Å ÂB CÜ  @  B ÅÂ  Ü ÂÎ @ FÂC KÄÍBÁC EC  \ \B  FÂC KÄÍBÁC B \BÀô     	   nx_value    nx_is_valid 
   GoodsGrid    nx_find_custom    mark_material_num       ð?   GetItemCount 
   nx_string 
   nx_custom 	   material 
   nx_number    ipt_1    Text    materialnum    get_num_string    MaterialGrid    SetItemAddInfo    nx_widestr    ShowItemAddInfo     J                              £  £  £  £  £  ¤  §  §  §  §  §  §  ¨  «  «  «  «  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ­  ­  ­  ­  ­  ­  ­  ­  ­  ­  ­  ­  ­  ®  ®  ®  ®  °  °  °  °  °  °  °  °  ±  ±  ±  ±  ±  ±  «  ³  	      form    I      goods_grid    I      (for index)    I      (for limit)    I      (for step)    I      i    H      count )   H      repair_cout 6   H      num_string :   H      
   FORM_NAME     ¶  Å    7   E      \ Z@      E@     Á  \Z   @EÀ   A @A\ À  Æ@  N A Å  A E  ÁÁ \  Ü  ÀE@     Á  \Z   @EÀ   A @A\ À  Æ C  N @C Å  A E  Á \  Ü  À        nx_is_valid    nx_find_custom    CapitalType0 
   nx_number    ipt_1    Text    mltbox_jinzi 	   HtmlText    nx_widestr 
   nx_string    manage_capital            CapitalType1    mltbox_yinzi       ð?    7   ¸  ¸  ¸  ¸  ¸  ¹  ¼  ¼  ¼  ¼  ¼  ¼  ½  ½  ½  ½  ½  ½  ½  ½  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  Á  Á  Á  Á  Á  Á  Â  Â  Â  Â  Â  Â  Â  Â  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Å        form     6      capital       	   capital1 ,   6           È      j      D    E   @  \   À    @      À@ Å    Ü AÁ À    E  \ Z   E   \ ZA      KÁAÁ \ÁAB @ÆÁB B E Â À  \    É ÆÁB B A  ÉÆAD @    ÆD ÂD ÎÀÆE BÅ EÂ É@ÆD F ÎÀÆE BÅ EB É@ÆE BÅ E É	@ÆD BD Í	ÀÆG B FBD  ÉÆAG BD ÉÆAG D É      	   nx_value    gui    nx_is_valid 	   building    game_client    GetSceneObj 
   nx_string 
   QueryProp    GuildBuildEndure    GuildBuildRepairingEndure            lbl_repair_time    Text    nx_widestr    get_format_time 
   nx_number 	   00:00:00    EndureValue 
   MaxEndure    RuinStateRate    lbl_build_state    TextManager    GetText 
   ui_sunhui    DamageStateRate    ui_sunshang    build_state_lab_normal    MaxRepairValue    lbl_Endure    pbar_Endure    Value    Maximum     j   É  É  É  Ë  Ë  Ë  Î  Î  Î  Î  Î  Ï  Ò  Ó  Ó  Ó  Ô  Ô  Ô  Ô  Ô  ×  ×  ×  ×  ×  ×  ×  ×  ×  ×  Ø  Ü  Ü  Ü  ß  ß  ß  â  â  ã  ã  ã  ã  ã  ã  ã  ã  ã  ã  å  å  å  å  å  é  é  é  ê  î  î  î  î  î  ï  ï  ï  ï  ï  ï  ï  ð  ð  ð  ð  ð  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ó  ó  ó  ó  ó  ó  ö  ù  ù  ù  ù  ü  ü  ü  ü  ü  ÿ  ÿ  ÿ                   form    i      gui    i      buildid    i      game_client    i      build_object    i      cur_endure #   i      cur_repair_endure &   i      
   FORM_NAME       -    g      @@Ï@  Å   Æ@À@ Á@Ü   A@PÁ@  E A \  ÁÁ   ÆAÂËÂAÂ Ü @  E \ AÀ ÀÆAÂËÂA Ü  E \  À  ÀÆAÂËÂAB Ü  E  \  À  B À Å  Ü Å  Ü ÂÃ A B À  UDC @     @Å Ã Ü   E  \ ÕBÞ  Å C Ü   E  \ ÕBÞ         math    floor     .A     @@	   nx_value    gui    nx_widestr                TextManager    GetText    ui_ding 	   ui_liang    ui_wen    game_client 
   GetPlayer    CapitalType 
   nx_string 
   QueryProp    <center><font color="#FF0000">    </font></center> 	   <center>     g                             
  
  
                                                                                                          #  #  #  $  $  %  %  %  %  %  &  &  &  &  &  (  (  )  )  )  )  )  )  )  )  )  )  +  +  +  +  +  +  +  +  +  -        capital     f      capital_type     f      ding    f      liang 	   f      wen    f      gui    f      text_money    f      text           text &   .      text 4   <      game_client E   f      client_player G   f      capital_name L   f      capital_player Q   f           0  v    ¥      D    E@     \ Z@      A  À@ W A@   Á@  Å    AÁ ÜÚ@      Á  ÁA A àËABE Â À   E  \ C\  Ü  Â @  B Å   Ü ÂE  \ WÀÃ@ÀÃ @E FBÄ\ @ @E FBÄ\  À   E FBÄ\ @ ßÀó ÆD  ÀC  ÆÀD  WÀC   Á   Ë@EÜ Å KÅÁÁ \ ÆD  WÀC ÀÃ  ADÆD ÏÁ @  À ADÆD ÏÁ Å   Ü À@ ADÆD ÏÁ @   ÆÁD  WÀC ÀÃ  ADÆÁD ÏÁ @  À ADÆÁD ÏÁ Å   Ü À@ ADÆÁD ÏÁ @  ÀE @   FÀE ÀÃ   AÀ ^       	   nx_value    nx_is_valid       ð¿   Needed_Item_Num     
   GoodsGrid    nx_find_custom    mark_material_num       ð?   GetItemCount 
   nx_string 
   nx_custom 	   material    materialnum 
   nx_number            math    floor    CapitalType0    CapitalType1    game_client 
   GetPlayer 
   QueryProp    MaxRepairValue     ¥   1  1  1  4  4  4  4  4  5  9  <  <  <  =  =  =  >  >  >  >  >  >  ?  B  B  B  B  C  C  C  C  C  C  C  C  C  C  C  C  D  D  D  D  D  D  D  D  F  F  F  F  F  H  H  I  I  I  I  I  I  J  J  J  J  J  J  J  J  J  K  K  K  K  K  B  R  R  R  R  R  R  R  R  R  R  S  S  S  T  T  V  V  V  W  W  W  Y  Y  Y  Y  Y  [  [  \  \  \  \  \  \  \  ]  ]  ]  ]  ]  ]  ]  ]  ]  ]  ^  ^  ^  ^  ^  ^  b  b  b  b  b  d  d  e  e  e  e  e  e  e  f  f  f  f  f  f  f  f  f  f  g  g  g  g  g  g  m  m  m  n  q  q  r  u  v        form    ¤      repair_value 
   ¤      goods_grid    K      (for index)    K      (for limit)    K      (for step)    K      i    J      count '   J      repair_cout /   J      game_client X         client_player Z      	   capital0 ]      	   capital1 `         
   FORM_NAME ?   	   	   	   
   
   
                                                C   C      L   F   U   O   v   X      y         ´   ¢   Û   ·   ð   Þ   õ   ó   g  ù   ~  j        ³  ³    Å  ¶      È  -    v  v  0  v     
   FORM_NAME    >       