LuaQ  \   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_school_war\form_school_war_control.lua           -      A@  @    A  @    AÀ  @ 
  	@A	ÀA	@B	ÀB	@C	ÀC	@D	ÀDA  ¤   @ ¤@   ¤  À ¤À           ¤  @ ¤@  ¤ À ¤À   ¤  @ ¤@  ¤    À          require    util_functions 	   util_gui 2   form_stage_main\form_school_war\school_war_define    school_jinyiwei    jy    school_gaibang    gb    school_junzitang    jz    school_jilegu    jl    school_tangmen    tm    school_emei    em    school_wudang    wd    school_shaolin    sl 8   form_stage_main\form_school_war\form_school_war_control    main_form_init    on_main_form_open 
   open_form    refresh    refresh_sl    on_main_form_close    on_btn_close_click    on_btn_start_school_war_click    on_btn_click    forbidselfschool    close_form                    	@@        Fixed                      form                "   ?     X   E   @  Á  Á  \@ E  @ \ ÀÁ ÆÀA À  B	 Â ÆB À  B		 Ã	ÃÀ À   @  D Å Á Ü À E Å Á Ü À@E Å Á Ü ÀE Å Á Ü ÀÀE Å Á Ü À F Å Á Ü À@F Å Á Ü ÀF Å Á Ü À  ÁÀ  Å    Ü Ú   ÀË@GE \ Á À  Ü@Ë HAA  Å Ü Â @  Â ÁÂ Ü@  $      nx_execute    custom_sender +   custom_send_request_look_school_fight_info       "@	   nx_value    gui    Left    Width        @   Top    Height    targetschool            selective_btn     forbidselfschool    mtb_jy3 	   HtmlText    nx_widestr    @ui_school_wubaobei    mtb_gb3    mtb_jz3    mtb_jl3    mtb_tm3    mtb_em3    mtb_wd3    mtb_sl3    timer_game    nx_is_valid    UnRegister    nx_current    close_form 	   Register     OA      ð?      ð¿    X   #   #   #   #   #   $   $   $   %   %   %   %   %   &   &   &   &   &   '   (   *   *   *   -   -   -   -   -   .   .   .   .   .   /   /   /   /   /   0   0   0   0   0   1   1   1   1   1   2   2   2   2   2   3   3   3   3   3   4   4   4   4   4   7   7   7   9   9   9   9   9   ;   ;   ;   ;   ;   ;   =   =   =   =   =   =   =   =   =   =   ?         self     W      gui    W      timer B   W           A   L        E   @  Á  ` EÁ  FIAA_ÀþE À À     \@          sf_school_jinyi    sf_school_shaolin       ð?   school_table    treasureSUM            refresh    unpack        B   B   B   B   C   C   C   B   K   K   K   K   K   L         arg           (for index)          (for limit)          (for step)          j               N   t    ¯   E      \ @  À   @         Á   Å@    Ü Ú@      ÅÀ  Æ Á   Ü A OÁA  Â MBÁNÁLBÁFB  E BÁAA \ B ÅB ÆÆÂÌBÁÂÂÂ C AC  E  ÅC ÆÆÃÃ\ CËCE Ã \  Ä D CÆ Å  Ü UÃÜC B@A@ FÃDKÅÅC ÆCÆÁ\  E  \ CÉC BÃE F  FCÄ E C \ CÉÉÂE FCÄ E ÃDED DA\   Á  ÉÁæÁ E A  
ÂÂ C ÁB  Å  EC FÃFÃCÜ ÂKCÅ C Ü  D C ÃCF E  \ ÕB\Â ÅB ÆÂÆÂÂ  @  I @ IÁô  "   	   nx_value    nx_is_valid    gui    table    getn       ð?       @
   nx_number 
   nx_string    school_table    treasureSUM    groupbox_msg    Find 
   groupbox_    school    mtb_    3 	   HtmlText    nx_widestr    TextManager    GetText    item_table             @           <br>    Top    sf_school_jinyi    sf_school_shaolin    lbl_    2    refresh_sl    Text 
   ForeColor     ¯   O   O   O   P   P   P   P   P   Q   S   S   S   T   T   T   T   T   U   W   W   W   W   Y   Y   Y   Y   Z   Z   Z   Z   Z   Z   [   [   [   [   [   [   \   \   \   \   \   \   \   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   ]   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   `   `   `   `   `   a   a   a   a   a   a   a   a   a   a   a   a   a   a   c   c   c   c   c   c   d   d   d   d   d   d   d   d   e   g   g   g   g   g   g   g   g   g   g   g   g   g   g   g   g   Y   m   m   m   m   n   n   n   n   n   n   n   n   n   n   n   n   n   n   o   o   o   o   o   o   o   o   o   o   o   o   o   o   o   o   p   p   p   p   p   q   q   q   q   r   r   r   r   m   t         arg     ®      form    ®      gui    ®      arg_num    ®      (for index)    ~      (for limit)    ~      (for step)    ~      i    }   	   schoolid     }      item_id &   }      grp_box ;   }   	   grp_text K   }      (for index)    ®      (for limit)    ®      (for step)    ®      j    ­      grp_box    ­   	   grp_text     ­      Text ¥   ­   
   ForeColor ¥   ­      
   form_name    school_table_sx     u   }         @ @E@    \ À  ^  W A @ @A @E@   \ À ^    E@  @ \  ^                 nx_widestr    @ui_schoolwar_rou    255,0,139,69       ð?       @   @ui_schoolwar_putong    255,0,0,128       @   @ui_schoolwar_qiang    255,178,34,34        v   v   w   w   w   w   w   w   x   x   x   x   y   y   y   y   y   y   z   z   {   {   {   {   {   }         lv                ~           E   @  \   À      @ÀÀ   AA   @ À   @      	   nx_value    timer_game    nx_is_valid    UnRegister    nx_current    close_form    nx_destroy                                                                    form           timer                          F @ @  À   @      À @           ParentForm    nx_is_valid    Close                                               btn     
      form    
                      F @ @À W@À  Á  A E AÀ \ @          ParentForm    targetschool            nx_execute    custom_sender "   custom_send_Request_Declare_Fight    nx_int                                                  btn           form                  °     1   F @ @@ @   I 
@@ @A  I@@ ÀA   I @@ @B  I@@ ÀB   I @@ @C  I@@ ÀC   I @@ @D@  I        ParentForm    Name    btn_shaolin    targetschool    sf_school_shaolin    btn_wudang    sf_school_wudang 	   btn_emei    sf_school_emei    btn_gaibang    sf_school_gaibang    btn_tangmen    sf_school_tangmen 
   btn_junzi    sf_school_junzi 
   btn_jinyi    sf_school_jinyi 	   btn_jile    sf_school_jile     1                           ¡   ¡   ¡   ¢   ¢   ¢   £   £   £   ¤   ¤   ¤   ¥   ¥   ¥   ¦   ¦   ¦   §   §   §   ¨   ¨   ¨   ©   ©   ©   ª   ª   ª   «   «   «   ¬   ¬   ¬   ­   ­   ­   ®   ®   °         btn     0      form    0           ³   Ú     <   E   @  \ À  ÅÀ    Ü Ú@      Ë AAA Ü ÀÁ@  @Â@  ÀÂ@  @Ã@  ÀÃ@  @Ä@  ÀÄ@   @Å   A    FÁE KÆÀ \Á  À     IÆ     	   nx_value    game_client 
   GetPlayer    nx_is_valid 
   QueryProp    School        school_jinyiwei 
   btn_jinyi    school_gaibang    btn_gaibang    school_junzitang 
   btn_junzi    school_jilegu 	   btn_jile    school_tangmen    btn_tangmen    school_emei 	   btn_emei    school_wudang    btn_wudang    school_shaolin    btn_shaolin    groupbox_msg    Find    Enabled      <   ´   ´   ´   ¶   ¶   ¸   ¸   ¸   ¸   ¸   ¹   ¼   ¼   ¼   ¾   ¿   ¿   À   À   Á   Á   Â   Â   Ã   Ã   Ä   Ä   Å   Å   Æ   Æ   Ç   Ç   È   È   É   É   Ê   Ê   Ë   Ë   Ì   Ì   Í   Í   Î   Ñ   Ñ   Ò   Õ   Õ   Õ   Õ   ×   ×   ×   ×   ×   Ø   Ú         form     ;      game_client    ;      client_player    ;      playerschool    ;   	   btn_name    ;      school_btn 5   ;           Ý   ã           A@    Ä     B   EÀ     \ Z   @ K A \@         nx_execute 	   util_gui    util_get_form    nx_is_valid    Close        Þ   Þ   Þ   Þ   Þ   Þ   Þ   à   à   à   à   à   á   á   ã         form          
   form_name -            	   	   	   
   
   
                                        ?   "   L   A   t   t   t   N   }   u      ~               °      Ú   ³   ã   ã   Ý   ã         school_table_sx    ,   
   form_name    ,       