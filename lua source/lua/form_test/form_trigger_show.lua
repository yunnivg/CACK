LuaQ  @   @H:\yuenanl_60512\01_Client\lua\form_test\form_trigger_show.lua           F      A@  @    A  @    AÀ  @   d       G@ d@      G d  GÀ dÀ  G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ     G  d  G@ d@ G d GÀ dÀ G  d  G@ d@ G d GÀ dÀ G    !      require 	   util_gui    util_functions    custom_sender    form_test\form_trigger_show 
   open_form    close_form    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_tbar_arph_value_changed    on_tbar_range_value_changed    on_tbar_range_drag_leave    on_btn_refresh_click    on_cbtn_auto_checked_changed    on_rbtn_1_click    on_rbtn_2_click    on_rbtn_3_click    on_rbtn_4_click    on_rbtn_5_click    on_textgrid_con_select_row    on_btn_select_click    on_btn_gmtarget_click    server_msg_handle    send_show_debug    send_refresh_debug    send_auto_debug    send_range_debug    send_gmtarget_debug    send_select_debug    set_rank_title    update_grid_con           -     !      D     E@     \ Z@      	À@K A \@ F@A KÁ \@ F@A KÀÁ \@ E     \@ F@B À Æ C Æ@Ã I E ÀC Á  \@        util_get_form    nx_is_valid    Visible    Show    textgrid_con 	   ClearRow    ClearSelect    set_rank_title    lbl_6    Text    nx_widestr    tbar_range    Value    on_rbtn_1_click    rbtn_1             !                                          !   !   !   "   "   "   %   %   %   (   (   (   (   (   (   +   +   +   +   -         form           
   FORM_NAME     0   7           A@    Ä     B   EÀ     \ Z   @ K A \@         nx_execute 	   util_gui    util_get_form    nx_is_valid    Close        2   2   2   2   2   2   2   3   3   3   3   3   4   4   7         form          
   FORM_NAME     >   E        	@@	À@        Fixed  	   cur_flag       ð?       @   C   E         form                H   Q        E   @  \   À      @ Á Æ A À @A	ÀÁ ÆÀA À @A	      	   nx_value    gui    nx_is_valid    Left    Width        @   Top    Height        K   K   K   L   L   L   L   L   M   M   M   M   M   N   N   N   N   N   Q         form           gui               T   \     	   E   @  Á    \@ EÀ     \@         send_show_debug               I@   nx_destroy     	   W   W   W   W   W   Z   Z   Z   \         form                c   s        W À     @@ Å    Ü Ú@      ËÀ@Ü@                 ParentForm    nx_is_valid    Close        f   f   g   k   l   l   l   l   l   m   q   q   s         btn           mouse_type           form               v            @ Å@    Ü Ú@      Å  Á@ Ü  Õ ÀA	Á        ParentForm    nx_is_valid 
   nx_string    Value    ,255,255,255    BlendColor    groupbox_con        y   z   z   z   z   z   {                                    tbar        
   old_value           form          new_blend_color                           @ Å@    Ü Ú@      Æ@ FAA  É         ParentForm    nx_is_valid    lbl_6    Text    nx_widestr    Value                                                     tbar        
   old_value           form                  ¡        F @ @  À   @        ÆÀ@ @         ParentForm    nx_is_valid    send_range_debug    Value                                      ¡         tbar     
      form    
           ¤   ³        W À     @@ Å    Ü Ú@      ÅÀ  Ü@                 ParentForm    nx_is_valid    send_refresh_debug        §   §   ¨   ¬   ­   ­   ­   ­   ­   ®   ±   ±   ³         btn           mouse_type           form               ¶   º        E   @@ \@         send_auto_debug    Checked        ¸   ¸   ¸   º         cbtn                ½   Ö        W À     @@ Å    Ü Ú@      ÆÀ@É@AÆAÉÀAÆ BÉÀAÆ@BÉÀAÆBÉÀA ÃÅ@ ÁBFCFÁÃDAÜ@                 ParentForm    nx_is_valid    rbtn_1    Checked    rbtn_2     rbtn_3    rbtn_4    rbtn_5 	   cur_flag       ð?   send_show_debug    tbar_range    Value 
   cbtn_auto        À   À   Á   Å   Æ   Æ   Æ   Æ   Æ   Ç   Ë   Ë   Ì   Ì   Í   Í   Î   Î   Ï   Ï   Ò   Ô   Ô   Ô   Ô   Ô   Ô   Ô   Ö         rbtn           mouse_type           form               Ù   ò        W À     @@ Å    Ü Ú@      ÆÀ@É@AÆAÉÀAÆ BÉ@AÆ@BÉ@AÆBÉ@A ÃÅ@ ÁBFCFÁÃDAÜ@                 ParentForm    nx_is_valid    rbtn_1    Checked     rbtn_2    rbtn_3    rbtn_4    rbtn_5 	   cur_flag        @   send_show_debug    tbar_range    Value 
   cbtn_auto        Ü   Ü   Ý   á   â   â   â   â   â   ã   ç   ç   è   è   é   é   ê   ê   ë   ë   î   ð   ð   ð   ð   ð   ð   ð   ò         rbtn           mouse_type           form               õ          W À     @@ Å    Ü Ú@      ÆÀ@É@AÆAÉ@AÆÀAÉ BÆ@BÉ@AÆBÉ@A ÃÅ@ ÁBFCFÁÃDAÜ@                 ParentForm    nx_is_valid    rbtn_1    Checked     rbtn_2    rbtn_3    rbtn_4    rbtn_5 	   cur_flag       @   send_show_debug    tbar_range    Value 
   cbtn_auto        ø   ø   ù   ý   þ   þ   þ   þ   þ   ÿ                       
                        rbtn           mouse_type           form                 *       W À     @@ Å    Ü Ú@      ÆÀ@É@AÆAÉ@AÆÀAÉ@AÆ BÉ@BÆBÉ@A ÃÅ@ ÁBFCFÁÃDAÜ@                 ParentForm    nx_is_valid    rbtn_1    Checked     rbtn_2    rbtn_3    rbtn_4    rbtn_5 	   cur_flag       @   send_show_debug    tbar_range    Value 
   cbtn_auto                                      !  !  "  "  #  #  &  (  (  (  (  (  (  (  *        rbtn           mouse_type           form               -  F       W À     @@ Å    Ü Ú@      ÆÀ@É@AÆAÉ@AÆÀAÉ@AÆ BÉ@AÆ@BÉB ÃÅ@ ÁBFCFÁÃDAÜ@                 ParentForm    nx_is_valid    rbtn_1    Checked     rbtn_2    rbtn_3    rbtn_4    rbtn_5 	   cur_flag       @   send_show_debug    tbar_range    Value 
   cbtn_auto        0  0  1  5  6  6  6  6  6  7  ;  ;  <  <  =  =  >  >  ?  ?  B  D  D  D  D  D  D  D  F        rbtn           mouse_type           form               I  M                      K  M     	   textgrid           row                P  f       W À     @@ Å    Ü Ú@      ÆÀ@Æ Á À    ÆÀ@Ë@ÁFÁ@FÁ  Ü  @A                 ParentForm    nx_is_valid    textgrid_con    RowSelectIndex    GetGridTag    send_select_debug        S  S  T  X  Y  Y  Y  Y  Y  Z  ^  ^  ^  ^  _  b  b  b  b  b  b  d  d  d  f        btn           mouse_type           form          ident               i         W À     @@ Å    Ü Ú@      ÆÀ@Æ Á À    ÆÀ@Ë@ÁFÁ@FÁ  Ü  @A                 ParentForm    nx_is_valid    textgrid_con    RowSelectIndex    GetGridTag    send_gmtarget_debug        l  l  m  q  r  r  r  r  r  s  w  w  w  w  x  {  {  {  {  {  {  }  }  }          btn           mouse_type           form          ident                 °   b   E   F@À    \ À     F@ À  Á   ÅÀ    Ü À @ Á Á D    Â   Å    Ü Ú@  @Å@  A   Ü@   Å   Æ@À   Ü ÀÂ    Æ C A FC EA \ W@    Á FD  EÁ AD \ Á ÆD  ÅÁ ÂD Ü  FÂB  EB  À  @ À \B@À  Á   ÅÀ    Ü À @@ Á Á D    Â   Å    Ü Ú@  @ Å Ü@         table    getn       ð?
   nx_number            nx_execute 	   util_gui    util_get_form    nx_is_valid    send_show_debug       I@      @       @   nx_int 	   cur_flag    nx_widestr       @      @      @      @
   nx_string    update_grid_con 
   open_form     b                                                                                                                  ¡  ¡  ¡  ¢  ¢  ¢  £  £  £  ¤  ¤  ¤  §  §  §  §  §  §  §  §  §  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ª  ª  ª  ª  ª  ª  ª  «  «  «  «  «  ¬  ¬  °  
      arg     a      sub_msg    a      form    J   	   cur_flag *   J      player_info 6   J   	   npc_info 9   J      scene_info <   J   
   buff_info ?   J      ident_info B   J      form Z   a      
   FORM_NAME     ·  Ã       Á        Á@    AÁ   E    \   Á  Å    Ü   A  E  \ AEA  ÁÁ   \A                    ð?   nx_widestr    show_trigger_debug          nx_execute    custom_sender    custom_gminfo        ¹  º  º  »  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  ¿  Á  Á  Á  Á  Á  Ã     	   cur_flag           range           checked           auto          gm_info               Æ  Í     	      A@   E  À  Á     \@         nx_widestr    refresh_trigger_debug    nx_execute    custom_sender    custom_gminfo     	   É  É  É  Ë  Ë  Ë  Ë  Ë  Í        gm_info               Ð  Ü       A        A@    ÁÀ   Å    Ü À Å  A A  Ü@                    ð?   nx_widestr    auto_trigger_debug     nx_execute    custom_sender    custom_gminfo        Ò  Ó  Ó  Ô  Ø  Ø  Ø  Ø  Ø  Ø  Ø  Ú  Ú  Ú  Ú  Ú  Ü        checked           auto          gm_info               ß  æ       E   @  \    À    U   ÁÀ   @ @         nx_widestr    range_trigger_debug     nx_execute    custom_sender    custom_gminfo        â  â  â  â  â  â  â  ä  ä  ä  ä  ä  æ        range           gm_info               é  ð       E   @  \    À    U   ÁÀ   @ @         nx_widestr    gmtarget_trigger_debug     nx_execute    custom_sender    custom_gminfo        ì  ì  ì  ì  ì  ì  ì  î  î  î  î  î  ð        target           gm_info               ó  ú       E   @  \    À    U   ÁÀ   @ @         nx_widestr    select_trigger_debug     nx_execute    custom_sender    custom_gminfo        ö  ö  ö  ö  ö  ö  ö  ø  ø  ø  ø  ø  ú        target           gm_info               ý  	       E   @  \   À   @      À@  AA E Á \ @  À@  A E A \ @  À@  A E Á \ @       	   nx_value    gui    nx_is_valid    textgrid_con    SetColTitle            nx_widestr 	   ÔØÌå¶ÔÏó       ð?	   ´¥·¢ÊÂ¼þ        @   ÐÐÎª¼¯ÎÄ¼þÃû        ÿ  ÿ  ÿ                                                             	        form           gui                 Á    ]  @ A@A @ @A   ÅÁ   @ AB ÜÁ Â FB  EÂ  \ W@ÀÂ FB  EÂ B \ @@ @  E Â \ W@@
  E  À  ÁB \ A B CÀ  AÁ `B   Å  F AÄ ÜÁ D C@  AA àCÊ   E \  À 
E C
@	  À@ D
Å Z  @B  F@ KÅ
À 
F E Á	\ \E  ÀF@ KÅ
À 
F E Æ \ \E  F@ KÅ
À 
 E  Å GÂ	Ü   \  \E  F@ KÅ
À 
F E FÄ	\ \E  F@ KÅÅ
À 
F E Æ\ \E  ßïÌÁ_BêÂ FB  EÂ  \ W@ÀÂ FB  EÂ B \ @  @  E Â \ W@
  E  À  ÁB \ A B CÀ  AÁ `BB   Å  F AÄ ÜÁ D C@  AA àÊ   E \  À 
E C
@	   @ D
Å Z  B  E Á	\  ÁÅ  
 F@ KÅ
À 
F E F \ \E   F@ KÅ
À 
F E  Å Á	Ü   \  \E  ÀF@ KÅ
À 
F E Æ \ \E  F@ KÅ
À 
 E  Å GÂ	Ü   \  \E  F@ KÅ
À 
F E FÄ	\ \E  F@ KÅÅ
À 
F E Æ\ \E  ßÃéÌÁ_åÂ FB  EÂ  \ W@ÀÂ FB  EÂ  \ @@ @ E Â \ W@@
  E  À ÁB \ A B CÀ  AÁ `B   Å  F AÄ ÜÁ D C@  AA àCÊ   E \  À 
E C
@	  À@ D
Å Z  @B  F@ KÅ
À 
F E Á	\ \E  ÀF@ KÅ
À 
F E Æ \ \E  F@ KÅ
À 
 E  Å GÂ	Ü   \  \E  F@ KÅ
À 
F E FÄ	\ \E  F@ KÅÅ
À 
F E Æ\ \E  ßïÌÁ_BêÂ FB  EÂ  \ W@ÀÂ FB  EÂ Â \ @@+ @  E Â \ W@@)
  E  À  ÁB \ A B CÀ  AÁ `%B   Å  F AÄ ÜÁ D C@  AA àC Ê   E \  À 
E C
@	  À@ D
Å Z  @B  E Å \  ÆÁ	 Å Æ Ü WÀ@
Å Á	Ü UÅ ÆEÂ	 Å Æ Ü À@
Å F Ü UÅ 
Å  E FÂ	\   Ü  UÅ ÆEÄ	 Å Æ Ü À@
Å  Ü UÅÀ
Å F Ü  E  ÆFÄ	 \    U@ E  
AF 
EÀF@ KÅ
À 
F E Æ \ \E  F@ KÅ
À 
 E  Å Æ	Ü   \  \E  F@ KÅ
À 
F E ÆÆ	\ \E  F@ KÅÅ
À 
F E Æ\ \E  ßßÌÁ_BÚ        textgrid_con 	   ClearRow    ClearSelect    util_split_string 
   nx_string    |       ð?   nx_int 	   cur_flag        @   nx_widestr        util_split_wstring    table    getn    ;    ,       @
   InsertRow       ð¿   SetGridText         
   util_text    SetGridTag 
   nx_object    ¿ÕID       @      @   :¿ÕID    :     ]                                                                                                                                         "  "  "  "  "  "  "  "  $  %  %  %  %  %  %  %  '  '  '  '  '  '  )  )  )  )  *  *  +  ,  ,  ,  ,  ,  ,  ,  ,  ,  .  .  .  .  .  .  .  .  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  "  7    =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  >  >  >  >  >  >  >  >  ?  @  @  @  @  @  @  @  B  B  B  B  B  B  B  B  C  D  E  E  E  E  E  E  E  G  G  G  G  G  G  G  G  I  J  J  J  J  J  J  J  L  L  L  L  L  L  N  N  N  N  O  O  P  Q  Q  Q  Q  Q  Q  Q  Q  R  R  R  R  R  R  R  R  R  T  T  T  T  T  T  T  T  T  T  T  T  U  W  W  W  W  W  W  W  W  Z  Z  Z  Z  Z  Z  Z  Z  Z  Z  Z  Z  [  [  [  [  [  [  [  [  \  \  \  \  \  \  \  \  G  a  B  g  g  g  g  g  g  g  g  g  g  g  g  g  g  g  g  h  h  h  h  h  h  h  h  i  j  j  j  j  j  j  j  l  l  l  l  l  l  l  l  m  n  o  o  o  o  o  o  o  q  q  q  q  q  q  q  q  s  t  t  t  t  t  t  t  v  v  v  v  v  v  x  x  x  x  y  y  z  {  {  {  {  {  {  {  {  {  }  }  }  }  }  }  }  }                                                          q    l                                                                                                                                                                       ¢  ¢  ¢  ¢  ¢  ¢  ¢  ¢  £  £  £  £  £  £  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¥  ¦  ¦  ¦  ¦  ¦  ¦  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¨  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ¬  ­  ­  ­  ­  ­  ­  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ±  ±  ±  ±  ±  ±  ±  ³  ³  ³  ³  ³  ³  ³  ³  µ  µ  µ  µ  µ  µ  µ  µ  µ  µ  µ  µ  ¶  ¶  ¶  ¶  ¶  ¶  ¶  ¶  ·  ·  ·  ·  ·  ·  ·  ·    ¼    Á  =      form     \     player_info     \  	   npc_info     \     scene_info     \  
   buff_info     \     ident_info     \  
   ident_tab    \  
   cur_index    \  
   p_all_tab (         (for index) 6         (for limit) 6         (for step) 6         i 7         b_first 8         p_tab 9         (for index) G         (for limit) G         (for step) G         m H         t_info_tab I         row Z      
   p_all_tab ¦         (for index) ´         (for limit) ´         (for step) ´         i µ        b_first ¶        p_tab ·        (for index) Å        (for limit) Å        (for step) Å        m Æ        t_info_tab Ç        row Ø     
   p_all_tab 9       (for index) G       (for limit) G       (for step) G       i H       b_first I       p_tab J       (for index) X       (for limit) X       (for step) X       m Y       t_info_tab Z       row k    
   p_all_tab ·  \     (for index) Å  \     (for limit) Å  \     (for step) Å  \     i Æ  [     b_first Ç  [     p_tab È  [     (for index) Ö  Z     (for limit) Ö  Z     (for step) Ö  Z     m ×  Y     t_info_tab Ø  Y     row é  Y  
   self_name ï  4      F   	   	   	   
   
   
               -   -      7   7   0   E   >   Q   H   \   T   s   c      v         ¡      ³   ¤   º   ¶   Ö   ½   ò   Ù     õ   *    F  -  M  I  f  P    i  °  °    Ã  ·  Í  Æ  Ü  Ð  æ  ß  ð  é  ú  ó  	  ý  Á    Á     
   FORM_NAME 
   E       