LuaQ  O   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_stall\form_stall_sell.lua           I      A@  @    A  @    AÀ  @    A  @    A@ @    A @    AÀ @    A  @ @ d   G d@  GÀ d  G  dÀ      G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G    !      require    share\client_custom_define    share\logicstate_define    share\view_define    define\gamehand_type 	   util_gui    util_functions    custom_sender 	   util_vip       N@   main_form_init    on_main_form_open    getIniValue    setGridCount    on_sell_viewport_changed    RefreshSell    RefreshGrid    add_sell_by_rightclick    on_sell_grid_select    on_btn_clear_click    custom_offline_sell_add_item    on_sell_grid_rightclick_grid    custom_sell_remove_item    on_sell_grid_doubleclick    on_drop_in_sell_grid    custom_sell_set_itemprice    trans_price    cover_goods_grid    on_mousein_sell_grid    on_mouseout_sell_grid    on_main_form_close    open_kuorong    on_btn_kuorong_click                   	@@	À@A  ^          Fixed  	   form_bag        ð?                            form                   /        E   @@ \@ E  À  \  Á A FA@  ÁÁ @       	      setGridCount 
   sell_grid 	   nx_value    data_binder    AddViewBind    VIEWPORT_OFFLINE_SELL_BOX +   form_stage_main\form_stall\form_stall_sell    on_sell_viewport_changed       ð?       $   $   $   +   +   +   ,   ,   ,   ,   ,   ,   .   .   /         self           databinder               2   P     C      Á@    AÁ   Å    Ü Ú@   Å@  EÁ  \ AÜ@ Á@ Þ  Á Á @   Õ CÁ À   A  @ A  ACÁ À   @B@ AA ^ KCÀ Â A \A À ÅA    Ü À C  @  Å   Ý Þ  A          nx_execute    util_functions    get_ini    share\Rule\stall.ini    nx_is_valid 
   nx_msgbox    share\Rule\stall.ini     get_msg_str    msg_120            Rank_ 
   nx_string    FindSection    FindSectionIndex    ReadString    Level    0    nx_int 	   nx_int64     C   3   3   3   3   3   4   4   4   4   4   5   5   5   5   5   5   5   6   6   9   9   9   9   9   ;   ;   ;   ;   ;   ;   ;   =   =   @   @   @   @   @   A   A   B   B   D   D   D   D   D   F   F   F   F   F   F   F   F   H   H   H   H   H   J   J   J   J   N   N   P         level     B      key     B      ini    B      section_name    B   
   sec_index &   B      lev /   B      value <   @           R   j    $   E   @  \ À  ÅÀ   AA  Ü   EÁ 	@	@BEÁ  \ 	@	À AA B ÆB B  C  @B LAÂAþ	 Ä	 Ä	 D	 Ä	 D     	   nx_value    game_client 
   GetPlayer    nx_execute +   form_stage_main\form_stall\form_stall_main    GetSellCount    typeid    VIEWPORT_OFFLINE_SELL_BOX    beginindex       ð?	   endindex    nx_int    playerCount            SetBindIndex 
   canselect     candestroy 	   cansplit    canlock    canarrange     $   S   S   S   T   T   V   V   V   V   V   W   Y   Y   Z   [   [   [   [   \   ^   _   _   _   _   `   `   `   `   a   _   d   e   f   g   h   j   
      grid     #      game_client    #      client_player    #      playerSellCount 
   #   
   cellCount    #      grid_index    #      (for index)          (for limit)          (for step)          view_index             TotalCellCount     m        R     @   A  @ A     AÁ   KAÅA   Ü \    À A  @ A    ÆÁA   Â À ÅA    ÜA 
Â  ÅÁ ËÃ@  ÜAÀ@Ã À ÅA    ÜA @Ã ÅÁ  AB   ÀÜAÅ ÂD E ÜA @Å ÅÁ  A   ÀÜAÀÀÅ @ÅÁ  AB   ÀÜAÅÁ  AB  ÜA ÁA  Þ         nx_is_valid       ð?	   nx_value    game_client    GetView 
   nx_string    nx_int 	   endindex    createview    RefreshGrid    deleteview 
   GoodsGrid 
   GridClear    updateview    additem    nx_execute ,   form_stage_main\form_stall\stall_goods_grid    view_grid_on_update_item    cover_goods_grid    ParentForm    VIEWPORT_OFFLINE_SELL_BOX    delitem    view_grid_on_delete_item    updateitem +   form_stage_main\form_stall\form_stall_main    refresh_total_price     R   o   o   o   o   o   p   p   s   s   s   t   t   t   t   t   u   u   u   u   u   v   v   y   y   y   {   {   }   }   }   }   ~   ~                                                                                                                                                            grid     Q      optype     Q      view_ident     Q      index     Q      game_client 
   Q      view    Q   
   sellCount    Q              ¢            A@     Â    E     \ Z@      EÀ   A \@ E@  A \@         util_get_form +   form_stage_main\form_stall\form_stall_sell    nx_is_valid    setGridCount 
   sell_grid    RefreshGrid                                                              ¢         form               ¤   ¦        E   @  Á     \@         nx_execute ,   form_stage_main\form_stall\stall_goods_grid    view_grid_fresh_all        ¥   ¥   ¥   ¥   ¥   ¦         grid                ©   *    :     Á@   Å     Ü   AÁ   E  \ ZA      E AA\ ZA      E AAA\ ZA      KÁA À \B ÌAÂ  AÂ  Â Å C E BAAÂC\  À  Å  Ü  
  Á   ËBDÜ  @ C       A Ã À C   E  C \  À   @ ÅC Ã ÁC  @ ÆÆFËÃÆA ÜÃ  BG   Å  AÃ  Ü W È  À CÈ À    KÃHÅ  Ü \   À C      ÉD	   ÉD	 Å   Ü  A  ÀÀÅ Ä	 A
  Á  AE
  Á
  ÜC    ÉÄ
   ÉÄ
 Å   Ü  A  ÀÀÅ Ä	 A
  Á  AE
  Á  ÜC    ÉD   ÉD Å   Ü  A  ÀÀÅ Ä	 A
  Á  AE
  Á  ÜC    CÄ Å IÄ Ü   AD
   ÀÅ Ä	 A
  Á  AE
  Á  ÜC    Å D A Ä Â   Ü ÍE \ 	DÉÄ   @ÉÄ W N E Ä  ÁD  @ \ÎE \ 	EÅÎE  	\ 	EÏE 	\ 	E @ E  \ @    DÏ	ÄOÍ	ÄOÐ	Ð ÐE \ 	DÄÐD  AD Á ÀQ Å  Ü Ú  ÀÅ   @ À  	@ÜD  I   	   nx_value    gui    game_client +   form_stage_main\form_stall\form_stall_main    nx_is_valid 
   page_sell 
   sell_grid    GetItemNumber    typeid       ð?   nx_execute    find_empty_pos    VIEWPORT_OFFLINE_SELL_BOX       N@   nx_int    playerCount 
   nx_number 
   GetPlayer 	   util_vip    is_vip 
   VT_NORMAL     form_stage_main\form_vip_prompt    Close    util_show_form    info_mltbox 	   HtmlText    TextManager    GetText 
   ui_jhhy_5    GetBindIndex    form_stage_main\form_bag_func    get_addbag_index            GetView 
   nx_string    GetViewObj 	   FindProp    BindStatus 
   QueryProp    custom_handler    custom_sysinfo        @   7043    CantExchange    7055    LockStatus    7054    StallState    7040 	   util_gui    util_get_form .   form_stage_main\form_stall\form_sell_inputbox    lbl_total_num    Text    nx_widestr 	   ConfigID        find_item_price    ipt_yb_ding    ipt_yb_liang    ipt_yb_wen    lbl_total_sign    Visible     ipt_number 	   ReadOnly 
   ShowModal    nx_wait_event     ×A   sell_stall_price_input_return    ok    custom_offline_sell_add_item     :  ª   ª   ª   «   «   «   ¬   ¬   ¬   ­   ­   ­   ­   ­   ®   ±   ±   ±   ±   ±   ²   µ   µ   µ   µ   µ   µ   ¶   ¹   ¹   ¹   º   »   ½   ½   ½   ½   ½   ½   ¾   ¾   ¾   ¾   ¾   À   À   À   À   À   À   À   À   Ã   Ã   Ã   Ä   Ä   Å   Å   Å   Å   Å   Æ   É   É   É   É   É   É   Ê   Ê   Í   Í   Í   Î   Î   Î   Î   Î   Ï   Ï   Ñ   Ñ   Ñ   Ñ   Ñ   Ò   Ò   Ò   Ò   Ò   Ò   Õ   Ù   Ù   Ù   Ú   Ú   Ú   Ú   Ú   Û   Û   Ü   ß   ß   ß   ß   ß   à   à   à   à   à   á   á   á   á   á   â   å   å   å   å   å   æ   æ   æ   ç   ç   ç   ç   ç   ç   ç   ç   è   è   è   è   è   è   è   è   è   è   è   é   í   í   í   í   í   î   î   î   ï   ï   ï   ï   ï   ï   ï   ï   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ò   ÷   ÷   ÷   ÷   ÷   ø   ø   ø   ù   ù   ù   ù   ù   ù   ù   ù   ú   ú   ú   ú   ú   ú   ú   ú   ú   ú   ú   û                                                                                                                                                                                        #  #  %  %  %  %  %  &  &  &  &  &  &  &  '  '  '  '  '  '  '  '  *        grid     9     index     9     gui    9     game_client    9     form 	   9     src_amount    9     src_viewid     9     src_pos !   9     selected_index '   9     playerCount ,   9     game_client 7   ]      client_player 9   ]      vip_status E   ]      form_prompt J   \      view_index `   9     addbag_index e   9     view m   9     viewobj r   9     bind          cant_exchange    °      lock_status ¸   Ì      client_player Î   9     dialog ë   9  	   ConfigID ø        ding         liang         wen         res *  9     money_silver *  9     number *  9          .  Ä    V     Á@   Æ@ Á@  E AA \  À  Å  Ü À
  ÁÁ  ËBÜ B @ B       AÂ  ÀC B   E   \ B À   @ ÂÃB  Á  @ BÄÆÂDËÅAC ÜÂFEKÂÅ\B   F   ÆEÆAÆ  ÀC FEFÂÆ E EG\  ÆEÆBÇ Å  Ã Ü ÇÃ À    KHÅÃ  Ü \  C À C      C ËÈAÄ ÜÚ  ÀËÉAÄ ÜÅ   Ü  AD  ÀÀÅ D	 A	 D ÁD E AÅ	 Å Á
  ÜC    ÁC ÈD
   ÀÉD
 À  @ E D \  À AD	 	 ÁD E AE Å	 ÅÅ 
 Ü D    D KÈÁÄ
 \Z  ÀKÉÁÄ
 \ E  \  ÁD  @	ÀE D	 Á	 E AE E ÁÅ	 Æ A  \D    E  Ä \ Â Å I	E Ü   AÅ	   	ÀÅ E	 A	 E ÁE F AÆ	 Æ Á  ÜD    Å   Ü Å W 	@Å   Ü  W 	ÀÅ   Ü E W 	@Å   Ü  W 	ÀÅ E	 A	 E ÁE F AÆ	 Æ Á
  ÜD    ÆEËÄÅ	ÜD Å Å A E Â   Ü Í	E  \ 	EÈE   @ÉE WN
 E Å Á F @ 
\Ï	E 
\ 	FÆÏ	E  \ 	FÐ	E \ 	F @  E E \ @
    EÐ		ÅP¡Í		ÅP¡Ñ		Ñ¢Ñ	E  \ 	EÅÑ	E  AE 	Á ÀR
 ÅE  Ü Ú  ÀÅ   @ À
  @ÜE  M   	   nx_value    gui    ParentForm    GetSelectItemIndex    nx_int    playerCount 
   nx_number    game_client 
   GetPlayer    nx_is_valid    nx_execute 	   util_vip    is_vip 
   VT_NORMAL     form_stage_main\form_vip_prompt    Close    util_show_form    info_mltbox 	   HtmlText    TextManager    GetText 
   ui_jhhy_5 	   GameHand 
   ClearHand    GetBindIndex    Type    GHT_VIEWITEM    Para1    Para2    Para3    GetView 
   nx_string    GetViewObj         	   FindProp    BindStatus 
   QueryProp    custom_handler    custom_sysinfo        @   7043    CantExchange    7055    LockStatus    7054    StallState    7040    VIEWPORT_EQUIP_TOOL    VIEWPORT_TOOL    VIEWPORT_MATERIAL_TOOL    VIEWPORT_TASK_TOOL 	   util_gui    util_get_form .   form_stage_main\form_stall\form_sell_inputbox    lbl_total_num    Text    nx_widestr 	   ConfigID     +   form_stage_main\form_stall\form_stall_main    find_item_price    VIEWPORT_OFFLINE_SELL_BOX    ipt_yb_ding    ipt_yb_liang    ipt_yb_wen    lbl_total_sign    Visible     ipt_number 	   ReadOnly 
   ShowModal    nx_wait_event     ×A   sell_stall_price_input_return    ok    custom_offline_sell_add_item     V  0  0  0  2  6  6  8  8  8  :  :  :  :  :  :  :  :  =  =  =  >  >  ?  ?  ?  ?  ?  @  C  C  C  C  C  C  D  D  G  G  G  H  H  H  H  H  I  I  K  K  K  K  K  L  L  L  L  L  L  Q  Q  Q  S  V  V  V  Y  Y  [  [  [  ]  ]  ]  ]  ^  ^  ^  ^  _  _  _  _  b  b  b  c  c  c  c  c  d  d  d  d  d  e  e  e  e  e  f  i  j  j  j  j  j  k  k  k  k  l  l  l  l  l  l  l  l  m  m  m  m  m  m  m  m  m  m  m  n  r  s  s  s  s  s  t  t  t  t  u  u  u  u  u  u  u  u  v  v  v  v  v  v  v  v  v  v  v  w  |  }  }  }  }  }  ~  ~  ~  ~                                                                                                                                                                                                           £  £  £  £  £  ¤  ¤  ¤  ¥  ¥  ¦  ¦  ¦  ¦  ¦  ¦  §  §  §  §  §  ¨  ¨  ¨  ¨  ¨  ©  ©  ©  ©  ©  ®  ®  ®  ®  ®  ®  ®  ®  ¯  ³  ³  ´  ´  ·  ·  ¸  ¸  ¸  ¸  ¸  »  »  ½  ½  ½  ½  ½  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  Ä        grid     U     index     U     gui    U     form    U     selected_index    U     playerCount 	   U     game_client    =      client_player    =      vip_status "   =      form_prompt '   9      view_index @   U     gamehand_type B   U     src_viewid I   U     src_pos M   U     src_amount Q   U     game_client T   U     view Y   U     viewobj ^   U     bind e   U     cant_exchange    U     lock_status ¡   U     game_client Á   U     client_player Ã   U     dialog   U  	   ConfigID   +     ding   +     liang   +     wen   +     res F  U     money_silver F  U     number F  U          Ç  Ñ       E   @  \   À   @  @ À     Á A E  EA Á \ @       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int !   CLIENT_CUSTOMMSG_REMOVE_ALL_SELL       ð?       É  É  É  Ê  Ê  Ê  Ê  Ê  Ë  Ë  Ï  Ï  Ï  Ï  Ï  Ï  Ï  Ï  Ñ        btn           game_visual               Õ  î    s     ÁA   Å    Ü ÚA  @ ÁÁ  Þ Å   Ü Ú  @ËÁAB ÜÚ   ËÁA ÜÚA  @ ÁÁ  Þ Å  Â Ü   @    @B    ÂÂ ËÃAC Ü  ÅÂ C Ü Ã KÃÁ \  EÃ C \ Ã Å Ä @ DÜ   ÅÃ D Ü Ä E Ä À D	DD	\   EÄ D \ Ä Å Å @ ED
Ü   ÅÄ E Ü ÂBD ÅÂ  Å    Ü  @  E  \  À Å   Ü B       	   nx_value    game_visual    nx_is_valid         	   FindProp 	   ConfigID 	   UniqueID    form_main_sysinfo    nx_find_method    SaveFightInfoToFile    SaveStallPriceInfo    nx_widestr 
   QueryProp    /    nx_int 
   nx_number     .A     @@   CustomSend '   CLIENT_CUSTOMMSG_ADD_OFFLINE_SELL_ITEM 	   nx_int64     s   Ö  Ö  Ö  ×  ×  ×  ×  ×  Ø  Ø  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ü  Ý  Ý  à  à  à  á  á  á  á  á  á  á  á  á  á  á  ã  ã  ã  ã  ã  ã  ã  ã  ã  ä  ä  ä  ä  ä  ä  ä  ä  å  å  å  å  å  å  å  å  å  å  å  æ  æ  æ  æ  æ  æ  æ  æ  æ  æ  æ  æ  ç  ç  ç  ç  ç  ç  ç  ç  ç  ç  ç  ç  ã  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  ì  î        src_viewid     r      src_pos     r      dst_pos     r      silver     r      num     r      viewobj     r      game_visual    r      form_logic    r           ñ          @          @  Á   ËÀ@Ü ÁA A    KÁA À \ ÀA   	      IsEmpty 	   nx_value    game_client 
   GetPlayer 
   QueryProp    StallState        @   GetBindIndex    custom_sell_remove_item        ò  ò  ò  ò  ò  ó  ÷  ÷  ÷  ø  ø  ù  ù  ù  ú  ú  û  þ  þ  þ                grid           index           game_client 	         client_player          state          view_index                 
       E   @  \   À   @  @ À     Á A E  EA   \ @       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int *   CLIENT_CUSTOMMSG_OFFLINE_REMOVE_SELL_ITEM                            	  	  	  	  	  	  	  	  
        src_pos           game_visual                 `    ¢    @          @  Á   ËÀ@Ü ÁA E  \  ÁÁ  WÀE  \  Á      KABÅ ÂB Ü \   À A      AC   ËÃE  \ Ü   @ B      ÂÃ B      BÄ Á ÁÃ    E    KBÅÁ   A \ Å    BÅ @ Ã  E    ËÁA Ü Å    C  AC  E Ã Á D B   \  ÀFÄÇD À  IFÈD À IFÄÈD À  IE \  Á      FÉD À IFDÉD À IFÉIÊFÉIÊFDÉIÊKÄÊ\D E D À \ÀË  @  	À	E   1      IsEmpty 	   nx_value    game_client 
   GetPlayer 
   QueryProp    LogicState    nx_int      @Y@     À[@   GetView 
   nx_string    typeid    nx_is_valid    GetBindIndex    GetViewObj    FindRecord    offline_sellbox_table    FindRecordRow       ð?	   UniqueID            QueryRecord       @      @   Amount    gui    nx_execute 	   util_gui    util_get_form .   form_stage_main\form_stall\form_sell_inputbox    trans_price    ipt_yb_ding    Text    nx_widestr    ipt_yb_liang    ipt_yb_wen    lbl_total_num    ipt_number    lbl_total_sign    Visible  	   ReadOnly 
   ShowModal    nx_wait_event     ×A   sell_stall_price_input_return    ok    custom_sell_set_itemprice     ¢                                                                                                !  !  !  !  !  "  "  "  "  "  #  &  &  &  &  &  '  *  *  *  *  *  *  *  +  +  ,  0  0  0  0  0  1  1  2  5  5  5  5  5  6  6  7  :  :  :  ;  ;  <  @  @  @  A  A  A  A  A  A  A  D  D  D  E  E  E  E  E  F  F  F  F  F  G  G  G  G  G  J  J  J  J  J  J  J  J  K  N  N  N  N  N  O  O  O  O  O  R  R  S  S  V  V  X  X  [  [  [  [  [  \  \  ]  ]  ]  ]  ]  `        grid     ¡      index     ¡      game_client 	   ¡      client_player    ¡      state    ¡      view $   ¡      bind_index -   ¡      viewobj 2   ¡      row E   ¡      silverprice M   ¡   
   sellCount U   ¡      totalCount [   ¡      gui a   ¡      dialog h   ¡      ding k   ¡      liang k   ¡      wen k   ¡      res    ¡      money_silver    ¡      number    ¡           c  k    	      Á@   Æ@ÁÀ  @ÁA  A A Á À    AÉ B  	   	   nx_value    gui 	   GameHand 
   IsDragged 
   IsDropped    nx_execute +   form_stage_main\form_stall\form_stall_sell    on_sell_grid_select        d  d  d  e  g  g  g  g  g  g  h  h  h  h  h  h  i  k        grid           index           gui       	   gamehand               n  u       Å   A  Ü   @ A  @ Á   ÁA Å  ÅA    Ü Â @  EB  \ A       	   nx_value    game_visual    nx_is_valid            CustomSend    nx_int ,   CLIENT_CUSTOMMSG_OFFLINE_SET_SELL_ITEMPRICE 	   nx_int64        o  o  o  p  p  p  p  p  q  q  t  t  t  t  t  t  t  t  t  t  t  t  t  t  u        pos           silver        
   sellCount           game_visual               x  ~       E   @@ \    Î@À ÍÀ   Å   @Ü   NÀMA @ À ^      	   nx_int64     .A     @@       y  y  y  z  z  z  z  {  {  {  |  |  |  |  }  }  }  }  ~        price           price_ding          temp          price_liang 
      
   price_wen                           Æ@@        ÁÀ   FA@ @         nx_is_valid 	   form_bag    nx_execute    form_stage_main\form_bag    refresh_lock_item                                    form     
   	   viewport     
             ¼    j    @          @  ÌÀ  Å@  Á@ Ü       Á@  ËAEÁ B \ Ü  A @ A      B  KÁÂÅÁ   Ü \  A À A      ÃB A      ÃB A  ÂÃ   @D    ËÄAB  ÁÂ Ü A  CB À     BE   @  @ Â À IB À   @ ÁB  @ Å Ã A ËCG Ü G  AÄ Ä ÆH ÜB  !      IsEmpty    nx_int       ð?   playerCount 	   nx_value    game_client    GetView 
   nx_string    typeid    nx_is_valid    GetBindIndex    GetViewObj    FindRecord    offline_sellbox_table    FindRecordRow 
   QueryProp 	   UniqueID            QueryRecord       @
   GoodsGrid    GetItemData    StallPrice1 	   nx_int64    nx_execute 
   tips_data    get_prop_in_item 
   tips_game    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop       @@   ParentForm     j                                                                                                        ¡  ¤  ¤  ¤  ¤  ¤  ¤  ¤  ¥  ¥  ¦  ª  ª  ª  ª  ª  ¬  ¬  ¬  ­  ®  ®  ®  ®  ®  ¯  ¯  ¯  ¯  ¯  ±  ±  ±  ±  ´  ´  ´  ´  ´  ¶  ¶  ¶  ¶  ¶  ¶  ¸  ¸  ¸  ¸  ¸  ¸  ¸  ¸  ¹  ¹  ¹  ¸  ¼        self     i      index     i      game_client    i      view    i      bind_index     i      viewobj %   i      row 8   i      item_svil_price @   i   
   GoodsGrid C   i   
   item_data D   i   	   ConfigID ]   i           ¿  Á          Á@    FÁ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm        À  À  À  À  À  Á        self           index                Å  É       	@@E     \@ AÀ  ^          Visible     nx_destroy       ð?       Æ  Ç  Ç  Ç  È  È  É        form                Ë  Ð           A@    ÁÀ   B   	@AKA \@         nx_execute 	   util_gui    util_get_form (   form_stage_main\form_stall\form_kuorong    Type       ð?
   ShowModal        Ì  Ì  Ì  Ì  Ì  Ì  Ì  Í  Ï  Ï  Ð        dialog    
           Ò  Ô                    Ô        btn             I                     	   	   	   
   
   
                                                /      P   2   j   j   R      m   ¢      ¦   ¤   *  ©   Ä  .  Ñ  Ç  î  Õ    ñ  
    `    k  c  u  n  ~  x      ¼    Á  ¿  É  Å  Ð  Ë  Ô  Ò  Ô        TotalCellCount    H       