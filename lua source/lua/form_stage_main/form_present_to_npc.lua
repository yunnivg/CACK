LuaQ  H   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_present_to_npc.lua           Q      A@  @    A  @    AÀ  @    A  @    A@ @    A @    AÀ @    A  @ @ d   G d@  GÀ d  G  dÀ  G@ d      G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G@ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ   $      require 	   util_gui    util_functions    game_object    define\gamehand_type    share\view_define    share\capital_define    share\client_custom_define 
   menu_game    icon\prop\prop_xinge.png    show_present_form    main_form_init    on_main_form_open    on_main_form_close    refresh_form    on_btn_cancle_click    on_btn_send_click    on_postbox_drag_move    on_postbox_drag_enter    on_postbox_select_changed    on_postbox_doubleclick_grid    on_postbox_mouseout_grid    on_postbox_mousein_grid    on_postbox_rightclick_grid    on_drop_in_postbox    on_HeartBeatCheck    can_present    reset_grid    reset_scene    dead_changed    get_item_num_by_configid    show_pigeon_number    CheckPresent    get_npc_relation    on_rec_relation_changed    get_relation_desc_by_karma                
&   Å   A  A  Á  Ü  @    A @A   AA    ÁÁ   B   À   @ A      É  É@É AÂA   A Á Â A         nx_execute 	   util_gui    util_get_form $   form_stage_main\form_present_to_npc    nx_is_valid    nx_destroy    npc_id 	   scene_id    type    Show    form_stage_main\form_bag    auto_show_hide_bag     &                                                                                                                           npc_id     %   	   scene_id     %      type     %      form    %           "   2        	@@	À@	À@E@  \  Â Æ B À @B	ÀÂ ÆÀB À  C	 	Ã	Ã	C@           Fixed     allow_empty    Visible 	   nx_value    gui    Left    Width       @   Top    Height       @   npc_id  	   scene_id    type       ð?       $   &   '   )   )   )   *   *   *   *   *   +   +   +   +   +   -   .   /   1   1   2         self           gui               4   <        E   @  \   À      ÀÀ  @  A  Á @ À À   @      	   nx_value    data_binder    nx_is_valid    AddTableBind    rec_npc_relation    nx_current    on_rec_relation_changed    refresh_form        6   6   6   7   7   7   7   7   8   8   8   8   8   8   8   ;   ;   ;   <         self           databinder               >   G        E   @  \   À      ÀÀ    @ Á A @  @ Á Á @  @      	   nx_value    data_binder    nx_is_valid    DelViewBind    DelRolePropertyBind    Dead    DelTableBind    rec_npc_relation        A   A   A   B   B   B   B   B   C   C   C   D   D   D   D   E   E   E   E   G         self           databinder               I          F @ IÀF @ I ÁF @ IÁF @ KÀÁ \@ F B  Á   IEÀ   \ @Ã CÁC Æ D  @  É Æ@Ã ËÃAA D UÜÁD E \ 	AAÃ C FAE IE ÁE \  Á  FAF IÁFFG IÁFEÁ A \  À A      Á ÁÁ  Å   Ü ÚA      ËHAB   ÜA ÅÁ  Ü  @ B      ÂÈÉE  \ ZB      KBIÁB    A  \B @FAF IIFG IIFAF KÁÉÁ   A  Á  \AEÁ 
 \  À   @AÊ
 @  Â
 Á A EA ÁC \ K Å  Ü ÁÁ Á
  Å   Ü Ú  ÀËÁKA B À    AÃ ÜA  4      postbox 
   persistid       ð¿	   oldphoto        num            Clear    lbl_num    Text    nx_widestr 	   nx_value    gui    TextManager    GetText    npc_id    ipt_target 
   ui_scene_ 	   scene_id 
   ipt_topic    ui_present_to_npc_menu    lettercontent    nx_int    type       ð?   imagegrid_pigeon    Visible     lbl_pigeon_num    GAME_SELECT_OBJECT    nx_is_valid    common_execute    RemoveExecute    CheckDisToGiftNpc    game_visual    GetSceneObj    Ident    AddExecute    AddItem    data_binder    AddViewBind    VIEWPORT_TOOL $   form_stage_main\form_present_to_npc    show_pigeon_number    get_npc_relation    ipt_yx    AddRolePropertyBind    Dead    int    nx_current    dead_changed        J   J   K   K   L   L   M   M   M   N   N   N   N   N   P   P   P   S   S   S   S   T   T   T   T   T   W   W   W   W   W   W   X   X   X   X   X   [   [   [   [   \   \   ^   ^   ^   ^   ^   ^   ^   ^   `   `   a   a   d   d   d   e   e   e   e   e   f   i   i   i   j   j   j   j   j   k   n   n   n   n   p   p   p   q   q   q   q   q   r   u   u   u   v   v   v   v   v   w   z   z   z   z   z   z   z   }   }   ~   ~                                                                                                                                                      self           gui          target_name          scene_name           content )      
   selectobj :   e      common_execute C   e      game_visual P   e      visual_scene_obj Y   e      databinder u         text_relation          databinder             xinge_photo        ¤     
#   F @ IÀÀ  Á   Å@   Ü Ú   À ËAAÁ   Ü@ Ë Â Ü@ Å@   Ü@ Å Á A A Â    A ÜA @   @ ÂA         ParentForm    Visible  	   nx_value    common_execute    nx_is_valid    RemoveExecute    CheckDisToGiftNpc    Close    nx_destroy    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    colorlevel_confirm     #                                                                                            ¡   ¡   ¡   ¡   ¡   ¢   ¢   ¤         btn     "      form    "      common_execute    "      confirm_form    "           §   ï     ·   F @ @  Á   ÅÀ    Ü Ú@      Æ Á Æ@ÁWÁ (ÅÀ  Á AAÜ Ú   &Æ Á Æ@ÁËÀÁA ÜÁ AAÁAA FÁ FAÁKÁÁÁ \Á À Ã FBÃ  A   ÁÁ  AB  Â   Å B A  ÅÂ  AC  Ü  ÜA  ÆEÉÆÆAFÂ E Â \   ÉËGÜA ÅA  B Ü ÂÇFÂGBHÈFHBHÂ A	  ÁB	  WI@ ÀI    
 À Å
 B
 Ü  ÁÁ  AB  Â  
 Å B A  ÅÂ  AÃ
  Ü  ÜA  ÆEÂ E  \   ÉÆAFÂ E B \   ÉËGÜA ÅA  B Ü ÂÇFÂGBHÈFHBHÂ A	  ÁB	  ÀI    KÂ E  EÂ BÃ \ Ã ÅB  Ü Ã FÁ FÌ EÃ ÃÌ \ A  Å    Ü@ Å A A Ü@  7      ParentForm 	   nx_value    game_visual    nx_is_valid    postbox 
   persistid       ð¿
   QueryProp 	   UniqueID 	   ConfigID    ColorLevel    CheckPresent    npc_id 	   scene_id    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    show_common_text    nx_widestr    util_format_string    333333    ok_btn    Visible     cancel_btn    Text    ui_ok 
   ShowModal    gui    Left    Width        @   Top    Height    nx_wait_event     ×A   confirm_return    ok    cancel 
   nx_number       @   colorlevel_confirm    ui_present_to_npc_makesure    ui_present_to_npc_give    ui_present_to_npc_cancel    CustomSend    nx_int     CLIENT_CUSTOMMSG_PRESENT_TO_NPC 
   nx_string    num    type    reset_grid 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     ·   ¨   ª   ª   ª   «   «   «   «   «   ¬   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   ²   ²   ²   ²   ²   ³   ³   ³   ³   ³   ´   ´   ´   ´   ´   ´   ´   ·   ·   ·   ·   ·   ·   ·   ¸   ¸   ¸   ¸   ¸   ¸   ¸   ¸   ¸   ¸   ¹   ¹   º   º   º   º   º   º   º   »   »   ¾   ¾   ¾   ¿   ¿   ¿   ¿   ¿   À   À   À   À   À   Ã   Ã   Ã   Ã   Ã   Ä   Ä   Ä   Ä   Å   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ì   Ì   Ì   Ì   Ì   Ì   Ì   Ì   Í   Í   Í   Í   Í   Í   Í   Í   Í   Í   Î   Î   Î   Î   Î   Î   Î   Ï   Ï   Ï   Ï   Ï   Ï   Ï   Ð   Ð   Ó   Ó   Ó   Ô   Ô   Ô   Ô   Ô   Õ   Õ   Õ   Õ   Õ   Ø   Ø   Ø   Ø   Ø   Ù   Ù   Ú   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   á   á   á   î   î   î   î   ï         btn     ¶      form    ¶      game_visual    ¶   
   unique_id    ¯      item_id    ¯      color_level #   ¯      dialog 1   ]      gui I   ]      res X   ]      color_level_dialog m         gui          res               ñ   ò                     ò         grid                 ô   õ                     õ         grid                 ø       F   F @ @@ @@ À@ 	  Á@  Å ÁABÜ  FÁAFAÂ E  \ ÁÂ @   ÅA   Ü ÚA      ËCE  \ Ü  B @ B      Â @  B      ÂADB B A Â Æ@ B  @ BB FÅ Â BB A B B        ParentForm 	   oldphoto     
   BackImage 	   nx_value    gui    nx_int 	   GameHand    Para1    Para2    game_client    GetView 
   nx_string    nx_is_valid    GetViewObj    can_present 
   ClearHand    nx_execute 
   tips_game 	   hide_tip    reset_grid    on_postbox_mousein_grid    postbox         5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     F   ù   û   û   û   ü   ü   ÿ   ÿ   ÿ                                                   	  	  	  	  	  
  
  
  
  
                                                                  grid     E      form    E      gui 	   E      src_viewid    E      src_pos    E      game_client    E      view    E      viewobj $   E             %    	   F @ W@À  F@ À  À   @     
   persistid       ð¿   ParentForm    reset_grid     	   !  !  !  "  #  #  #  #  %        grid           form               (  *          Á@    FÁ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm        )  )  )  )  )  *        self           index                ,  6        @ @@      ÁÀ   F@ AA  AËÁA Ü  A B @  	   
   persistid       ð¿   nx_execute 
   tips_game    show_goods_tip    GetMouseInItemLeft       @@   GetMouseInItemTop    ParentForm        .  .  .  /  3  3  3  3  4  4  4  5  5  5  5  5  3  6        self           index                8  >    	   F @ W@À  F@ À  À   @     
   persistid       ð¿   ParentForm    reset_grid     	   :  :  :  ;  <  <  <  <  >        grid           form               @  I          Á@   Æ@ÁÀ  ÀÁA   A @   AÉA     	   nx_value    gui 	   GameHand 
   IsDragged 
   IsDropped    on_postbox_select_changed        A  A  A  B  D  D  D  D  D  D  F  F  F  F  G  I        grid           index           gui       	   gamehand               L  Q           A@   E     \ Z    EÀ   A \@      	   nx_value $   form_stage_main\form_present_to_npc    nx_is_valid    on_btn_cancle_click    btn_cancle        M  M  M  N  N  N  N  N  O  O  O  Q        form               S  £    ­      À   @  @      @  Á   ÆÀ@Ë ÁÜ Ú   @ Â   Þ  ÆÀ@Æ@Á W @ Â   Þ  ÆÀA W ÂÅ@ ÁA @ ÜÚ    ÆÀ@ËÂÜ@ Â   Þ  ÅÀ Ã A Ü  ÃÀÁ A A Á  A  ÅÂ  Ü A  Á@BA    Ã A E  \  Á  @ÀEÁ  ÁA  A  Á Ã AÃ  \A  FÁ@KÂ\A B  ^ KÃ Á \ À Å  Ü ÀÁ Á B A  Á  EÃ C \ A  Á@BA    Ã  ÅÁ Â A  ÁB  Ü  @ À  AÂ  À Â@BB    B  A  KBH\  ËÃA Ü  Å  Ü ÀÀÂ@BB Â Á C A  Á  EÄ Ä \ B         $      nx_is_valid 	   nx_value    gui 	   GameHand    IsEmpty    Type    GHT_VIEWITEM 
   persistid       ð¿   nx_id_equal 
   ClearHand 
   nx_number 
   QueryProp    SellPrice1            nx_execute    custom_handler    custom_sysinfo        @
   nx_string    37045    CantExchange    nx_int    7055    LockStatus    7054 
   LogicPack    util_static_data    item_static_query    CantDelete    STATIC_DATA_ITEM_LOGIC       ð?   game_client 
   GetPlayer    StallState    7040     ­   T  T  T  T  T  U  U  X  X  X  Z  Z  Z  Z  Z  [  [  ^  ^  ^  ^  ^  _  _  c  c  c  d  d  d  d  d  d  e  e  e  f  f  s  s  s  s  s  v  v  w  w  w  w  w  w  w  w  w  w  w  x  x  x  y  y  |  |  |  }  }  }  }  }  }  }  }  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~                                                                                                                                                                                ¢  ¢  £  
      grid     ¬      viewobj     ¬      gui 
   ¬      SellPrice1 +   ¬      cant_exchange @   ¬      lock_status [   ¬      pack v   ¬      cant_delete }   ¬      game_client    ¬      client_player    ¬           ¥  ¾    9      À      @
@À   ÆÀ@ É Æ@A ÉÀAÆÀ@ Æ ÁÀ @Æ@A A FÁ@ FÁ É Å Á A  ÁA Ü WÀÁ WÃ   FÁ@ KÁÃÁ B @  A  Á \AFÁ@ IA À@  E@ @A ÀAÀ@  DÀ@ Ä        nx_is_valid 
   QueryProp    Amount    postbox    num    lbl_num    Text        ð?   nx_widestr    nx_execute    util_static_data    queryprop_by_object    Photo        AddItem         
   nx_string       ð¿
   persistid    Clear     9   ¦  ¦  ¦  ¦  ¦  §  §  §  ¨  ¨  ª  ª  «  «  «  «  ¬  ¬  ¬  ¬  ¬  ¬  ¯  ¯  ¯  ¯  ¯  ¯  °  ±  ±  ±  ±  ²  ´  ´  ´  ´  ´  ´  ´  ´  ´  ´  ·  ·  ·  ¹  ¹  ¹  º  º  »  »  ¼  ¼  ¾        form     8      viewobj     8      amount    .      value    .      photo    .           Á  Æ           A@   E     \ Z    EÀ   A \@      	   nx_value $   form_stage_main\form_present_to_npc    nx_is_valid    on_btn_cancle_click    btn_cancle        Â  Â  Â  Ã  Ã  Ã  Ã  Ã  Ä  Ä  Ä  Æ        form               É  Î           A@   E     \ Z    EÀ   A \@      	   nx_value $   form_stage_main\form_present_to_npc    nx_is_valid    on_btn_cancle_click    btn_cancle        Ê  Ê  Ê  Ë  Ë  Ë  Ë  Ë  Ì  Ì  Ì  Î        form               Ñ  Ú    
     AA   K@\ Á  ËÁAB Ü  ÅÁ   Ü WÀ Á ÆB A   	   	   nx_value    game_client 
   GetPlayer    nx_int 
   QueryProp    Dead            on_btn_cancle_click    btn_cancle        Ò  Ò  Ò  Ó  Ó  Ö  Ö  Ö  Ö  Ö  Ö  Ö  Ö  Ö  Ö  ×  ×  ×  Ú        form        
   prop_name        
   prop_type           prop_value           game_client          client_player               Ý  ù    ;   E   @  \   À   @         ÁÀ   Å    Ü Ú@      Ë AEA   \ Ü  Á A À   AÁ   À    B ÅA   ÜÂÃ EC  \ C À   À KÂÁ \LAá  û^      	   nx_value    game_client    nx_is_valid 
   GoodsGrid    GetToolBoxViewport 
   nx_string    GetView            GetViewObjList    pairs 
   QueryProp 	   ConfigID    Amount     ;   Þ  Þ  Þ  ß  ß  ß  ß  ß  à  ä  ä  ä  å  å  å  å  å  æ  é  é  é  é  é  ê  ê  ê  ê  ê  ì  í  í  í  í  í  î  î  ï  ï  ï  ï  ð  ð  ð  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ñ  ò  ò  ò  ó  ï  ô  ø  ù     	   configid     :      game_client    :      goods_grid    :      view_id    :      toolbox_view    :      pigeon_number    :      viewobj_list $   9      (for generator) '   9      (for state) '   9      (for control) '   9      j (   7      obj (   7      obj_id +   7      num 6   7           ü  ;    q   E      \ Z@      E@    ÁÀ   \    À   @      @Á  AÁ     B    Ë@Â @  ÁÁ Ü E \ A E FÁÃ \  ÁA  Å    Ü ÚA      ËDÜ   @ B      Â A  KBÅÁ \Z  KÂÅÁ \ ÍÆ  CÆ @ Á  A àÆ	@ Â   ßCþÂûFG  À  IEÂ  \ Â Á  @FH KBÈÁ  \B  FH KBÈÁ   \B   "      nx_is_valid    nx_execute    util_functions    get_ini    share\Rule\post.ini    FindSectionIndex 
   nx_string    Post            ReadString    ReplaceItem        util_split_string    ,    table    getn 	   nx_value    game_client 
   GetPlayer    get_item_num_by_configid    mail_xinge    FindRecord 
   sable_rec    GetRecordRows       ð?   QueryRecord       @     8@   lbl_pigeon_num    Text    nx_widestr 
   nx_number    imagegrid_pigeon    ChangeItemImageToBW     q   ý  ý  ý  ý  ý  þ                                                                                                                                          !  !  !  !  !  "  "  "  "  #  #  #  $  %  "     4  4  4  4  4  6  6  6  6  6  6  6  6  7  7  7  7  7  7  9  9  9  9  9  ;        self     p      ini    p      index    p      strPlaceItem    p      str_lst $   p   
   arg_count (   p      game_client +   p      client_player 3   p      pigeon_number <   p      row_num D   X      (for index) G   X      (for limit) G   X      (for step) G   X      i H   W      config M   W      (for index) P   W      (for limit) P   W      (for step) P   W      j Q   V           >  @       Â  Þ               ?  ?  @        item_id           npc_id        	   scene_id                C  [    	=   E   @  \   À   @  À À  Á       @Á  Å    Ü Ú@  À ÅÀ   Ý  Þ   ËAAÁ ÜÚ@  À ÅÀ   Ý  Þ   Ë BAÁ A Å    Ü Ü  Á @ EÁ A \ @À Á  A    CÁ ÀB E  ] ^       	   nx_value    game_client    nx_is_valid 
   util_text    ui_karma_rela4 
   GetPlayer    FindRecord    rec_npc_relation    FindRecordRow         
   nx_string 
   nx_number    QueryRecord        @   get_relation_desc_by_karma     =   E  E  E  F  F  F  F  F  G  G  G  G  J  J  K  K  K  K  K  L  L  L  L  O  O  O  O  O  P  P  P  P  S  S  S  S  S  S  S  T  T  T  T  T  T  T  T  U  U  U  U  X  X  X  X  X  Z  Z  Z  Z  [        npc_id     <      game_client    <      client_player    <      row '   <      karma 8   <           ^      C   W @À W@@@ A  ^ EÁ    \ Z   FA Z  @EA   Á \ZA  @ A  ^ EÁ  \ Á  À A  @    AÂ ÅÁ    Ü ÚA  @ Á  Þ ËBAÂ ÜÚA  @ Á  Þ ËCAÂ Á  ÜB FA  EB \ @  @  B Â          update    add            nx_is_valid    Visible    nx_find_custom    npc_id 	   nx_value    game_client 
   GetPlayer    FindRecord    rec_npc_relation    QueryRecord 
   nx_string    refresh_form       ð?    C   `  `  `  `  a  a  j  j  j  j  j  j  j  j  j  j  j  j  j  j  k  k  n  n  n  o  o  o  o  o  p  p  s  s  t  t  t  t  t  u  u  y  y  y  y  y  z  z  ~  ~  ~  ~  ~                                    self     B      recordname     B      optype     B      row     B      clomn     B      game_client    B      client_player "   B      npc_id 5   B             ¨    Q   A   @  Á  Á  A  Å@   Ü Ú@  @Å Á @  Ý   Þ   Ë BAA Ü @ E Á \ @@ EÁ  \     CÅÁ B Ü   A Á Å ÆAÄ  Ü   Á `ÁE ÁÂ \ ÆÃ Å    Ü ÀÀ À   Å ÅÜ ÀÀ Â ÆBÅ @  _ùE Á À  ]  ^          ui_karma_rela4    nx_execute    util_functions    get_ini    share\sns\msg_config.ini    nx_is_valid 
   util_text 
   nx_string    FindSectionIndex    Karma    nx_int            GetItemValueList    r       ð?
   nx_number    table    getn    util_split_string    ,        @      @    Q                                                                                                                                     ¡  ¡  ¡  ¡  ¡  ¡  ¡  ¡  £  £  £  £    §  §  §  §  §  §  ¨  
      karma     P      karma_text    P      ini    P   
   sec_index    P      GroupMsgData (   P      (for index) 0   J      (for limit) 0   J      (for step) 0   J      i 1   I   	   stepData 5   I       Q                                                                           
         2   "   <   4   G   >         I   ¤      ï   §   ò   ñ   õ   ô     ø   %    *  (  6  ,  >  8  I  @  Q  L  £  S  ¾  ¥  Æ  Á  Î  É  Ú  Ñ  ù  Ý  ;  ü  @  >  [  C    ^  ¨    ¨        xinge_photo    P       