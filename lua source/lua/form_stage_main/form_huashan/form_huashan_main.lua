LuaQ  S   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_huashan\form_huashan_main.lua           3      A@  @    A  @    AÀ  @    A  @    A@ @    A @    AÀ @    A  @ $   @ $@   $  À $À    $  @ $@  $ À $À   $  @ $@  $ À $À   $  @         require ,   form_stage_main\form_huashan\huashan_define .   form_stage_main\form_huashan\huashan_function    util_functions 	   util_gui    share\itemtype_define    custom_sender    role_composite    define\request_type 
   open_form    main_form_init    on_main_form_open    on_main_form_close    open_join_match_game    on_server_msg    on_custom_msg    on_btn_close_click    on_rbtn_click    on_server_get_phase    get_huashan_phase    timeout_cancel_loading    closeallform           $            E@    E     \ Z@   EÀ  ]  ^   E  @ \   À   @   À       	ÀA B @     	      util_get_form    m_Main_Path    nx_is_valid    nx_null 	   nx_value    gui    Visible    Show                                                                                !   !   #   $         form          gui               (   1        	@@	À@	@A        Fixed     arrayList_msg     LimitInScreen        *   -   0   1         form                4   S     <   E   @  \ ÀÀ ÆÀ@ À  A	 Á ÆA À  A	ÀA @BB @BÀ Æ C  @  À @ Á  	  C ÀC@   Æ@D @  À   @    ÅÀ  ÅÀ   Ü Ú   ÀË EEA \  À  Ü@ËEAÁ  ÅA Ü  @   Á Ü@     	   nx_value    gui    Left    Width        @   Top    Height    ani_loading    Visible     lbl_loading    nx_is_valid    arrayList_msg    get_arraylist     form_huashan_main_arraylist_msg    ClearChild    on_rbtn_click    rbtn_lj_msg    get_huashan_phase    GAME_TIMER    UnRegister    nx_current 	   Register      Lí@      ð¿    <   6   6   6   7   7   7   7   7   8   8   8   8   8   ;   ;   <   <   >   >   >   >   >   ?   ?   ?   ?   B   B   B   E   E   E   H   H   H   K   K   K   L   L   L   L   L   N   N   N   N   N   N   Q   Q   Q   Q   Q   Q   Q   Q   Q   Q   S         form     ;      gui    ;      timer &   ;           V   h     #   E     \@ E@    \ À  À      À Á A  A   @ Á A  AÁ   @À  Æ B      @ Æ B @ @ À   @   
      closeallform 	   nx_value    GAME_TIMER    nx_is_valid    UnRegister    nx_current    timeout_cancel_loading    get_huashan_phase    arrayList_msg    nx_destroy     #   X   X   X   Z   Z   Z   [   [   [   [   [   \   \   \   \   \   \   ^   ^   ^   ^   ^   ^   b   b   b   b   b   c   c   c   g   g   g   h         form     "      timer    "           k   z            E@   E     \ Z@   EÀ  \    E     \ Z@      	@AE ÀA \@      	   nx_value    m_Main_Path    nx_is_valid 
   open_form    Visible    on_rbtn_click    rbtn_dz_msg        l   l   l   m   m   m   m   m   o   o   o   r   r   r   r   r   s   v   y   y   y   z         form               }   ä     ²   F @ @  @ À  ÅÀ   Å    Ü Ú   @ Ë@AÜ@    @ ÀÀ Á  A E  Â   Å    Ü Ú   @ ËÀBÜ@   À	  @  À Á@  EÁ  ÁA @   À @ ÀÀ Á  A E  Â   Å    Ü Ú   @ Ë@AÜ@    À @ @À Å  A FE @     ÅÀ  Å    Ü Ú@      Å  FÜ Ú@      Á  A @ @ Á @Á @   FE  À  @A @ @ Á  Á @ @ Á  ÀA @ @ Á Á @ @ Á 	 @A	 @ @ Á	     À     FÁIE  \ ZA      EÁ JÆAJ
 @   \A  FFKÁÊÀ \AFFKAË\ @@FKIÌFALIÌE   \  À   @ÁÌ  AB  A  6         ð?   HuaShanSToC_LeaveLook 	   nx_value    m_WuLin_Path    nx_is_valid    Close    HuaShanSToC_FightStart    nx_execute 	   util_gui    util_get_form    m_Game_Djs    Show    HuaShanSToC_AskJoinInvote ,   form_stage_main\form_main\form_main_request    add_request_item $   REQUESTTYPE_HUASHAN_JOIN_MATCH_GAME           ^@   HuaShanSToC_FightEnd    HuaShanSToC_FightStatistics    m_Game_Stat 
   open_form        @   m_Main_Path    arrayList_msg    HuaShanSToC_ReqPlayerList    rw_list    HuaShanSToC_ReqPlayerInfo 
   nx_string    HuaShanSToC_ReqVSList    dz_msg    HuaShanSToC_ReqFightLog 	   zd_notes    HuaShanSToC_GetRankNo    get_rankno    HuaShanSToC_GetHuaShanPhase 
   get_phase    HuaShanSToC_ReqAsLooker    dz_look 	   GetChild    path    func    unpack    RemoveChildByID            GetChildCount    ani_loading    Visible     lbl_loading    GAME_TIMER    UnRegister    nx_current    timeout_cancel_loading     ²   ~                                                                                                                                                                                                                  ¢   ¢   ¢   ¢   ¢   ¤   ©   ©   ©   ª   ª   ª   ª   ª   «   ®   ®   ®   ®   ®   ¯   ²   ³   ³   ³   µ   µ   ¶   ¶   ¶   ¸   ¸   ¸   ¸   ¸   ¹   ¹   ¹   »   »   ¼   ¼   ¼   ¾   ¾   ¿   ¿   ¿   Á   Á   Â   Â   Â   Ã   Ã   Ä   Ä   Ä   Å   Å   Ç   Ê   Ê   Ë   Î   Î   Î   Î   Ï   Ï   Ï   Ï   Ï   Ð   Ô   Ô   Ô   Ô   Ô   Ô   Ô   ×   ×   ×   ×   Ú   Ú   Ú   Ú   Ú   Ü   Ü   Ý   Ý   ß   ß   ß   à   à   à   à   à   á   á   á   á   á   á   ä   	      arg     ±      child_msg_id    ±      look       	   form_djs    "   	   form_djs 9   A      form N   ±      flag [   ±      child    ±      timer ¦   ±           ç   5        EA   E   \ ZA      E  Á@\ ZA      A A  @ A ÀÁ    ÆAÂ @  Å Â Ü       Á @@  À  @ AA     Á  @ A @A  @ A  Á  @ A ÀA  @ A  Á  ÀÿW   W@ @    Á@F ÅA   A   ÜA ÅA   AÂ  ÜA ÆGÉÇÆGÉÈÆAHÉÈÅ   Ü   @   ÀÂÈ	  ÁB	   BÉÂ	 ÁB 	  AC	  Á
 
 BA
 Á
 Â
 E  \ B À A    .   	   nx_value    m_Main_Path    nx_is_valid    arrayList_msg        HuaShanCToS_ReqPlayerList    rw_list    HuaShanCToS_ReqPlayerInfo 
   nx_string       ð?	   get_name    m_Name_NULL    HuaShanCToS_ReqVSList    dz_msg    HuaShanCToS_AnswerInvote    HuaShanCToS_ReqFightLog 	   zd_notes    HuaShanCToS_ReqAsLooker    dz_look    HuaShanCToS_GetRankNo    get_rankno    HuaShanCToS_GetHuaShanPhase 
   get_phase    HuaShanCToS_ReqLeaveLooker    CreateChild    nx_set_custom    path    func    ani_loading 	   PlayMode            Visible    lbl_loading    GAME_TIMER    UnRegister    nx_current    timeout_cancel_loading 	   Register      LÍ@      ð¿   nx_execute    custom_sender    custom_request_huashan    nx_int    unpack        è   è   è   é   é   é   é   é   ê   í   í   í   í   í   î   ñ   ó   ó   ó   õ   õ   ö   ö   ö   ø   ø   ø   ø   û   û   û   û   û   û   û   ü                                        
  
                                                                           !  !  !  !  !  $  $  %  %  &  &  )  )  )  *  *  *  *  *  ,  ,  ,  ,  ,  ,  /  /  /  /  /  /  /  /  /  /  4  4  4  4  4  4  4  4  4  4  5        path        	   funcname           child_msg_id           arg           form          flag          child T   |      timer g   |           8  @       F @ @  À   @      IÀ@ Á @         ParentForm    nx_is_valid    Visible     Close        9  :  :  :  :  :  ;  >  ?  ?  @        btn     
      form    
           C  x    
G   	@@FÀ@ @ @E  @ Á \@   FÀ@ @@E  @ Á  \@  ÀFÀ@ @ E  @ Á \@  FÀB   Â   @ @ ÆÀ@ À Å   Ü Á @ A  À A A À  B   À  Á @ A      Ä ÁD@@ É@EÉ@E    É@À @ A         Checked       @	   TabIndex    nx_execute 0   form_stage_main\form_advanced_weapon_and_origin    show_origin       @	   show_ytj       @   show_wuxuege    ParentForm    closeallform    m_child_list 	   nx_value    nx_is_valid 	   util_gui    util_get_form    groupbox_main    Add    Top            Left    Visible    get_huashan_phase     G   D  G  G  G  I  I  I  I  J  J  K  K  K  M  M  M  M  N  N  O  O  O  Q  Q  Q  Q  R  U  X  X  X  [  [  [  ^  ^  ^  _  _  _  _  _  `  `  `  `  `  `  `  `  a  a  a  a  a  b  e  e  e  e  h  h  i  j  j  l  q  w  w  w  x        btn     F      form    F      child_path "   F      form_child %   F      is_load <   B           z  ¯    Q   E   @@ W     E  À@ \    À @ @      ÅÀ  Å    Ü Ú@      Å  AB Ü B	ÃAC	ÃC	ÃÁC	ÃD	ÃAD	CÁD	C @  B	ÅB	ÁÅ  @ AC	ÅAC	ÁÅAD	ÁEA @ ÀC	ÅC	ÁÅAD	ÁEÁD	ÁEÀ ÀÁC	ÅÁC	ÁÅD	ÅD	ÁÅ        HuaShanSToC_GetHuaShanPhase       ð?
   nx_number        @   HuaShanNotStart    HuaShanFighting 	   nx_value    m_Main_Path    nx_is_valid       @   ani_1    Visible     ani_2    ani_3    ani_4    ani_5    rbtn_rw_list    Enabled    rbtn_dz_msg    HuaShanRankDay 	   PlayMode            HuaShanFightDay     Q   {  {  {  {  |                                                                                                                            ¡  ¡  ¢  ¢  ¥  ¥  ¦  ¦  §  §  ©  ©  ª  ª  ¯        arg     P      phase    P      form    P      choose    P           ²  ´       E   @  Á  Á  \@         on_custom_msg    m_Main_Path    on_server_get_phase    HuaShanCToS_GetHuaShanPhase        ³  ³  ³  ³  ³  ´        form                ·  Ê       E      \ Z@      F@ KÀÀ \ @    F@ K Á \@ F@A IÀAF B IÀAE@  \@         nx_is_valid            arrayList_msg    GetChildCount    ClearChild    ani_loading    Visible     lbl_loading    self_systemcenterinfo     ä.A       ¸  ¸  ¸  ¸  ¸  ¹  ¼  ¼  ¼  ¼  ¼  ½  Á  Á  Á  Ä  Ä  Å  Å  É  É  É  Ê        form                Í  Ù    	   E   @  \ @  À ÅÁ    Ü Ú  @    ËAÜA   Áa  Àû        ipairs    m_child_list 	   nx_value    nx_is_valid    Close    Visible         Î  Î  Î  Î  Ï  Ï  Ï  Ð  Ð  Ð  Ð  Ð  Ò  Ò  Ó  Ó  Ó  Õ  Î  ×  Ù        isclose           (for generator)          (for state)          (for control)          i          path          form           3            	   	   	   
   
   
                                                $      1   (   S   4   h   V   z   k   ä   }   5  ç   @  8  x  C  ¯  z  ´  ²  Ê  ·  Ù  Í  Ù          