LuaQ  >   @H:\yuenanl_60512\01_Client\lua\form_test\form_move_check.lua           B      A@  @    A  @    AÀ  @    A  @ @ A À Á  A AA  ÁÁ  A   Ê  
  J  ¤  C ¤C        ¤       Ã ¤Ã        ¤                   C ¤C             ¤            Ã ¤Ã  ¤ C         require    util_functions    custom_sender 	   util_gui    share\client_custom_define    255,255,0,0    255,0,255,0    255,0,0,255    255, 255, 0, 0    255, 0, 150, 0       N@     Q@      4@   main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    init_drawline    on_recv_data    sum_minute_dif    on_btn_Inmage_click    get_scene_id_by_name 	       E   P     
   	@@	À@	À@	ÀÀ	À@E  @ \ 	@  
      Fixed     cell_width            cell_height    o_x    o_y    target    nx_widestr         
   F   I   J   M   N   O   O   O   O   P         form     	           R   _       	@@E     \@ FÀ@ K Á \@ F@A K Á \@ J   H   J   H          Fixed     init_drawline    DrawLines1    Clear    DrawLines2        T   W   W   W   Y   Y   Y   Z   Z   Z   ]   ]   ^   ^   _         form           	   move_tbl    all_move_tbl     b   h    	   J   H   J   H  E      \@           nx_destroy     	   c   c   d   d   f   f   f   g   h         form           	   move_tbl    all_move_tbl     k   q       J   H   J   H  F @ @À @         ParentForm    Close        l   l   m   m   o   p   p   q         btn           form          	   move_tbl    all_move_tbl     t   Ù       E      \ Z@      F@@    À        IÀ@  Æ@Á ÍÀÀ Å  Á Á@Ü  D   E  \  ÏA 	 Ï 	     Â A Á ÌCB AB B ÁB 	ÀCD C	  @   	ÍÃMÃN LÍÃÎ	 Ì	EÄ  À  	@	 KÄ À 
 \E EÅ FÅ
À\E @   	@	 Ã@  	À	CöCÄ  À  @ KÄ À  \C AC C ÁC D A Á `MC
EN
L
 ÍC
FÎÌ KFÄ À
  @ \ Ä  D F  C
@ @ @
@ À  _Ä÷KDÄ À  @ \ Ä  D D         nx_is_valid    GridDrawLines 
   LineWidth       $@	   tonumber    Width    Height    cell_width    nx_int    cell_height    Clear           ð?           o_x       4@   o_y    AddLine    SetLineColor    table    insert        u   u   u   u   u   v   z   |   |   |   |   |   }                                                                                                                                              ¡   ¡   ¡   ¡   ¡   ¢   ¢   £   £   £   £   £   ¥   ¥   ¥   ¥   ¥   ¥   §   §   §   §   ©   ©   ©   ©   ©   «   «   ¬   ­   °   °   ±   ²      ·   ·   ·   ·   ·   ·   ¸   ¸   ¸   ¸   º   »   ¼   ½   À   À   À   À   Á   Á   Á   Á   Á   Â   Ã   Ã   Ã   Ã   Ã   Ä   Ä   Æ   Æ   Æ   Æ   Æ   Æ   È   È   È   È   Ê   Ê   Ë   Ì   Ï   Ï   Ð   Ñ   À   Ö   Ö   Ö   Ö   Ö   Ö   ×   ×   ×   ×   Ù   $      form           GridDrawLines          W          H          rows          cols          xy *         cur_row +         row_end_x_1 ,         row_end_y_1 -         row_end_x_2 .         row_end_y_2 /         (for index) 8   _      (for limit) 8   _      (for step) 8   _      i 9   ^      start_x ;   ^      start_y @   ^      end_x B   ^      end_y G   ^      index M   ^      index e         col_end_x_1 j         col_end_y_1 k         col_end_x_2 l         col_end_y_2 m         (for index) p         (for limit) p         (for step) p         i q         start_x v         start_y w         end_x |         end_y ~         index          index             MAX_ROW    MAX_COL    x_point_tbl    y_point_tbl    TOPDEFLECT    LEFTDEFLECT    SELECT_COLOR     Ü   7   È   E   @  \   À   @      À@ Æ A AA FA ÁA ÆB BB FB ÂB IÀÆBÃ Ã @ ÉÆÄ Ã EC  À  \    ÉÆÂÄ Ã E \   EÃ C \ Ã Å   Ü   ÉÆÅ Ã @ ÉÆÂÅ Ã @  É  ÆBÆ Ã O ÉÆÆ Ã @ ÉÆÂÆ Ã @  É ÆÇ Ã O ÉÆBÇ ÆÇCÇ @Ã ÁÃ  ÅÃ   Ü UÃ	C CHD   A È CWÀH@  IÀ Å  Ü @ÅC	   Ü D	 @  ÌÈ EÄ \ 	DÉ   @  E  \ @     @  E  \ @@ ÄID   D@
 @ D 
     DÊ JD È EÄ Ä \ 	D DHD     À@    DÊ AÄ  Ä@ÁÄ  `ÄFÅÊ Ë 
L
  ÆÅÊ Æ@
FË FÌ  LÆ@
FKFKÀ
  @ \ K DF _ù  /   	   nx_value    form_test\form_move_check    nx_is_valid       ð?       @      @      @      @      @      @       @      "@   target    lbl_player    Text    nx_widestr 
   lbl_scene 
   util_text    get_scene_id_by_name    lbl_pos    nx_int    :    fipt_total 
   fipt_time            fipt_average    fipt_check_total    fipt_check_total_time    fipt_check_total_average 
   lbl_value 	   HtmlText    ;    table    getn    fipt_cur_minute      
   nx_number    o_y    insert    sum_minute_dif    DrawLines1    Clear    o_x    cell_width    AddLine    SetLineColor     È   Ý   Ý   Ý   Þ   Þ   Þ   Þ   Þ   ß   â   ã   ä   æ   ç   é   ê   ë   ì   ï   ð   ð   ð   ð   ð   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ñ   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   ò   õ   õ   õ   õ   õ   ö   ö   ö   ö   ö   ÷   ÷   ø   ø   ø   ø   ø   ü   ü   ü   ü   ü   ý   ý   ý   ý   ý   þ   þ   ÿ   ÿ   ÿ   ÿ   ÿ                                     	  	  
  
  
  
                                                                                                         !  !  !  !  !  $  $  $  $  $  &  &  '  *  ,  ,  ,  ,  -  -  -  -  .  .  0  0  0  0  0  1  1  1  3  3  3  3  3  3  4  4  4  4  ,  7        arg     Ç      form    Ç      dif 
   Ç      total    Ç   	   sum_time    Ç      check_total    Ç      check_sum_time    Ç      player    Ç      scene    Ç      x    Ç      z    Ç      temp U   Ç      length c   Ç   
   new_value d   Ç      cur f   Ç   
   new_value u   Ç      DrawLines1 ª   Ç      (for index) ­   Ç      (for limit) ­   Ç      (for step) ­   Ç      j ®   Æ      start_x ²   Æ      start_y ´   Æ      end_x ¹   Æ      end_y ¼   Æ      index Â   Æ      	   move_tbl    TOPDEFLECT    MAX_ROW    GRID_COLOR     :  `   N   A   @  @Ä    ÁÀ    AÁ  à ÆA   ÍLÀ ß@þÆ@A Á @  É Æ A M@Å@  ÆÀ Ü  À  Ê   È  Æ B Ë@ÂÜ@ Å@  ÆÂ @ Ü@Å@  ÆÀ Ü ÀÀ    Á  MÁÀÁ   AÂB FC NBBD FÂÂB ÌÂÀC ÎÂÄ ÃÀÆB CC À  @ FB KÃÀ \C ù                table    getn       ð?   o_y    fipt_last_minute    Text    nx_widestr    DrawLines2    Clear    insert    o_x    cell_width    AddLine    SetLineColor     N   ;  <  <  <  <  =  =  =  =  >  >  >  >  ?  =  C  C  C  C  C  E  E  G  G  G  G  G  G  G  H  H  I  I  I  L  L  L  L  L  O  O  O  O  Q  Q  R  U  U  U  U  V  V  V  V  W  W  Y  Y  Y  Y  Y  Z  Z  Z  \  \  \  \  \  \  \  ]  ]  ]  ]  ]  U  `        form     M      sum_minute_dif    M      length    M      (for index)          (for limit)          (for step)          i 	         dif          length +   M      (for index) 1   M      (for limit) 1   M      (for step) 1   M      j 2   L      start_x 6   L      start_y 8   L      end_x =   L      end_y @   L      index G   L      	   move_tbl    all_move_tbl    MAX_ROW 
   OUT_COLOR     c  y    &   F @ @  Á   ÆÀ@ AA E \ Á Å Â Ü  @  E B \ UAA  Á  ÅÁ   Ü ÚA      ËC@ÜÚ    Àÿ        ParentForm 	   nx_value    game_config    login_account    os    time 
   nx_string    \    target    .jpg    world    nx_is_valid    ScreenShot     &   d  f  f  f  g  i  i  i  j  j  j  j  j  j  j  k  k  k  k  k  k  k  m  m  m  o  o  o  o  o  p  t  t  t  t  t  t  y        btn     %      form    %      game_config    %      account    %   	   cur_time    %   
   file_name    %      world    %           |      #   E   @  Á  Á  \   À   @  @      @Á  Á Á A  Á `AÌ ÂEB Â  MB \     ^ _ýAÁ ^         nx_execute    util_functions    get_ini    share\rule\maplist.ini    nx_is_valid    GetSectionItemCount                   ð?
   nx_string    GetSectionItemValue     #   }  }  }  }  }  ~  ~  ~  ~  ~                                                    
   	   scene_id     "      ini    "      item_count    "      index    "      scene_name    "      (for index)           (for limit)           (for step)           i          scene_name           B                     	   	   	   
   
   
                                 9   :   =   @   P   E   _   _   _   R   h   h   h   b   q   q   q   k   Ù   Ù   Ù   Ù   Ù   Ù   Ù   Ù   t   7  7  7  7  7  Ü   `  `  `  `  `  :  y  c    |       	   IN_COLOR    A   
   OUT_COLOR    A      SELECT_COLOR    A   
   COLOR_RED    A      COLOR_DARKGREEN    A      GRID_COLOR    A      MAX_ROW    A      MAX_COL    A      TOPDEFLECT    A      LEFTDEFLECT    A      x_point_tbl    A      y_point_tbl    A   	   move_tbl    A      all_move_tbl    A       