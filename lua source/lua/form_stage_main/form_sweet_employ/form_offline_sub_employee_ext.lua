LuaQ  d   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_sweet_employ\form_offline_sub_employee_ext.lua           9      A@  @   AÀ    ä   Ç@ ä@  Ç ä  ÇÀ äÀ  Ç  ä        Ç@ ä@ Ç ä     ÇÀ äÀ Ç  ä  Ç@ ä@ Ç ä    ÇÀ äÀ Ç  ä      Ç@ ä@     Ç ä ÇÀ äÀ Ç  ä  Ç@ ä@ Ç ä ÇÀ äÀ Ç  ä  Ç@ ä@ Ç         require    util_functions @   form_stage_main\form_sweet_employ\form_offline_sub_employee_ext       @      @   on_main_form_init    on_main_form_open    on_main_form_close    change_form_size 
   init_form    on_btn_close_click 
   open_form    on_rbtn_checked_changed    show_sweet_lists    del_subcontrol    init_control    fill_sweet_info    clone_team_set_groupbox    clone_sweet_groupbox    on_cbtn_bg_checked_changed    on_btn_set_click    on_btn_xiuxi_click    on_btn_chuzhan_click #   on_cbtn_team_title_checked_changed    on_btn_jiejiao_record_click    sweet_team_set    init_team_set        
           	@@        Fixed                     form                        	   E      \@ E@     \@ F@ I Á        change_form_size 
   init_form    rbtn_type_1    Checked     	                                    form                           E      \@         nx_destroy                          form                   (        E      \ Z@      E@    \    À   @       Á Æ A À @A	ÀÁ ÆÀA À @A	         nx_is_valid 	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height                          !   !   !   "   "   "   "   "   #   &   &   &   &   &   '   '   '   '   '   (         form           gui 	              +   C    %   E      \ Z@      E@  @ \@ EÀ  @ Ä   \@E@   A \@ E@  A Ä  \@E À \  Â  Å     Ü Ú@      Ë@BA ÜÁB 	Á         nx_is_valid    del_subcontrol 
   gsb_sweet    init_control    gsb_team_set    init_team_set 	   nx_value    game_client 
   GetPlayer 
   QueryProp    Photo    lbl_cur_image 
   BackImage     %   ,   ,   ,   ,   ,   -   1   1   1   2   2   2   2   4   4   4   5   5   5   5   8   8   8   9   9   :   :   :   :   :   ;   ?   ?   ?   @   @   C         form     $      game_client    $      client_player    $      photo "   $         SPACE_NUMBER    TEAM_SET_NUMBER     F   N        F @ @  À   @      IÀ@ Á @         ParentForm    nx_is_valid    Visible     Close        G   H   H   H   H   H   I   L   M   M   N         btn     
      form    
           Q   `           D    E@     \ Z   À 	À@K A \@   E@  ÁÀ   B   \    E@     \ Z@      	 BK@B \@   
   	   nx_value    nx_is_valid    Visible     Close    nx_execute 	   util_gui    util_get_form    Show        R   R   R   S   S   S   S   S   T   U   U   V   Y   Y   Y   Y   Y   Y   Y   Y   Z   Z   Z   Z   Z   [   ^   _   _   `         form          
   FORM_NAME     b   t     $   F @ Z@      F@@   À   @      À@ Å    Ü  AA   À Å   Ü@ Å    Ü  AÁ    Å    Ü@   	      Checked    ParentForm    nx_is_valid 	   TabIndex 
   nx_number            show_sweet_lists       ð?   sweet_team_set     $   c   c   c   d   g   h   h   h   h   h   i   l   m   m   m   m   m   m   m   m   o   o   o   o   p   p   p   p   p   p   p   p   r   r   r   t         rbtn     #      form    #   
   tab_index    #           w   ~        E      \ Z@      F@@ IÀ@F A I@A        nx_is_valid 
   gsb_sweet    Visible    gsb_team_set         x   x   x   x   x   y   |   |   }   }   ~         form     
                   ,   K @ \ @  @À   ÅÀ   Ü A @ A        A Á  Â EB  \ Z   E  \ @ÂÀE  ÁÂ \Z  @KC À \BKBÃÀ \BÁù        GetChildControlList    table    getn 	   nx_value    gui    nx_is_valid       ð?      ð¿   nx_name 	   GroupBox    nx_find_custom    dynamic_create    Remove    Delete     ,                                                                                                                                       	      ctl     +      child_table    +      child_count    +      gui 	   +      (for index)    +      (for limit)    +      (for step)    +      i    *      child    *              ¾    O    @ Å@    Ü A  A   Y @ÅÀ     Ü Ú    ÅÀ    Ü Ú@      Á   @  ÁB @  EÂ   \ Z  	ÂAFBIÂ	ÂEÂ À \BKC À \BúÁD    ÁB @ B EÂ   \ Z  	ÂAFBIÂFC ÁB  Å  Ü ÂIKC À \Bù	ÀDE A         ParentForm 
   nx_number            nx_is_valid       ð?   clone_sweet_groupbox    Visible    cbtn_bg 	   TabIndex    sweet_index    fill_sweet_info    Add        @   mltbox_no_hire_tips 	   HtmlText    nx_widestr 
   ¿ÕÏÐÀ¸Î»     IsEditMode     ResetChildrenYPos     O                                                                                  ¡   ¡   ¡   ¡   ¢   ¢   ¢   ¢   ¢   £   ¤   ¤   §   ª   ª   ª   ª   ¬   ¬   ¬       ±   ±   ±   ±   ²   ²   ²   ²   ³   ³   ³   ³   ³   ´   µ   µ   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ·   ·   ·   ±   ¼   ½   ½   ¾         ctl     N      space_number     N      form    N      cur_sweet_number    N      (for index)    .      (for limit)    .      (for step)    .      i    -      gb    -      (for index) 1   K      (for limit) 1   K      (for step) 1   K      j 2   J      gb 6   J         SPACE_NUMBER     Á   ç     k      À    Å   A  Ü XÀ    À   @      À  Á   Ë@AÜ   @ A      ÁÁ A      ÂÁ ÁA B  FÂ IKÂÁÁ B AB \Ã Å  Ü ÁÂÂ AB Â ÆÄ  EB  ÁÂ C @  Õ \    ÉËÂA B ÁB Ü  @ E  B \ @@Å E B Å Ã Ü   \  	BÆ 	ÆÂÆ 	Ç Å E B Å C Ü   \  	BÆ 	ÇÂÆ 	Æ     
   nx_number       ð?   nx_is_valid 	   nx_value    game_client 
   GetPlayer    FindRecord    rec_pet_show    QueryRecord         
   lbl_photo 
   BackImage 	   lbl_name    Text    nx_widestr       @
   lbl_shili 
   nx_string 
   util_text    desc_    rec_pet_show_base_prop       @   lbl_status    ui_sweetemploy_08    btn_chuzhan    Enabled 
   btn_xiuxi     ui_sweetemploy_07     k   Â   Â   Â   Â   Â   Â   Â   Â   Â   Â   Â   Â   Â   Ã   Ç   Ç   Ç   È   È   É   É   É   É   É   Ê   Í   Í   Í   Í   Í   Î   Ò   Ò   Ò   Ò   Ò   Ó   Ó   Õ   Õ   Õ   Õ   Õ   Ö   Ö   Ö   Ö   Ö   Ø   Ø   Ø   Ø   Ø   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ý   Ý   Ý   Ý   Ý   Þ   Þ   Þ   Þ   Þ   Þ   Þ   Þ   ß   ß   ß   ß   ß   ß   ß   ß   ß   à   à   á   á   á   ã   ã   ã   ã   ã   ã   ã   ã   ã   ä   ä   å   å   ç         i     j      gb     j      game_client    j      client_player    j      photo $   j      name +   j      level 5   j      status G   j           ê   ¢   *9  E   @  \   À          À   @  @     ÀÀ  Æ@A   @       @ A  @   ÀA @ AA  ÁBÀ  ÁA `ÁE  ÆC @\B  _ýKÃÁÁ \ÁÀ  Å    Ü Ú   	Å   Ü Ú  ÀÅ  Ü B E FÂÂ\ B  Â @ ÃÅC  FÄÜC  ýB @   B @ Â Á B BE BËÃA ÜÂÀ  E   \ Z  ÀE  \ Z  E \ B Å ÆÂÂ Ü C  Â À DED ÆD\C  ýBE  B KÃÁÂ \ÂÀ  Å    Ü Ú  ÀÅ   Ü Ú  Å  Ü C E FÃÂ\ C  Ã @ ÄÅD  FÅÜD  ýCE C	ËÃAC ÜÃÀ  E   \ Z  ÀE  \ Z  E \ C Å ÆÃÂ Ü D  Ã À EEE ÆE\D  ýCE  C	KÃÁÃ \ÃÀ  Å    Ü Ú  ÀÅ   Ü Ú  Å  Ü D E FÄÂ\ D  Ä @ ÅÅE  FÆÜE  ýDE D	ËÃA ÜÄÀ  E   \ Z  ÀE  \ Z  E \ D Å ÆÄÂ	 Ü E  Ä À FEF ÆF\E  ýDE  D	KÃÁD \ÄÀ  Å    	Ü Ú  ÀÅ   Ü Ú  Å  Ü E E FÅÂ
	\ E  Å @ 	Æ	ÅF  FÇ	ÜF  ýEE 	E	ËÃA ÜÅÀ  E   
\ Z  ÀE  	\ Z  E 	\ E Å ÆÅÂ 
Ü F  Å À 
G
EG 	ÆG
\F  ýEE  
E KÃ	ÁÅ \ÅÀ  Å    Ü Ú  ÀÅ   
Ü Ú  Å  
Ü F E FÆÂ\ F  Æ @ ÇÅG  
FÈÜG  ýFE
 F	ËÃ	A ÜÆÀ  E   \ Z  ÀE  \ Z  E \ F Å ÆÆÂ Ü G  Æ À HEH ÆH\G  ýFE
  F	KÃ	ÁF \ÆÀ  Å    Ü Ú  ÀÅ   Ü Ú  Å  Ü G E FÇÂ\ G  Ç @ ÈÅH  	FÉÜH  ýGE
 G	ËÃ	A ÜÇÀ  E   \ Z  ÀE  \ Z  E \ G Å ÆÇÂ Ü H  Ç À IEI 	ÆI\	H  ýGE
  G	KÃ	ÁÇ \ÇÀ  Å    Ü Ú  ÀÅ   Ü Ú  Å  Ü H E FÈÂ\ H  È	 @	 ÉÅI  
FÊÜ	I  ýHE
 H	    $   	   nx_value    gui    nx_is_valid    Create 	   GroupBox    gb_team_item    dynamic_create    nx_property_list       ð?   table    getn    nx_set_property    nx_property    Find    cbtn_team_title    CheckButton    nx_bind_script    nx_callback    on_checked_changed #   on_cbtn_team_title_checked_changed    Add 
   gb_zhenfa    lbl_8    Label    rbtn_1    RadioButton    rbtn_2    lbl_rbtn_1    lbl_rbtn_2 	   gb_skill    lbl_9    rbtn_3    rbtn_4    lbl_rbtn_3    lbl_rbtn_4     9  ë   ë   ë   ì   ì   ì   ì   ì   ì   ì   ì   ì   ì   í   í   ð   ð   ð   ñ   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ó   ó   ÷   ú   ú   ú   û   û   û   û   û   û   û   ü   ü   ü   ü   ü   ü   ü   ü   û                                                                                    	  	  	  	  	                                                                                                                                                   !  !  !  !  !  !  !  !     $  $  $  %  (  (  (  )  )  )  *  *  *  *  *  *  *  *  *  *  +  +  +  ,  ,  ,  ,  ,  ,  ,  -  -  -  -  -  -  -  -  ,  0  0  0  1  4  4  4  5  5  5  6  6  6  6  6  6  6  6  6  6  7  7  7  8  8  8  8  8  8  8  9  9  9  9  9  9  9  9  8  <  <  <  =  @  @  @  A  A  A  B  B  B  B  B  B  B  B  B  B  C  C  C  D  D  D  D  D  D  D  E  E  E  E  E  E  E  E  D  H  H  H  I  L  L  L  M  M  M  N  N  N  N  N  N  N  N  N  N  O  O  O  P  P  P  P  P  P  P  Q  Q  Q  Q  Q  Q  Q  Q  P  T  T  T  U  Y  Y  Y  Z  Z  Z  [  [  [  [  [  [  [  [  [  [  \  \  \  ]  ]  ]  ]  ]  ]  ]  ^  ^  ^  ^  ^  ^  ^  ^  ]  a  a  a  b  e  e  e  f  f  f  g  g  g  g  g  g  g  g  g  g  h  h  h  i  i  i  i  i  i  i  j  j  j  j  j  j  j  j  i  m  m  m  n  q  q  q  r  r  r  s  s  s  s  s  s  s  s  s  s  t  t  t  u  u  u  u  u  u  u  v  v  v  v  v  v  v  v  u  y  y  y  z  }  }  }  ~  ~  ~                                                                                                                                                                                                                                ¡  ¢  d      form     8     gui    8     item    8  	   tpl_item    8  	   prop_tab #   8     (for index) )   3      (for limit) )   3      (for step) )   3      i *   2   
   tmp_title 6   8     cbtn_team_title 9   8  
   props_tab F   c      (for index) L   V      (for limit) L   V      (for step) L   V      i M   U      tmp_zhenfa f   8  
   gb_zhenfa i   8  
   props_tab v         (for index) |         (for limit) |         (for step) |         i }      
   tmp_lbl_8    8     lbl_8    8  
   props_tab    ±      (for index) £   ­      (for limit) £   ­      (for step) £   ­      i ¤   ¬      tmp_rbtn_1 ´   8     rbtn_1 ·   8  
   props_tab Ä   Ø      (for index) Ê   Ô      (for limit) Ê   Ô      (for step) Ê   Ô      i Ë   Ó      tmp_rbtn_2 Û   8     rbtn_2 Þ   8  
   props_tab ë   ÿ      (for index) ñ   û      (for limit) ñ   û      (for step) ñ   û      i ò   ú      tmp_lbl_rbtn_1   8     lbl_rbtn_1   8  
   props_tab   &     (for index)   "     (for limit)   "     (for step)   "     i   !     tmp_lbl_rbtn_2 )  8     lbl_rbtn_2 ,  8  
   props_tab 9  M     (for index) ?  I     (for limit) ?  I     (for step) ?  I     i @  H  
   tmp_skill P  8  	   gb_skill S  8  
   props_tab `  t     (for index) f  p     (for limit) f  p     (for step) f  p     i g  o  
   tmp_lbl_9 w  8     lbl_9 z  8  
   props_tab        (for index)        (for limit)        (for step)        i        tmp_rbtn_3   8     rbtn_3 ¡  8  
   props_tab ®  Â     (for index) ´  ¾     (for limit) ´  ¾     (for step) ´  ¾     i µ  ½     tmp_rbtn_4 Å  8     rbtn_4 È  8  
   props_tab Õ  é     (for index) Û  å     (for limit) Û  å     (for step) Û  å     i Ü  ä     tmp_lbl_rbtn_3 ì  8     lbl_rbtn_3 ï  8  
   props_tab ü       (for index)        (for limit)        (for step)        i        tmp_lbl_rbtn_4   8     lbl_rbtn_4   8  
   props_tab #  7     (for index) )  3     (for limit) )  3     (for step) )  3     i *  2     
   FORM_NAME     ¦  }   +     Á@   Å     Ü Ú    Å    Ü Ú@  @ Ã Þ  ËÀ@A ÜAA E  \ Z   E   \ ZA  @ C^ ÉÀAE  \ A Å ÆÁÂ Ü B  Á ÀCEC  ÆC\B  ýCÂ ËÁ@A Ü  @   @  @      @  AB  ÂBÀ  ÁB `ÂE ÆD @ \C  _ýEB Ä  \BE ÁÂ  \B ÉÀB @  EB  \ @	CÂ E   \ ZB    Þ  KÂ@Á \ À  ÁB  ÃB@  AC àÂÅ  FD À ÜC  ßýËBÆ@ÜBÉ@ËBÆ@ÜBÞ  B @  EB B \ W@  Þ  BÆBC KÂ@ÁÂ \  À   À  À     À  ÁB  ÃB@  AC àÂÅ  FD À ÜC  ßýËBÆ@ÜBÉ@C ËÂ@AÃ Ü  @   À  @     @  AC  ÃBÀ  ÁC `ÃE ÆE @ \D  _ýKCÆÀ\CÉÀCC KÃ@ÁÃ \  À   À  À     À  ÁC  ÄB@  AD àÃÅ  FE À ÜD  ßýËCÆ@ÜCÉ@C ËÃ@AÄ Ü  @   À  @     @  AD  ÄB	À  ÁD `ÄE ÆF @ \E  _ýKDÆÀ\DÉÀCÄ KÄ@ÁÄ \  À   À  À     À  ÁD  ÅB
@ 	 AE àÄÅ  F	F À 	ÜE  ßýËDÆ@ÜDÉ@C ËÄ@AÅ Ü  @	   À  @ 	    @ 	 AE  ÅBÀ 
 ÁE `ÅE 	Æ
G @ 	
\F  _ýKEÆÀ	\EÉÀCE KÅ@ÁÅ \  À
   À  À 
    À 
 ÁE  ÆB@  AF àÅÅ  
FG À 
ÜF  ßýËEÆ@
ÜEÉ@C ËÅ@AÆ Ü  @   À  @     @  AF  ÆBÀ  ÁF `ÆE ÆH @ \G  _ýKFÆÀ\FÉÀCÆ KÆ@ÁÆ \  À   À  À     À  ÁF  ÇB@  AG àÆÅ  FH À ÜG  ßýËFÆ@ÜFÉ@C	 ËÆ@AG	 Ü  @    	  @    À @  AG  ÇBÀ  ÁG `ÇE ÆI @	 		\H  _ýEG Ä  \GE Á	 È	 \G KGÆÀ\GÉÀC
 KÇ@ÁG	 \  À    	  À    À À  ÁG  ÈB@  AH àÇÅ  	FI À	 	ÜH  ßýÅG  D  ÜGÅ  A	 H
 ÜG ËGÆ@ÜGÉ@C
 ËÇ@AH	 Ü  @    	  @    À @  AH  ÈBÀ  ÁH `ÈE	 	Æ		J @
 
	
\I  _ýEH Ä  \HE Á	 É
 \H KHÆÀ\HÉÀÞ    ,   	   nx_value    gui    nx_is_valid    Create 	   GroupBox    gb_place_item    dynamic_create    nx_property_list       ð?   table    getn    nx_set_property    nx_property    Find    cbtn_bg    CheckButton    nx_bind_script    nx_callback    on_checked_changed    on_cbtn_bg_checked_changed 
   nx_number        @   mltbox_no_hire_tips    MultiTextBox    Add 
   lbl_photo    Label    lbl_1 	   lbl_name    lbl_2 
   lbl_shili    lbl_3 
   lbl_level    lbl_4    lbl_status    btn_set    Button 	   on_click    on_btn_set_click    btn_chuzhan    on_btn_chuzhan_click 
   btn_xiuxi    on_btn_xiuxi_click       §  §  §  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ©  ©  ¬  ¬  ¬  ­  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ¯  ¯  ³  ¶  ¶  ¶  ·  ·  ·  ·  ·  ·  ·  ¸  ¸  ¸  ¸  ¸  ¸  ¸  ¸  ·  ¼  ¼  ¼  ½  ½  ½  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¾  ¿  ¿  ¿  À  À  À  À  À  À  À  Á  Á  Á  Á  Á  Á  Á  Á  À  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Ç  Ë  Ë  Ë  Ë  Ë  Ë  Ë  Ë  Ì  Ì  Ì  Í  Í  Í  Í  Í  Î  Ñ  Ñ  Ñ  Ò  Ò  Ò  Ó  Ó  Ó  Ó  Ó  Ó  Ó  Ô  Ô  Ô  Ô  Ô  Ô  Ô  Ô  Ó  ×  ×  ×  Ø  Ù  Ù  Ù  Û  ß  ß  ß  ß  ß  ß  ß  ß  à  ã  ã  ã  å  å  å  æ  æ  æ  ç  ç  ç  ç  ç  ç  ç  ç  ç  ç  è  è  è  é  é  é  é  é  é  é  ê  ê  ê  ê  ê  ê  ê  ê  é  ì  ì  ì  í  ñ  ñ  ñ  ò  ò  ò  ó  ó  ó  ó  ó  ó  ó  ó  ó  ó  ô  ô  ô  õ  õ  õ  õ  õ  õ  õ  ö  ö  ö  ö  ö  ö  ö  ö  õ  ø  ø  ø  ù  ü  ü  ü  ý  ý  ý  þ  þ  þ  þ  þ  þ  þ  þ  þ  þ  ÿ  ÿ  ÿ                                                        	  	  	  
  
  
  
  
  
  
  
  
  
                                                                                                                                             !  !  !  !  !  !  !  !  !  !  "  "  "  #  #  #  #  #  #  #  $  $  $  $  $  $  $  $  #  &  &  &  '  *  *  *  +  +  +  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  -  -  -  .  .  .  .  .  .  .  /  /  /  /  /  /  /  /  .  1  1  1  2  6  6  6  7  7  7  8  8  8  8  8  8  8  8  8  8  9  9  9  :  :  :  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  ;  :  =  =  =  >  A  A  A  B  B  B  C  C  C  C  C  C  C  C  C  C  D  D  D  E  E  E  E  E  E  E  F  F  F  F  F  F  F  F  E  H  H  H  I  M  M  M  N  N  N  O  O  O  O  O  O  O  O  O  O  P  P  P  Q  Q  Q  Q  Q  Q  Q  R  R  R  R  R  R  R  R  Q  U  U  U  U  V  V  V  V  V  X  X  X  Y  ]  ]  ]  ^  ^  ^  _  _  _  _  _  _  _  _  _  _  `  `  `  a  a  a  a  a  a  a  b  b  b  b  b  b  b  b  a  e  e  e  e  f  f  f  f  f  h  h  h  i  m  m  m  n  n  n  o  o  o  o  o  o  o  o  o  o  p  p  p  q  q  q  q  q  q  q  r  r  r  r  r  r  r  r  q  u  u  u  u  v  v  v  v  v  x  x  x  y  |  }  l      form          type          gui         item      	   tpl_item      	   prop_tab #        (for index) )   3      (for limit) )   3      (for step) )   3      i *   2      tmp_bg 6        cbtn_bg 9     
   props_tab F   `      (for index) L   V      (for limit) L   V      (for step) L   V      i M   U   
   tmp_mtbox k         mltbox_no_hire_tips t      
   props_tab w         (for index) }         (for limit) }         (for step) }         i ~      
   tmp_photo      
   lbl_photo ¡     
   props_tab ®   Â      (for index) ´   ¾      (for limit) ´   ¾      (for step) ´   ¾      i µ   ½   
   tmp_lbl_1 Å        lbl_1 È     
   props_tab Õ   é      (for index) Û   å      (for limit) Û   å      (for step) Û   å      i Ü   ä   	   tmp_name ì     	   lbl_name ï     
   props_tab ü        (for index)        (for limit)        (for step)        i     
   tmp_lbl_2        lbl_2     
   props_tab #  7     (for index) )  3     (for limit) )  3     (for step) )  3     i *  2  
   tmp_shili :    
   lbl_shili =    
   props_tab J  ^     (for index) P  Z     (for limit) P  Z     (for step) P  Z     i Q  Y  
   tmp_lbl_3 a       lbl_3 d    
   props_tab q       (for index) w       (for limit) w       (for step) w       i x    
   tmp_level     
   lbl_level     
   props_tab   ¬     (for index)   ¨     (for limit)   ¨     (for step)   ¨     i   §  
   tmp_lbl_4 ¯       lbl_4 ²    
   props_tab ¿  Ó     (for index) Å  Ï     (for limit) Å  Ï     (for step) Å  Ï     i Æ  Î     tmp_status Ö       lbl_status Ù    
   props_tab æ  ú     (for index) ì  ö     (for limit) ì  ö     (for step) ì  ö     i í  õ     tmp_set ý       btn_set      
   props_tab   *     (for index)        (for limit)        (for step)        i        tmp_chuzhan -       btn_chuzhan 0    
   props_tab =  Z     (for index) C  M     (for limit) C  M     (for step) C  M     i D  L  
   tmp_xiuxi ]    
   btn_xiuxi `    
   props_tab m       (for index) s  }     (for limit) s  }     (for step) s  }     i t  |     
   FORM_NAME           .   F @ @@       À   @      ÀÀ  A Å@ ÆÁ  Ü  AÁ   ÂE   \ Z   EB  Á \Z  EÂ CBC\ Â ÆBC  W@ FCIÃÁù        ParentForm    Checked    nx_is_valid 
   gsb_sweet    GetChildControlList    table    getn       ð?      ð¿   nx_find_custom    dynamic_create 
   nx_number    cbtn_bg 	   TabIndex      .                                                                                               	      cbtn     -      form    -      child_table    -      child_count    -      (for index)    -      (for limit)    -      (for step)    -      i    ,      child    ,                     F @ @  À      @  À  Á  @      ÀÀ Æ A ÉÅ@  AÁ Ü@        Parent    nx_is_valid    nx_find_custom    sweet_index    ParentForm    nx_execute 8   form_stage_main\form_sweet_employ\form_offline_employee 
   open_form                                                         btn           gb          sweet_index               £  ¤                    ¤        btn                 §  ¨                    ¨        btn                 «  ¼       F @ @@ Å    Ü Ú    Å    Ü Ú@      ÆÀ@ Ú   À Æ@Á Æ ÁÀ  ÆAÆ ÁÀ ÆÀÁ É@BÆÀÁ ËÂÜ@         ParentForm    Parent    nx_is_valid    Checked    Height    gb_team_item    cbtn_team_title    gsb_team_set    IsEditMode     ResetChildrenYPos        ¬  ­  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ¯  ³  ³  ³  ´  ´  ´  ´  ¶  ¶  ¶  º  º  »  »  »  ¼        cbtn           form          gb               ¿  Á       E   @  Á  \@        nx_execute @   form_stage_main\form_sweet_employ\form_offline_employee_records 
   open_form        À  À  À  À  Á        btn                Ä  Ë       E      \ Z@      F@@ IÀ@F A I@A        nx_is_valid 
   gsb_sweet    Visible     gsb_team_set        Å  Å  Å  Å  Å  Æ  É  É  Ê  Ê  Ë        form     
           Î  å    3    @ Å@    Ü A  A   X  ÅÀ    Ü Ú@      Á    A  àÅ   Ü Â  @   ÉÁÂÁEB  \ B Á  U	BÂÁÂBÉÂÁ	ÉC BßÀø	 ÄË@D Ü@         ParentForm 
   nx_number       ð?   nx_is_valid    clone_team_set_groupbox    Visible    cbtn_team_title    Text    nx_widestr    ÈË³öÕ½    Height 	   TabIndex    team_index    Add    IsEditMode     ResetChildrenYPos     3   Ï  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ð  Ñ  Ô  Ô  Ô  Ô  Õ  Õ  Õ  Ö  Ö  Ö  Ö  Ö  ×  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ù  Ù  Ù  Û  Û  Ý  Þ  Þ  Þ  Ô  ã  ä  ä  å        ctl     2      number     2      form    2      (for index)    /      (for limit)    /      (for step)    /      i    .      gb    .       9                        
               (      C   C   C   +   N   F   `   `   Q   t   b   ~   w         ¾   ¾      ç   Á   ¢  ¢  ê   }  }  ¦           ¤  £  ¨  §  ¼  «  Á  ¿  Ë  Ä  å  Î  å     
   FORM_NAME    8      SPACE_NUMBER    8      TEAM_SET_NUMBER    8       