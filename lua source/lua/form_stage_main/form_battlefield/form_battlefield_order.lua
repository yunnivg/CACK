LuaQ  \   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_battlefield\form_battlefield_order.lua           '|      A@  @    A�  @ �  A  �@ �� � A �A �� � A� � �B � A� �� � D A� � �D � A� � �� 
  J��F �� � A �G �� � A �H �� � A	 �I bF��� ��G��FH���H��FI���I��FJ���J��FK���K��FL���L��FM���M��FN���N��    �   � �F  �F �  ǆ ��  �� � � �F �F � ǆ �� �� �          �      �  �      	  �	   
  �
     �  �     �� �F         �  ��F �    ǆ ��      �  �  ��� � � �F       �F � ǆ �� ��  � L      require 	   util_gui    util_functions 8   form_stage_main\form_battlefield\form_battlefield_order       0@   battlefield_order_array               �?       @      @      @      $@      @      @      @       @      "@   ui_guildwar_order_mingci    ui_guildwar_order_xingming 
   ui_menpai    ui_battle_getpoint    ui_battle_killenemy    ui_battle_maxkill    ui_battle_dead    ui_battle_grapbanner    ui_battle_retbanner    ui_battle_killboss2    ui_battle_getmoney    ui_battle_help    ui_battle_damage     (   gui\language\ChineseS\shengwang\wmp.png    school_shaolin '   gui\language\ChineseS\shengwang\sl.png    school_wudang '   gui\language\ChineseS\shengwang\wd.png    school_gaibang '   gui\language\ChineseS\shengwang\gb.png    school_tangmen '   gui\language\ChineseS\shengwang\tm.png    school_emei '   gui\language\ChineseS\shengwang\em.png    school_jinyiwei '   gui\language\ChineseS\shengwang\jy.png    school_jilegu '   gui\language\ChineseS\shengwang\jl.png    school_junzitang '   gui\language\ChineseS\shengwang\jz.png    force_jinzhen 0   gui\special\forceschool\shililogo\jinzhen02.png    force_taohua /   gui\special\forceschool\shililogo\taohua02.png    force_wanshou 0   gui\special\forceschool\shililogo\wanshou02.png    force_wugen .   gui\special\forceschool\shililogo\wugen02.png    force_xujia .   gui\special\forceschool\shililogo\xujia02.png    force_yihua .   gui\special\forceschool\shililogo\yihua02.png    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_rbtn_side1_checked_changed    on_rbtn_side2_checked_changed    show_effect    hide_effect    update_battlefield_order    refresh_battlefield_order_grid     create_battlefield_grid_control    InitGridCol    on_btn_exit_bf_click    sort_bf_info_array $   create_battlefield_eliminate_button    on_btn_eliminate_click        [   s    !   D   	@ �D   	@��	�@�D � 	@ �	���E� �� \� � � �� �@   ܀ �@    � � ˀBA� ܀��@    � � �  AC�� �܀  	� �	 ć �    
   self_side    other_side    have_score  	   play_way    Fixed 	   nx_value    game_client 
   GetPlayer    nx_is_valid 	   FindProp    Name    nx_widestr 
   QueryProp 
   self_name 	   show_win             !   ]   ]   ^   ^   `   a   a   c   e   e   e   g   g   h   h   h   h   h   i   l   l   l   l   l   m   p   p   p   p   p   q   r   s         self            client           client_role           player_name              SIDE_UNKNOWN    PLAY_WAY_NONE     v   �     .   E   �   \� Z@    � � E@  ��  \� � � � A �� �@A	������ ��A �� �@A	� ��  �   �@ �@B �     ܀ �@    � � ƀ� ���A �@��@C�@ ƀC � ć�@D ɀć�@D �@��� E ɀć�@ �   �       nx_is_valid 	   nx_value    gui    Left    Width        @   Top    Height    hide_effect    textgrid_battle_order    TextManager    GetText    ui_battle_killenemy 	   ClearRow    btn_exit_bf    Visible     ani_connect 	   PlayMode    lbl_connect       �?    .   y   y   y   y   y   z   }   }   }   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         self     -      gui 	   -      grid    -           �   �        E   �   \� Z@    � � E@  �   \@  �  �       nx_is_valid    nx_destroy        �   �   �   �   �   �   �   �   �   �   �         self     
           �   �        F @ �@� �@  �       Parent    Close        �   �   �   �         self           form               �   �     	   F @ Z    �F@@ ��  ��� � �@� �       Checked    Parent    refresh_battlefield_order_grid    textgrid_battle_order 
   self_side     	   �   �   �   �   �   �   �   �   �         self           form               �   �     	   F @ Z    �F@@ ��  ��� � �@� �       Checked    Parent    refresh_battlefield_order_grid    textgrid_battle_order    other_side     	   �   �   �   �   �   �   �   �   �         self           form               �   �     7   �   �   �� �@    � � �@@ W��   ��@  � � �� �� A W@�   ��@  � � �� ���A W��   ��@  � � �� �� B W@�   ��@  � � �� ���B W��   ��@  � � �� �� C W@�   ��@  � � �� ���C W��   ��@  � � �� �� D W@�   ��@  � � �� � �       nx_is_valid    lbl_win_text    Visible       �?   lbl_lose_text        @   lbl_succeed_fully       @   lbl_succeed_large       @   lbl_succeed_less       @   lbl_failed_fully       @   lbl_failed_large       @   lbl_failed_less        @    7   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     6   	   isWinner     6           �   �        E   �   \� Z@    � � F@@ I�@�F A I�@�F@A I�@�F�A I�@�F�A I�@�F B I�@�F@B I�@�F�B I�@� �       nx_is_valid    lbl_win_text    Visible     lbl_lose_text    lbl_succeed_fully    lbl_succeed_large    lbl_succeed_less    lbl_failed_fully    lbl_failed_large    lbl_failed_less        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form                �   �  �  �   A  ܀ ��� E�  � \� ZA    � � KA�A \��ZA    � �    ��E� �  �� \��� ��  �E� �  �  \��� �E�  � \� ZA    � � EA F���� \� ��  � � �  � �� ��    ܁ �A    � � �A� �� F�� �� @� ��B C AC ����� � @ � ���D��D�߂��EɂŊ��EɂŊ���     �����ł   AC ܂��B    � � �BFW��  � � ��  CCAC �B9��G���   @ �DG����  �@7�� E� �D�� ��	��	�DC	\� DK�G�   A� �� \D KH� E E� �E���� \ \D  KH� � E	 ������ \ \D  E� � �D	 \��ZD  @�E� ��IE ��\�  �@��FDI�� �D��Ą �� ����E	 ������ \� �@��    �D���IW��� �D ��I�� 
�L�FD� ��@	@ ��@C�@�� @	@ ���C� ���@	@ ���C���� @	@ �� D�����@	@ ���B�@�� @	@ ��@J� ���@	@ ���J�� �� @	  ���J�KH�  E	 ������ \ \D  KH� E E	 ����� \ \D  KH� � E	 ������ \ \D  KH� � E	 �E���� \ \D  KH�  E	 ������ \ \D  KH� E E	 ������ \ \D  KH� � E� ������ \ \D  KH�  E� �E���� \ \D      �KH� � E	 ������ \ \D  KH�  E	 �E���� \ \D  KH� � E	 ������ \ \D  KH�  E	 �E���� \ \D  ��KH� � E� ������ \ \D  KH�  E	 ����� \ \D  ���  C ܂ �ID�W@�� F�IW@� ��F�I@@��I��� �E	EF�KC��� \��	C��E	¡E	�E��E	�Ŋ@	��F�IW@� � F�I@@��I�� �E	�E	EF�KC��C \��	C���EF�KC��� \��	C��E	¡���� ���� �E	�Ŋ�E	�Ŋ@ �� @ C � RC CR	�ŊCR	�F��R	�Ŋ�A  @�S	C @ �JC�� F�S��IC� � P   	   nx_value    game_client 
   GetPlayer    nx_is_valid 	   FindProp    Name    util_get_form    have_score    table    getn       @   common_array       �?       @      @      @      H@
   nx_string    RemoveArray    rbtn_side1    Visible     rbtn_side2 	   play_way    time_stamp    nx_find_custom               (@      .@	   AddArray      ��@	   AddChild    b_order_player_name    nx_widestr    b_order_side    nx_int 
   self_name 
   QueryProp 
   self_side 	   show_win       @      @       @   b_order_kill_count    b_order_dead_count    b_order_boss_count    b_order_queue_kill    b_order_grap_banner    b_order_ret_banner    b_order_school       "@   b_order_help_kill       $@   b_order_score       &@   b_order_money       *@   b_order_batdamage       ,@   b_order_eliminated    gui    other_side    Text    TextManager    GetText    ui_battle_ranking    Checked    Enable    ui_battle_friend    ui_battle_enemy    InitGridCol    Show    ani_connect 	   PlayMode    lbl_connect    btn_exit_bf    show_effect    refresh_battlefield_order_grid    textgrid_battle_order     �  �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                         	  	  	  	  
  
                                                                    !  #  #  $  (  (  (  (  (  (  )  ,  ,  ,  .  1  1  1  1  1  4  4  5  5  8  8  ;  ;  <  ?  ?  ?  ?  ?  ?  ?  ?  ?  A  A  A  A  A  A  C  C  C  C  C  C  C  C  D  D  D  D  D  D  D  D  F  F  F  F  F  F  G  G  G  G  G  H  L  L  L  L  L  L  L  M  M  M  M  M  N  N  O  O  O  O  O  O  O  O  P  P  Q  Q  Q  R  R  S  S  S  T  T  V  V  V  X  X  Y  Y  Y  [  [  \  \  \  ^  ^  _  _  _  a  a  b  b  b  d  d  e  e  e  g  m  m  m  m  m  m  m  m  n  n  n  n  n  n  n  n  o  o  o  o  o  o  o  o  p  p  p  p  p  p  p  p  q  q  q  q  q  q  q  q  r  r  r  r  r  r  r  r  s  s  s  s  s  s  s  s  t  t  t  t  t  t  t  t  v  v  w  w  w  w  w  w  w  w  x  x  x  x  x  x  x  x  z  z  z  z  z  z  z  z  {  {  {  {  {  {  {  {  {  ~  ~  ~  ~  ~  ~  ~  ~                  1  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        have_score     �     arg     �     form     �     client    �     client_role    �     param_count )   �     common_array /   �     timeS 6   �     allMsgCount 7   �     thisMsg 8   �  	   play_way 9   �     (for index) >   H      (for limit) >   H      (for step) >   H      i ?   G      array_name D   G      (for index) _   G     (for limit) _   G     (for step) _   G     i `   F  
   msg_index b   F     array_name r   F     player_name �   �      result �   �      gui J  �        FORM_BATTLEFIELD_ORDER    BATTLEFIELD_ORDER_ARRAY_INFO    EVERYTIME_MSG_COUNT    SIDE_WHITE    SIDE_BLACK    BF_RESULT_SUCCEED    BF_RESULT_FAILED    BF_RESULT_SUCCEED_FULLY    BF_RESULT_SUCCEED_LARGE    BF_RESULT_SUCCEED_LESS    BF_RESULT_FAILED_FULLY    BF_RESULT_FAILED_LARGE    BF_RESULT_FAILED_LESS    SIDE_UNKNOWN    SIDE_NORMAL 
   SIDE_BOSS     �  #   �  �   �   �� �@    � � �@@ �     ܀ �@    � � ŀ  �  ܀   @�� A    � � �  A � J  H  EA ��A\A K�A \A KB \A AA �� �A � CD  � AB �q���   D  F���� W�� � �� ��  ��C�� @�� A� �� W��   ��  �D��   �� �  �j��CD � ����C�E� ��\� �� ܃ �AD  @�C  ��EW� �DE�E�� ��� E��� FDF MD��D  ��F � ��	  E�D��F � �  @� D  �F � �D  �D�D @ � �� E��� ���� ��  D  �A  �3��F � �  KE�Ņ  �܅ F \   D  �F � ��  KE�Ņ  �܅ � \   D  �F � �	  KE�Ņ  �܅ F	 \   D  �F � ��	  KE�Ņ  �܅ �	 \   D  � FDW@� � FD@@��F � �
  KE�Ņ  �܅ F
 \   D  �JD�@ ��F � ��
  KE�Ņ  �܅  \   D  �F � �D  KE�Ņ  �܅ � \   D  �F � ��  KE�Ņ  �܅  \   D  �F � �D  KE�Ņ  �܅ � \   D  � @ � �  �KE�Ņ  �܅ F \ D  �9��F � ��
  KE�Ņ  �܅  \   D  �F � �D  KE�Ņ  �܅ � \   D  � @ � ��  �KE�Ņ  �܅ F \ D  �0��F � �
  KE�Ņ  �܅ � \   D  �F � ��
  KE�Ņ  �܅  \   D  �F � �D  KE�Ņ  �܅ � \   D  @'��F � �  KE�Ņ  �܅ � \   D  �F � ��  KE�Ņ  �܅ F	 \   D  �F � �	  KE�Ņ  �܅ �	 \   D  � FDW@� � FD@@��F � ��	  KE�Ņ  �܅ F
 \   D  �JD�@ ��F � �
  KE�Ņ  �܅  \   D  �F � ��
  KE�Ņ  �܅ � \   D  �F � �D  KE�Ņ  �܅  \   D  � @ � ��  �KE�Ņ  �܅ F \ D   ��F � �
  KE�Ņ  �܅  \   D  � @ � ��
  �KE�Ņ  �܅ F \ D  ���F � ��	  KE�Ņ  �܅ � \   D  �F � �
  KE�Ņ  �܅  \   D  LA��A� � 7      nx_is_valid    ParentForm 	   nx_value    common_array    gui    sort_bf_info_array    have_score 	   ClearRow    ClearSelect       �?   255,255,0,0    table    getn 
   FindChild 
   nx_string    b_order_side 
   self_side 
   InsertRow       �   b_order_player_name 
   self_name    TextManager    GetText    ui_battle_name         	   ColCount    SetGridForeColor    SetGridText    nx_widestr     create_battlefield_grid_control        @   b_order_school       @   b_order_score       @   b_order_kill_count       @   b_order_batdamage       @   b_order_queue_kill       @   b_order_help_kill 	   play_way        @   b_order_grap_banner       "@   b_order_ret_banner       $@   b_order_dead_count       &@   b_order_money $   create_battlefield_eliminate_button       (@   b_order_eliminated    b_order_boss_count     �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                                                                                                                    	                                                                                                                                                                                                                                                                                                                                 �  #        grid     �     battle_side     �     form    �     common_array    �     gui    �     rank #   �     HIGH_LIGHT_COLOR $   �     (for index) *   �     (for limit) *   �     (for step) *   �     i +   �     is_add_row ,   �     is_show_name -   �     array_name /   �     row G   �     player_name M   �     (for index) a   h      (for limit) a   h      (for step) a   h      i b   g         grid_order_data    SIDE_WHITE    SIDE_BLACK    PLAY_WAY_DUOQI     &  @   ;     AA  � E�  � \� ZA  @ �A�  ^ KA�A \��I�A�IAB��� �  � ܁ B E � \� �AI���A� ������@ �A��AD��AD������AE���  @� � AB � � �� Ձ�����Ƌ������A��AB��  ��������G �A�@� � ���A� �    	   nx_value    gui    nx_is_valid            Create 	   GroupBox 
   BackColor    0,0,0,0    NoFrame    Name    groupbox_battlefield_school_ 
   nx_string    _ 
   ImageGrid    Add    Width       >@   Height    Top    Left       $@   imagegrid_rank_reward_item_ 	   DrawMode 
   FitWindow    SelectColor    MouseInColor 
   BackImage    textgrid_battle_order    SetGridControl     ;   '  '  '  (  (  (  (  (  )  )  ,  ,  ,  -  .  /  /  /  /  /  /  /  /  /  /  1  1  1  2  2  2  3  4  5  6  7  7  7  7  7  7  7  7  7  7  8  9  :  ;  <  <  <  >  >  >  >  >  >  @        form     :      row     :      col     :      order_school     :      gui    :   	   groupbox    :   
   grid_item    :         battlefield_school_pic     C  �   g  E   �@  \� ��  � � �� �@    � � ��@ ŀ    ܀ �@    � � � A �   @��   AA W �� �� � AA  ���ƀA   �@ ��  ��@���� ��   AA W �� �� � AA  ���ƀA   �@ ��@� ���  �� Ã�@ �A�CA� �� ���C@ � �A ߀���CA� �A �@ � A �   @��   AA W ���� � AA  �  �@���CA� �� �@ ��CA �� �@  ��   AA W � �� � AA  �  �����CAA �� �@ ��CA� �� �@ ˀEAA ��� �F��C���@  ˀEA� ��� �F�BF���@  ˀEAA ��� �F��F���@  � A �   ��ˀEA� ��� �F�BE���@  ˀEAA ��� �F��D���@  ˀEA� ��� �F�B���@  ˀEA ��� �F�E���@  �   AA W �� �� � AA  �@�ˀEA� ��� �F�G���@  ƀA   � �ˀEA ��� �F�C���@  ˀEA� ��� �F��B���@  ˀEA� ��� �F��F���@  ˀEAA ��� �F�BB���@  �!�ˀEA ��� �F��F���@  ˀEA� ��� �F�BB���@  ��ˀEA� ��� �F��B���@  ˀEA ��� �F��F���@  ˀEA� ��� �F�BB���@  @�ˀEA� ��� �F��D���@  ˀEAA ��� �F�B���@  ˀEA� ��� �F�E���@  �   AA W �� �� � AA  �@�ˀEA ��� �F�G���@  ƀA   � �ˀEA� ��� �F�C���@  ˀEA ��� �F��B���@  ˀEA� ��� �F��F���@   �ˀEA� ��� �F��F���@  ��ˀEA ��� �F��B���@  ˀEA� ��� �F��F���@  �@G�@ ˀG�@  �    	   nx_value    gui    nx_is_valid    textgrid_battle_order    have_score 
   self_side 	   play_way 	   ColCount       *@      &@      $@      "@       @              �?   SetColWidth       N@      T@      @     �Q@      @      @   SetColTitle    TextManager    GetText        @      @      @      (@	   ClearRow    ClearSelect     g  D  D  D  E  E  E  E  E  F  I  J  J  J  J  J  K  O  O  O  P  P  P  P  P  P  P  P  Q  Q  Q  Q  T  T  X  Y  ]  ^  `  `  `  `  `  `  `  `  a  a  a  a  d  d  h  i  m  r  r  r  r  r  s  s  s  s  r  u  u  u  u  w  w  w  x  x  x  x  x  x  x  x  x  {  {  {  {  |  |  |  |  }                    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     f     gui    f     grid 
   f     (for index) :   @      (for limit) :   @      (for step) :   @      i ;   ?         SIDE_WHITE    SIDE_BLACK    PLAY_WAY_DUOQI    bf_order_head_name     �  �       A   �@  ��  �  @� �@  �           @   nx_execute    custom_sender    custom_battlefield        �  �  �  �  �  �  �        btn           CLIENT_SUBMSG_REQUEST_LEAVE               �  !     E   �@  \� ��  � � �� �@    � �     $���  �  �  ��"��  �A  �܁ ��ˁ� @ ܁��    �� �A�� ܁ ���@�� Ɓ�� @ �A� ��  �  E FB��� \� ��   ��� �C �� �Â�� � � K�� �C   ܃  \� @ �� ��B��  �@ �C �� �� � ������ D D� FĂ� AD �� ��� ED � \� �D ܃ � � �BD� ��� D ��  ����� ��� �D �� �Ă	�� �� � K�� �D   ܄ � \� @ �� ��B	��  �@ �D �� �� � ������ E D� Fł
� A� �� ��� EE � \� �� ܄ ��	�� �B
D� ��� E ��   �B��A   � �BD� � B����@���  �  �  � ��  �A  �܁ ��ˁ� @ ܁��  ��� �A�� ܁ ���@�� Ɓ�� @ �A����  �  E FB��� \� ��   ���� �C �� �Â�� �C � K�� �C   ܃ D \� @ �� ��B��  �@ �C ��  ��� � ���� D D� FĂ� A� �� ��� ED � \� �� ܃ � � �BD� ��� D �� �� ������� �D �� �Ă	�� �� � K�� �D   ܄ � \�  ���� ��B	��  �@ �D ��   ����A   � �BD� � B��@� �    	   nx_value    common_array    nx_is_valid       �?      H@
   nx_string 
   FindArray            table    getn    insert 
   FindChild    b_order_score    b_order_kill_count    b_order_queue_kill    b_order_dead_count       �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                                                       	  	  
  
  
  
  
  
                                                          �                �  !  $   	   is_score          common_array         (for index)    �      (for limit)    �      (for step)    �      i    �      array_name    �      insert_done &   �      (for index) ,   �      (for limit) ,   �      (for step) ,   �      j -   �      score_in_table 4   �      score_new_array :   �      kill_in_table N   �      kill_new_array T   �      queue_in_table h   �      queue_new_array n   �      dead_in_table �   �      dead_new_array �   �      (for index) �        (for limit) �        (for step) �        i �        array_name �        insert_done �        (for index) �   
     (for limit) �   
     (for step) �   
     j �   	     kill_in_table �   	     kill_new_array �   	     queue_in_table �   	     queue_new_array �   	     dead_in_table �   	     dead_new_array �   	        BATTLEFIELD_ORDER_ARRAY_INFO    grid_order_data     $  D    E   W �  � � EA  ��  \� ��  ���� �A    � � ��B �����    ܁ �A    � � ��  @� � �����Ɓ����A ܁�������ÆƁ����A ܁������  �܁ ������D��AE���E��AF���F��   EB \� �A  Ł   A� � �A �AH ˁ�@� � �A �AH ���@� � � �A� � $         �?	   nx_value    gui    nx_is_valid    Create    Button    Name    btn_eliminate_ 
   nx_string    Text    TextManager    GetText    tips_battlefield_KickOut 
   ForeColor    255,255,255,255 	   HintText    tips_battlefield_KickOutDec    DataSource 	   DrawMode 
   FitWindow    NormalImage &   gui\common\button\btn_normal1_out.png    FocusImage %   gui\common\button\btn_normal1_on.png 
   PushImage '   gui\common\button\btn_normal1_down.png    Visible    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_eliminate_click    textgrid_battle_order    ClearGridControl    SetGridControl     E   %  %  &  )  )  )  +  +  +  +  +  ,  /  /  /  1  1  1  1  1  2  5  5  5  5  5  5  6  6  6  6  6  7  8  8  8  8  8  9  9  9  9  :  ;  <  =  >  ?  ?  ?  ?  ?  @  @  @  @  @  B  B  B  B  B  C  C  C  C  C  C  D        form     D      row     D      col     D      player_name     D      be_eliminated     D      gui    D      button    D           G  Q    	   E   �@@ \� W@ �@ �@��  � � �  �@ � A� � �  � � �@   � 	   
   nx_string    DataSource            "@   nx_execute    custom_sender    custom_battlefield    nx_widestr        H  H  H  J  J  J  J  K  N  P  P  P  P  P  P  P  P  Q        btn           name          CLIENT_SUBMSG_REQUEST_COMPLAIN 	          |                                                            !   "   #   $   %   &   '   (   )   *   +   0   3   5   6   7   8   9   :   ;   <   =   >   ?   @   B   B   E   G   H   I   J   K   L   M   N   O   Q   R   S   T   U   V   s   s   s   [   �   v   �   �   �   �   �   �   �   �   �   �   �   �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   #  #  #  #  #  �  @  @  &  �  �  �  �  �  C  �  �  !  !  !  �  D  $  Q  G  Q        FORM_BATTLEFIELD_ORDER    {      EVERYTIME_MSG_COUNT    {      BATTLEFIELD_ORDER_ARRAY_INFO 	   {      SIDE_UNKNOWN 
   {      SIDE_NORMAL    {   
   SIDE_BOSS    {      SIDE_WHITE    {      SIDE_BLACK    {      PLAY_WAY_NONE    {      PLAY_WAY_SHADI    {      PLAY_WAY_ZHANLING    {      PLAY_WAY_DUOQI    {      PLAY_WAY_DEADTH    {      BF_RESULT_UNKNOWN    {      BF_RESULT_DOGFALL    {      BF_RESULT_SUCCEED    {      BF_RESULT_FAILED    {      BF_RESULT_ESCAPE    {      BF_RESULT_SUCCEED_FULLY    {      BF_RESULT_SUCCEED_LARGE    {      BF_RESULT_SUCCEED_LESS    {      BF_RESULT_FAILED_FULLY    {      BF_RESULT_FAILED_LARGE    {      BF_RESULT_FAILED_LESS    {      grid_order_data    {      bf_order_head_name .   {      battlefield_school_pic >   {       