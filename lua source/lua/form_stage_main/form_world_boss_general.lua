LuaQ  L   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_world_boss_general.lua           Q      A@  @    A  @    AÀ  @    A  @    A@ @  AÀ   Á@  AÁ ¤   ¤A     A ¤   ¤Á  Á ¤     ¤A A ¤  ¤Á Á ¤  ¤A A ¤  ¤Á     Á ¤  ¤A   A ¤  ¤Á     Á ¤     ¤A   A ¤       ¤Á      Á ¤       ¤A A ¤    #      require 	   util_gui    util_functions 
   tips_data 
   tips_game    util_static_data )   form_stage_main\form_world_boss_detailed    ini\world_boss_info.ini     gui\special\tiguan\duihua_2.png       @      $@      @   on_main_form_init    load_set_info    on_main_form_open    change_form_size    refresh_main_rbtn    load_main_rbtn    create_main_rbtn    set_node_prop    set_rbtn_info    set_node_info    get_node_prop    on_main_form_close    on_btn_close_click    on_rbtn_checked_changed    on_btn_left_right_click    on_cbtn_image_checked_changed    on_cbtn_image_get_capture    on_cbtn_image_lost_capture    get_node_info    get_node_info_item    get_item_id    get_item_info 
   open_form                   	@@        Fixed                     form                   9     3      D    E@     \ Z@      E  À  \ @  À   @       Á @ @A  ÀA    Ë Â A ÜAB  A  Á `KÂB À B\ C   MB ÅB  @ ÜB _Aü        get_ini    nx_is_valid    get_global_arraylist    set_info_list    ClearChild    FindSectionIndex 	   rbtn_set            CreateChild    GetSectionItemCount       ð?   GetSectionItemKey    GetSectionItemValue    nx_set_custom     3                                          "   "   "   "   "   #   &   &   )   )   )   +   +   ,   /   /   /   1   1   1   3   3   3   3   4   4   4   4   5   5   5   5   7   7   7   7   7   3   9         ini    2      set_info_list    2      index    2   	   rbtn_set    2      rbtn_set_count     2      (for index) #   2      (for limit) #   2      (for step) #   2      i $   1      prop (   1      value ,   1         BOSS_INI_PATH     ;   A     	   E   \@ E@     \@ E     \@         load_set_info    change_form_size    refresh_main_rbtn     	   <   <   >   >   >   @   @   @   A         form                C   L        E   @  \   À   @       Á Æ A À @A	ÀÁ ÆÀA À @A	      	   nx_value    gui    nx_is_valid    Left    Width        @   Top    Height        D   D   D   F   F   F   F   F   G   J   J   J   J   J   K   K   K   K   K   L         form           gui               N   Z       E      \ @  À   @      @ ËÀ@Ü@ Å    @ A Ü@         get_ini    nx_is_valid    groupbox_rbtn 
   DeleteAll    load_main_rbtn    root        O   O   O   Q   Q   Q   Q   Q   R   U   W   W   Y   Y   Y   Y   Y   Z         form           ini       	   groupbox 
            BOSS_INI_PATH     \        J   Ë À @ Ü@À    À ÁÁ   E FAÁ \  À  	BÁÂ   ÕB C À ÃE  \ ZC  EÃ   À \ E  \ Z   FCCÁN	CEÃ \ 	CE  À   \C AöAD  Å ÆAÁ  Ü @À    AE  \ ZB      	ÂD        FindSectionIndex            GetItemValueList    node    table    getn       ð?   ui_    Find    rbtn_    nx_is_valid    create_main_rbtn    Left    Width    Text 
   util_text    set_rbtn_info    GetChildControlList    Checked     J   ]   ]   ]   _   _   `   c   c   c   c   e   e   e   e   g   g   g   g   h   i   i   i   k   k   k   k   k   m   m   m   m   m   n   n   n   n   n   p   p   p   p   p   q   q   q   q   r   r   r   r   t   t   t   t   t   g   y   y   {   {   {   {   }   }   ~                                 	   groupbox     I      ini     I      section     I      index    I   
   rbtn_list 
   I      rbtn_count    I      (for index)    8      (for limit)    8      (for step)    8      i    7      rbtn_remark    7   
   rbtn_text    7      rbtn    7      child_list :   I      child_count >   I   
   rbtn_home B   I              £     ,      Á@   Å    Ü Ú@      ËÀ@A Ü @ AÉ Á @ AA @  A  Á @ ÁA A C AÁC  E FAÄ \ ÁÄAÉÞ       	   nx_value    gui    nx_is_valid    Create    RadioButton    Name    rbtn_    set_node_prop 	   rbtn_set    nx_bind_script    nx_current    nx_callback    on_checked_changed    on_rbtn_checked_changed    Add    GetChildControlList    table    getn    Left    Width     ,                                                                                                                                    ¢   £      	   groupbox     +      remark     +      gui    +      rbtn    +      child_list #   +      child_count '   +           ¥   Â     A      Á@   Å    Ü Ú@      ËÀ@@ Ü @ EA FÁ \ Á ÀÂ  Á	BÅ    @ ÜC @ E À \À ÀE   À D @ \C    @E   À  \C   E   À  @ \C  õ        get_global_arraylist    set_info_list    nx_is_valid 	   GetChild    nx_custom_list    table    getn       ð?   nx_property    nx_type 
   nx_custom    number    nx_set_property 
   nx_number    string    boolean    nx_boolean     A   ¦   ¦   ¦   ¨   ¨   ¨   ¨   ¨   ©   ¬   ¬   ¬   ®   ®   ®   °   °   °   °   ²   ²   ²   ²   ³   µ   µ   µ   µ   ¶   ¶   ¶   ¸   ¸   ¸   ¸   ¸   º   º   »   »   »   »   »   »   »   »   ¼   ¼   ½   ½   ½   ½   ½   ½   ¾   ¾   ¿   ¿   ¿   ¿   ¿   ¿   ¿   ²   Â         node     @      props     @      set_info_list    @   	   set_info    @      custom_list    @      custom_count    @      (for index)    @      (for limit)    @      (for step)    @      i    ?      prop    ?      value    ?      value_type    ?           Ä   à     &   Ë @ @ Ü@À    @ ÁÁ   E FAÁ \  ÁÁ  AÂ àÆ @  C@   @C    @AßÁû@À        FindSectionIndex            GetItemValueList    node    table    getn           ð?   set_node_info    ,    DataSource    page_no     &   Å   Å   Å   Ç   Ç   È   Ë   Ë   Ë   Ë   Í   Í   Í   Í   Ï   Ñ   Ñ   Ñ   Ñ   Ò   Ô   Ô   Ô   Ô   Ö   Ö   ×   ×   ×   ×   ×   Ù   Ù   Ù   Ñ   Ý   ß   à         ini     %      props     %      rbtn     %      index    %   
   node_list 
   %      node_count    %      data_source    %      (for index)    #      (for limit)    #      (for step)    #      i    "      node_remark    "           â   6    !      Á@   Ë@Ü Á  @ A        A  EÁ   \ ZA      EA  \ Á  À A      ÁA    B    ËAÂ@ ÜB  AÂ  ÁÂ `KC À ÄB\ CC   MÄB W@@ @ÀÅ   AD Ü ÄD@ A Ä À Å  EÅ   AF Ü ÆD@ A   @FÆÂÅÆ ÅÜ     FÆÂÂ  W@@ FÀ     Â    Â Ú  À@@ @À  AG UDóÅC  @ ÜC _Bë     	   nx_value    game_client 
   GetPlayer    nx_is_valid    ConditionManager    get_global_arraylist    set_info_list    FindSectionIndex            CreateChild    GetSectionItemCount       ð?   GetSectionItemKey    GetSectionItemValue 	   uncommon    common    util_split_string    ,    table    getn        /        @
   nx_number    CanSatisfyCondition    nx_set_custom        ã   ã   ã   ä   ä   æ   æ   æ   æ   æ   ç   ê   ê   ê   ì   ì   ì   ì   ì   í   ð   ð   ð   ò   ò   ò   ò   ò   ó   ö   ö   ö   ø   ø   ù   ü   ü   ü   þ   þ   þ                                                       	                                                                                     !  "  #  #  $  (  (  )  )  *  *  ,  ,  ,  ,    1  4  4  4  4  4     6        ini           props           game_client          client_player          condition_manager          set_info_list          index        	   node_set &         node_set_count )         (for index) ,         (for limit) ,         (for step) ,         i -   ~      prop 1   ~      value 5   ~   
   item_list =   y      item_count A   y      filter_value B   y      (for index) E   x      (for limit) E   x      (for step) E   x      j F   w   
   item_info G   w      item_info_list K   w      item_info_list_count O   w      item_id P   w      item_condition_id Q   w      is_add ]   w           8  N    !      Á@   Å    Ü Ú@      ËÀ@@  Ü @ EA FÁ \ Á ÀÂ  ÁB  Å  @ ÜÞ ý  	      get_global_arraylist    set_info_list    nx_is_valid 	   GetChild    nx_custom_list    table    getn       ð?
   nx_custom     !   9  9  9  ;  ;  ;  ;  ;  <  ?  ?  ?  A  A  A  C  C  C  C  E  E  E  E  F  H  H  I  I  I  I  K  E  N        remark            prop            set_info_list        	   set_info           custom_list           custom_count           (for index)           (for limit)           (for step)           i          custom_prop          custom_value               P  \      E      Â   \@  À   @    ÁÀ   Å@    Ü Ú    Å    Ü@   À   @         util_get_form    nx_is_valid    get_global_arraylist    set_info_list    nx_destroy        Q  Q  Q  Q  S  S  S  S  S  T  T  T  V  V  V  V  V  W  W  W  [  [  [  \        form           detailed_form          set_info_list             BOSS_DETAILED     ^  b       F @ @À @         ParentForm    Close        _  a  a  b        btn           form               d  ©   |   F @ @  À   @      @ @      À  Æ A  Å@   A ÜÁ B@ @B@FÂ  ÁA  I  E Á Ä  ÏÁ \      LÄÆAD @Â@ Á  À  À	ÀÂ E \  Á  Å  Ü UÂ	BÂ FÂD 	B D    Å CE ÅÃ   Ü ÃEC   \ Z  À		Æ	ÆMÄ  NLÃ ÀCEÄ EÄ  \ DËCEA Ä  À UÜD  @     D  @   ÀDED  Á \CÉ	ÃÇBò         ParentForm    nx_is_valid    Checked 
   nx_string    DataSource    util_split_string    ,    table    getn         	   lbl_page    Text    nx_widestr    0/0 
   nx_number    nx_int       ð?   page_no    /    Name    groupbox_image    Find    groupbox_image_    Visible  
   BackImage        lbl_image_    cbtn_image_    get_node_prop    image1     |   e  g  g  g  g  g  h  k  k  k  l  o  o  o  q  q  q  q  s  s  s  s  u  u  v  v  v  v  v  x  {  {  {  {  {  {  }  }                                                                                                                                                                    ¡  ¢  ¤    ©        rbtn     {      form    {      data_source    {   
   node_list    {      node_count    {   
   node_page $   {   	   node_mod &   {      page_no *   {      (for index) D   {      (for limit) D   {      (for step) D   {      i E   z      groupbox_image M   z      index X   z   
   lbl_image a   z      cbtn_image h   z      remark s   z      image w   z         MAX_BOSS_COUNT     «  Ã    '   F @ @  À   @        ÆÀÀ Æ Á Æ@Á ËÁ@ ÜA  @ A        FA   À FÂMAÂÉ@   FÂLAÂÉ@EÁ \A         ParentForm    nx_is_valid 
   nx_string 	   lbl_page    DataSource    groupbox_rbtn    Find    0    page_no       ð?   1    on_rbtn_checked_changed     '   ¬  ®  ®  ®  ®  ®  ¯  ²  ²  ²  ²  ´  ´  ´  ´  ¶  ¶  ¶  ¶  ¶  ·  º  º  º  ¼  ¼  ½  ½  ½  ½  ¾  ¾  ¿  ¿  ¿  Â  Â  Â  Ã        btn     &      form    &   
   rbtn_name    &      rbtn    &      data_source    &           Å  Õ      E   @@ \ W@ @ @      Ä    Å@   Ü Ú@      Å   @ Ü@ÅÀ   B Ü@     
   nx_string    DataSource         util_get_form    nx_is_valid    get_node_info    util_show_form        Æ  Æ  Æ  È  È  È  È  É  Ì  Ì  Ì  Ì  Î  Î  Î  Î  Î  Ï  Ò  Ò  Ò  Ò  Ô  Ô  Ô  Ô  Õ        cbtn           remark          detailed_form             BOSS_DETAILED     ×  Ù      F @    I        Parent 
   BackImage        Ø  Ø  Ø  Ù        cbtn              BOSS_SELECT_PNG     Û  ë      F @ @  À   @      À ÁÀ    AÁ  à ËAAB  À  UÜB  @     ÉÂß@ü  	      ParentForm    nx_is_valid    groupbox_image       ð?   Find    groupbox_image_ 
   nx_string 
   BackImage            Ü  Þ  Þ  Þ  Þ  Þ  ß  â  ä  ä  ä  ä  å  å  å  å  å  å  å  ç  ç  ç  ç  ç  è  ä  ë        cbtn           form       	   groupbox          (for index)          (for limit)          (for step)          i          groupbox_image             MAX_BOSS_COUNT     í  e   !×      Á@   Å    Ü Ú@      ËÀ@@ Ü @ EA FÁ \ Á ÀÂ  /BÅB  A ÜB 	Ã,ÅB  A ÜCC CC CC ÃC À ÁC C @(ÅB  A ÜÃD CC ÃD ÃC À ÁC C  $ÅB  A ÜC @ EC FÁ \ ÃE  Æ Å Ä Ü Ã  Å D D  OD Ü       ÌÃÁAÄ C À Å Å Ü  @ 	H ËC	ÜD ÁÄ   AÅ àDÍÅÁ  ÎÌ@ÀÆEF  Á \ÆH	ÇA@	 ÁÇ H FßûÀ@ÅB  AC	 ÜC @ EC FÁ \ I  Æ Å Ä Ü Ã  Å D D OD Ü      ÌÃÁAÄ C À Å Å Ü  @ 	ÄI ËC	ÜD ÁÄ  AÅ àDÍÅÁ ÎÌ@ÀÆEF  Á \ÆH	ÇA@	 ÁÇ H FßûAÐ	@   )      get_global_arraylist    set_info_list    nx_is_valid 	   GetChild    nx_custom_list    table    getn       ð?   image2 
   nx_custom 
   lbl_image 
   BackImage    rule1 	   mltbox_1    Clear    AddHtmlText 
   util_text       ð¿   rule2 	   mltbox_2 	   uncommon    util_split_string    ,    lbl_uncommon_page            Text    nx_widestr    0/0 
   nx_number    nx_int    page_no    /    imagegrid_uncommon    get_item_info    Photo    AddItem        common    lbl_common_page    imagegrid_common    DataSource     ×   î  î  î  ð  ð  ð  ð  ð  ñ  ô  ô  ô  ö  ö  ö  ø  ø  ø  ø  ú  ú  ú  ú  û  ý  ý  þ  þ  þ  þ                                                         	  	  	  
  
  
  
  
  
  
  
                                                                    "  $  &  &  &  &  &  &  &  &  &  &  &  (  )  )  +  +  +  +  ,  ,  ,  ,  .  .  /  1  1  1  1  3  3  3  3  3  3  3  +  5  6  6  7  7  7  7  9  9  9  9  ;  ;  ;  ;  =  ?  ?  @  @  @  @  B  E  E  E  E  E  E  G  G  I  I  J  M  O  Q  Q  Q  Q  Q  Q  Q  Q  Q  Q  Q  S  T  T  V  V  V  V  W  W  W  W  Y  Y  Z  \  \  \  \  ^  ^  ^  ^  ^  ^  ^  V  ú  d  e  ,      form     Ö      remark     Ö      set_info_list    Ö   	   set_info    Ö      custom_list    Ö      custom_count    Ö      (for index)    Õ      (for limit)    Õ      (for step)    Õ      i    Ô      prop    Ô      value           value '   1      value 8   B   	   uncommon I      
   item_list M         item_count Q      	   lbl_page R      
   item_page _      	   item_mod a         page_no e         image_grid r         (for index) w         (for limit) w         (for step) w         i x         index |         item_id          item_photo          common    Ô   
   item_list    Ô      item_count    Ô   	   lbl_page    Ô   
   item_page ¨   Ô   	   item_mod ª   Ô      page_no ®   Ô      image_grid »   Ô      (for index) À   Ô      (for limit) À   Ô      (for step) À   Ô      i Á   Ó      index Å   Ó      item_id È   Ó      item_photo Ì   Ó         MAX_UNCOMMON_COUNT    MAX_COMMON_COUNT     g  Á      Å   A  Ü   @ A      ÁÀ E  À \Z  ÀEA  À \ ÀÂ Å ÆAÂ  Ü   AÂ   BC D  À  @ ÂC D   À  B      ÀÂ B Á  	  Â Å CÜ   ÐBÀ  BE @  C      EÀB@ C       	EC  \ C ÁÃ  ÅC   Ü UÃ	BE \  @ FF     FCF   À C      ÆC C ÀD  DED	D	À	ÀÆÅ @	 KEÇÍEÅ  
A F ÁÆ \ECû         get_global_arraylist    set_info_list    nx_is_valid 	   GetChild    nx_find_custom 
   nx_custom    util_split_string    ,    table    getn    nx_null         	   uncommon    lbl_uncommon_page    common    lbl_common_page    Text    nx_widestr    0/0 
   nx_number    nx_int       ð?   page_no    /    imagegrid_uncommon    imagegrid_common    Clear    get_item_info    Photo    AddItem           ð¿       h  h  h  j  j  j  j  j  k  n  n  n  p  p  p  p  p  p  q  q  q  q  s  s  s  s  u  u  u  u  w  w  y  {  {  |  ~  ~                                                                                     £  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  §  §  ©  ©  ª  ª  «  «  ¬  ¯  ¯  ¯  ¯  ¯  °  ³  ³  µ  µ  µ  µ  ¶  ¶  ¶  ¸  ¸  ¹  »  »  »  »  ½  ½  ½  ½  ½  ½  ½  µ  Á        form           remark           prop           set_info_list       	   set_info          value       
   item_list          item_count       	   lbl_page           MAX_ITEM_COUNT !      
   item_page <      	   item_mod =         page_no H         image_grid ]         (for index) o         (for limit) o         (for step) o         i p         index s         item_id v         item_photo z            MAX_UNCOMMON_COUNT    MAX_COMMON_COUNT     Ã     Y     AA   E   \ ZA      KÁ@À \ À    ÀA À  Å   AÂ Ü BB@ E \ Â   FBC   À  @ FÂC  Å   Ü ÚB  @ Á Þ ÀB@ Á Þ ÅB  O Ü     ÌÂÄE Á \ZC  @ A ^ FÅÀÂ@ AÃ  @  @ÃÄÃ ÃD @ ÆÞ           get_global_arraylist    set_info_list    nx_is_valid 	   GetChild    nx_find_custom 
   nx_custom    util_split_string    ,    table    getn    nx_null         	   uncommon    lbl_uncommon_page    common    lbl_common_page     
   nx_number    nx_int       ð?   page_no     Y   Ä  Ä  Ä  Æ  Æ  Æ  Æ  Æ  Ç  Ê  Ê  Ê  Ì  Ì  Ì  Ì  Ì  Ì  Í  Í  Í  Í  Ï  Ï  Ï  Ï  Ñ  Ñ  Ñ  Ñ  Ó  Ó  Õ  ×  ×  Ø  Ú  Ú  Û  Û  Ü  Þ  á  á  á  á  á  â  â  å  å  æ  æ  é  é  é  é  é  ë  í  í  î  ñ  ñ  ñ  ñ  ñ  ñ  ò  ò  õ  ÷  ÷  ø  ø  ù  ù  ú  ý  ý  ý  ý  ÿ  ÿ                   form     X      remark     X      prop     X      index     X      set_info_list    X   	   set_info    X      value    V   
   item_list    V      item_count    V   	   lbl_page     V      MAX_ITEM_COUNT !   V   
   item_page :   V   	   item_mod ;   V      page_no G   V      list_index R   V      item_id U   V         MAX_UNCOMMON_COUNT    MAX_COMMON_COUNT     	            À                 item_query_ArtPack_by_id        
  
  
  
  
          item_id           prop                             E@  \  @          util_auto_show_hide_form    nx_current                          Q            	   	   	   
   
   
                                             9   9      A   ;   L   C   Z   Z   N      \   £      Â   ¥   à   Ä   6  â   N  8  \  \  P  b  ^  ©  ©  d  Ã  «  Õ  Õ  Å  Ù  Ù  ×  ë  ë  Û  e  e  e  í  Á  Á  Á  g        Ã    	              BOSS_DETAILED    P      BOSS_INI_PATH    P      BOSS_SELECT_PNG    P      MAX_BOSS_COUNT    P      MAX_UNCOMMON_COUNT    P      MAX_COMMON_COUNT    P       