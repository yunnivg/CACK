LuaQ  W   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_world_war\form_world_war_hero.lua                 A@  @ �  d   G�  d@  G  d�  G@ d�  G� d  G� d@ G  d�     G@ d� G� d  G�  �       require 	   util_gui       @   main_form_init    on_main_form_open    on_main_form_close    Load    update_hero_info    update_info_list    Grid_Refresh    on_btn_1_click    on_btn_2_click 	               	   	@@�	�@�E@ �� ��  \� 	@ � � 	      Fixed    Current_Page       �?
   Info_List    nx_call 	   util_gui    get_arraylist    hero:info_list     	                                    form                   (     	K   E   �@  \� ��  � � �� �   ����@ � AA E� ��� �BB ��\  �@  ��@ � A� E� ��� �B� ��\  �@  ��@ � A E� ��� �BB ��\  �@  ��@ � A� E� ��� �B� ��\  �@  ��@ � A E� ��� �BB ��\  �@  ��@ � A� E� ��� �B� ��\  �@  �  �   �@ �@ �   �@  �    	   nx_value    gui    nx_is_valid    textgrid_1    SetColTitle            nx_widestr    TextManager    GetText    ui_lxc_touxiang       �?   ui_lxc_heroname        @   ui_lxc_herotype       @   ui_lxc_herostate       @   ui_lxc_herodesc       @   ui_lxc_herojihuo    Load    Grid_Refresh     K                                                                                                                                                             !   !   !   !   !   !   !   !   !   !   "   "   "   "   "   "   "   "   "   "   %   %   %   '   '   '   (         form     J      gui    J           +   -        E   �   \@  �       nx_destroy        ,   ,   ,   -         form                0   O     O   E   �@  ��  �  \� � � �� �@A ˀ��@ ��  ܀ A�� K�B�� \��� �  ����B� � @� ��  ������� @ �C �� ܂��� 
�CA �D�� ��KC� �  A� \��	C�KC� � � A� \��	C�KC� � D A� \��	C�KC� � � A� \��	C�KC� � D A� \��	C�KC� � � A� \��	C�	����� � !      nx_execute    util_functions    get_ini     share\WorldWar\WorldWarHero.ini    GetSectionCount 
   Info_List    ClearChild 	   nx_value    game_client 
   GetPlayer 
   QueryProp    WorldWarForce       �?   FindSectionIndex 
   nx_string            ReadInteger    Belone    CreateChild        ID    ReadString    PHOTO    Photo    TYPE    Type    STATE    State    LEVEL    Level    PLACE    Place    BELONE     O   1   1   1   1   1   3   3   5   5   5   8   8   8   9   9   :   :   :   <   <   <   <   =   =   =   =   =   ?   ?   @   @   @   @   @   B   B   C   C   C   C   E   E   E   E   E   E   F   F   F   F   F   F   G   G   G   G   G   G   H   H   H   H   H   H   I   I   I   I   I   I   J   J   J   J   J   J   K   <   O         form     N      ini    N      count    N      game_client    N      client_player    N      world_war_force    N      (for index)    N      (for limit)    N      (for step)    N      i    M      index    M      belone "   M      child (   M           R   g     6   E   �@  �   \����  � � �� �   �
���  �  AA ܀ � ����� � �  ܀ �@�A @��A  ��  E ��\� �B ��E �BA\� � ƂB�� � �B܂  FC� EC �� ��  @ ��\C A�� @� A  �       util_get_form 3   form_stage_main\form_world_war\form_world_war_hero    nx_is_valid    util_split_string 
   nx_string       �?   ;    table    getn    ,        @      @      @   update_info_list    Grid_Refresh     6   S   S   S   S   U   U   U   U   U   V   V   V   V   V   V   X   X   X   X   X   Z   Z   Z   Z   [   [   [   [   [   [   ]   ]   ]   ^   ^   ^   _   _   _   `   `   `   b   b   b   b   b   b   b   Z   e   e   e   g         arg     5      form    5      tbl_hero_info    5      count    5      (for index)    2      (for limit)    2      (for step)    2      i    1   
   hero_info    1      hero_id !   1   
   hero_type $   1      hero_place '   1      hero_state *   1           i   u     "   A  �A@ ��@�� �  `��FB@ K���@\��F�@� �FB@ K���@\��I���FB@ K���@\��I� �FB@ K���@\��I��A  ^ _��A ^  � 	         �?
   Info_List    GetChildCount    GetChildByIndex    ID    TYPE    STATE    PLACE             "   j   j   j   j   j   j   k   k   k   k   k   k   k   l   l   l   l   l   m   m   m   m   m   n   n   n   n   n   p   p   j   t   t   u   	      form     !      hero_id     !   
   hero_type     !      hero_state     !      hero_place     !      (for index)          (for limit)          (for step)          i               x   �    �  F @ K@� \� @ �@t��   ��� � �����@ �@   � ܀ ̀��� �@���@ �@   � ܀ �� ��@ ��@ ����� �    ܀ ����	�����@ � A� � � ��  �	����  A ܀ � @��   �i��C DA � D  ��  �g�  FBB M��B�@ �e�  FBB M��B��AF�C KB��� \����C ��D �A� ���CE@ �E� ���E���B  � �B �� �@ ˂�@ ܂�Ƃ������C ��D �A� �� ���C�A ���  �B  ��� �� �� �@ ˂�@ ܂�Ƃ������C ��D �A� �� ���C�AD ���  �B   �� �� �� �@ ˂�@ ܂�Ƃ������C ��D �A� �� ���C�A� ���  �B  ��� � �� �@ ˂�@ ܂�Ƃ������C ��D �A� �� ���C�AD ���  �B   �� �� �� �@ ˂�@ ܂�Ƃ������C ��D �A� �� ���C�A� ���  �B  ����C ��D �A� �� ���C�A	 ���  �B  � �B �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�A�	 ���  �B   �� �� �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�A
 ���  �B  ��� �� �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�AD
 ���  �B   �� � �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�A�
 ���  �B  ��� �� �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�A�
 ���  �B   �� � �� �@ ˂�@ ܂��B������C ��D �A�	 �� ���C�AD ���  �B  ����C ��D �A�	 �� ���C�A	 ���  �B  ��C ��D �A� �� ���C�F@ K��� \��F�����  �B  � �B �� �@ ˂�@ ܂��������C ��D �AC �� ���C�A� ���  �B  @�� �� �� �@ ˂�@ ܂��������C ��D �AC �� ���C�A� ���  �B  ����C �M��A�  �� ł   ܂ �B  @��B�A� ܂����  M��� ������Μ�ϝ��Ϟ�П��Р��С��N���΢��N���Σ��N���Ҥ��ϥ�BS��BS��ԧł   ܂ �   ��BT�B ˂TA�  � �@ ˃�@ ܃������ � � A� �B���C �B�M����  � �B��� � V   
   Info_List    GetChildCount            ipt_1 	   MaxDigit    nx_int       �?   Text 
   nx_number    Current_Page    nx_widestr    1 	   nx_value    gui    nx_is_valid    textgrid_1 	   ClearRow 
   InsertRow       �   SetGridText    TextManager    GetText    GetChildByIndex    ID 
   nx_string    0    TYPE        @   ui_lxc_hero_gongneng    ui_lxc_hero_zhandou    2    ui_lxc_renzhi    3    ui_lxc_guifu_gongneng    4    ui_lxc_guifu_zhandou    ui_lxc_weizhi    STATE       @   ui_lxc_jiankang    ui_lxc_neishang    ui_lxc_zhongdu    ui_lxc_jibin    ui_lxc_qitafeijiankang    5    ui_lxc_xuanyun       @   LEVEL    PLACE       @   ui_lxc_weijihuo    ui_lxc_jihuo    GetGridControl    Create 
   ImageGrid    Name    Grid_Photo_ 
   BackColor    0,0,0,0 
   LineColor    255,197,184,159 	   AutoSize    DrawGridBack $   gui\common\imagegrid\icon_item2.png    GridBackOffsetX        �   GridBackOffsetY    SelectColor    MouseInColor    CoverColor 
   LockColor 
   CoolColor    ShowMouseDownState     FitGrid 
   GridWidth       D@   GridHeight 	   GridsPos    10,8    Clear    AddItem    PHOTO        SetGridControl     �  y   y   y   {   {   |   |   |   |   }   }   }   }   }   }   }   }                     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     �     count    �     current_page    �     gui +   �     (for index) 6   �     (for limit) 6   �     (for step) 6   �     i 7   �     array D   �     row H   �     Grid_Photo �  �        SINGLE_PAGE_MAX     �   �        F @ F@� @ � �F @ F�� �@ � @ �@�̀��� I� ���F @ F�� �@ � @ ���ƀ��� I� �E� � @ \@  �       ParentForm    Current_Page       �?   ipt_1    Text    nx_widestr 	   MaxDigit    Grid_Refresh        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         btn                �   �        F @ F@� � @ ��@��@��  �F @ F�� �@ � @ �@�̀��� I� �@�F @ F�� �@ �� �� I� �E  � @ \@  � 	      ParentForm    Current_Page    ipt_1 	   MaxDigit    Text    nx_widestr       �?   1    Grid_Refresh        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         btn               
   
   
            (      -   +   O   0   g   R   u   i   �   �   x   �   �   �   �   �         SINGLE_PAGE_MAX           