LuaQ  Q   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_wuxue\form_wuxue_zhenfa.lua           ?      A@  @ $   d@  G  d  GÀ  dÀ  G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G         require +   form_stage_main\form_wuxue\form_wuxue_util    main_form_init    main_form_open    main_form_close    on_grid_photo_mousein_grid    on_grid_photo_mouseout_grid    on_btn_faculty_get_capture    on_btn_faculty_lost_capture    on_pbar_gate_get_capture    on_pbar_gate_lost_capture    on_tree_types_select_changed    on_tree_types_left_click    on_grid_photo_select_changed    on_grid_photo_drag_enter    on_grid_photo_drag_move    on_btn_select_click    on_btn_faculty_click    on_view_zhenfa_operat    on_view_skill_operat    prop_callback_facultyname    prop_callback_facultystyle    show_type_data    hide_item_data    show_item_data    select_one_item    hide_zhenfa_data    show_zhenfa_data    hide_skill_data    show_skill_data    get_zf_get_desc        	           E   @  À     Õ \@        nx_function    ext_log_testor    
        
   
   
   
   
   
            str                           	@@	À@A  ^          Fixed    sel_item_index       ð¿      ð?                            form                   0     	5   E      \@ F@@ IÀ@F A IÀ@	ÀÀE À \   À      @@Â  @  Á  Á @ @Â A @  Á  Á @ ÀÃ  AA   ÅÁ Ü  @ÀÃ Á A   ÅÁ Ü B @	ÅÀ À   @             hide_item_data    lbl_ani_photo    Visible     btn_faculty_on    is_open 	   nx_value    data_binder    nx_is_valid    AddViewBind    VIEWPORT_SKILL    nx_current    on_view_skill_operat    VIEWPORT_ZHENFA    on_view_zhenfa_operat    AddRolePropertyBind    FacultyName    string    prop_callback_facultyname    FacultyStyle    int    prop_callback_facultystyle    show_type_data       ð?    5                            #   #   #   $   $   $   $   $   %   %   %   %   %   %   %   &   &   &   &   &   &   &   '   '   '   '   '   '   '   '   (   (   (   (   (   (   (   (   +   -   -   -   /   /   0         form     4      databinder    4           3   D     -   E   @  \   À      ÀÀ    @ Á A @  @  Á  @  @ À À       @  Æ B      @B BÀBB @  Á@  FAB FÂ@ À À   @      	   nx_value    data_binder    nx_is_valid    DelViewBind    DelRolePropertyBind    FacultyName    FacultyStyle    nx_find_custom    Actor2    scenebox_show    Scene    Delete    nx_execute    scene    delete_scene    nx_destroy     -   4   4   4   5   5   5   5   5   6   6   6   7   7   7   7   8   8   8   8   <   <   <   <   <   <   <   <   <   <   <   =   =   =   =   =   A   A   A   A   A   A   C   C   C   D         form     ,      databinder    ,           J   f     3    @ Æ@@ ÀÀ ÆÀ@É@A@ÀÅ  A Ü  @ A  @ Á  Ã  À  E  \ ZA  @ AÁ ^ E A \  À     IAAÁ Á B @ D  ËÂD Ü  A @ A        ParentForm    DataSource        lbl_ani_photo    Visible  
   type_name 
   item_name 	   nx_value 
   GoodsGrid    nx_is_valid            GetItemData    tips_manager    InShortcut    nx_execute 
   tips_game    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop       @@    3   K   N   N   N   O   O   P   Q   T   T   T   U   U   U   U   U   V   V   Y   Y   Y   Y   Z   Z   Z   Z   Z   [   [   ^   ^   ^   _   _   _   _   _   `   d   d   d   d   e   e   e   e   e   e   e   d   f         grid     2      index     2      form    2   
   GoodsGrid    2   
   item_data    2      tips_manager     2           i   k           Á@    FÁ@ @         nx_execute 
   tips_game 	   hide_tip    ParentForm        j   j   j   j   j   k         grid           index                n   u        E      Á@  \Z@  @ A  ^  EÀ     Á  A@ \@         nx_find_custom    wuxue_type            show_faculty_info 
   item_name        p   p   p   p   p   p   q   q   t   t   t   t   t   u         self                x   z        E   @  Á  Á@ \@         nx_execute 
   tips_game 	   hide_tip    ParentForm        y   y   y   y   y   z         self                }           E   @  \ À À ÁÀ AA Å ÂA Ü  FB    EA  ÁÁ  @  @ \A      	   nx_value    gui    GetCursorPosition    TextManager    GetFormatText    tips_ng_xw_01    nx_int    Value    Maximum    nx_execute 
   tips_game    show_text_tip    nx_widestr                                                                                         self           gui          x          y          text                          E   @  Á  \@        nx_execute 
   tips_game 	   hide_tip                             self                   ¤     "   Æ @ A  @   À  A  @    Á  @   @Á  @    ÀÁFÁ W@À AÁ	ÁAÉ BÉ Â @A         ParentForm    set_node_select            nx_find_custom 
   type_name    lbl_ani_photo    Visible      
   item_name    show_item_data     "                                                                                                         ¤         self     !   	   cur_node     !   	   pre_node     !      form    !           §   ±     
    @ Å@  @ @ ÜÚ@  @ ÁÀ  Þ          ParentForm    nx_id_equal    SelectNode             
   ¨   «   «   «   «   «   «   ¬   ¬   ±         self     	      node     	      form    	           ´   Æ            Æ@@ @ @À@    A@ Á  Þ  Å@  Ü Á @ A      Â  ÁA A B A AÁ A A A        select_one_item    ParentForm    DataSource    GetBindIndex         	   nx_value 
   GoodsGrid    nx_is_valid    ViewGridOnSelectItem       ð¿   SetSelectItemIndex    nx_execute 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form         µ   µ   µ   µ   ·   ·   ·   ¸   ¸   ¹   ¹   ¼   ¼   ¼   ¾   ¾   ¾   ¾   ¾   ¿   Â   Â   Â   Â   Ä   Ä   Ä   Å   Å   Å   Å   Æ         grid           index           view_index       
   goodsgrid               È   Ï           Á@   Å    Ü Ú    ÆÀ@É@AÉ@A     	   nx_value    gui    nx_is_valid 	   GameHand 
   IsDragged  
   IsDropped        É   É   É   Ê   Ê   Ê   Ê   Ê   Ë   Ì   Í   Ï         grid           index           gui       
   game_hand 	              Ñ   â     	      Á@   Å    Ü Ú   @ÆÀ@ÁA  @É@A  A  E   \ ZA      KÁAÀ   \A   	   	   nx_value    gui    nx_is_valid 	   GameHand 
   IsDragged 
   GoodsGrid    ViewGridOnSelectItem       ð¿       Ò   Ò   Ò   Ó   Ó   Ó   Ó   Ó   Ô   Õ   Õ   Õ   ×   Ù   Ù   Ù   Û   Û   Û   Û   Û   Ü   ß   ß   ß   ß   â         grid           index           gui       
   game_hand 	      
   goodsgrid               å   ñ        F @ @  À       ÀÀ  ÆÀ  ÅÀ  A Ü WÀ À @Á ÀAI@BI@BÀ À  A @        ParentForm    nx_find_custom    sel_item_index 
   nx_number    DataSource    lbl_ani_photo    Visible  
   type_name     
   item_name    select_one_item        æ   é   é   é   é   é   é   ê   ê   ê   ê   ê   ê   ê   ê   ë   ë   ì   í   ð   ð   ð   ð   ñ         self           form               ô          E      Á@  \Z@  @ A  ^  E      ÁÀ  \Z@  @ A  ^  E  @ Á A@ \ ÀÁ @   @   	      nx_find_custom 
   item_name            wuxue_type    nx_execute    faculty    set_faculty_wuxue    auto_show_hide_wuxue        ö   ö   ö   ö   ö   ö   ÷   ÷   û   û   û   û   û   û   ü   ü                                  self        	   bSuccess               	  (    ;     @      A@ A  @    Á  @   AA A  KÁAÅ B E \ Â À   A \AAA ^ A @ E   \ ZA  @ A  ^ KCÁÁ \ Ä@    	@	 DÁ À  A Á A  ÅA A         nx_is_valid    is_open         
   nx_string    updateitem 	   nx_value    timer_game 	   Register    CALLBACK_WAIT_TIME       ð?   nx_current    show_type_data       ð¿   get_view_object 
   QueryProp 	   ConfigID     
   type_name 
   item_name    set_radio_btns    switch_sub_page    WUXUE_ZHENFA     ;   
  
  
  
  
  
  
  
                                                                                     !  #  #  #  %  %  '  '  '  (        form     :      optype     :      view_ident     :      index     :      timer          item "   :   
   type_name ,   :           +  K    ?     @      A@ A  @    Á  @   AA A  KÁAÅ B E \ Â À   A \AAA ^ A @ E   \ ZA  @ A  ^ KCÁÁ \ ÀB D@ Á  Þ 		@ÅA    ÜA Å ÜA ÅÁ B ÜA         nx_is_valid    is_open         
   nx_string    updateitem 	   nx_value    timer_game 	   Register    CALLBACK_WAIT_TIME       ð?   nx_current    show_item_data       ð¿   get_view_object 
   QueryProp 	   ConfigID    get_type_by_wuxue_id    WUXUE_ZHENFA     
   type_name 
   item_name    show_type_data    set_radio_btns    switch_sub_page     ?   ,  ,  ,  ,  ,  ,  ,  ,  -  -  0  0  0  0  0  2  2  2  3  3  3  3  3  3  3  3  3  3  5  5  8  8  8  8  9  9  9  9  9  :  :  =  =  =  >  >  >  >  ?  ?  @  @  C  D  F  F  F  H  H  J  J  J  K        form     >      optype     >      view_ident     >      index     >      timer          item "   >   
   item_name ,   >   
   type_name 0   >           N  \         @   A  @ A   @ A  @ A   Á  FA A A  @ A   A EÁ A AA\ 	A        nx_is_valid            is_open    nx_find_custom    btn_faculty_on 
   item_name    Visible    check_wuxue_is_faculty        O  O  O  O  O  P  P  S  S  S  T  T  W  W  W  W  W  W  X  X  [  [  [  [  [  [  \        form        
   prop_name        
   prop_type           prop_value                _  m         @   A  @ A   @ A  @ A   Á  FA A A  @ A   A EÁ A AA\ 	A        nx_is_valid            is_open    nx_find_custom    btn_faculty_on 
   item_name    Visible    check_wuxue_is_faculty        `  `  `  `  `  a  a  d  d  d  e  e  h  h  h  h  h  h  i  i  l  l  l  l  l  l  m        form        
   prop_name        
   prop_type           prop_value                s  Ò       E   @  \   À    @  @ À       Á   Å    Ü Ú@  @ ÁÀ  Þ  Æ@A ËÁAÁ ÜÁ  CAA BA AB ÁÁ  BC@  AÂ àÆC À AÃ  CCÀ  ÁÃ `CFÄC ÆÄ ËDÄ	@ÜÄÅ À	   E   
\ ZE  @KÅÅÅ  	Ü \   
EE  
ÁÅ \EFÄ KEÄ
À\E
Æ @
   Å    Ü Ú   EÅE   AÆ ÜEÅ    	Ü Ú   	EFEFÅFÁB@ GEGÅ    A ÜÚ   ÅÅ E Ü Æ @    @ _íßÁéÆH Â @  ÉÅ   Ü Ú   ÆAA ÉA ÅÁ BA ÜA É GÆAA ËAÉÜA   &   	   nx_value    gui    nx_is_valid            WuXueQuery    tree_types    CreateRootNode        BeginUpdate    GetMainNames    WUXUE_ZHENFA       ð?   table    getn    GetSubNames    GetLearnID_ZhenFa    TextManager    GetText 	   FindNode    nx_widestr    CreateNode    set_node_prop 
   type_name        @   ShowCoverImage  
   ForeColor    255,101,80,63    255,123,114,106    nx_find_custom 
   nx_string    lbl_zfcount    Text    SelectNode    auto_select_first    Expand 
   EndUpdate        t  t  t  v  v  v  v  v  w  w  {  {  {  |  |  |  |  |  }  }                                                                                                                        ¥  ¥  ¥  ¥  ¦  ¦  ¦  ¦  ¦  §  §  §  §  §  ¨  ©  ©  ©  ©  ¯  ¯  ¯  ¯  ¯  °  ²  ³  µ  µ  ¸  ¹  ¼  ¼  ¼  ¼  ¼  ¼  ½  ½  ½  ½  ½  ½  ½  ½  ¾      Å  Å  Å  Å  Å  È  È  È  È  È  É  É  É  Ë  Ë  Ë  Ï  Ñ  Ñ  Ñ  Ò        form           gui          wuxue_query          root          learned_zf_count          sel_type_node       	   type_tab           (for index) &         (for limit) &         (for step) &         i '   ~   
   type_name (   ~      sub_type_tab ,   ~      (for index) 2   ~      (for limit) 2   ~      (for step) 2   ~      j 3   }      sub_type_name 4   }   	   sub_type 7   }   
   type_text ;   }   
   type_node @   }      sub_type_text S   }      sub_type_node X   }           Õ  å    
"   A   @  Á   `@F@ KÁÀÁ B @  Õ\ À     IÂ_ üF@ K@Â \@ E    ÆÀB   \@ 	 ÃF@C À Á   I            ð?   ITEM_BOX_COUNT    gpsb_items    Find    gbox_item_ 
   nx_string    nx_is_valid    Visible     ResetChildrenYPos    set_name_color    sel_item_index       ð¿   mltbox_desc 	   HtmlText    nx_widestr         "   ×  ×  ×  ×  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ù  Ù  Ù  Ù  Ù  Ú  ×  Ý  Ý  Ý  à  à  à  à  à  á  ä  ä  ä  ä  ä  å        form     !      (for index)          (for limit)          (for step)          i       
   gbox_item               è  T    Ï   E   @  \   ÅÀ  A Ü Á  AA  À    A ÆA ÆÀÁ @ A  @ A  A @ A  @ A    AÁ  E  \ ZA  @ AA ^ FÂ À  A AC @ Á  Â D@  @A  àA"Í@ÆÂCD DÃ À ÃE  \ ZC     KDÁ   Õ\DD @ DËDA  UÜDÄ À Ä	E \ Z  ÀE  \ Z  E \ Z  @E  \ ZD    À@  ÀE \ @ DF @ 	À F @ 		ÄDÇ G	  À   
@ Ä À E D D À E D  	ÀÄ À EÅ D D À E	 D 	 	D À  Å   @D	 ÆÄF  ÅD	  Ü À	@  ÀÄ À EÅ D D À E	 D 	 		ÃIßÝÆAD ËÊÜA À ÅA
    @ ÜAÆJ ÉÁJ  ,   	   nx_value    gui       ð?   nx_int    sel_item_index            tree_types    SelectNode    nx_is_valid    nx_find_custom 
   type_name    WuXueQuery    hide_item_data    GetItemNames    WUXUE_ZHENFA    table    getn    gpsb_items    Find    gbox_item_    grid_photo_ 
   lbl_name_    lbl_level_    btn_select_    nx_null    GetLearnID_ZhenFa    GetLearnID_Skill 
   item_name    Text    TextManager    GetFormatText    set_grid_data    VIEWPORT_ZHENFA    show_wuxue_level    wuxue_type    VIEWPORT_SKILL    WUXUE_SKILL 
   nx_string    Visible    ResetChildrenYPos    select_one_item    lbl_skill_back_1      Ï   é  é  é  ë  î  î  î  î  î  î  î  î  ï  ò  ò  ó  ó  ó  ó  ó  ô  ô  ÷  ÷  ÷  ÷  ÷  ÷  ø  ø  ü  ü  ü  ý  ý  ý  ý  ý  þ  þ                  	  	  	  	  	  	  	  	  
  
                                                                                                                        !  !  "  "  "  "  "  $  $  $  $  (  +  +  +  +  +  .  .  .  .  .  0  0  1  1  1  1  1  2  2  2  2  2  3  3  3  5  5  5  5  5  6  6  6  6  6  7  7  ;  ;  ;  ;  ;  ;  <  <  <  <  <  <  <  <  =  @  C  C  C  C  C  D  D  D  D  D  E  E  I  	  L  L  L  O  O  P  P  P  P  S  S  T        form     Î      gui    Î      sel_item_index    Î   	   sel_node    Î      wuxue_query !   Î   
   zhenfa_id )   Î   	   item_tab 0   Î      (for index) 7   Ã      (for limit) 7   Ã      (for step) 7   Ã      i 8   Â   
   item_name :   Â   
   gbox_item @   Â      grid_photo K   Â   	   lbl_name P   Â   
   lbl_level U   Â      btn_select Z   Â      item t   Â           W  |    
S      Á@   Æ@ ËÀÀE A Å   Ü Á\ Ü   @ A  @ Á  ÁÀ Á  @  Õ   E  \ ZA  @ AÁ ^ EA   ÆB   \A EÁ  \ 	@EA   ÆB  \A E  ÁA \ZA  @ AÁ ^ E  Á \ZA  @ AÁ ^ FCÁ À E   \A ÀFCA À E   ÆAC\A     	   nx_value    gui    gpsb_items    Find 
   nx_string    gbox_item_    nx_is_valid            btn_select_    set_name_color    sel_item_index 
   nx_number    nx_find_custom 
   item_name    wuxue_type    WUXUE_ZHENFA    show_zhenfa_data    WUXUE_SKILL    show_skill_data     S   X  X  X  [  [  [  [  [  [  [  [  [  [  \  \  \  \  \  ]  ]  `  `  `  `  `  `  `  `  `  a  a  a  a  a  b  b  f  f  f  f  f  g  g  g  g  h  h  h  h  h  k  k  k  k  k  k  l  l  p  p  p  p  p  p  q  q  u  u  u  u  v  v  v  v  y  y  y  y  z  z  z  z  |        form     R      sel_item_index     R      gui    R   
   gbox_item    R      btn_select    R                 &   F @   ÁÀ   IF A IÁFÀA IÁF B   ÁÀ   IF@B KÂ \@ FÀB KÂ \@ FÀB K Ã Á@ \@E À \   À       @Ä ÁB @D  Å     	   lbl_name    Text    nx_widestr        btn_faculty 
   item_name     btn_faculty_on 
   lbl_level    mltbox_desc    Clear    grid_photo    SetSelectItemIndex       ð¿	   nx_value 
   GoodsGrid    nx_is_valid 
   GridClear 
   gbox_info    Visible      &                                                                                     form     %   
   GoodsGrid    %             Ï    t   E   @  \ @ À@Å    Ü Ú@  @ Á@ Þ  Å   AÁ ÜÚ@  @ Á@ Þ  Å    Ü  @ A  @ A  ÁAEA   \A FB Ã AC @    IFÁC KÄÆÃ ËAÃAB  UÜ \A KÁÄÀ \ À   @ B A À   ÀE Å   Ü ÁE ÆAF ÆÆÁE ÅÁ E ÂEÜ Á ÆAG  E A Á À    E A A À    AH ÁHE ÁHH ÆÃ ËAÃEB	  \ Ü  ÁH I ÆAG A ÁI I  (   	   nx_value    gui    tree_types    SelectNode    nx_is_valid            nx_find_custom 
   type_name    WuXueQuery    hide_zhenfa_data 	   lbl_name    Text    TextManager    GetText 
   nx_string    mltbox_desc    AddHtmlText    desc_       ð¿   GetLearnID_ZhenFa    show_faculty_level    WUXUE_ZHENFA    btn_faculty_on 
   item_name    Enabled    btn_faculty    Visible    check_wuxue_is_faculty    set_grid_data    grid_photo    VIEWPORT_ZHENFA    show_item_action    WUXUE_SHOW_ZHENFA    add_zhenfa_weapon    mltbox_get_desc  	   HtmlText    get_zf_get_desc 
   gbox_info     t                                           ¢  ¢  ¢  £  £  £  £  £  ¤  ¤  §  ª  ª  ª  ­  ­  ­  ­  ­  ­  ­  ­  ®  ®  ®  ®  ®  ®  ®  ®  ®  ®  ±  ±  ±  ´  ´  ´  ´  ´  ´  ¶  ¶  ¶  ¶  ¶  ·  ·  ·  ·  ·  ¸  ¸  ¸  ¸  º  º  º  º  º  º  ¼  ¼  ¼  ¼  ¼  ¿  ¿  ¿  ¿  ¿  Â  Â  Â  Â  Ä  Ä  Ä  Æ  Æ  È  È  È  È  È  È  È  È  É  É  Ë  Ë  Ë  Î  Î  Ï        form     s      gui    s   	   sel_node    s      wuxue_query    s   
   zhenfa_id    s      zhenfa 7   s           Ò  ã    $   F @   ÁÀ   IF A IÁFÀA   ÁÀ   IF B K@Â \@ FB K@Â \@ FB KÀÂ Á  \@E@  \ À À        Ä B @@D ÀD     	   lbl_name    Text    nx_widestr        btn_faculty 
   item_name  
   lbl_level    mltbox_desc    Clear    grid_photo    SetSelectItemIndex       ð¿	   nx_value 
   GoodsGrid    nx_is_valid 
   GridClear 
   gbox_info    Visible      $   Ô  Ô  Ô  Ô  Ô  Õ  Õ  Ø  Ø  Ø  Ø  Ø  Ù  Ù  Ù  Ú  Ú  Ú  Û  Û  Û  Û  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Ý  Þ  Þ  Þ  â  â  ã        form     #   
   GoodsGrid    #           æ      T      Á@   Å     Ü Á  @ A  @   A @  A A FBKAÂÅ   Ü \  	AÁB CA ÆBËAÂA  UÜ  ÁÁ A Ä EA   À   E \AEÁ   \ Z  @EÁ E À B \A E   À Â B \AE   À \AFAF IÁF EÁ E \A FAF BABB @    IFAF IGFÁG IG      	   nx_value    gui    WuXueQuery    nx_is_valid            hide_skill_data 	   lbl_name    Text    TextManager    GetText 
   nx_string    mltbox_desc    AddHtmlText    nx_widestr    desc_       ð¿   GetLearnID_Skill    show_faculty_level    WUXUE_SKILL    set_grid_data    grid_photo    VIEWPORT_SKILL    show_item_action    WUXUE_SHOW_SKILL    add_weapon    mltbox_get_desc    Visible  	   HtmlText    get_zf_get_desc 
   gbox_info     T   ç  ç  ç  ê  ê  ê  ë  ë  ë  ë  ë  ì  ì  ð  ð  ð  ó  ó  ó  ó  ó  ó  ó  ó  ô  ô  ô  ô  ô  ô  ô  ô  ô  ô  ô  ô  ÷  ÷  ÷  ú  ú  ú  ú  ú  ú  ü  ü  ü  ü  ü  ý  ý  ý  ý  ý                                        	  	  	  	  	  	  	  	  
  
              form     S   	   skill_id     S      gui    S      wuxue_query    S      skill '   S                    E   @  Á  Á  B \  À   @  @ @   Á Á @      @Ë@Â @  ÁA Ý Þ   Á@ Þ          nx_call    util_functions    get_ini    INI_FILE_ZF_GETDESC    nx_is_valid        FindSectionIndex 
   nx_string            ReadString    GetDesc                                                                     
   zhenfa_id           ini          index           ?                     0      D   3   f   J   k   i   u   n   z   x      }         ¤      ±   §   Æ   ´   Ï   È   â   Ñ   ñ   å     ô   (  	  K  +  \  N  m  _  Ò  s  å  Õ  T  è  |  W      Ï    ã  Ò    æ              log    >       