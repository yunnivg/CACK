LuaQ  Y   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_wuxue\form_team_faculty_setting.lua           ,      A@  @    A  @ À  A  @ Á Á AA G A G AA GÁ A G d  GA dA  G d  GÁ dÁ  G d    GA dA G d GÁ dÁ G d GA dA G d     GÁ         require 	   util_gui    util_functions       ~@      ð?       @      @      @   TEAM_FACULTY_TYPE_NORMAL            TEAM_FACULTY_TYPE_DONGFANG    TEAM_FACULTY_TYPE_TEACHER    TEAM_FACULTY_TYPE_JIUGONG    main_form_init    on_main_form_open    on_main_form_close    on_main_form_shut    on_btn_begin_click    on_btn_close_click    on_btn_return_click    on_textgrid_taolu_select_row    refresh_form    change_form_size !   on_jiugong_heap_Perception_Point           !        	@@	À@	@A        Fixed     zhenxing_index            taolu                      !         self                $   8     	%   E   \@ E@     \@ E     ÁÀ  \Z@  @ F A IÁEÀ   \ @ À      ÀÂ Á A   ÅA Ü  @ÀC Å@  AÁ  Ü  À         change_form_size    refresh_form    nx_find_custom    is_help 
   btn_begin    Enabled  	   nx_value    data_binder    nx_is_valid    AddRolePropertyBind    HeapPerceptionPoint    int    nx_current !   on_jiugong_heap_Perception_Point 	   mltbox_1 	   HtmlText    nx_widestr 
   util_text    ui_train_team_intr     %   '   '   *   *   *   ,   ,   ,   ,   ,   ,   -   -   1   1   1   2   2   2   2   2   3   3   3   3   3   3   3   3   7   7   7   7   7   7   7   8         self     $      databinder    $           ;   C        E   @  \ W@ @ Z@   À  À   @      	   nx_value    helper_form     nx_destroy        =   =   =   ?   ?   ?   ?   @   @   @   C         self     
      helper_form    
           F   H                     H         self                 L   [       F @ @  À   @      À À@      Á@  D  Á ÆÀ  @    Á  A @Â @         ParentForm    nx_is_valid    taolu        nx_execute    custom_sender    custom_team_faculty 
   nx_string 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form    Close        M   N   N   N   N   N   O   R   R   R   S   W   W   W   W   W   W   W   W   X   X   X   X   Z   Z   [         self           form             SUB_CLIENT_OPEN     ^   e     
   F @ @  À   @      À @         ParentForm    nx_is_valid    Close     
   _   `   `   `   `   `   a   d   d   e         self     	      form    	           h   s        F @ @  À   @      À @ À  Á   @        ParentForm    nx_is_valid    Close    util_show_form .   form_stage_main\form_wuxue\form_wuxue_faculty        i   j   j   j   j   j   k   o   o   r   r   r   r   s         self           form               v        
@    @ Å@    Ü Ú@      Å  Á  A A Ü A  @ A      ÁÁ  B	ÂÁBEA  ÁÁ  FA Õ \  	AAÄ Á Â E  \  ÅA  À E  \A FÁEA Å  Ü   IE  A Á \A        ParentForm    nx_is_valid    nx_execute    util_functions    get_ini %   share\Faculty\faculty_team_taolu.ini    taolu    GetSectionByIndex 
   btn_begin    Enabled    mltbox_taolu 	   HtmlText    nx_widestr 
   util_text    ui_ 
   nx_string    ReadInteger 	   PlayType            nx_int    TEAM_FACULTY_TYPE_JIUGONG !   on_jiugong_heap_Perception_Point 	   mltbox_1    ui_train_team_intr 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     @   w   x   x   x   x   x   y   }   }   }   ~   }                                                                                                                                                                     self     ?      row     ?      form    ?      ini    ?   
   play_type (   ?              ·     @   E      \ Z@      F@@ KÀ \@ F@@ KÀÀ \@ E  @ Á Á \    À   @       Â  Á@   AA à@ËÂ MBBÂ Á ÜB @ EB  \ W@ ÂÃ BBFB@ KÄÁB \B@ D A Ã Å   Ü   B  ß øÆ@@ Ë@ÅÜ@         nx_is_valid    textgrid_taolu    BeginUpdate 	   ClearRow    nx_execute    util_functions    get_ini %   share\Faculty\faculty_team_taolu.ini    GetSectionCount       ð?   ReadInteger 	   PlayType            nx_int    TEAM_FACULTY_TYPE_DONGFANG    GetSectionByIndex 
   InsertRow       ð¿   SetGridText    nx_widestr 
   util_text 
   EndUpdate     @                                                   ¡       ¢   ¢   ¢   ¢   ¢   £   §   §   ¨   ¨   ¨   ¨   ª   ª   ª   ª   ª   «   «   «   «   «   «   «   «   ®   ®   ®   ±   ±   ±   ±   ²   ²   ²   ²   ²   ²   ²   ²   ²   ²   ¨   ¶   ¶   ¶   ·   
      form     ?      ini    ?      count    ?      (for index)    <      (for limit)    <      (for step)    <      i    ;   
   play_type "   ;      taolu_name -   ;      row 1   ;           »   Å            A@     E     \ Z@      EÀ    \ Á ÆA À ÀA	@Â Æ@B À ÀA	   
      util_get_form 5   form_stage_main\form_wuxue\form_team_faculty_setting    nx_is_valid 	   nx_value    gui    Left    Width        @   Top    Height        ¼   ¼   ¼   ¼   ½   ½   ½   ½   ½   ¾   Á   Á   Á   Ã   Ã   Ã   Ã   Ã   Ä   Ä   Ä   Ä   Ä   Å         form          gui               È   ß    M   E      \ Z@  @ B   ^  E@    \ @  ÁÀ   Ë AÜ AÁ EÁ  \ Á Á  ÀFAB Á Å B Ü   I@
EÁ  \ Á Ä   @@FAB Á Å B Ü   ÅÁ  A  Ü  ÁIÀEÁ ÁÃ DB EÂ  \   \  AB ÅÁ  AB  Ü  Â @ ÕÁ        nx_is_valid 	   nx_value    gui    game_client 
   GetPlayer 
   QueryProp    HeapPerceptionPoint    nx_int         	   mltbox_1 	   HtmlText    nx_widestr 
   util_text    ui_xl_thd_002    ui_xl_thd_004    TextManager    GetFormatText    ui_xl_thd_003     M   É   É   É   É   É   Ê   Ê   Í   Í   Í   Ð   Ð   Ð   Ñ   Ñ   Ô   Ô   Ô   ×   ×   ×   ×   ×   ×   ×   ×   Ø   Ø   Ø   Ø   Ø   Ø   Ø   Ø   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ú   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ü   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   Ý   ß         form     L      gui 
   L      game_client    L      client_player    L      Perception_Point    L      text A   L         PERCEPTION_MAX_POINT ,            	   	   	                                          !      8   $   C   ;   H   F   [   [   L   e   ^   s   h      v   ·      Å   »   ß   ß   È   ß         PERCEPTION_MAX_POINT    +      SUB_CLIENT_OPEN    +      SUB_CLIENT_SET 	   +      SUB_CLIENT_BEGIN 
   +      SUB_CLIENT_EXIT    +       