LuaQ  W   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_npc_karma_prize.lua           ?      A@  @    A  @    AÀ  @   A@  ÁÀ  AA ¤   ¤A  Á ¤   ¤Á  A ¤  ¤A     Á ¤     ¤Á           A ¤  ¤A Á ¤                ¤Á A ¤  ¤A Á ¤  ¤Á A ¤  ¤A Á         require 	   util_gui    util_functions    custom_sender       $@      $À      ð?       @      @      @   main_form_init    on_main_form_open    on_main_form_close 
   hide_form 
   show_form    on_btn_karma_add_click    on_btn_karma_dec_click    on_btn_prize_gold_click    on_npc_relation_change    update_prize    update_time    update_prize_confirm    format_time    format_time_text    refersh_npc_news    change_form_size    on_btn_npc_info_click    on_btn_present_click                   	@@A  ^          Fixed       ð?                         form                   +     %   E   @  \   À      ÀÀÀ  @  A Á @ ÀÀ Á @  A Á @    Á   Ë@BA Á Å Ü B @  Â ÁÂ Ü@	ÀCÁ  Þ       	   nx_value    data_binder    nx_is_valid    AddTableBind    rec_npc_relation 3   form_stage_main\form_relation\form_npc_karma_prize    on_npc_relation_change    rec_npc_relation_delay    timer_game 	   Register      Ã@      ð¿   nx_current    update_time    Visible       ð?    %                                                   "   "   "   "   "   "   &   &   &   '   '   '   '   '   '   '   '   '   '   )   *   *   +         form     $      databinder    $      timer    $           .   9        	@@E     \@ EÀ    \ @ À      @ Á @ À           Visible     nx_destroy 	   nx_value %   form_common\form_karma_prize_confirm    nx_is_valid    Close       ð?       0   1   1   1   4   4   4   5   5   5   5   5   6   6   8   8   9         form           prize_confirm               <   P      %      A@   E     \ Z   À 	 ÁE@    \@ E    \   À      À I Á@ À  @    ÁÀ  Å    Ü Ú   @ Ë BÜ@ Á@ Þ    
   	   nx_value 3   form_stage_main\form_relation\form_npc_karma_prize    nx_is_valid    Visible     nx_destroy 6   form_stage_main\form_relation\form_npc_karma_prize_ex %   form_common\form_karma_prize_confirm    Close       ð?    %   >   >   >   ?   ?   ?   ?   ?   @   A   A   A   D   D   D   E   E   E   E   E   F   G   G   G   K   K   K   L   L   L   L   L   M   M   O   O   P         form    $      form_ex    $      prize_confirm    $           S   $         À   @@      ÁÀ   Å    Ü Ú@      Å@  AÁ  Â   Ü  @ A        @  É Â	ÃAÃ	ÃÃ	ÃÁÃ	ÃÄ	Ã  AA  E  \ ZA      KD\  À A        ÁÁ  Å   Ü Ú  @ËE@ÅB  Ü Ü  Ú   ÆÁÅÉÆ@ ÆÁÅÉÃÆÂ AB   ÉÆAÃ AB   ÉÆÃ AB   ÉÆÁÃ AB   ÉÆÄ AB   ÉÆÁÆ AB   ÉÆAÇ AB   ÉÆÇ AB   ÉÆÁÇ AB   ÉÆÈ AB   ÉÆÁÆ AÂ  ÉÆAÇ AÂ  ÉÆÇ AÂ  ÉÆÁÇ AÂ  ÉÆÈ AÂ  ÉËIE   \ Ü  B	 I@ ÂIAÂ Â ÁÂ C  AC  C  Å Ä Ü  AÄ  E Ä \ 
 ÎÄIÅ	  EÌÊ
ÆÅFÊ
E   \ Ê EÆ
  \ ÀE   \ E \ @@EÆ
  \ Æ
 ÁÆ  @EÆ
 \ Æ
 À  LE   \   À  Á ÃE \  À @À E \ ÀEÆ
  \ Æ
 ÁÆ  EÆ
  \ Æ
 À  E  \   À  Á UÃE \  À  @À E \  Dè À Å Å Ü 	 ÄÆÅ  Ü ÄÂÆÂÅ E A  Ü  ÄÂÅ    Ü ÄÂÅÄ
  Ü ÄÂÅ    Ü Ä À  Å Å Ü 	 DÇÅ   Ü ÄDÃÆDÃÅ E A  Ü  ÄDÃÅ    Ü ÄDÃÅÄ
   Ü ÄDÃÅ   Ü Ä À Å Å Ü 	'ÄLE @   ÅD	 ÆÉ	  	Ü  @	 E E \ @
@#E FJ	 E  EJ	\ E ÆÅI	 Å  FM	Ü  @ 
 E 
 \ W@À @ 
 E F
 \ @ ÇE \ 	FÃ	ÆÃE F Á  \  	FÃE   \ 	FÃEÆ
 \ 	FÃ	Ã	FÃ	Ã	Æ  @ 
 E Æ	 \ @ ÆÇE \ 	FÆÃ	ÆÆÃE F ÁÆ  \  	FÆÃE   \ 	FÆÃEÆ
 \ 	FÆÃ	ÆÃ	FÆÃ	ÆÃ	ÆÀ	 @ 
 E F \ @ÀÈE \ 	FÄ	ÆÄE F Á  \  	FÄE   \ 	FÄEÆ
 \ 	FÄ	Ä	FÄ	Ä	ÆD ÀD O  DÄ ÀD   @   
   nx_string     	   nx_value    Karma    nx_is_valid    nx_execute 	   util_gui    util_get_form 6   form_stage_main\form_relation\form_npc_karma_prize_ex    target_npc_id    btn_karma_add    Enabled     btn_karma_dec    btn_prize_gold    btn_prize_item    btn_prize_buffer    game_client 
   GetPlayer    ConditionManager    CanSatisfyCondition    nx_int      êÙ@   btn_present 	   HintText    nx_widestr    lbl_add_timeout    Text    lbl_dec_timeout    lbl_gold_timeout    lbl_item_timeout    lbl_buffer_timeout    prize_timeout 
   nx_double            GetNpcPrize    table    getn       @      ð?       @   Gold 	   nx_int64    , 
   util_text    desc_sns_delaykarma1    prize_npc_id    prize_value 
   prize_uid    desc_sns_delaykarma2    GetKarmaPrizeInfo 
   nx_number       @   desc_sns_delaymoney    prize_type 	   prize_id    prize_amount    prize_text    desc_sns_delayitem    desc_sns_delaybuff    update_time    Add    change_form_size       U   U   U   U   U   V   Y   Y   Y   Z   Z   Z   Z   Z   [   ^   ^   ^   ^   ^   ^   ^   `   `   `   `   `   a   d   d   d   d   f   f   g   g   h   h   i   i   j   j   l   l   l   m   m   m   m   m   n   q   q   r   r   r   r   r   s   v   v   v   w   w   w   w   w   y   y   y   y   y   y   y   y   y   z   z   z   |   |                                                                                                                                                                                                                                                                                                                  ¢   ¢   ¢   ¢   ¤   ¥   ¥   ¦   ¦   ¨   ¨   ¨   ¨   ¨   «   «   «   «   ­   ­   ­   ­   °   °   °   °   °   ²   ²   ²   ²   ²   ²   ²   ²   µ   µ   µ   µ   µ   µ   µ   ¸   ¸   ¸   ¸   ¸   ¸   ¸   ¸   »   »   »   »   »   »   »   »   ¼   ¼   ¼   ¼   À   À   À   À   À   À   À   À   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Æ   Æ   Æ   Æ   Æ   Æ   Æ   Æ   É   É   É   É   É   É   É   É   Ê   Ê   Ê   Ê   ¢   Ó   Ó   Ó   Ó   Ó   Ó   Ó   Ó   Ô   Ô   Ô   Ô   Ô   Õ   Õ   Ö   Ö   Ö   Ö   Ö   Ö   Ö   Ø   Ø   Ø   Ø   Ø   Ù   Ù   Ù   Ù   Ù   Ú   Ú   Ú   Ú   Ú   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Þ   Þ   Þ   Þ   Þ   ß   ß   à   à   à   à   à   à   à   â   â   â   â   â   ã   ã   ã   ã   ã   ä   ä   ä   ä   ä   ç   ç   ç   ç   ç   ç   ç   ç   é   é   é   é   é   ê   ê   ê   ê   ë   ë   ë   ë   ë   ë   ë   ë   î   î   î   ï   ï   ï   ð   ð   ð   ñ   ñ   ñ   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ô   ö   ö   ö   ö   ö   ÷   ÷   ø   ø   ø   ø   ø   ø   ø   ú   ú   ú   ú   ú   û   û   û   û   û   ü   ü   ý   ý   þ   þ   ÿ   ÿ   ÿ                                                                   	  	  
  
                                                                                                  !  !  !  #  #  #  $     
   form_base       	   configid       	   karmamgr 	        form         client -        player 5        condition_manager >     
   table_out ¡        num ¦     
   add_value §     
   dec_value ¨        gold_value ©        str_add_uid ª        str_dec_uid «        str_gold_uid ¬        timeout_add ¯        timeout_dec ²        timeout_gold µ        (for index) ¸        (for limit) ¸        (for step) ¸        i ¹        value º        timeout ¼        type ¾        table_out_prize n       num r       type }       id        amount        text             '  d      E   @  \    Á   ÅÀ    Ü Ú@      Æ Á Ë@ÁA Ü@Æ Á ËÀÁE AB \ Ü@  Æ Á ËÀÁE ÁB ËCÜ Á\ Ü@  Æ Á ËÀÁE A \ Ü@  Æ Á ËÃÜ ÁC DADE Á Á B B   \  Å ÂE Ü  ÅA ÆÆ  Ü Â A Á `E C GÆ \  Ã À ÅÃ  Ü À  G_ÂûE B ÁB  D   À  \B KÈ\B EÂ 	 ÀC	 \ WÉ    Â À ÅÂ Ã Ü À     À  B ÅC ÆÇDÜ   ÅÃ   Ü Ä A   ÀÅ Ä	 A
 D
 Á
  Å EÜ E
 AÅ  E EB \ ÜC  ø  +   	   nx_value    gui    Karma    nx_is_valid    TextManager    Format_SetIDName    ui_sns_npcvalue001    Format_AddParam 
   nx_string    prize_npc_id 	   nx_int64    prize_value    GetGoodCoefficient      @@   Format_GetText    ParentForm    lbl_add_timeout    Text    nx_execute 	   util_gui    util_get_form %   form_common\form_karma_prize_confirm    util_split_string 
   prize_uid    ,    table    getn               ð?   string    len 
   nx_number       @@   show_karma_prize_confirm 
   ShowModal    nx_wait_event     ×A   karma_prize_confirm_return    ok    custom_sender    apply_add_npc_relation    nx_int       @       )  )  )  *  *  *  +  +  +  +  +  ,  0  0  0  0  1  1  1  1  1  1  2  2  2  2  2  2  2  2  2  3  3  3  3  3  3  4  4  4  6  6  6  9  9  9  9  9  9  9  <  <  <  <  <  <  >  >  >  >  @  B  B  B  B  C  C  C  C  C  C  D  D  D  D  D  D  D  D  E  B  I  I  I  J  J  J  J  J  I  M  M  P  P  P  P  P  R  R  S  W  W  W  W  W  W  W  W  X  [  [  [  [  ]  ]  ]  ]  ]  ]  ^  ^  ^  ^  ^  ^  ^  ^  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  [  d        btn           gui       	   karmamgr          text (         time_out_text +         form_prize 2         table_uid_list 8         num <      	   real_num =         (for index) @   Q      (for limit) @   Q      (for step) @   Q      i A   P      uid_len G   P      res a         (for index) p         (for limit) p         (for step) p         i q         uid_len w            KARMA_PRIZE_TYPE_ADD     g  ¡      E   @  \    Á   ÅÀ    Ü Ú@      Æ Á Ë@ÁA Ü@Æ Á ËÀÁE AB \ Ü@  Æ Á ËÀÁE Á CÆAC  ËCÜ Á\ Ü@  Æ Á ËÀÁE Á \ Ü@  Æ Á Ë ÄÜ AD DÁDE A Á Â B   \  Å BF Ü  ÅÁ ÆÇ  Ü B A Á `E Ã HÆ \  C À ÅC  Ü À  G_ÂûE Â ÁÂ  D   À  \B KÉ\B EB	 	 ÀÃ	 \ W Ê    B À ÅB C Ü À     À  B ÅÃ ÆÈDÜ   ÅC   Ü D A   ÀÅ D
 A
 Ä
 Á  Å EÜ Å
 AE  E EB \ ÜC  ø  -   	   nx_value    gui    Karma    nx_is_valid    TextManager    Format_SetIDName    ui_sns_npcvalue002    Format_AddParam 
   nx_string    prize_npc_id 	   nx_int64    math    abs    prize_value    GetBadCoefficient      @@   Format_GetText    ParentForm    lbl_dec_timeout    Text    nx_execute 	   util_gui    util_get_form %   form_common\form_karma_prize_confirm    util_split_string 
   prize_uid    ,    table    getn               ð?   string    len 
   nx_number       @@   show_karma_prize_confirm 
   ShowModal    nx_wait_event     ×A   karma_prize_confirm_return    ok    custom_sender    apply_add_npc_relation    nx_int       @       i  i  i  j  j  j  k  k  k  k  k  l  p  p  p  p  q  q  q  q  q  q  r  r  r  r  r  r  r  r  r  r  r  r  s  s  s  s  s  s  t  t  t  v  v  v  y  y  y  y  y  y  y  |  |  |  |  |  |  ~  ~  ~  ~                                                                                                                                                                          ¡        btn           gui       	   karmamgr          text +         time_out_text .         form_prize 5         table_uid_list ;         num ?      	   real_num @         (for index) C   T      (for limit) C   T      (for step) C   T      i D   S      uid_len J   S      res d         (for index) s         (for limit) s         (for step) s         i t         uid_len z            KARMA_PRIZE_TYPE_DEC     ¤     Ì   E      Á@  \Z   @E      Á  \Z   ÀE      ÁÀ  \Z   @E      Á  \Z@      F A @ À   Å@   Ü XÀ À@ À   Å@  Ü     @@ Â     B   À  ÀA  B B ABBÅA   Ü B D     Z    À   ÅA   Ü B D    Z       ÀÅA   Ü B D   Z    @ Â   ÆB ÆÃÂÅA   Ü B D   Z    À Â  ÆB ÆÄÂÅA  Ü ÂÄE À  B  ÂÄBE ÆE  B  Ú   @ÂÄBE Æ@  B    @ÂÄBEÂ ÆÂ@  B  ÂÄF EB  ÁÂ  B   \ B Á C @ À   F@ Ä@ BÇB Â Á  AC  WH    Å     A ÜÚ  @Å E Ü WÀÁ ÅB Ã A	 C	 Á	  Å E Ü D	 AÄ	  ÜB  ÅB 
 AC
 ÜB  *      nx_find_custom    prize_text 	   prize_id    prize_amount    prize_type 
   nx_number 
   nx_string        ParentForm    lbl_gold_timeout    Text    ui_geinisuiyin    ui_geiniguanyin    ui_geinidaojv    lbl_item_timeout    ui_geinizengyi    lbl_buffer_timeout 	   nx_value    gui    TextManager    Format_SetIDName    Format_AddParam    prize_npc_id 	   nx_int64    Format_GetText    nx_execute 	   util_gui    util_get_form %   form_common\form_karma_prize_confirm    show_karma_prize_confirm 
   ShowModal    nx_wait_event     ×A   karma_prize_confirm_return    ok    custom_sender    apply_add_npc_relation    nx_int       @        5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     Ì   ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  ¦  §  ­  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ¯  ³  ¶  ·  ¹  ¼  ¼  ¼  ¼  ¼  ½  Á  Á  Á  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Å  Å  Æ  É  É  Ê  Ê  Ê  Ê  Ê  Ê  Ê  Ê  Ì  Ì  Í  Ð  Ð  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ó  Ó  Ô  ×  Ø  Ú  Ú  Ú  Ú  Û  Û  Û  Û  Û  Û  Û  Û  Ý  Ý  Þ  á  ã  ã  ã  æ  æ  æ  é  é  é  é  é  é  ê  ê  ê  ê  ê  ê  í  í  î  î  î  î  î  î  ò  ò  ó  ó  ó  ó  ó  ó  õ  õ  õ  ø  ø  ø  ø  ø  ø  ø  ú  ú  ú  û  û  û  û  û  û  ú  þ  þ                                        	  	  	  	  	  	  	  	  	  	  	  	  	                  btn     Ë      prize_type    Ë   
   form_text ,   Ë      text_para_2 -   Ë      text_para_3 .   Ë   	   bHasText /   Ë      time_out_text 8   Ë      gui u   Ë      text    Ë      form_prize    Ë      res ¬   Ë         KARMA_PRIZE_TYPE_MONEY_BIND    KARMA_PRIZE_TYPE_BUFFER    KARMA_PRIZE_TYPE_MONEY    KARMA_PRIZE_TYPE_ITEM       )       E  A  \ ÀÂ  A B  Á    AÃ Ã A BÀÿ@BÀÿBÀÿÀBÀÿ       	   nx_value    timer_game 	   Register      @@      ð?   nx_current    update_prize       ð¿   add    update    del    clear                                                $  $  (  (  )        self           recordname           optype           row           clomn           timer               ,            A@    ÁÀ   B   E     \ Z@      F@A Z@      E    ÁÀ \Z@      FÀA   À   @B     ÁÀ  Å    Ü Ú@      Ë CE  \ Ü  A C@ ÁCE  À \AEA  \ A Á  ÀFÁD IAEFE IAEFÁE IAEFF IAEFAF IAEFF  ÁA  IFAG  ÁA  IFG  ÁA  IFÁG  ÁA  IFH  ÁA  I  AA A ÁA B AB B Å C Ü  AC  E C \  ÎÃCÄ  DÌÄÆÄÅÈE  
\  É
 EE	  	\ À
E  \ 
E 	\ @
@EE	  	\ E	 ÁE  @EE	 \ E	 À 	 L
E  \  À 
 Á	 Â
E 	\  À @À E 	\ À
EE	  	\ E	 ÁE  
EE	  \ E	 À 	 
E \  À 
 Á	 UÂ
E 	\  À  @À E 	\  
Cè À Å D Ü @F Å  Ü ÃÃD JÃD Å 
 AÄ
  Ü  ÃÃD Å   Ü ÃÃD ÅC	  Ü ÃÃD Å   Ü ÃÀF Å D Ü ÃÃD CEF Å D Ü Ã À  Å D Ü @CG Å   Ü ÃE JE Å 
 AÄ  Ü  ÃE Å   Ü ÃE ÅC	   Ü ÃE Å  Ü ÃÀCG Å D Ü ÃE CECG Å D Ü Ã À Å D Ü )LD @   ÅC ÆÃ  Ü D @ ED  \ @1D FD E ÄH\ D ÆÄC Å LÜ E @  EE  \ W@
ÀE @  EE Å \ @
 G E \ 	EÅE 	JÅE E 
 ÁÅ  \  	EÅE E  \ 	EÅE EE	 \ 	EÅE 	ÅE 	EÅE 	ÅE 	Å@"E @  EE Å \ @
 ÅG E \ 	EF 	JF E 
 Á  \  	EF E  \ 	EF EE	 \ 	EF 	F 	EF 	F 	Å E @  EE  \ @
 H E \ 	EEF 	JEF E 
 ÁE  \  	EH E  À \  	EEF E  \ 	EEF EE	 \ 	EEF 	EF 	EEF 	EF 	Å G Å D Ü ÃÃE CEG Å D Ü ÃÃG Å D Ü ÃF CEÃG Å D Ü ÃH Å D Ü ÃCF CEH Å D Ü Ã  ÁÃ  ED D \  À  ÅD E Ü C   À  C   ?      nx_execute 	   util_gui    util_get_form 6   form_stage_main\form_relation\form_npc_karma_prize_ex    nx_is_valid    Visible    nx_find_custom    target_npc_id 
   nx_string     	   nx_value    Karma    GetNpcPrize    table    getn       @   refersh_npc_news 
   nx_number       ð?   btn_karma_add    Enabled     btn_karma_dec    btn_prize_gold    btn_prize_item    btn_prize_buffer    lbl_add_timeout    Text    nx_widestr    lbl_dec_timeout    lbl_gold_timeout    lbl_item_timeout    lbl_buffer_timeout         
   nx_double        @   Gold 	   nx_int64    ,    prize_timeout 	   HintText 
   util_text    desc_sns_delaykarma1    prize_npc_id    prize_value 
   prize_uid    desc_sns_delaykarma2    GetKarmaPrizeInfo    nx_int       @   desc_sns_delaymoney    prize_type 	   prize_id    prize_amount    prize_text    desc_sns_delayitem    desc_sns_delaybuff    format_time    custom_sender    apply_add_npc_relation        @   update_time       .  .  .  .  .  .  .  0  0  0  0  0  1  4  4  4  5  8  8  8  8  8  8  9  =  >  >  >  >  >  ?  B  B  B  C  C  C  C  C  D  G  G  G  G  G  I  I  I  I  I  L  L  L  L  O  O  O  O  O  O  O  O  Q  Q  R  R  S  S  T  T  U  U  W  W  W  W  W  X  X  X  X  X  Y  Y  Y  Y  Y  Z  Z  Z  Z  Z  [  [  [  [  [  ]  `  a  b  d  e  g  i  i  i  j  j  j  k  k  k  m  m  m  m  o  p  p  q  q  s  s  s  s  s  v  v  v  v  w  w  w  w  z  z  z  z  z  }  }  }  }  }  }  }  }                                                                                                                              m                                                     ¢  ¢  ¢  ¢  ¢  £  £  £  £  £  ¤  ¤  ¤  ¤  ¤  ¤  §  §  §  §  §  ¨  ¨  ª  ª  ª  ª  ª  ­  ­  ­  ­  ­  ­  ­  ­  ®  ®  ®  ®  ®  ¯  ¯  °  °  °  °  °  °  °  ²  ²  ²  ²  ²  ³  ³  ³  ³  ³  ´  ´  ´  ´  ´  ´  ¶  ¶  ¶  ¶  ¶  ·  ·  ¹  ¹  ¹  ¹  ¹  ¼  ¼  ¼  ¼  ¼  ¼  ¼  ¼  ½  ½  ½  ½  ½  ¾  ¾  ¾  ¾  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  Â  Â  Â  Ã  Ã  Ã  Ä  Ä  Ä  Å  Å  Å  È  È  È  È  È  È  È  È  È  È  È  È  È  È  È  È  Ë  Ë  Ë  Ë  Ë  Ì  Ì  Í  Í  Í  Í  Í  Í  Í  Ï  Ï  Ï  Ï  Ï  Ð  Ð  Ð  Ð  Ð  Ò  Ò  Ó  Ó  Ô  Ô  Õ  Õ  Õ  ×  ×  ×  ×  ×  ×  ×  ×  Ù  Ù  Ù  Ù  Ù  Ú  Ú  Û  Û  Û  Û  Û  Û  Û  Ý  Ý  Ý  Ý  Ý  Þ  Þ  Þ  Þ  Þ  à  à  á  á  â  â  ã  ã  ã  å  å  å  å  å  å  å  å  ç  ç  ç  ç  ç  è  è  é  é  é  é  é  é  é  ê  ê  ê  ê  ê  ê  ê  ë  ë  ë  ë  ë  ì  ì  ì  ì  ì  î  î  ï  ï  ð  ð  ñ  ñ  ó  ö  ö  ö  ö  ö  ÷  ÷  ø  ø  ø  ø  ø  ú  ú  ú  ú  ú  û  û  ü  ü  ü  ü  ü  þ  þ  þ  þ  þ  ÿ  ÿ                                                         form         npc_id      	   karmamgr "     
   table_out -        num 2     
   add_value c     
   dec_value d        gold_value e        str_add_uid f        str_dec_uid g        str_gold_uid h        timeout_add k        timeout_dec n        timeout_gold q        (for index) t   Ó      (for limit) t   Ó      (for step) t   Ó      i u   Ò      value v   Ò      timeout x   Ò      type z   Ò      table_out_prize D  å     num H  å     type S  å     id V  å     amount Y  å     text \  å          
  {   Q  F @ @  À   @    À  Á   Å@   Ü Ú@      ËAEA   \ Ü  Á B@ ABE  \  ÁÁ      EÁ   \ A À A      AÃ Å ÂC A ÜÚ   ÅA ÂC DÜ B @  ÀÀÆÁC Â E B ÆÂC ÆÄ ÅB   Ü Â\   ÉÅA   FÂC FÄÜAÆÁC Â A   ÉÆE ÉÆÅA   A  ÜAÅ BF A ÜÚ   ÅA BF DÜ B @  ÀÀÆAF Â E B ÆBF ÆÄ ÅB   Ü Â\   ÉÅA  FBF FÄÜAÆAF Â A   ÉÆF ÉÆÅA  A  ÜAÅ ÂF A ÜÚ   ÅA ÂF DÜ B @  ÀÀÆÁF Â E B ÆÂF ÆÄ ÅB   Ü Â\   ÉÅA  FÂF FÄÜAÆÁF ÆÄÂF EÂ   \ 	BG 	ÆB D   BB  @ W@ B A Â Å C Ü C  @  E  \ B  Å ÂH A ÜÚ   ÅA ÂH DÜ B @  ÀÀÆÁH Â E B ÆÂH ÆÄ ÅB   Ü Â\   ÉÅA FÂH FÄÜAÆÁH ÆÄÂH EÂ   \ 	BI 	ÆB D  BB  @ W@ B A Â Å C Ü C  @  E  \ B  Å BI A ÜÚ   ÅA BI DÜ B @  ÀÀÆAI Â E B ÆBI ÆÄ ÅB   Ü Â\   ÉÅA  FBI FÄÜAÆAI ÆÄBI EÂ   \ 	BI 	ÆB D   BB  @ W@ B A Â Å C Ü C  @  E  \ B    '      target_npc_id 
   nx_string     	   nx_value    Karma    nx_is_valid    GetNpcPrize    table    getn       @
   nx_number       ð?   MessageDelay    GetServerDateTime    nx_find_custom    lbl_add_timeout    prize_timeout 
   nx_double    Text    nx_widestr    format_time    update_prize_confirm    btn_karma_add    Enabled     lbl_dec_timeout    btn_karma_dec    lbl_gold_timeout    btn_prize_gold    nx_execute    custom_sender    apply_add_npc_relation    nx_int        @           lbl_item_timeout    btn_prize_item    lbl_buffer_timeout    btn_prize_buffer     Q                                                                                 !  !  !  !  !  "  %  %  (  (  (  (  (  (  (  (  (  (  (  (  (  (  (  )  )  )  )  )  )  )  )  )  )  )  )  )  )  +  +  +  +  +  +  -  -  -  -  -  .  .  0  0  0  0  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  5  5  5  5  5  5  5  5  5  5  5  5  5  5  7  7  7  7  7  7  9  9  9  9  9  :  :  <  <  <  <  @  @  @  @  @  @  @  @  @  @  @  @  @  @  @  B  B  B  B  B  B  B  B  B  B  B  B  B  B  E  E  E  E  E  E  G  G  I  I  I  I  I  J  J  L  L  L  L  O  O  O  O  O  P  P  P  P  P  P  P  P  P  P  P  P  P  U  U  U  U  U  U  U  U  U  U  U  U  U  U  U  W  W  W  W  W  W  W  W  W  W  W  W  W  W  Y  Y  Y  Y  Y  Y  [  [  ]  ]  ]  ]  ]  ^  ^  `  `  `  `  b  b  b  b  b  d  d  d  d  d  d  d  d  d  d  d  d  d  i  i  i  i  i  i  i  i  i  i  i  i  i  i  i  k  k  k  k  k  k  k  k  k  k  k  k  k  k  m  m  m  m  m  m  o  o  q  q  q  q  q  r  r  t  t  t  t  w  w  w  w  w  x  x  x  x  x  x  x  x  x  x  x  x  x  {  
      form     P     npc_id    P  	   karmamgr 
   P  
   table_out    P     num    P  
   msg_delay &   P     cur_date_time .   P  	   old_time ¯   Ì   	   old_time ñ     	   old_time 3  P        KARMA_PRIZE_TYPE_ADD    KARMA_PRIZE_TYPE_DEC    KARMA_PRIZE_TYPE_MONEY    KARMA_PRIZE_TYPE_ITEM    KARMA_PRIZE_TYPE_BUFFER     ~            Á@    @   @        nx_execute %   form_common\form_karma_prize_confirm    update_time                            current_prize_type           time_out_text                         E   @  Å     Ü  \  À  À   Å@ ÆÁ  Ü WÀÁ@ Á  Þ  Å@ ÁAÜ Þ    
      nx_function    format_date_time 
   nx_double    util_split_string    ;    table    getn        @       format_time_text                                                            date           str_dt       	   table_dt 
         format_time                 ­       E   F@À    \   À   WÀ@        AÅ@    Ü  AÁ  Å@   Ü  Â  @     
      string    len 
   nx_number        @   sub 
   nx_string       ð?      @   00:00    00:01                ¡  ¡  ¡  ¡  ¡  ¢  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¨  ¨  ¨  ¨  ¨  ©  ¬  ­        text           len          format_time               °  í    v      Á@   Å     Ü   AÁ   E \ A À    AÂABÂBÁB @     @ A À    ÁÂB @  BÅA   Ü Ú  ËÁBA   UÜB @    ÀÃ @ ÉÂ ÉÄ AÂ  À  U ÉA À  A   A À   @
  Á  ÅA   Ü Ú  @ÆAEËÁÂA   UÜB @   ÂÂ À  ÂEB  \ Z   ÀÃ @ 	Â 	ÄE Â Å   Ü Â\ 	B     	   nx_value 2   form_stage_main\form_relation\form_relation_shili 2   form_stage_main\form_relation\form_relation_fujin 3   form_stage_main\form_relation\form_relation_renmai    nx_null    nx_is_valid 	   lbl_news    Visible     lbl_news_num    groupbox_npc    Find 
   nx_string    gb_npc_info    lbl_news_num_            Text    nx_widestr     /   form_stage_main\form_relation\form_friend_list    player_list    gb_player_     v   ²  ²  ²  ´  ´  ´  µ  µ  µ  ·  ·  ¹  ¹  ¹  ¹  ¹  »  »  ¼  ¼  ¿  ¿  ¿  ¿  ¿  ¿  ¿  Ê  Ê  Ê  Ê  Ê  Ë  Ë  Ë  Ë  Ë  Ì  Ì  Ì  Ì  Ì  Í  Í  Í  Í  Í  Î  Î  Î  Î  Î  Ï  Ï  Ð  Ð  Ò  Ó  Ó  Ó  Ó  Ó  Ó  Ó  Ó  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ú  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Ý  Þ  Þ  Þ  Þ  Þ  Þ  ß  ß  ß  ß  ß  à  à  à  à  à  á  á  á  á  á  â  â  ã  ã  å  æ  æ  æ  æ  æ  æ  æ  æ  í        npc_id     u      num     u      form_shili    u      form_fujin    u      form_renmai 	   u      gb_npc    u      gb_npc_info %   A      lbl_npc_news_num /   A      form_friend_list N   u   
   gb_player Y   u      lbl_npc_news_num c   u           ð  ù       F @ @  À      ÀÀ 	 ÀÀ 	 Á 	 @Á 	        Parent    nx_is_valid    Left    Top    Width    Height        ò  ó  ó  ó  ó  ó  ô  ô  õ  õ  ö  ö  ÷  ÷  ù        form        
   form_base               ü         E   @@ Á  \Z@      F@@ FÀ À  Á  A @ @         nx_find_custom    ParentForm    target_npc_id    nx_execute ,   form_stage_main\form_relation\form_npc_info    show_npc_info        þ  þ  þ  þ  þ  þ  ÿ                        btn           npc_id 	              
  +    
>   E   @@ Á  \Z@      F@@ FÀ ÀÀ       Á@  @  ÅÀ   Ü Á A       Å@  Ü Á @     @A  AA  Á  B   À  Á @ A      É@É ÉÄÁÄA  A A Â A         nx_find_custom    ParentForm    target_npc_id        nx_execute ,   form_stage_main\form_relation\form_npc_info    get_scene_id 
   nx_number       ð¿	   nx_value $   form_stage_main\form_present_to_npc    nx_is_valid    nx_destroy 	   util_gui    util_get_form    npc_id 	   scene_id    type        @   Show    form_stage_main\form_bag    auto_show_hide_bag     >                                                                             !  !  !  !  !  !  !  !  "  "  "  "  "  #  %  &  '  (  (  *  *  *  *  *  +        btn     =      npc_id 	   =   	   scene_id    =      form    =       ?                     	   	   	                           +      9   .   P   <   $  S   d  d  '  ¡  ¡  g            ¤  )      ,  {  {  {  {  {  {  
    ~      ­    í  °  ù  ð    ü  +  
  +        KARMA_PRIZE_TYPE_ADD 
   >      KARMA_PRIZE_TYPE_DEC    >      KARMA_PRIZE_TYPE_MONEY_BIND    >      KARMA_PRIZE_TYPE_MONEY    >      KARMA_PRIZE_TYPE_ITEM    >      KARMA_PRIZE_TYPE_BUFFER    >       