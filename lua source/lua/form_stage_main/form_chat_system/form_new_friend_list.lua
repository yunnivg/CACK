LuaQ  Z   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_chat_system\form_new_friend_list.lua           H      A@  @    A  @    AÀ  @    A  @ @ d   G d@  GÀ d      G  dÀ  G@ d  G d@ GÀ d G  dÀ     G@ d      G d@ GÀ d G  dÀ     G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G  dÀ G@ d  G d@ GÀ d G    !      require    util_functions 	   util_gui 
   tips_data    util_role_prop    ini\sns\sns_new_style.ini    on_main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click %   on_textgrid_friend_right_select_grid $   on_textgrid_enemy_right_select_grid    change_form_size    reset_friend_info    reset_enemy_info    get_client_player    add_info_to_grid    add_info_yingxiang    on_lab_name_click 
   open_form    find_player_in_list    on_btn_find_click    on_btn_friend_click    on_btn_enemy_click    on_btn_yinxiang_click    on_btn_all_click    on_textgrid_double_click_grid    rest_friend    on_btn_show_tips_click    on_btn_hide_tips_click    save_show_form_to_file    init_show_form    reset_scene                   	@@	À@        Fixed     refresh_time                               form                   #        E   \@ E@  \@ E  \@ FÀ@ I@AFA I@AFÀA I@AE     \@ E@  ÁÀ  \@         reset_friend_info    reset_enemy_info    change_form_size    groupbox_all    Visible     groupbox_find    btn_show_tips    init_show_form    nx_execute    custom_sender    custom_query_enemy_info       @                                                    "   "   "   "   "   #         form                %   2       E   @  \   À       ÀÀ   @   Á   Å    Ü Ú   @ Ë@AÜ@ Å    Ü@      	   nx_value    IniManager    nx_is_valid    UnloadIniFromManager 6   form_stage_main\form_chat_system\form_new_friend_menu    Close    nx_destroy        '   '   '   (   (   (   (   (   )   )   )   ,   ,   ,   -   -   -   -   -   .   .   1   1   1   2         form           IniManager       
   form_menu             FILE_SNS_STYLE     4   8        F @ @À @         ParentForm    Close        5   7   7   8         btn           form               :   J     	    À Å@    Ü Á  @   @ ÁA   Ë@A @   Ü A  AÁ A   ÅA  Ü  A  
           	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_menu    nx_is_valid    Close    GetGridText 
   SelectRow    nx_execute 
   open_form    nx_widestr        <   <   =   =   =   >   >   >   >   >   ?   ?   B   E   E   E   E   G   G   G   I   I   I   I   I   I   I   I   J         grid           row           col           form_new_friend_menu          name               L   \     	    À Å@    Ü Á  @   @ ÁA   Ë@A @   Ü A  AÁ A   ÅA  Ü   A  
           	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_menu    nx_is_valid    Close    GetGridText 
   SelectRow    nx_execute 
   open_form    nx_widestr        N   N   O   O   O   P   P   P   P   P   Q   Q   T   W   W   W   W   Y   Y   Y   [   [   [   [   [   [   [   [   \         grid           row           col           form_new_friend_menu          name               ^   g            A@   E     \ Z@      E   À  \ @Á Æ@A À A	  Â Æ B À A	  	   	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    gui    Left    Width        @   Top    Height        _   _   _   `   `   `   `   `   a   d   d   d   e   e   e   e   e   f   f   f   f   f   g         form          gui               l   ¾     Ç      A@   E     \ Z@      EÀ  \   À   @       A Ë@AÜ@ ËAÜ@ ËÀAÜ@ @BÀBÁ  AÃ A ÁCÁÁ `KÄ À  AÃ \Ä  @ C ËÄ @ ÁC Ü KÄ À  AÄ \  E Ä  @  \  Ä  @ D ËÄ @ Á ÜÄ @ À  LE À D_AóÁ  KAÃ À\ A ÁCÁÁ `KÄ À  AÃ \Ä  @ C ËÄ @ ÁC Ü KÄ À  AÄ \  E Ä  @  \  Ä  @ D ËÄ @ Á ÜÄ @ À  LE À D_AóKAFÁ  \A FÁF Å   AB  ÁÂ Ü  @  @ ÃÀ ÆH ÉÈ  @ ÆH ÉÁÈÆH ËÉÜA Á ÂÃAÂ àËBI@  Ü CI Á  E	 H Á   @ À  \C  ßAûËAFAÂ	   ÜA ËJÜA   )   	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    get_client_player    textgrid_friend    BeginUpdate 	   ClearRow    ClearSelect 	   ColCount       @
   ColWidths    130, 130, 130, 140, 130, 0    rec_friend    GetRecordRows               ð?   QueryRecord       @
   nx_number       &@      (@      "@       @   add_info_to_grid 
   rec_buddy    SortRowsByInt       @	   RowCount    get_ini_prop    max_num    num    30    groupbox_yinxiang1 
   BackImage ,   gui\special\sns_new\new_shijiesil\hmyhy.png 1   gui\special\sns_new\sns_newworld\back_friend.png 
   DeleteAll    GetGridText    add_info_yingxiang       @
   EndUpdate     Ç   m   m   m   n   n   n   n   n   o   r   r   s   s   s   s   s   t   w   y   y   z   z   {   {   ~                                                                                                                                                                                                                                                                                                                                                                     £   £   £   £   ¥   ¦   ¦   ¦   ¦   ¦   ¦   ¦   ¦   §   §   ¨   «   «   ¬   ¬   ­   ­   ¯   ¯   ²   ²   ²   ´   ´   ´   ´   µ   µ   µ   µ   ¶   ¶   ¶   ¶   ·   ·   ·   ·   ·   ·   ·   ·   ·   ´   º   º   º   º   ½   ½   ¾   #      form    Æ      client_player    Æ      grid    Æ   	   rec_name    Æ   
   row_count    Æ      (for index) !   T      (for limit) !   T      (for step) !   T   
   row_index "   S      name '   S      power_level ,   S      guild 1   S      num1 8   S      num2 ?   S   	   scene_id D   S      online I   S      (for index) \         (for limit) \         (for step) \      
   row_index ]         name b         power_level g         guild l         num1 s         num2 z      	   scene_id          online          count    Æ      max_num    Æ      (for index) ­   À      (for limit) ­   À      (for step) ­   À   
   row_index ®   ¿      name ²   ¿      num ¶   ¿         FILE_SNS_STYLE     Á       ¼      A@   E     \ Z@      EÀ  \   À   @       A Ë@AÜ@ ËAÜ@ ËÀAÜ@ @BÀBÁ  AÃ A ÁCÁÁ `A
KÄ À  AÃ \Ä  @ C ËÄ @ ÁC Ü KÄ À  AÄ \  KÄ À  A \Ä  @ D Å   @ À  @ ÀÜC_õÁÀ KAÃ À\ A ÁCÁÁ `KÄ À  AÃ \Ä  @ C ËÄ @ ÁC Ü KÄ À  AÄ \  E Ä  @  \  Ä  @  ËÄ @ ÁD Ü @ À  LE À D_AóFAF Å   AÂ  ÁB Ü  @  @ ÃÀ ÆG ÉÈ  @ ÆG ÉAÈÆG ËÈÜA Á ÂÃAÂ àËÂH@  Ü ÃH Á	  EC	 G ÁÃ   @ À  \C  ßAûËIAÂ	   ÜA ËJÜA   )   	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    get_client_player    textgrid_enemy    BeginUpdate 	   ClearRow    ClearSelect 	   ColCount       @
   ColWidths    130, 130, 130, 140, 130, 0 
   rec_enemy    GetRecordRows               ð?   QueryRecord       @
   nx_number       &@      "@       @   add_info_to_grid 
   rec_blood       (@	   RowCount    get_ini_prop    max_num    num    30    groupbox_yinxiang2 
   BackImage ,   gui\special\sns_new\new_shijiesil\hmydr.png 0   gui\special\sns_new\sns_newworld\back_enemy.png 
   DeleteAll    GetGridText       @   add_info_yingxiang    SortRowsByInt       @
   EndUpdate     ¼   Â   Â   Â   Ã   Ã   Ã   Ã   Ã   Ä   Ç   Ç   È   È   È   È   È   É   Ì   Î   Î   Ï   Ï   Ð   Ð   Ó   Ô   ×   Ø   Ø   Ø   Ù   Ù   Ù   Ù   Û   Û   Û   Û   Û   Ü   Ü   Ü   Ü   Ü   Ý   Ý   Ý   Ý   Ý   Þ   Þ   Þ   Þ   Þ   Þ   Þ   ß   ß   ß   ß   ß   à   à   à   à   à   â   â   â   â   â   â   â   â   â   â   Ù   ç   è   è   è   è   é   é   é   é   ë   ë   ë   ë   ë   ì   ì   ì   ì   ì   í   í   í   í   í   î   î   î   î   î   î   î   ï   ï   ï   ï   ï   ï   ï   ð   ð   ð   ð   ð   ñ   ñ   ñ   ñ   ñ   ó   ó   ó   ó   ó   ó   ó   ó   ó   ó   é   ÷   ø   ø   ø   ø   ø   ø   ø   ø   ù   ù   ú   ý   ý   þ   þ   ÿ   ÿ                                     	  	  	  	  	  	  	  	  	                  "      form    »      client_player    »      grid    »   	   rec_name    »   
   row_count    »      (for index) !   M      (for limit) !   M      (for step) !   M   
   row_index "   L      name '   L      power_level ,   L      guild 1   L      num1 8   L   	   scene_id =   L      online B   L      (for index) U         (for limit) U         (for step) U      
   row_index V         name [         power_level `         guild e         num1 l         num2 s      	   scene_id x         online }         count    »      max_num    »      (for index) ¢   µ      (for limit) ¢   µ      (for step) ¢   µ   
   row_index £   ´      name §   ´      num «   ´         FILE_SNS_STYLE                  A@   E     \ Z    KÀ@ ]  ^   E  ]  ^        	   nx_value    game_client    nx_is_valid 
   GetPlayer    nx_null                                            game_client                 ]    ¿     AB   E   \ ZB      KÂ@ ÆA \B À @   Á  Å    Ü ÚB      ËÂAA C À  Ü   ËBB @ ÅÃ   Ü ÜB  ËBB @ ÅC  @ DÜ ÜB  ËBB @Ã ÀÜBËBB @ ÅÃ D @  Ü  ÜB  ËDEC \ Ü  Ú  @ËBB @ ÅC Ä @DÜ ÜB  ËBB @ ÅC  Ü ÜB  Á @@ Á À@@ ÁÂ À@@ Á À@@ Á À@@ Á À@@ Á À@@ Á À@@ Á À C @ ÌCB Á Ä ED \   C  C @  WH@ÃH Á 	 CÃH Á 	 CÃH ÁÃ 	 CÃH Á 	 CÃH Á 	 C@É ÃH Á 	 CÃH Á 	 CÃH ÁÃ 	 CÃH Á 	 CÃH Á 	 C  '   	   nx_value    form_main_chat    nx_is_valid 
   InsertRow 	   RowCount 
   nx_string    Karma    ParseColValue       @   SetGridText            nx_widestr       ð?
   util_text    desc_        @      @   nx_int    IsNewScene 
   ui_scene_    sns_newCJ_001    90    91    354    355    365       @   366       @   367       @   368        @     @@   0    SetGridForeColor    255,190,190,190 
   rec_blood    255,255,0,0     ¿                     !  !  !  #  #  #  #  %  %  %  &  &  &  &  &  '  *  *  *  *  *  *  *  -  -  -  -  -  -  -  .  .  .  .  .  .  .  .  .  /  /  /  /  /  0  0  0  0  0  0  0  0  0  2  2  2  2  2  2  2  3  3  3  3  3  3  3  3  3  3  5  5  5  5  5  5  5  9  :  :  ;  ;  <  <  =  =  >  >  ?  ?  @  @  A  A  B  B  C  C  D  D  E  E  F  F  G  G  H  H  I  I  K  K  K  K  N  N  N  N  N  N  N  N  N  P  P  P  P  P  Q  Q  Q  Q  Q  R  R  R  R  R  S  S  S  S  S  T  T  T  T  T  U  U  U  U  U  U  V  V  W  W  W  W  W  X  X  X  X  X  Y  Y  Y  Y  Y  Z  Z  Z  Z  Z  [  [  [  [  [  ]        grid     ¾      name     ¾      power_level     ¾      guild     ¾      nums     ¾   	   scene_id     ¾      online     ¾   	   rec_name     ¾      form_main_chat    ¾      row    ¾   	   karmamgr    ¾      index W   ¾           `  ±     E  A  \   À A        ÁÁ   Å    Ü ÚA      ËÁ@ÜB E \  ÁÂ  ÀE   ÁB  AC \  E \  ÁÂ  @ÀE \  Á  ÀE   ÁB C AC \  
E \  Á  @ÀE \  ÁÂ  ÀE   ÁB  AC \  E \  ÁB  ÀE   ÁB  AC \   Â C @Ä  Á C @ Á    ÀEE   À AD \@E   À  AD \   FE   À AD \@E   À  AD \À  @FE   ÀD AD \@E   À D AD \ 	  FE   À AD \@E   À  AD \@ ÀÀF@E   À AD \@E   À  AD \E   ÅC   Ü  AD \ Ä  D @  AÄ D ËHAD ÜH DÉÃÉÃ ÉCÉÉÉCJÉÃJÉCKÄ @ ÉÄ @  ÉÌÉÉÍD @  D  Ä @ ÁD D   :   	   nx_value    form_main_chat    nx_is_valid    gui 	   IsInRank        nx_int       ð?   get_ini_prop    back_image    2        @      @   3       @      $@   4            1 &   gui\special\sns_new\cbtn_sub2_out.png    font    colour_friend    colour_enemy       I@     Àr@     @@     @@     jø@   5 
   nx_string    left    top    Create    Label    Add    Text 	   HintText    Font 
   ForeColor 
   BackImage    Transparent     ClickEvent 	   DrawMode 
   FitWindow    Left 
   nx_number    Top    Width 
   TextWidth    Height       9@   nx_bind_script    nx_current    nx_callback 	   on_click    on_lab_name_click       a  a  a  b  b  b  b  b  c  f  f  f  g  g  g  g  g  h  k  k  k  l  o  o  o  o  o  o  o  o  p  p  p  p  p  p  p  p  r  r  r  r  r  r  r  r  r  r  r  r  r  r  r  r  s  s  s  s  s  s  s  s  u  u  u  u  u  u  u  u  u  u  u  u  u  u  u  u  v  v  v  v  v  v  v  v  x  x  x  x  x  x  x  x  y  y  y  y  y  y  y  y  |                                                                                                                                                                                                                                                       ¡  ¡  ¡  ¢  £  ¤  ¥  ¦  §  ¨  ©  ª  ª  ª  ª  «  «  «  «  ¬  ¬  ­  ¯  ¯  ¯  ¯  ¯  °  °  °  °  °  ±     	   groupbox           type           index           name           num           form_main_chat          gui          rank_no          back          font h         colour h      	   key_font h         key_colour h         left Õ         top Ý         lab à            FILE_SNS_STYLE     ³  ·       E   @  Á  Á@ \@         nx_execute    custom_sender !   custom_send_get_player_game_info    Text        ¶  ¶  ¶  ¶  ¶  ·        lab                ¹  Í     $       @      E@    \ À  À        Á @  @ Á Á A   Â   @  À  À   @  @       Â @       	      is_newjhmodule 	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    Close    nx_execute 	   util_gui    util_get_form    Show     $   º  º  »  »  ¼  ¿  ¿  ¿  À  À  À  À  À  Â  Â  Â  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Ä  Å  Å  Å  Å  Å  Æ  Æ  É  É  Ì  Ì  Í        bIsNewJHModule    #      form    #           Ï  Û        @ Á@  @A  à@ËÁ@ @ B  Ü À À ËA @ ÜA ß ýÁ@ Þ       	   RowCount               ð?   GetGridText 
   SelectRow       ð¿       Ð  Ò  Ò  Ò  Ò  Ó  Ó  Ó  Ó  Ó  Ó  Ô  Ô  Ô  Ö  Ò  Ú  Ú  Û        grid           name           count          (for index)          (for limit)          (for step)          index               Ý      	J   F @ @  À   @      À À@Å  A Ü À     ÆÁ ÆÀÁÚ   ÀÆ Â Â ÁAA    Æ@Â  @ WÀB@E A Á   \A ÀE A ÁÁ   \A @Å Â @ ÜWÀÂ@ AA  À A @ FAÂ  À  WÀÂ@ AA  À A   AA Á À A         ParentForm    nx_is_valid 
   ipt_input    Text    nx_widestr        groupbox_all    Visible    textgrid_friend    textgrid_enemy    find_player_in_list       ð¿   nx_execute    custom_sender !   custom_send_get_player_game_info    custom_sns_search_friend     J   Þ  ß  ß  ß  ß  ß  à  ã  ã  ä  ä  ä  ä  ä  å  è  è  è  è  é  ê  ê  ê  ê  ë  î  î  î  î  ð  ð  ñ  ñ  ñ  ñ  ñ  ñ  ó  ó  ó  ó  ó  ô  ö  ö  ö  ö  ø  ø  ù  ù  ù  ù  ù  ù  û  û  û  û  û  ý  ý  þ  þ  þ  þ  þ  þ                         btn     I      form    I      name 	   I      grid    *      row    *      row /   I           	  !    -   F @ @  @ ÅÀ    A ÜÚ   Æ Á ÍÀ @ÁÅ Á Ü  @   @AÂ ÁÁ  Á A   I Å@ Ü@ ÆÃ É ÄÆ@Ä ÉÀDÆ Å ÉÀDÆ@Å ÉEÅÀ   A Ü@        ParentForm    os    time    nx_find_custom    refresh_time ¹?	   nx_value    SystemCenterInfo    nx_is_valid    ShowSystemCenterInfo 
   util_text    sns_new_05        @   reset_friend_info    lbl_shuzhi 
   BackImage )   gui\special\sns_new\sns_newworld\qmd.png    groupbox_all    Visible    textgrid_friend    textgrid_enemy     save_show_form_to_file    2     -   
                                                                                            !        btn     ,      form    ,   	   new_time    ,      SystemCenterInfo               #  <    -   F @ @  @ ÅÀ    A ÜÚ   Æ Á ÍÀ @ÁÅ Á Ü  @   @AÂ ÁÁ  Á A   I Å@ Ü@ ÆÃ É ÄÆ@Ä ÉÀDÆ Å É@EÆÅ ÉÀDÅÀ   A Ü@        ParentForm    os    time    nx_find_custom    refresh_time ¹?	   nx_value    SystemCenterInfo    nx_is_valid    ShowSystemCenterInfo 
   util_text    sns_new_05        @   reset_enemy_info    lbl_shuzhi 
   BackImage )   gui\special\sns_new\sns_newworld\chd.png    groupbox_all    Visible    textgrid_friend     textgrid_enemy    save_show_form_to_file    1     -   $  %  %  %  &  &  &  &  &  &  '  '  '  '  (  (  (  )  )  )  )  )  *  *  *  *  *  *  -  1  3  3  5  5  6  6  7  7  8  8  ;  ;  ;  ;  <        btn     ,      form    ,   	   new_time    ,      SystemCenterInfo               >  G       F @ @À À@ Á À@@Á AÀÁ A  À  A @  
      ParentForm    groupbox_yinxiang1    Visible    groupbox_yinxiang2    groupbox_all     groupbox_find    save_show_form_to_file    0        ?  A  A  B  B  C  C  E  E  F  F  F  F  G        btn           form               I  T       F @ @À À@ Á À@@Á AÀÁ A Â À@@Â A À  Á @        ParentForm    groupbox_yinxiang1    Visible     groupbox_yinxiang2    groupbox_all    textgrid_friend    textgrid_enemy    groupbox_find    save_show_form_to_file    2        J  L  L  M  M  N  N  O  O  P  P  R  R  S  S  S  S  T        btn           form               V  f        À Å@    Ü Á  @   @ ÁA   Ë@A @   Ü  AÁ  ÀA   	           	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_menu    nx_is_valid    Close    GetGridText    nx_execute 9   form_stage_main\form_relation\form_new_world_player_info    scene_jhpk_chat        X  X  Y  Y  Y  Z  Z  Z  Z  Z  [  [  ^  a  a  a  a  e  e  e  e  e  f        grid           row           col           form_new_friend_menu          name               h  q       E   @  \   À      @À  Á  A A  @À  Á  A A Á @  @   	   	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    nx_execute    custom_sender    custom_query_enemy_info               ð?   reset_friend_info        i  i  i  j  j  j  j  j  l  l  l  l  l  l  m  m  m  m  m  m  o  o  q        form           form_friend_list               s  y       F @ @À À@	 A@Á À@        ParentForm    groupbox_tips    Visible     btn_hide_tips        t  v  v  w  x  x  y        btn           form               {         F @ @À À@	À@ Á @A        ParentForm    groupbox_tips    Visible     btn_show_tips        |  ~  ~                btn           form                            Á@   Æ@Á  A  EA  \ ZA      @Á U	AKB\A KABÁ Â E  \ \A  KAC\A E  \A      	   nx_value    game_config    login_account 
   nx_create    IniDocument    nx_is_valid 	   FileName    \form_main.ini    LoadFromFile    WriteString    form_new_friend_list 
   show_form 
   nx_string    SaveToFile    nx_destroy                                                                               form           flag           game_config          account          ini                 ±    	3   E   @  \ À ÅÀ   Ü A @ A        AÁ AÉ ÂA AÂ ÁÁ   CÀ EA C \A  ÀCE AD \A E ÁD \A À E@E AD \A EA E \A EÁ \A      	   nx_value    game_config    login_account 
   nx_create    IniDocument    nx_is_valid 	   FileName    \form_main.ini    LoadFromFile    ReadString    form_new_friend_list 
   show_form    0    on_btn_yinxiang_click    btn_yinxiang    1    on_btn_all_click    btn_all    on_btn_enemy_click 
   btn_enemy    2    on_btn_friend_click    btn_friend    nx_destroy     3                             ¡  ¡  ¡  ¡  ¢  ¢  ¤  ¤  ¤  ¤  ¤  ¦  ¦  §  §  §  §  ¨  ¨  ©  ©  ©  ª  ª  ª  ª  «  «  ¬  ¬  ¬  ­  ­  ­  °  °  °  ±        form     2      game_config    2      account    2      ini    2      flag    2           ´  ¹           A@   E     \ Z   @ KÀ@ \@      	   nx_value 6   form_stage_main\form_chat_system\form_new_friend_list    nx_is_valid    Close        µ  µ  µ  ¶  ¶  ¶  ¶  ¶  ·  ·  ¹        form    
       H            	   	   	   
   
   
                     #      2   2   %   8   4   J   :   \   L   g   ^   ¾   ¾   l       Á       ]    ±  ±  `  ·  ³  Í  ¹  Û  Ï    Ý  !  	  <  #  G  >  T  I  f  V  q  h  y  s    {      ±    ¹  ´  ¹        FILE_SNS_STYLE    G       