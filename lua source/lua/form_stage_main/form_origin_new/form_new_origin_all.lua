LuaQ  X   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_origin_new\form_new_origin_all.lua           	U      A@  @    A  @    AÀ  @   A  @ Á 
  AÁ  ÁA $   $B  Â $   $Â  B $     $B Â $  $Â    B $     $B       Â $         $Â        B $  $B Â $  $Â B $  $B Â $  $Â        B $          $B Â $  $Â B $           #      require    util_functions 	   util_gui 2   form_stage_main\form_origin_new\new_origin_define       @      8@       @      (@     ÃÀ     Ã@   refresh_form    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    close_form    show_chapters    get_new_origin_data    show_origin_pandect_line    show_origin_chapter_line_all    show_origin_chapter_line    page_btn_init    on_btn_left_page_click    on_btn_right_page_click    page_btn_atate    on_btn_show_origin_data    set_new_origin_photo    table_clear    clone_control    show_event_origin    show_time_limit_origin    show_time_limit_person_name    request_time_limit_data    request_wu_ji_dao_para    show_wu_ji_dao_para        !   (            A@    ÅÀ    B   E     \ Z@      E@    \@         nx_execute 	   util_gui    util_get_form    FORM_NEW_ORIGIN_ALL    nx_is_valid    show_chapters        "   "   "   "   "   "   "   #   #   #   #   #   $   '   '   '   (         form               +   -        	@@        Fixed        ,   -         form                0   ?        E   @  \   ËÀ@ @ Ü @ A      ÉÁÁ @  A      	   nx_value    gui    groupbox_name_    Find    nx_is_valid    Visible     show_chapters        1   1   1   4   6   6   6   7   7   7   7   7   8   ;   >   >   >   ?         form           gui          groupbox_name          groupbox_name_origin               B   H     
   E      \ Z@      E@     \@         nx_is_valid    nx_destroy     
   C   C   C   C   C   D   G   G   G   H         form     	           K   W       F @ @  Ä   @ IÀ@  Å@  Å   Ü Ú   @ÅÀ A A  ÅA Ü@  
      ParentForm    table_clear    Visible  	   nx_value    FORM_NEW_ORIGIN_MAIN    nx_is_valid    nx_execute    open_subform    FORM_TYPE_MAIN        L   O   O   O   Q   S   S   S   T   T   T   T   T   U   U   U   U   U   U   W         btn           form       	   mainform             new_type_origin_table     Z   `            E@   E     \ Z   @ KÀ@ \@      	   nx_value    FORM_NEW_ORIGIN_ALL    nx_is_valid    Close        [   [   [   ]   ]   ]   ]   ]   ^   ^   `         form    
           c        9   E   @  \   À   @         ËÀÀ FA Ü Å@ ÆÁ  Ü ÀÁ    Æ@B	À ÆÀA	À Æ C	ÀÅ@ C Ü@ ÆC ÁB  À ÅÀ    Ü@ @ÆC B  À Å     Ü@ @ÆC B   Å@ Ü@  Å    Ü@      	   nx_value    OriginManager    nx_is_valid    GetNewSubTypeList 
   main_type    table    getn        @   wu_ji_dao_para       ð?   time_limit_type    chapter_main_id       @   get_new_origin_data    chapter_id    show_origin_pandect_line    show_time_limit_origin    request_wu_ji_dao_para    show_origin_chapter_line_all     9   l   l   l   n   n   n   n   n   o   r   s   s   s   s   u   u   u   u   u   u   v   y   y   z   z   {   {   ~   ~   ~                                                                                          form     8      origin_manager    8      new_origin_chapter 
   8              ¡        E   @  \   À   @      ÀÀ    Å    Ü@ Á@   AA àÊ  Á   À  À Â BD  BßÀü  	   	   nx_value    OriginManager    nx_is_valid    GetSubTypeLines    table_clear       ð?   GetNewTypeOriginList    table    insert                                                                                                      ¡         chapter_id           origin_manager          origin_line_num          (for index)          (for limit)          (for step)          i          new_origin_data             new_type_origin_table     ¤   ä    p   F @ @  À   @       @ À@ A @AA @AÀA @A @  B Á@  ÁB@  AA à ÆÉAAÉAAßÀþÆ@C ÉÀ@Å ÆÀÂ  Ü A @A  
  D  ÂE FÂÂ \ B ÀC   ÅÃ  Ü  EÄ \ CÁC Ä @ A Ä À ÕÄ  ED   \ ZD      KÄ À\D  À D      DÀ	Ä@	Ä@D	IÄ@IÄ@D À  D À Å  D   À E A D ÂðÁí        groupbox_6    nx_is_valid    Visible    groupbox_5     groupscrollbox_1    groupscrollbox_wjd    GetChildControlList       ð?   table    getn    Enabled    lbl_1    btn_ 
   nx_string    _    lbl_    Find         
   origin_id    set_new_origin_photo    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_show_origin_data     p   ¦   ¨   ¨   ¨   ¨   ¨   ©   ­   ­   ®   ®   ¯   ¯   °   °   ²   ²   ²   ³   ³   ³   ³   ³   ³   ³   ´   µ   ¶   ³   º   º   ½   ½   ½   ½   ¿   ¿   ¿   ¿   À   Á   Á   Ä   Ä   Ä   Ä   Æ   Æ   Æ   Æ   È   È   È   È   È   È   È   È   È   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ê   Ì   Ì   Ì   Í   Í   Í   Í   Í   Î   Ñ   Ñ   Ñ   Ò   Ò   Ò   Ò   Ò   Ó   Ö   Ö   Ö   ×   Ø   Ù   Ù   Ú   Û   Ý   Ý   Ý   Ý   ß   ß   ß   ß   ß   à   à   à   à   à   Æ   ¿   ä         form     o      groupbox_origin    o   	   btn_list    o      (for index)          (for limit)          (for step)          n          control          origin_line_num #   o      (for index) &   o      (for limit) &   o      (for step) &   o      i '   n      new_origin_data (   n      rows .   n      (for index) 1   n      (for limit) 1   n      (for step) 1   n      j 2   m   	   btn_name ;   m   	   lbl_name D   m      btn_origin G   m      lbl_origin P   m         new_type_origin_table     ç      8   F @ @  À   @      @  Á@A  ÁA  Á @ ÀÁ  @BÄ    Ä      Á   A àÅÁ   A ÜAÅ   ÜA ßÀýÌB A àÁA  @  ÕÂÃ EB   \ ZB      	ÁßÀû        groupbox_5    nx_is_valid    groupbox_6    Visible     groupscrollbox_1    groupscrollbox_wjd    table    getn       ð?   show_origin_chapter_line    page_btn_init    groupbox_line_ 
   nx_string    Find     8   é   ë   ë   ë   ë   ë   ì   ð   ð   ñ   ñ   ò   ò   ó   ó   ö   ö   ö   ö   ø   ø   ø   ú   ý   ý   ý   ý   þ   þ   þ   þ            ý                                     	              form     7      groupbox_origin    7      origin_line_num    7      (for index)    #      (for limit)    #      (for step)    #      i    "      (for index) &   7      (for limit) &   7      (for step) &   7      j '   6      groupbox_name ,   6      groupbox_line /   6         new_type_origin_table    ORIGIN_GROUPBOX_LINE_MAX_NUM          ü      Å@   Å    Ü Ú@      ÆÀ@  @ A       AAD          EÁ   \ AKÂÀ \  À A      IÂ  Ä  ÍÁÂ  ÎÌÁÂ  E FBÁ \ À    E FBÁ \  @D  BAÀ  MLÂÂÄ Ã  Â ÅÃ    Ü D EÄ \ CÁ Ä @   AD Ä À ÕÄ EÄ   \ D ÅÄ  Ü ÄA Ä À   ÁD Å @ UÂ  Å    	Ü Ú    DÄËÂ@Ü  @	     ÉDÄÂ E   
\ Z    	EÄKÂÀ\  À
     IEÄí BAÀ    AÂ À Ã   ÅÃ    Ü D EÄ \ CÁ Ä @   AD Ä À ÕÄ EÄ   \ D ÅÄ  Ü ÄA Ä À   ÁD Å @ UÂ  Å    	Ü ÚD      ËÂ@Ü  @	 E      Â E   
\ ZE      KÂÀ\  À
 E      	EÄIEÄÂÉÂEÅ À 	 	@ 

E À 	F  E   À 	Æ A E LÂÂÂç     	   nx_value    FORM_NEW_ORIGIN_ALL    nx_is_valid    groupbox_5    table    getn    groupbox_line_ 
   nx_string    Find    Visible       ð?
   btn_line_    _ 
   lbl_line_    lbl_get_origin_effect_    lbl_active_origin_effect_  
   origin_id    set_new_origin_photo    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_show_origin_data     ü                                                 #  #  #  #  #  $  $  $  %  %  %  %  %  &  )  +  ,  ,  /  /  /  /  2  2  4  4  4  4  4  4  5  8  8  8  8  8  8  9  9  9  9  9  9  9  9  ;  ;  ;  ;  =  =  =  =  =  =  =  =  =  ?  ?  ?  ?  ?  ?  ?  ?  ?  A  A  A  A  A  A  A  A  A  C  C  C  C  C  C  C  C  C  F  F  F  G  G  G  G  G  H  K  K  K  L  L  L  L  L  M  P  P  P  Q  Q  Q  Q  Q  R  U  U  U  V  V  V  V  V  W  ;  [  [  [  [  [  ^  _  _  _  _  a  a  a  a  a  a  a  a  a  c  c  c  c  c  c  c  c  c  e  e  e  e  e  e  e  e  e  g  g  g  g  g  g  g  g  g  i  i  i  j  j  j  j  j  k  n  n  n  o  o  o  o  o  p  s  s  s  t  t  t  t  t  u  x  x  x  y  y  y  y  y  z  }  ~                                            _    #      line     û      page     û      form    û      groupbox_origin 
   û      groupbox_name    û      groupbox_line    û      new_origin_data '   û      row_bengin -   û      row_end /   û      bengin D         (for index) G         (for limit) G         (for step) G         i H      	   btn_name Q      	   lbl_name Z         lbl_get_origin_name c         lbl_active_origin_name l         btn_origin o         lbl_origin x         lbl_get_origin          lbl_active_origin       
   btn_index    û      (for index)    û      (for limit)    û      (for step)    û      j    ú   	   btn_name ¤   ú   	   lbl_name ­   ú      lbl_get_origin_name ¶   ú      lbl_active_origin_name ¿   ú      btn_origin Â   ú      lbl_origin Ë   ú      lbl_get_origin Ô   ú      lbl_active_origin Ý   ú         new_type_origin_table    CHAPTER_ORIGIN_PAGE_NUM       Ù      E   @  \   À   @      À   AÄ             Ä    Æ@Á  EÁ   \ AKÂÀ \  À A      A ÅÁ    Ü ÁÁ Â @   ÕÂ EÂ   \ BKÂÀ \  À B      IBCIÂCI IÄ BEÅÂ  ÆÁ  Ü  Ï I ÀÃ  B   ÀC A B Â @   À B      IBCI IÄ BEÅÂ  ÆÁ  Ü  Ï IBÄÆÂÄ@ IÂC  IBC ÀÃ  B   ÀC AÃ B Â  Å    Ü ÚB      BCÅB  AÃ Ã ÆÈ  ÁC Ä @   U Ü  Â  "   	   nx_value    FORM_NEW_ORIGIN_ALL    nx_is_valid    table    getn    groupbox_5    groupbox_line_ 
   nx_string    Find 
   btn_left_    btn_right_ 
   lbl_line_    Visible    Enabled     line    page       ð?	   max_page    math    ceil    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_left_page_click    on_btn_right_page_click    Text    nx_widestr 
   util_text    ui_SubtypeList_    chapter_id    _                                                                               ¡  ¥  ¥  ¥  ¥  ¥  ¦  ¦  ¦  ¦  ¦  ©  ©  ©  ©  ©  ¬  ¬  ¬  ­  ­  ­  ­  ­  ®  ±  ²  ³  ´  µ  µ  µ  µ  µ  µ  µ  µ  µ  µ  ·  ·  ·  ·  ·  ¸  ¸  ¸  ¸  ¸  »  »  »  »  ¼  ¼  ¼  ¼  ¼  ½  À  Á  Â  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Ã  Å  Å  Å  Å  Ç  Ç  Ê  Í  Í  Í  Í  Í  Î  Î  Î  Î  Î  Ñ  Ñ  Ñ  Ò  Ò  Ò  Ò  Ò  Ó  Ö  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ù        line           form          new_origin_data          groupbox_origin          groupbox_name          groupbox_line          btn_left_pag_name '         btn_right_pag_name ,         lbl_origin_level 1      	   btn_page 4      
   lbl_level }            new_type_origin_table    CHAPTER_ORIGIN_PAGE_NUM     Ü  ç       F @ @À     F @ M@À 	@ E   @ ÆÀ@ \@E  À@ Æ @ \@        page       ð?   page_btn_atate    line    show_origin_chapter_line        Ý  Ý  Ý  Þ  â  â  â  ä  ä  ä  ä  æ  æ  æ  æ  ç        btn                ê  õ       F @ @@ @     F @ LÀ 	@ EÀ   @ Æ A \@E@  A Æ @ \@        page 	   max_page       ð?   page_btn_atate    line    show_origin_chapter_line        ë  ë  ë  ë  ì  ð  ð  ð  ò  ò  ò  ò  ô  ô  ô  ô  õ        btn                ø  -    K      Å@   Å    Ü Ú@      ÆÀ@  @ A       EA  \ AKÁÀ \  À A      Á ÅA   Ü ÁÁ B @  ÕÁ E   \ ZB      	FBBÂ@ 	Ã  	BÃKÁÀ\ E   \ ZB      	FBBC@@ 	Ã  	BÃ     	   nx_value    FORM_NEW_ORIGIN_ALL    nx_is_valid    groupbox_5    groupbox_line_ 
   nx_string    Find 
   btn_left_    btn_right_    page       ð?   Enabled  	   max_page     K   ù  ù  ù  ú  ú  ú  ú  ú  û  ÿ                                        	                                                                             !  $  &  &  &  &  (  (  +  -  	      page     J      line     J      form    J      groupbox_origin 
   J      groupbox_name    J      groupbox_line    J      btn_left_pag_name #   J      btn_right_pag_name (   J   	   btn_page +   J           0  F    )   E   @  \   À   @      À@ Å    Ü Ú@      Ë Á FAA ÜÚ   ÀAÅ    Ü   @   @ É Á E  ÀB FBA  A     	   nx_value    OriginManager    nx_is_valid    ParentForm    IsActiveOrigin 
   origin_id    Visible     FORM_NEW_ORIGIN_MAIN    return_form_type    FORM_TYPE_SUB    nx_execute    open_subform    FORM_TYPE_ORIGIN_INFO         )   2  2  2  4  4  4  4  4  5  8  9  9  9  9  9  :  =  =  =  =  =  >  @  @  @  A  A  A  A  A  B  B  C  C  C  C  C  C  C  C  F        btn     (      origin_manager    (      form 
   (   	   mainform    (           I           AA   E   \ ZA      E  Á  \   À A        ËÁFBA ÜÅ ÆÁÁ  Ü       ËAÂFBA ÜÚ   Å ÆÁ	ÀÅ    Ü Ú   Å BCCÂ Ü  IÀI@DÀËÄFBA ÜÚ  ÅÁ ÆÁ	ÀÅ   Ü   @ B        AB  KE\   À B      Â Å C @ÀDA Å    Ü Ú     Å CCC Ü  IÀIÀFÀÅ CCC Ü  IÀI@GÅÂ  AÃ CA Ü Ú  À  @    É@HÃ A  ÆCA C       @    @@HÀÅÁ ÆÁ	ÀÅ    Ü Ú  ÀÅ BCC	 Ü  IÀI@I  &   	   nx_value    gui    nx_is_valid    OriginManager    GetOriginInfo 
   origin_id    table    getn    ORIGIN_INFO_GET_PHOTO    IsCompletedOrigin    NormalImage    Text    nx_widestr    TextManager    GetText    ui_origin_yhd 
   ForeColor    255,255,128,0    IsActiveOrigin    ORIGIN_INFO_ACTIVE_PHOTO    ConditionManager    game_client 
   GetPlayer    nx_execute    FORM_NEW_ORIGIN_DESC    can_get_origin    ui_origin_khd    255,0,219,0    ui_origin_ktz    255,255,0,0 -   form_stage_main\form_main\form_main_shortcut    is_new_active_origin    Visible    del_new_active_origin    ORIGIN_INFO_UNACTIVE_PHOTO    ui_origin_wjh    255,204,204,204        J  J  J  K  K  K  K  K  L  P  P  P  Q  Q  Q  Q  Q  R  V  W  W  W  W  Y  Y  Y  Y  Y  Y  Y  Z  ]  ]  ]  ]  ]  ^  ^  ^  `  `  `  `  `  a  a  a  a  a  a  a  b  c  d  d  d  d  d  e  e  e  h  h  h  i  i  i  i  i  j  n  n  n  o  o  p  p  p  p  p  q  t  t  t  t  t  t  t  t  u  u  u  u  u  v  v  w  w  w  w  w  w  w  x  x  z  z  z  z  z  z  z  {                                                                                                  btn           lbl           lbl_get_origin           lbl_active_origin           gui          origin_manager          new_origin_data          condition_manager @         game_client I         player K         can_get_origin Y         is_new v                       A   @  @À    Á   `À EA  FÁÀ  \A _þJ                 ð?   table    getn    remove                                            t           (for index)          (for limit)          (for step)          i                 Ò    b      À    Å@  ÆÀ  Ü ÀÀ@ Ã Þ  Å  A Ü Á E ÁA \  À  U	AFAB 	AFB 	AFÁB 	AFC 	AFAC 	AFC 	AFÁC 	AFD 	AFAD 	AFD 	AFÁD 	AFE 	AFAE 	AFE 	AFÁE 	AFF 	A@F FF 	AFÁF 	AFG 	AFAG 	AÀG   ÀGKH \ A HÀ ÁÁ   AÂ àÁÅ	 @ ÜC	 @    ICßü   '      nx_name    string    len         	   nx_value    gui    Create    Name 
   nx_string    Top    Left    Height    Width    VAnchor    HAnchor    NoFrame 	   DrawMode 
   BackImage 	   AutoSize    Text    Font 
   ForeColor 
   BackColor    BlendColor 
   LineColor    Button    NormalImage    FocusImage 
   PushImage    DisableImage    Label 	   GroupBox    GetChildControlList    table    getn       ð?   clone_control    nx_is_valid    Add     b         ¡  ¡  ¡  ¡  ¡  ¡  ¢  ¢  ¥  ¥  ¥  §  §  §  ©  ©  ©  ©  ©  ©  ©  ©  «  «  ¬  ¬  ­  ­  ®  ®  ¯  ¯  °  °  ±  ±  ²  ²  ³  ³  ´  ´  µ  µ  ¶  ¶  ·  ·  ¸  ¸  ¹  ¹  º  º  ¼  ¼  ½  ½  ¾  ¾  ¿  ¿  À  À  À  Ã  Ã  Ã  Ä  Ä  Å  Å  Ç  Ç  Ç  Ç  É  É  É  É  Ê  Ê  Ê  Ê  Ë  Ë  Ë  Ë  Ë  Ì  Ì  Ì  É  Ñ  Ò        control     a      index     a      entity_name    a      gui    a      new_control    a      control_list K   `      control_count O   `      (for index) R   `      (for limit) R   `      (for step) R   `      i S   _   
   new_child W   _           Õ      C  E   @  \   À   @      À@ Å    Ü Ú@      Æ A ÉÁÆÀA ÉÁÆ B ÉÁÆÀ@ É@ÂÊ   Â  À  Á C@ @C    E FÁÃ  \  @  D ÄÄ   B Å  Ü ÂËÂD@ Ü  @ C      ÉÁÁû À  ?B Å  Ü ÂËÂD@ Ü  @ C      ÉBÂÄD  CDD  NC     @ DDÀ   A àÃÁ  @ AE  À 	 Õ	 E \ E Å   	Ü Å
AÅ  À ÁE  @ 	 U
 Å  Ü F E  	\ EËÅÄ@	Ü  @     ÉÁÆÄ 
E   \ Z    	ÁKÆÄÀ
\  À     IÁÆÄ  Å    Ü Ú    Áßí@  À  A àÁ  @ AE  À  Õ	 E \ E Å   Ü Å
AÅ  À ÁE  @  U
 Å  Ü F E  \ EËÅÄ@	Ü  @ F      ÆÄ 
E   \ ZF      KÆÄÀ
\  À F      ÆÄ  Å    Ü ÚF      IÁÁÉEÂ	FÂÆÉÅÅ  @ À ÜFÅÆ  E \ ÜF  ÅF  A Ç ÜF DßÃçÁ  @ ÕD E \ DA  À UÄÄ Å    	Ü ÚD      ËÄÄ@ Ü  @	 E      ÅÄE   
\ ZE      ÁÉÁ	ÁAÀ  "   	   nx_value    OriginManager    nx_is_valid    groupbox_5    groupbox_6    Visible     groupscrollbox_1    groupscrollbox_wjd    OriginCompletedEventsSort    table    getn            math    ceil       ð?   groupbox_line_ 
   nx_string    Find 
   btn_line_    _ 
   lbl_line_    lbl_get_origin_effect_    lbl_active_origin_effect_ 
   origin_id    set_new_origin_photo    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_show_origin_data 
   btn_left_    btn_right_     C  ×  ×  ×  Ù  Ù  Ù  Ù  Ù  Ú  Þ  à  à  à  à  à  á  å  å  æ  æ  ç  ç  è  è  ê  ë  ë  ë  í  í  í  í  ï  ï  ð  ô  ô  ô  ô  ô  ö  ö  ö  ÷  ú  ú  ú  ú  ü  ü  ü  ü  ü  ý  ý  ý  þ  þ  þ  þ  þ  ÿ    ú                          	  	  	  	  	  
                                                                            !  !  !  !  !  !  !  !  !  #  #  #  #  #  #  #  #  #  &  &  &  '  '  '  '  '  (  +  +  +  ,  ,  ,  ,  ,  -  0  0  0  1  1  1  1  1  2  5  5  5  6  6  6  6  6  7    ;  >  ?  ?  ?  ?  A  A  A  A  A  A  A  A  A  C  C  C  C  C  C  C  C  C  E  E  E  E  E  E  E  E  E  G  G  G  G  G  G  G  G  G  I  I  I  J  J  J  J  J  K  N  N  N  O  O  O  O  O  P  S  S  S  T  T  T  T  T  U  X  X  X  Y  Y  Y  Y  Y  Z  ]  ^  _  `  a  a  c  c  c  c  c  c  e  e  e  e  e  f  f  f  f  f  h  ?  l  l  l  l  l  m  m  m  m  m  p  p  p  p  p  s  s  s  t  t  t  t  t  u  y  y  y  z  z  z  z  z  {                              4      form     B     origin_manager    B     groupbox_origin 
   B     new_origin_events_sort    B     length     B     origin_line_num (   B     (for index) /   @      (for limit) /   @      (for step) /   @      jj 0   ?      groupbox_name 5   ?      groupbox_line 8   ?      (for index) C   B     (for limit) C   B     (for step) C   B     line D   A     groupbox_name I   A     groupbox_line L   A     row_bengin W   A     row_end Y   A     bengin a   ¯      (for index) d   ®      (for limit) d   ®      (for step) d   ®      i e   ­   	   btn_name n   ­   	   lbl_name w   ­      lbl_get_origin_name    ­      lbl_active_origin_name    ­      btn_origin    ­      lbl_origin    ­      lbl_get_origin    ­      lbl_active_origin §   ­   
   btn_index °   A     (for index) ³        (for limit) ³        (for step) ³        j ´     	   btn_name ½     	   lbl_name Æ        lbl_get_origin_name Ï        lbl_active_origin_name Ø        btn_origin Û        lbl_origin ä        lbl_get_origin í        lbl_active_origin ö        btn_left_pag_name   A     btn_right_pag_name   A     lbl_origin_level #  A     btn_page_left &  A     btn_page_right /  A  
   lbl_level 8  A        CHAPTER_ORIGIN_PAGE_NUM    ORIGIN_GROUPBOX_LINE_MAX_NUM          °   E   @  \   À   @         ÁÀ   Å    Ü Ú@      Æ A   @ A      AA 	ÁAB 	ÁAAB 	ÁAÉBÉÂÃA A KC À \  À A      Á DÄ   ÁA   AB àÁÊ    ÆÃ D@ FÄÃÄÄ ÃÍCDÃLÅÄ ÃËCÅ A ÜÉÆÉBÉCÅDFÉÄÄD DÉÆÉÄÆDD @ D  ÄEDD E
Å
E À 
\  À
 E      EÇ
 ÁE Æ D@  AF à ÆÉÆAÉÆAßÅþËÅÆ@
ÜEIEIÐÅÇ	 È@ÆÅ
ÆÌ ÌIÅÁE  @ 
 ÕÃ
E   \ ZF      FÆ@@	BFÆ	FJ  IÇH@ Æ DÀ ÅF	  F	 	Æ	 ÆÆH  
FëßáÉÀÁ  (   	   nx_value    gui    nx_is_valid    OriginManager    groupscrollbox_1    groupbox_6    Visible     groupbox_5    groupscrollbox_wjd    IsEditMode 
   DeleteAll    groupbox_name_    Find    table    getn       ð?   Top    Height    Left    Create    Label 
   BackImage +   gui\language\ChineseS\origin_new\bg_10.png       @   Width    Add    clone_control    GetChildControlList    Enabled        @        
   btn_name_ 
   nx_string 
   origin_id    GetOriginInfo    ORIGIN_INFO_GET_PHOTO    NormalImage    request_time_limit_data     °                                                     ¡  ¡  ¢  ¢  £  £  ¤  §  ¨  ¨  «  ­  ­  ­  ®  ®  ®  ®  ®  ¯  ³  ³  ³  ³  µ  µ  µ  µ  ¶  ·  ·  º  º  º  º  ½  ½  ½  ½  ½  ½  ½  ¾  ¾  ¾  Á  Á  Á  Â  Ã  Å  Æ  Æ  Æ  Ç  Ç  Ç  Ç  È  È  Ê  Ê  Ê  Í  Í  Í  Í  Ï  Ï  Ï  Ï  Ò  Ò  Ò  Ò  Ó  Ó  Ó  Ó  Ó  Ô  ×  ×  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ù  Ú  Û  Ø  Þ  Þ  Þ  á  ã  å  å  å  æ  æ  æ  æ  æ  æ  ê  ê  ê  ê  ê  ì  ì  ì  î  î  î  î  î  ï  ò  ò  ò  ó  ô  ô  ö  ÷  ÷  ÷  ÷  ù  ù  ù  ù  ù  ù  ù  ú  ú  ú  þ  þ  þ  þ  Í  µ            form     ¯      gui    ¯      origin_manager    ¯      groupbox_origin    ¯      groupbox_name $   ¯      groupbox_name_origin '   ¯      origin_line_num 1   ¯      (for index) 4   ®      (for limit) 4   ®      (for step) 4   ®      i 5   ­      new_origin_data 6   ­      rows <   ­      control_top C   ­      control_left F   ­      lbl I   ­      (for index) [   ­      (for limit) [   ­      (for step) [   ­      j \   ¬      index `   ¬   
   new_child d   ¬      new_control_list l   ¬      (for index) r   w      (for limit) r   w      (for step) r   w      n s   v      control t   v      btn_origin_name    ¬      btn_origin    ¬   	   new_data    ¬         new_type_origin_table     TIME_LIMIT_ORIGIN_CONTROL_SPACE    TIME_LIMIT_ORIGIN_ROWS       I    j   E   @  \   À   @         ÁÀ   Å    Ü Ú@      Æ A  @ A      AÁA       ÁA@    B    FB A Å  Ü ÁËÁÂ@ Ü  @ B       C B E  \  Å  Ü ÂKÂÂÀ \  À   ÀIÂÃB ÆÄ ËÂÄA Ü  I @   BC E Â\  Å  Ü ÃKÃÂÀ \  À    IÃÃC ÆÃ  Iú     	   nx_value    gui    nx_is_valid 4   form_stage_main\form_origin_new\form_new_origin_all    groupscrollbox_1    Visible    table    getn       ð?   groupbox_name_ 
   nx_string    Find        @
   lbl_name_    _    Text    nx_widestr    TextManager    GetText    ui_origin_tlnull     j         
  
  
  
  
                                                    !  !  "  &  )  )  )  )  )  +  +  +  ,  ,  ,  ,  ,  -  1  1  3  3  3  3  3  3  3  3  3  5  5  5  6  6  6  6  6  7  9  9  9  9  9  9  9  >  >  >  >  @  @  @  @  @  @  @  @  @  B  B  B  C  C  C  C  C  D  F  F  F  F  >  I        arg     i      gui    i      form    i      groupbox_origin    i      count !   i      index %   i      groupbox_name *   i      groupbox_name_origin -   i   	   lbl_name >   N      lbl_name_origin A   N      (for index) Q   i      (for limit) Q   i      (for step) Q   i      i R   h   	   lbl_name [   h      lbl_name_origin ^   h           L  S    	      Á@   Å    Ü Ú@      ËÀ@E A \  Å  À    Ü@      	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int    CLIENT_CUSTOMMSG_ORIGIN '   SUB_CUSTOMMSG_REQUEST_ORIGIN_OVER_DATA        M  M  M  N  N  N  N  N  O  R  R  R  R  R  R  R  R  R  R  S     
   origin_id           index           game_visual               V  ]           A@   E     \ Z@      KÀ@ Å  A Ü  E  \@       	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int    CLIENT_CUSTOMMSG_ORIGIN *   SUB_CUSTOMMSG_REQUEST_ORIGIN_WUJIDAO_PARA        W  W  W  X  X  X  X  X  Y  \  \  \  \  \  \  \  \  ]        game_visual               `  «   
   E   @  \   À   @      À   AÀ    Å@   Ü A D   W     ÆÁ É ÂÆ@Â É ÂÆÂ É ÂÆÀÂ É ÃÆ@C C FÁC Ä Å  Ü ÁÁÄ Å   Ü ÁÅ ÅÁÅ ÅA À ÅA  Ü  ÁÅ AÆ@A À ÅA  Ü À@ Å AÆÆ Ä  BGD  ÌÁÆ FÆ ÆÆ ÆÁÆ ÍÁÈ Å BH Ü ÁÈ Å ÂH Ü ÁÉ Å BI Ü ÁÉ Å ÂI Ü ÁÊ Å BJ Ü ÁÊ Å ÂJ Ü ÁË Å BK Ü ÁË Å ÂK Ü ÁÌ Å BL Ü Á  2   	   nx_value 4   form_stage_main\form_origin_new\form_new_origin_all    nx_is_valid    table    getn    nx_int    groupbox_6    Visible     groupbox_5    groupscrollbox_1    groupscrollbox_wjd       ð?       @      @   lbl_damingvalue    Text    nx_widestr    lbl_dongyingvalue    lbl_daming    Font    font_title    lbl_dongying            font_title2 
   pbar_camp    Maximum    math    abs    Minimum    Value    lbl_wjd_700       @   lbl_wjd_701       @   lbl_wjd_702       @   lbl_wjd_703       @   lbl_wjd_704        @   lbl_wjd_705       "@   lbl_wjd_706       $@   lbl_wjd_707       &@   lbl_wjd_708       (@       a  a  a  b  b  b  b  b  c  f  f  f  f  i  i  i  i  i  i  i  i  j  n  n  o  o  p  p  q  q  t  w  z  }  }  }  }  }                                                                                                                                                  ¡  ¡  ¡  ¡  ¡  ¤  ¤  ¤  ¤  ¤  §  §  §  §  §  ª  ª  ª  ª  ª  «        arg           form          size          ming_contribution_value          dongying_contribution_value           wujidao_camp_value !            WUJIDAO_MAG_DATA_COUNT    MAX_WUJI_ISLAND_CAMP_VALUE    MIN_WUJI_ISLAND_CAMP_VALUE U                     	   	   	                           (   !   -   +   ?   0   H   B   W   W   K   `   Z      c   ¡   ¡      ä   ä   ¤         ç           Ù  Ù  Ù    ç  Ü  õ  ê  -  ø  F  0    I      Ò          Õ            I    S  L  ]  V  «  «  «  «  `  «        CHAPTER_ORIGIN_PAGE_NUM 
   T      ORIGIN_GROUPBOX_LINE_MAX_NUM    T       TIME_LIMIT_ORIGIN_CONTROL_SPACE    T      TIME_LIMIT_ORIGIN_ROWS    T      new_type_origin_table    T      WUJIDAO_MAG_DATA_COUNT    T      MIN_WUJI_ISLAND_CAMP_VALUE    T      MAX_WUJI_ISLAND_CAMP_VALUE    T       