LuaQ  ?   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_karma.lua           d      A@  @    A  @ 
   J   À  ÁÀ    J  ¤   ¤A    A ¤   ¤Á  Á ¤  ¤A A ¤  ¤Á Á ¤  ¤A A ¤  ¤Á Á ¤  ¤A    A ¤                   ¤Á Á ¤  ¤A   A ¤       ¤Á        Á ¤      ¤A       A ¤           ¤Á    Á ¤     ¤A        A ¤      ¤Á Á ¤  ¤A A ¤    #      require 	   util_gui    share\client_custom_define       ð?   main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_rbtn_click    on_rbtn_checked_changed    add_group_karma    remove_group_karma    show_npc_friend    add_npc_info_groupbox    set_karma_groupbox    add_groupbox_menu    get_fangle_desc    on_rbtn_page_checked_changed    show_gossip_info    set_bagua_control_position    set_control_check_mlt_position    set_page_control_position    on_btn_left_click    on_btn_right_click    on_btn_select_all_click    on_btn_share_click    on_btn_delete_click    share_gossip_info    delete_gossip_info    get_selected_check_box    check_data_all_selected    data_exist    on_rbtn_tips_get_capture    on_rbtn_tips_lost_capture    show_karma_groupbox                   	@@A  ^          Fixed        ð?                         form                   ,    '   E   @  \       ÀÀ ÆÀ@ À  A	 Á ÆA À  A	ÀA @BB @BÀB @B  Æ C AC FC ÁC ÆD BD FD ÂD ÆE CE ¢@     ÁÀ  @     	   nx_value    gui    Left    Width        @   Top    Height    groupscrollbox_bagua    Visible  
   btn_share    btn_delete    rbtn_page_1    rbtn_page_2    rbtn_page_3    rbtn_page_4    rbtn_page_5    rbtn_page_6    rbtn_page_7    rbtn_page_8    rbtn_page_9    rbtn_page_10    nx_execute    custom_sender    custom_show_npc_friend     '                                                "   "   #   #   $   $   &   &   &   &   '   '   '   (   (   (   (   (   (   +   +   +   +   ,         form     &      gui    &         table_radio_page     /   3     	   E      \ Z    E@     \@         nx_is_valid    nx_destroy     	   0   0   0   0   0   1   1   1   3         form                5   8        F @ @À @         ParentForm    Close        6   7   7   8         btn           form               ;   <                     <         rbtn                 >   e     8   F @ @À     F@  A @Á ÀA Â @@@Â @@Â @@À @ À A  @Ã  @   @ À   A @ @ @Ã ÀAÀ @ @ A @Á @@ Â @@@Â @@Â @@  À  @ @ Á Á @        Checked     ParentForm         	   TabIndex    groupscrollbox_desc    Visible    groupscrollbox_bagua 
   btn_share    btn_delete    remove_group_karma       ð?   rbtn_page_1    show_gossip_info        @   add_group_karma    nx_execute 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     8   @   @   @   A   E   F   F   F   G   G   H   H   I   I   J   J   M   M   M   O   O   O   P   P   P   P   Q   Q   Q   Q   Q   Q   S   S   W   W   W   Y   Y   Y   Z   Z   [   [   ]   ]   ^   ^   a   a   a   d   d   d   d   e         rbtn     7      form    7           g   o        E   @  Á  Á  B   \  A   @A @AÀAIA  BÀAI   	      nx_execute 	   util_gui    util_get_form !   form_stage_main\form_group_karma    Add    Left    groupscrollbox_bagua       ð?   Top        i   i   i   i   i   i   i   j   j   j   l   l   l   l   m   m   m   m   o         form           form_group_karma               q   t      
      A@    ÁÀ   B   K A \@         nx_execute 	   util_gui    util_get_form !   form_stage_main\form_group_karma    Close     
   r   r   r   r   r   r   r   s   s   t         form_group_karma    	           w   Ì     µ   W @ @ @@     E  À  Á  A B   \  À   @      ÀÁ @BÀÁ B@ À Á  A A Á Á B E Â \  À B       Á  ËBEÜ  EÃ ÆD \    @  @ C Ã EÃ   \  EC FÇ \ ÀÇ    A C GÀ  Á `ÃEÄ Ä Æ ÁD \D G	À H	  ÅÄ ÈÜ   À  	ÄÈÅ FÈ   D      ÉÅ FÈ EÅ E	 \     	Ä ÆÈ Á	 Á	Ä	 Å   Ü   ÅÄ	   Ü WÀ	 ÅÄ   Ü     	@ ÅÄ 
 Ü     	ÆAÊ ÅÄ 
 FÈE
Ü    	Ä
 ÆÈ   	W@@@ ÅÄ   Ü     	 À   @ À  @ À D _çI@ÂKË \C FÃÁ KÃË\C FÃÁ IL  1           nx_execute 	   util_gui    util_get_form    form_stage_main\form_karma    nx_is_valid    groupscrollbox_desc    IsEditMode 
   DeleteAll    photo    name    degree    city 
   character 	   relation    fangle 	   nx_value 
   ItemQuery    game_client 	   GetScene 
   util_text 
   nx_string 
   QueryProp 	   ConfigID    add_groupbox_menu    util_split_string    ;    table    getn               ð?   ,       @   FindItemByConfigID    GetItemPropByConfigID    Photo    _1    nx_widestr    ui_karma_none        @   desc_matchingpack_    get_fangle_desc    add_npc_info_groupbox    Visable    Show    ResetChildrenYPos      µ   x   x   x   x   y   |   |   |   |   |   |   |   }   }   }   }   }   ~                                                                                                                                                                                     ¡   ¡   ¡   ¡   ¡   ¡   ¢   ¢   ¢   ¢   ¢   ¢   ¤   ¤   ¤   ¤   ¤   ¤   ¦   ¦   ¦   ¦   ¦   ¦   ¦   §   «   «   «   «   «   «   «   «   «   ®   ®   ®   ®   ®   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   ¯   °   °   °   °   °   °   °   ²   ²   ²   ²   ²   ²   ¶   ¹   ¹   ¹   ¹   ¹   ¹   ¹   ¹   ¼   ¼   ¼   ¼   ¼   ¾   ¾   ¿   ¿   ¿   ¿   ¿   ¿   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Ã   Ã       Æ   Ç   Ç   Ê   Ê   Ê   Ë   Ë   Ì         data     ´      form    ´      photo    ´      name    ´      degree    ´      city    ´   
   character    ´   	   relation    ´      fangle    ´   
   ItemQuery !   ´      game_client *   ´      game_scene ,   ´   	   npc_list =   ´      (for index) J   ¬      (for limit) J   ¬      (for step) J   ¬      i K   «   	   sub_list Q   «           Ï   [   	 	  E  \ @À    E  Â  \ ÁC ÆA ËÂÁ@ ÜBBBÁÂ  @  ÕÂÃÄÄÍÅ ÎBÅÌÂÂÆÆËÁAÃ ÜÃAC E  \ CÉÉBÇÉÇÉÂÇÉÄÉBH AÃ  ÉÁÃ KÃAÀ \CA	  À  U	C	CÉ	É	ÃÉ	ÃÉ	JE  \ 	CKÁÁÃ \ÃA CC
 Å   Ü ÃIIÊIÃÊIÇIËIË À IIÌIÍÁÄ ËÃA@ ÜCÁC  @  ÕÃÍÃÊÇËËÅ   Ü ÃÌÍËÁAÄ ÜÄADÄ E  \ DÉÉÎÉÃÊÉÇÉËÉË @ ÉÉÌÉÍÁÄ KÄAÀ \DAD  À  U	D	Î	ÄÊ	Ç	Ë	ËE  \ 	D	Ì	ÍKÁÁD \ÄA DIDBÄ Å   Ü Ä	IIÃIÄIÏIDÏÁ ÁÄ  @  Õ	ÄDÏÐJDDPÄP¡ËÁAÅ Ü E  \ E
ÉÉDÑÉDÏÉDÉQÉÄQÅE	EI
IIÇÅÅFÅE	E
R
ÅÁ 	EÅÁ	EE @ E  	À	  
\E KÁÁÅ \ÅA 
E Å   Ü ÅIIEÓIEÏIÓIÆIË§IK¨IÔ¨ À  I©ICªIÃªIÅU«IÖIÄ¬IÄ  Z   
   nx_number      jø@	   nx_value    gui    Create 	   GroupBox    groupscrollbox_desc    Add 	   AutoSize     Name    groupbox_info_ 
   nx_string 
   BackColor    0,0,0,0    NoFrame    Left       @   Top       ð?     @U@     A@   Width      °@   Height       T@   Label    label_line       (@     Q@     8@	   DrawMode    Expand 
   BackImage "   gui\common\form_line\line_bg2.png    label_photo       4@      $@      H@
   FitWindow    label_name       V@      >@      0@   Align    Center    Text    nx_widestr 
   ForeColor    255,76,61,44    Font    font_text_title1    label_degree       e@   label_city       o@   label_character      t@   groupbox_relation      pw@           ProgressBar    prog_karma       @   gui\mainform\NPC\bg_2.png    ProgressImage    gui\mainform\NPC\bg_1.png    label_karma      K@   gui\mainform\NPC\Level_4.png    Tile        @   nx_int    set_karma_groupbox    MultiTextBox    MultiTextBox_fangle_desc      P@      Y@   HAlign    VAlign 	   ViewRect    2,2,100,80 	   HtmlText    MouseInBarColor    SelectBarColor 
   TextColor    255,255,255,255    font_sns_event    TransParent     	  Ð   Ð   Ð   Ð   Ð   Ñ   Ó   Ó   Ó   Õ   Õ   Õ   Ö   Ö   Ö   Ö   ×   Ø   Ø   Ø   Ø   Ø   Ø   Ù   Ú   Û   Ü   Ü   Ü   Ü   Ý   Þ   à   à   à   á   á   á   â   â   â   â   â   â   ã   ä   å   æ   ç   è   è   è   è   ê   ê   ê   ë   ë   ë   ì   ì   ì   ì   ì   ì   í   î   ï   ð   ñ   ò   ò   ò   ò   ô   ô   ô   õ   õ   õ   ö   ö   ö   ö   ö   ö   ÷   ø   ù   ú   û   ü   ü   ü   ü   ý   þ                                                	  
                                                                                              !  "  $  $  $  %  %  %  &  '  '  '  '  '  '  (  )  *  +  -  -  -  .  .  .  .  .  .  /  0  1  2  3  4  6  6  6  7  7  7  7  7  7  8  9  :  ;  <  >  >  >  ?  A  A  A  A  A  C  C  C  D  D  D  F  F  F  G  G  G  G  G  I  I  I  J  J  J  K  K  K  K  K  K  L  M  N  O  P  Q  R  S  S  S  S  T  U  V  W  X  Y  [        form          index          photo          name          degree          city       
   character       	   relation          fangle_desc          gui 	     	   groupbox         label_line #        label_photo 8        label_name M        label_degree d        label_city {        label_character         groupbox_relation ©        label_fstip º        label_face É        karma_value æ        MultiTextBox_fangle_desc î             _  £    ¢   Å      Ü Ú@      Å     Ü Ú@      Á@    AÁ   ÁA  E   \ ZA      KAÁÁ \ Â  AA B EÂ  \   ÁA  EÂ FÄ \   AB àÁÅB A ÜÃ FCÃ EÃ  \ @ÀÃ @  EÃ Å\ @À Ã FCÅ À  ßùÁ AÂ  KFÀ Ã AC  \  À	 BEÂ \ 	@EÂ \ OÅÂ À  L	@@À    IÀE G \  ÆÂF  OG ÂGEÍÈC H@ EEC FÃÈÎÃÁ \I ÍCÃÆCI G DÌÇ EI É EÄII DÉ  B  I ÂDÉ FG MÊ  G JI É FÉ MD  É I   *      nx_is_valid        nx_execute    util_functions    get_ini    share\sns\msg_config.ini    FindSectionIndex    Karma            0    GetItemValueList 
   nx_string    r       ð?
   nx_number    table    getn    util_split_string    ,    nx_int        @      @     jA   KarmaValue    GetSectionItemValue 	   MaxValue    Minimum    Maximum    Value 
   BackImage    Width       $@      à?   math    abs    pow    Top    Left    Height       @      *@     ÀR@    ¢   `  `  `  `  `  a  c  c  c  c  c  d  h  j  j  j  j  j  k  k  k  k  k  l  o  o  o  p  p  q  s  s  s  s  s  s  t  t  t  t  t  t  t  t  t  u  u  u  u  v  v  v  v  v  v  v  v  v  v  v  v  v  v  v  v  w  w  w  w  t  {  |  |  |  }  }  ~  ~  ~  ~  ~  ~  ~                                                                                                                                                                 £        label_fstip     ¡      label_face     ¡      karma_value     ¡      photo    ¡      ini    ¡   
   sec_index    ¡      GroupMsgData $   ¡      (for index) ,   F      (for limit) ,   F      (for step) ,   F      i -   E   	   stepData 1   E      KarmaMaxValue G   ¡   
   index_max J   ¡      radio l   ¡      radius o   ¡      diff p   ¡      edge v   ¡      height }   ¡      top    ¡      left    ¡           ¥      ´   E   @  \ À Á  Æ A Ë@Á@ Ü@ÀA@BÀB@CÀC@DÀD@EËÀ A ÜAAAÁ E A \ AÉ ÉFÉÀFÉ GÉ@GÉÀG AA  É À  KAAÀ \A	H	ÁH	I	AI	I	ÁIEA
 
 ÁÁ
  \  	A	AK	ÁKKÀ Á \AA AILIALIIIAIIIIÁIA
 Å
  Ü   IIAKIÁKÀ  ËAA@ ÜAÁLMIAIIÁIÅA
 
 AB  Ü  ÁAKÁKËÀ A ÜBABÉMÉÁMÉIÉAIÉIÉÁIB
 E
  \   ÉÉAKÉÁKÀ  KBAÀ \B	BN	N	I	BI	I	ÂIEB
 
 ÁÂ  \  	B	BK	ÂKKÀ Á \BA BIOIBOIIIBIIIIÂIB
 Å
  Ü   IIBKIÂKÀ  ËBA@ ÜBÂOPIBIIÂIÅB
 
 AC  Ü  ÂBKÂK  B   	   nx_value    gui    Create 	   GroupBox    groupscrollbox_desc    Add 	   AutoSize     Name    groupbox_menu 
   BackColor    0,0,0,0    NoFrame    Left       @   Top            Width      °@   Height       D@   Label    label_line 
   nx_string    index       $@     @@     8@      @	   DrawMode    Expand 
   BackImage "   gui\common\form_line\line_bg2.png    groupbox_menu_1       .@      0@      K@   Align    Center    Text    nx_widestr 
   util_text    ui_karma_photo 
   ForeColor    255,76,61,44    Font    font_text_title1    groupbox_menu_2      ÀW@   ui_karma_name    groupbox_menu_3      àe@   ui_karma_degree    groupbox_menu_4      ào@   ui_karma_city    groupbox_menu_5      ðt@   ui_karma_xingge    groupbox_menu_6      @z@   ui_karma_relation    groupbox_menu_7      ¸@   ui_karma_news     ´   ¦  ¦  ¦  ¨  ¨  ¨  ©  ©  ©  ©  ª  «  ¬  ­  ®  ¯  °  ±  ³  ³  ³  ´  ´  ´  µ  µ  µ  µ  µ  µ  ¶  ·  ¸  ¹  º  »  »  »  »  ½  ½  ½  ¾  ¾  ¾  ¿  À  Á  Â  Ã  Ä  Å  Å  Å  Å  Å  Å  Æ  Ç  É  É  É  Ê  Ê  Ê  Ë  Ì  Í  Î  Ï  Ð  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ò  Ó  Õ  Õ  Õ  Ö  Ö  Ö  ×  Ø  Ù  Ú  Û  Ü  Ý  Ý  Ý  Ý  Ý  Ý  Þ  ß  á  á  á  â  â  â  ã  ä  å  æ  ç  è  é  é  é  é  é  é  ê  ë  í  í  í  î  î  î  ï  ð  ñ  ò  ó  ô  õ  õ  õ  õ  õ  õ  ö  ÷  ù  ù  ù  ú  ú  ú  û  ü  ý  þ  ÿ                                     	  
                              form     ³      gui    ³      groupbox_menu    ³      label_line    ³      label_1 *   ³      label_2 >   ³      label_3 R   ³      label_4 f   ³      label_5 z   ³      label_6    ³      label_7 ¢   ³             I    ¡      Á   A  @   @@ À  @A  @    A@ @ A  @   A@ À ÀA  @    B@ @  A  @   B@ À @A  @    C@ @ A  @   C@ À ÀA  @    D@ @  
A  @   D@ À @A  @    E@ @ A  @   E@ À ÀA  @    F@ @  A  @   F@ À @A  @    G  @  @  M A  @  @  @ À @È @ Á  @À ÀÈ @ Á 	 @À @É @ Á	  @À ÀÉ @ Á 
 @À @Ê @ Á
  @ ÀÇ   ÁÀ
  AKA  A Á À  Á Â @ AB Â À  U^   2       
   nx_number       ð?   Xiay        @   Yind       @   Haos       @   Tanc       @   Zhuany       @   Haose       @   Xius        @   Shij       "@   Shanl       $@   Shix       &@   Congh       (@   Nud       *@   Qinf       ,@   Lans    nx_int      jA             ã@   Zengw      ó@   Taoy      jø@   Fang      Lý@   Haoq      A   Xih    Yangm    math    random    News_ 
   nx_string    _    _00     ¡                                                                               !  !  !  !  !  "  "  #  #  #  #  #  $  $  %  %  %  %  %  &  &  '  '  '  '  '  (  (  )  )  )  )  )  *  *  +  +  +  +  +  ,  ,  -  -  -  -  -  .  .  /  /  /  /  /  0  0  1  1  1  1  1  2  5  5  5  5  6  6  6  6  7  7  7  7  8  8  9  9  9  9  :  :  ;  ;  ;  ;  <  <  =  =  =  =  >  >  ?  ?  ?  ?  @  @  A  A  A  A  B  F  F  F  F  G  G  G  G  G  G  G  G  G  G  G  G  G  G  I        characte_num            karma_value            characte_str           relation_str           index                L  \      F @ @À     F@ À@  A   @Á ÀA Â ÀA@Â ÀAÀÂ ÀA  À   D  @         Checked     ParentForm 	   TabIndex       ð?   mltbox_bagua_info    Visible    groupbox_check_box 	   btn_left    Enabled 
   btn_right    show_gossip_info        M  M  M  N  Q  R  R  R  T  T  U  U  W  W  X  X  Z  Z  Z  Z  Z  \        rbtn           form             gossip_page     `     !)  Å      Ü Ú@      Æ@@ ÉÀ@Æ A É@AÆA É@AÆÀA É@AÆ B ÉÀ@Æ@B ÉÀ@Á Á CD   A àÄ  ÆW@Ã Ä  ÆÉÁ@ßÀýÆC   @ A      ÁC E   \ ZA      FD   À A      AD Å    Ü ÚA      Å Â Ü   @ B      Å E   \ ZB      KBE\B KÅ\B KE\B KÅ\B J  ÂE B    Å C Ü  J  H EÃ BG\ LÂ    DÃ ÅÃ ÆÃ Ü ÍÃÍÂÏÇ LB   BGÁ @@ ÎG @@ À        Ä C@ ÌÀ  À  A  À ÂA à ËEGA  Á Ü @F  ÀÆÇ AF  ÅÆ ÆÃ Ü   U	F	F	É	É	FJ	ÆJ ÁF  	 ÁÆ  	 ÁF  	Ì  FÆÇÇ Á  @ 	 ÕÆFÎÍÌÆÆÆÍÍÆJÅ G Ü ÆÆ@FÅ   EG \  ÜF ÅÆ   A G ÜF ÅÆ   A Ç ÜF ËL@ ÜFËQ @ ÜFËÆÇAG Ü E  	\ GÉÉFÍÉÉÆÑÉÍÉFR¤Ç E B	\   É¥ÉFS¦ÌGB	LÂÓÇSKTÅÇ   Ü   	\G BEÇ FGÔ À\GßÄÞH  Å    EÅ FÃ
 \ À   ÜD 	©	 ª  U      nx_is_valid    groupscrollbox_desc    Visible     groupscrollbox_bagua 
   btn_share    btn_delete 	   btn_left 
   btn_right       ð?   table    getn     groupbox_check_box    groupbox_lbl_tips    groupbox_index    mltbox_bagua_info 	   nx_value    game_client 
   GetPlayer    Clear 
   DeleteAll    GetRecordRows    Gossip_Record    gui            nx_int       $@   QueryRecord    data_exist    Create    CheckButton    check_box_ 
   nx_string    Name    Left    Width       0@   Height 	   AutoSize    True 	   DrawMode    Title    CheckedImage '   gui\common\checkbutton\cbtn_2_down.png    NormalImage &   gui\common\checkbutton\cbtn_2_out.png    FocusImage %   gui\common\checkbutton\cbtn_2_on.png    Add    RadioButton 
   rbtn_tips    Top       @@     A@
   BackImage "   gui\special\karma\shengluehao.png    Transparent 	   TabIndex    nx_bind_script    nx_current        nx_callback    on_get_capture    on_rbtn_tips_get_capture    on_lost_capture    on_rbtn_tips_lost_capture    ToFront    Label    label_index       K@   Align    Center    Text    nx_widestr 
   ForeColor    255,76,61,44    TextManager    GetText    AddHtmlText    insert    set_bagua_control_position    SelectMltbox    SelectIndex     )  c  c  c  c  c  d  g  g  h  h  i  i  j  j  l  l  m  m  o  o  o  o  o  o  o  p  p  p  p  q  q  q  o  u  v  v  v  v  v  w  z  {  {  {  {  {  |                                                                                              ¡  ¤  ¤  ¤  ¦  §  §  ©  ©  ©  ©  ©  ¬  ¬  ¬  ®  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ¯  ±  ±  ´  ´  µ  ·  ·  ¸  ¸  ¹  ¹  º  º  ¼  À  À  À  Á  Á  Á  Á  Á  Ä  Ä  Å  É  Ê  Ë  Ì  Ì  Ì  Ì  Í  Í  Í  Í  Í  Ï  Ï  Ï  Ï  Ï  Ï  Ò  Ò  Ò  Ó  Ó  Ó  Ó  Ó  Ó  Ó  Ó  Ô  Õ  Ö  ×  Ø  Ù  Û  Û  Û  Û  Ü  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Þ  Þ  Þ  á  á  á  â  â  â  â  â  â  ã  ä  ä  ä  æ  ç  è  é  é  é  é  ê  ë  í  í  í  í  í  í  î  î  î  î  î  ï  ï  ï  ï  ï  ñ  ñ  ñ  ò  ò  ò  õ  õ  õ  ö  ö  ö  ö  ö  ö  ÷  ø  ø  ø  ù  ú  û  ü  ü  ü  ü  ü  ü  ý  ÿ  ÿ  ÿ                            
  
  
  
  
  Ì                                !      form     (     refresh     (     page     (     (for index)    !      (for limit)    !      (for step)    !      i        	   groupbox "   (     groupbox_lbl_tips )   (     groupbox_index 0   (     mltbox 7   (     game_client @   (     client_player H   (     table_remove W   (     rows Z   (     gui `   (     mltbox_count a   (     page_number h   (     start_index z   (     final_index {   (     control_top    (     control_number    (     show_number    (     (for index)         (for limit)         (for step)         i      	   bagua_id      
   check_box ¤        check_box_name ¬     
   rbtn_tips Ä        label_index ð        bagua_info           table_radio_page    table_check_box    bool_delete    table_selected    gossip_page    gossip_page_number       ,       F@ IÀFÁ@  À AA @ÁA @ À  @ À A A À    A@ Â        groupscrollbox_bagua    IsEditMode    groupbox_check_box       ð?	   btn_left    Visible 
   btn_right    set_control_check_mlt_position    set_page_control_position                         !  !  '  '  '  '  '  '  '  )  )  )  )  +  +  ,        form           rows           page_number           page           line_count        	   groupbox               /  A       À     A  A  Á  Â@AÂ  àÁÁ C @  ÕA EÃ  \ Z   NLC	Cßû  	         $@      @@              ð?   check_box_ 
   nx_string    Find    nx_is_valid    Top        1  1  2  5  6  :  :  :  :  ;  ;  ;  ;  ;  <  <  <  =  =  =  =  =  >  >  >  :  A     	   groupbox           rows           page_number           page           line_count           top       
   row_space          (for index)          (for limit)          (for step)          i 	         check_box_name          control               D  V   
,    @ @@@ ÆÀ@ Æ@ÀÎÀ À Å@ A A@ AÜ Á@ A@ÁAFÁ@ IÁ AA  ÁA `D  FWÂD  FIÃD  FID  FFBÀLBÀ_ÁûFAC @I        rbtn_page_1    Width       @	   btn_left        @   nx_int    groupbox_page       $@   Left       ð?    Visible 
   btn_right     ,   G  G  G  G  G  G  G  G  J  J  J  J  J  J  K  K  K  K  L  L  M  M  M  M  N  N  N  N  O  O  O  P  P  P  Q  Q  Q  Q  Q  M  U  U  U  V  	      form     +      page_number     +      control_width    +      left_btn_left    +      left_radio    +      (for index)    (      (for limit)    (      (for step)    (      i    '         table_radio_page     X  c      F @    @@ Ä    A@Æ WÀÀ Ä    A@Æ É@A        ParentForm       ð?            Checked        Z  \  \  ]  ]  _  _  _  _  _  _  `  `  `  `  `  c        btn           form          page             gossip_page    table_radio_page     e  p      D     @     F @   Ä   Ì@ÀÀ W@   Ä   Ì@ÀÀ  Á        ParentForm       ð?    Checked        g  g  g  g  h  k  m  m  m  m  m  m  n  n  n  n  n  p        btn           form             gossip_page    gossip_page_number    table_radio_page     r     8   F @ @  @Ä    À@    Æ Á A @  AÀAÁ Á@ÁÁ  `AA B À  UÂ ÅÂ   Ü Ú    BC_ü @CAÁ Á@ÁÁ  `AA B À  UÂ ÅÂ   Ü Ú    A_ü        ParentForm    table    getn       ð?   groupbox_check_box    check_data_all_selected            check_box_ 
   nx_string    Find    nx_is_valid    Checked      8   t  v  v  v  v  w  w  x  {  |  |  |  ~  ~                                                                                            btn     7      form    7      check_box_number    7   	   groupbox 	   7      all_selected    7      (for index)    !      (for limit)    !      (for step)    !      i           check_box_name           control           (for index) '   7      (for limit) '   7      (for step) '   7      i (   6      check_box_name -   6      control 0   6         table_check_box       ¤      F @ @  À  @   À@Ä     A    @ @    @ À   A @ @ ÀÁ @B  
      ParentForm    get_selected_check_box    table    getn       ð?   share_gossip_info    show_gossip_info    rbtn_page_1    Checked                                                          ¢  ¢  ¤        btn           form             table_selected    gossip_page     §  º      F @ @  À  @   À@Ä     A    @ @        @ À    A @ @ ÀÁ @B  
      ParentForm    get_selected_check_box    table    getn       ð?   delete_gossip_info    show_gossip_info    rbtn_page_1    Checked        ©  «  «  «  ­  ­  ­  ­  ­  ­  ®  ±  ±  ³  ³  µ  µ  µ  ¶  ¶  ¶  ¶  ¶  ¶  ¸  ¸  º        btn           form             table_selected    bool_delete    gossip_page     ½  ä    L      E@  FÀ    \ @@    À@  À  Á      AÁA     @þ ÁÀ  AA  Â   Å   Ü Ú@      ÅÀ  Ü ACFÁÃKÄÁA \	ADA Á A  ÁA Á E Á À  @    Á Á  Å   Ü ÚA      ËAFE Â \ Â  Å  Ü    ÜA             table    getn       ð?       @   |    nx_execute 	   util_gui    util_get_form '   form_stage_main\form_share_gossip_info    nx_is_valid 	   nx_value    gui 
   name_edit    Text    TextManager    GetText 	   ui_input 
   ShowModal    nx_wait_event     ×A   input_search_return    ok 
   nx_string    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_BAGUA    nx_widestr     L   ¿  À  À  À  À  Á  Á  Â  Â  Å  Å  Å  Å  Æ  Æ  Æ  Æ  Æ  Å  Ê  Ê  Ê  Ê  Ê  Ê  Ê  Ë  Ë  Ë  Ë  Ë  Ì  Ï  Ï  Ï  Ñ  Ñ  Ñ  Ñ  Ñ  Ñ  Ó  Ó  Õ  Õ  Õ  Õ  Õ  Ö  Ö  Ø  Ø  Ø  Ø  Ø  Ù  Ü  Ü  Ü  Ý  Ý  Ý  Ý  Ý  Þ  á  á  á  á  á  á  á  á  á  á  ä     	   bagua_id    K      selected_number    K      (for index)          (for limit)          (for step)          i          dialog    K      gui #   K      res 0   K      text 0   K      game_visual ;   K         table_selected     ç      O      A@    ÁÀ   B   E     \ Z@      E@  \ À Æ Â Ë@ÂE Á \ Ü     Å   Á  A   À Ü@Ë@C Ü@ Å Á @   Ü W@Ä 
       EÁ FÅ  \ @@   AE ÀB    BÁÂ   AþA Á  Å   Ü ÚA      ËAFE Â \  Á   ÜA         nx_execute 	   util_gui    util_get_form    form_common\form_confirm    nx_is_valid 	   nx_value    gui    nx_widestr    TextManager    GetText 
   nx_string    ui_gossip_del    show_common_text 
   ShowModal    nx_wait_event     ×A   confirm_return    ok        table    getn       ð?       @   |    game_visual    CustomSend    nx_int    CLIENT_CUSTOMMSG_BAGUA     O   é  é  é  é  é  é  é  ë  ë  ë  ë  ë  ì  ï  ï  ï  ò  ò  ò  ò  ò  ò  ò  ò  ó  ó  ó  ó  ó  ó  ö  ö  ù  ù  ù  ù  ù  ü  ü  þ  þ  ÿ                            	  	  	  	  	                                              dialog    N      gui    N      text    N      res %   N   	   bagua_id +   N      selected_number /   N      (for index) 6   =      (for limit) 6   =      (for step) 6   =      i 7   <      game_visual @   N         table_selected       -   .   J   H   F @ @  À   @        À@Ä    A    Á@ AA àÁ Â @  ÕÂ EB   \ Z  @FBBZ  E  FÂ  Ä AÆ\BßÀù          groupbox_check_box    nx_is_valid    table    getn       ð?           check_box_ 
   nx_string    Find    Checked    insert     .                                    $  $  $  $  %  %  %  %  %  &  &  &  '  '  '  '  '  '  '  '  (  (  (  (  (  (  (  $  ,  -  	      form     -   	   groupbox    -      check_box_number    -      (for index)    ,      (for limit)    ,      (for step)    ,      i    +      check_box_name    +      control    +         table_selected    table_check_box     0  B   "   E   F@À    \ À     À@ Á  À A  à@ÁA  @  ÕÂAE  \ Z   FBBÂ@ B  ^ ß ûÂ  Þ          table    getn       ð?   groupbox_check_box            check_box_ 
   nx_string    Find    nx_is_valid    Checked      "   2  2  2  2  3  3  4  7  9  9  9  9  :  :  :  :  :  ;  ;  ;  <  <  <  <  <  <  <  <  =  =  9  A  A  B  	      form     !      check_box_number    !   	   groupbox    !      (for index)          (for limit)          (for step)          i          check_box_name          control             table_check_box     E  S    
      @@À    @@      À  À    @Å   Ü  @   @ Â Þ ¡  Àü             table    getn       ð?   pairs 
   nx_string        G  G  G  G  G  G  H  H  K  K  K  K  M  M  M  M  M  M  M  M  N  N  K  O  R  R  S        table_data           data           (for generator)          (for state)          (for control)          i       
   gossip_id               U  g       F @ @  À   @      @ ÆÀ@ Á KAAÅ ÂA Ü \   À ÅA  AÂ  À  ÜA         ParentForm    nx_is_valid    AbsLeft    AbsTop    mltbox_bagua_info    GetHtmlItemText    nx_int 	   TabIndex    nx_widestr    nx_execute 
   tips_game    show_text_tip        W  X  X  X  X  X  Y  ]  ^  `  a  a  a  a  a  d  d  d  f  f  f  f  f  f  f  g        rbtn           form          x          y 	         mltbox 
      
   item_text       	   tip_text               i  k       E   @  Á  \@        nx_execute 
   tips_game 	   hide_tip        j  j  j  j  k        rbtn                m  ¥    :      Á@   Å    Ü Ú@      ËÀ@E  \ Ü    @ A      A @ A      ÁE   \ ZA      FÁAKÂÁA \  À A      IÁB  Á  Å    Ü Ú  À ËAC@  ÜA      	   nx_value    game_visual    nx_is_valid    GetSceneObj 
   nx_string    nx_find_custom    balloon_name    Control    Find    groupbox_karma    Visible 	   HeadGame    RefreshDataAndPos     :   o  o  o  p  p  p  p  p  q  t  t  t  t  t  u  u  u  u  u  v  y  y  y  y  y  y  z  }  ~  ~  ~  ~  ~                                   ¡  ¡  ¡  ¡  ¡  ¢  ¢  ¢  ¢  ¥        Repute     9   
   npc_ident     9      game_visual    9      visual_scene_obj    9      ball    9      groupbox_karma &   9   
   head_game 0   9       d                              
               ,   ,      3   /   8   5   <   ;   e   >   o   g   t   q   Ì   w   [  Ï   £  _    ¥  I    \  \  L                `  ,    A  /  V  V  D  c  c  c  X  p  p  p  p  e      r  ¤  ¤  ¤    º  º  º  º  §  ä  ä  ½      ç  -  -  -    B  B  0  S  E  g  U  k  i  ¥  m  ¥        table_check_box    c      table_selected    c      gossip_page 	   c      gossip_page_number 
   c      bool_delete    c      table_radio_page    c       