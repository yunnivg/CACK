LuaQ  f   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_logo.lua           5      A@  @    A  @ À  A  ¤   @ ¤@          ¤  À ¤À    ¤  @ ¤@  ¤ À ¤À   ¤  @ ¤@  ¤ À ¤À   ¤  @ ¤@  ¤ À ¤À   ¤  @ ¤@  ¤ À ¤À   ¤  @         require    custom_sender B   form_stage_main\form_relation\form_relation_guild\form_guild_util       @@      $@   main_form_init    on_main_form_open    on_main_form_close    setup_color_board #   on_trackrect_color_horizon_changed $   on_trackrect_color_vertical_changed    set_bright_color    update_selected_color    on_tbar_bright_value_changed    load_image_to_array 
   init_ctrl    show_thumbnail    picture_left_down    on_btn_frame_pre_click    on_btn_frame_next_click    on_btn_logo_pre_click    on_btn_logo_next_click    on_btn_ok_click    on_btn_close_click    on_recv_logo    on_btn_reset_logo_click           %        	@@	À@E@ \  U 	@ E@ \   U 	@	Â	Â	@C	@C	 Ä	Â	ÀD	ÀD        Fixed     MaxPreview       @   frame_path    nx_resource_path    gui\guild\frame\ 
   logo_path    gui\guild\logo\    frame_begin            logo_begin    selected_frame        selected_logo    selected_color    0,255,255,255    hue    sat       ð?   bri                                                            "   #   $   %         self                (   S    R   E@    ÁÀ    AA A\ 	@ E@    ÁÀ    AA A\ 	@  Æ @ ÁA A   @@  Á  Á  E \ A U 	 Å B FÁB  Ä Ü@Æ@C ÉÀCÆ D ÉÀCÅ@ D FÁD Ü@Å@ E FÁD Ü@Å@ D F@  Ü@ Å@ E FB  Ü@ ÅÀ  Ü ÆFF AÁF	 AÇFAG AÁF	  @  A Á A     !      frame_array    nx_call 	   util_gui    get_arraylist    nx_current    _frame_array    load_image_to_array    frame_path    ini\Guild\guild_frame.ini    _logo_array    logo_array 
   logo_path    ini\Guild\guild_logo.ini    btn_frame_pre    Enabled     btn_logo_pre 
   init_ctrl    textgrid_frame    MaxPreview    textgrid_logo    show_thumbnail         	   nx_value    gui    Left    Width        @   Top    Height    setup_color_board    custom_guild_get_logo       ð?    R   *   *   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   ,   /   /   /   /   /   /   2   2   2   2   2   2   2   2   3   6   6   6   6   6   6   9   9   ;   ;   =   =   =   =   ?   ?   ?   ?   A   A   A   A   A   B   B   B   B   B   E   E   E   G   G   G   G   G   H   H   H   H   H   K   K   K   P   P   R   R   S         self     Q      temp_frame_array    Q      temp_logo_array     Q      gui @   Q         FRAME_MAX_COUNT    LOGO_MAX_COUNT     V   ]        F @ K@À \@ F@ K@À \@ EÀ  @ \@ EÀ   @ \@ EÀ     \@         logo_array    ClearChild    frame_array    nx_destroy        W   W   W   X   X   X   Z   Z   Z   [   [   [   \   \   \   ]         self                `   n     
   E   @  \ À Á  Ë AAA  Á Ü@ËÀAA A Á B FÂB Ü@Æ C ÉÃÆ C É ÄÆ@D ÉÄÆ@D ÆÀÄÉ@EËÅ @ Ü@     	   nx_value    world    Create 
   EditColor    MakeColorTex    inner_tex:color_hue_sat       p@   MakeBrightTex    inner_tex:color_bright       0@   hue    sat    trackrect_color 
   BackImage $   inner_tex:color_hue_sat,0,0,256,256 	   DrawMode        tbar_bright "   inner_tex:color_bright,0,0,16,256    TrackButton    Height        @   Delete        a   a   a   c   c   c   e   e   e   e   e   f   f   f   f   f   f   f   h   h   i   i   j   j   k   k   k   m   m   m   n         form           world          edit_color               q   x        F @ @  À      À  Æ A  @AI  À  @ À À  @         ParentForm    nx_is_valid    hue 
   nx_number    HorizonValue      v@   set_bright_color    update_selected_color        r   s   s   s   s   s   t   t   t   t   t   u   u   u   v   v   v   x         self           form               z           F @ @  À      ÀÀ  Æ A  @A I À À  @   À  @   	      ParentForm    nx_is_valid    sat 
   nx_number    VerticalValue       Y@      ð?   set_bright_color    update_selected_color        {   |   |   |   |   |   }   }   }   }   }   }                              self           form                       
   E   @  \ À Á  Ë AAA  ÁÁ B FBB Ü@ËÂ @ Ü@ÁÀ Þ       	   nx_value    world    Create 
   EditColor    MakeBrightTex    inner_tex:color_bright       0@      p@   hue    sat    Delete       ð?                                                                      form           world          edit_color                          E   @  Æ@ Á@ FA \  EÁ  \  ÅÁ   Ü  EÂ \ A	 AB FAA 	A        nx_function    ext_hsb_to_rgb    hue    sat    bri    selected_color    255, 
   nx_string    ,    groupbox_preview 
   BackColor                                                                                      form           red          green          blue                  ¢        F @ @  À       À  Æ A  @A I À À  @         ParentForm    nx_is_valid    bri 
   nx_number    Value       Y@      ð?   update_selected_color                                                        ¢         self           form               ¥   ¸     2     AA   EÁ  \  U	AKA\ ZA  @ B  ^ KAA\  À  ÁÂA FÁ E \  ÁC    Å    Ü ÚB  ÀÿËÂB E Á\ Ü    E  \ CÉÉø     
   nx_create    IniDocument 	   FileName    nx_resource_path    LoadFromFile    GetSectionList       ð?   ReadString 
   nx_string        nx_is_valid    CreateChild    image 
   file_name     2   ¦   ¦   ¦   §   §   §   §   §   ©   ©   ©   ©   ª   ª   ­   ­   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   °   °   °   °   ±   ±   ±   ±   ±   ´   ´   ´   ´   ´   µ   µ   µ   µ   µ   µ   ¶   ¯   ¸         array     1      path     1   	   ini_path     1      count     1      ini    1      section_table    1      (for index)    1      (for limit)    1      (for step)    1      index    0      image_name    0      data )   0           »   Ó     (      Á@   Ë@ Ü@ ËÀ@ Ü@ Ë A AA Ü@Á ÁÁ AÁ à@ËBAB ÜÉÁBÉÁBÉÃÉÄB @  B  Â @ ÁB B E  À  Bß úËÀE Ü@      	   nx_value    gui    BeginUpdate 	   ClearRow 
   InsertRow       ð¿              ð?   Create    Picture    Width       P@   Height 
   LineColor    255, 255, 255, 255    NoFrame    nx_bind_script    nx_current    nx_callback    on_left_down    picture_left_down    SetGridControl 
   EndUpdate     (   ¼   ¼   ¼   ¾   ¾   ¿   ¿   Â   Â   Â   Ä   Ä   Ä   Ä   Å   Å   Å   Ç   È   É   Ê   Ì   Ì   Ì   Ì   Ì   Í   Í   Í   Í   Í   Ï   Ï   Ï   Ï   Ï   Ä   Ò   Ò   Ó         grid     '   
   max_count     '      gui    '      (for index)    %      (for limit)    %      (for step)    %      i    $   	   pic_ctrl    $           ×   ø     ?   Æ @ A  @ A        FÀLAÁÀ  Å   Ü  FÀ   A @  @ ÆÀÁ@ ÁA ÀAA àÁËÂA AC  Ü  @  E  \ CE \ @@CÂ  Ì   FCÉBFCCÉB@ ÉÃÉÃßø        ParentForm    nx_is_valid    MaxPreview    GetChildCount    nx_int               ð?   GetGridControl 
   nx_number 	   GetChild 
   nx_string    Image    image 
   file_name         ?   Ø   Ù   Ù   Ù   Ù   Ù   Ú   Ý   Þ   Þ   à   à   ã   ã   ã   ã   ã   ã   ã   ã   ä   å   å   æ   æ   ç   ç   è   ì   ì   ì   ì   ì   í   í   í   í   ï   ï   ï   ï   ï   ï   ï   ï   ï   ï   ï   ï   ð   ð   ð   ð   ð   ñ   ñ   ò   ò   ò   ô   õ   ì   ø         grid     >      array     >      begin     >      form    >   
   begin_idx    >      end_idx 
   >      total    >      (for index)     >      (for limit)     >      (for step)     >      i !   =   	   pic_ctrl %   =      item 6   :           û   
       F @ @  À    @      @ ÆÀ@ Á@ÆA IÀÆÀÁ B É ÀÆÀ@@Â ÆA IÀ ÆÀÂ B É         ParentForm    nx_is_valid    Parent    Name    textgrid_frame    selected_frame 
   file_name 
   pic_frame    Image    textgrid_logo    selected_logo 	   pic_logo        ü   ý   ý   ý   ý   ý   þ                                       
        self           form          grid                        F @ @  À   @      À @À  AI @ ÆÁ ÁÁ FÀ @  Â ÂÀ À@  	ÀÂ        ParentForm    nx_is_valid    frame_begin               ð?   show_thumbnail    textgrid_frame    frame_array    btn_frame_next    Enabled                                                                 btn           form                 .       F @ @  À   @      À À@ Æ Á Ì@ÁÆ Á ÌÁIÀ ÅÀ Â FÀ Á Ü@ Æ@Â ÉÀBÆ Á Ì@Á  	 C        ParentForm    nx_is_valid    frame_array    GetChildCount    frame_begin       @      ð?   show_thumbnail    textgrid_frame    btn_frame_pre    Enabled            !  !  !  !  !  "  $  $  $  %  %  %  %  &  &  &  '  '  '  '  '  (  (  *  *  *  *  +  .        btn           form          total 
              1  @       F @ @  À   @      À @À  AI @ ÆÁ ÁÁ FÀ @  Â ÂÀ À@  	ÀÂ        ParentForm    nx_is_valid    logo_begin               ð?   show_thumbnail    textgrid_logo    logo_array    btn_logo_next    Enabled         2  3  3  3  3  3  4  7  7  7  8  8  8  9  9  9  9  9  ;  ;  <  <  <  =  @        btn           form               C  R       F @ @  À   @      À À@ Æ Á Ì@ÁÆ Á ÌÁIÀ ÅÀ Â FÀ Á Ü@ Æ@Â ÉÀBÆ Á Ì@Á  	 C        ParentForm    nx_is_valid    logo_array    GetChildCount    logo_begin       @      ð?   show_thumbnail    textgrid_logo    btn_logo_pre    Enabled         D  E  E  E  E  E  F  H  H  H  I  I  I  I  J  J  J  K  K  K  K  K  M  M  N  N  N  N  O  R        btn           form          total 
              U  a       F @ @  À   @      À ÁÀ  Á AÁ  AÁ Å Á @  Ü@  Ë Â Ü@   	      ParentForm    nx_is_valid    selected_frame    #    selected_logo    selected_color    custom_guild_set_logo 
   nx_string    Close        V  X  X  X  X  X  Y  \  \  \  \  \  \  ^  ^  ^  ^  ^  `  `  a        btn           form          logo               d  j    	   F @ @  À      @ À @         ParentForm    nx_is_valid    Close     	   e  g  g  g  g  g  h  h  j        btn           form               m  |    +   E   @  \   À   @      À  À    Å@ ÆÁ  Ü ÀÁÆ@BIÀ ÆÀBIÀ ÆÀAIÀ Æ@Ã Á  A ABÉ Æ@Ä Á  A ÁBÉ ÆÀÄ ÁAÉ      	   nx_value B   form_stage_main\form_relation\form_relation_guild\form_guild_logo    nx_is_valid    util_split_string    #    table    getn       @   selected_frame       ð?   selected_logo        @   selected_color 
   pic_frame    Image    nx_resource_path    gui\guild\frame\ 	   pic_logo    gui\guild\logo\    groupbox_preview 
   BackColor     +   n  n  n  o  o  o  o  o  p  s  s  s  s  t  t  t  t  t  t  u  u  v  v  w  w  x  x  x  x  x  x  x  y  y  y  y  y  y  y  z  z  z  |        logo     *      form    *   
   logo_info    *                    F @ IÀIÀI@AÁ À Â À@Â @A        ParentForm    selected_frame        selected_logo    selected_color    0,255,255,255 
   pic_frame    Image 	   pic_logo    groupbox_preview 
   BackColor                                    btn     
      form    
       5                           %      S   S   S   (   ]   V   n   `   x   q      z               ¢      ¸   ¥   Ó   »   ø   ×   
  û       .    @  1  R  C  a  U  j  d  |  m              LOGO_MAX_COUNT    4      FRAME_MAX_COUNT    4       