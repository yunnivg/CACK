LuaQ  P   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_npc_info.lua                 A@  @    A�  @ $   �  $@    $�  @ $�  � $  � $@   $� @ $� � $  � $@   $� @  �       require 	   util_gui .   form_stage_main\form_relation\relation_define    main_form_init    main_form_open    show_npc_info    get_npc_info    get_scene_id    get_scene_id_by_relation    on_main_form_close    cancel_btn_click    on_btn_copyname_click    on_btn_guanzhu_click    on_btn_friend_click                   	@@�	�@�A  ^   �       Fixed     npc_id           �?          	   
   
            self                           E   �@  \� ��� ��@ �� � A	� ���� ƀA �� � A	����� �   �    	   nx_value    gui    Left    Width        @   Top    Height       �?                                                             self           gui                  �    �   �   �   �� �   A  ܀ �   � � ��  ��   AA �� �  �� ŀ   ܀ �@    � � � ���     ��FBBI� �F�BI�FCIB��F�CI��F�CI��F� @�� �F�DI�@�A� �  �� �� U����D� C E  ��\   ܂  ���E�  �� ��    \� @�  �A �BFł  � A� ���  ܂������  �� � @  ��  F@��G EC �  �C � \  �  �� � D@��G EC �  �� � \  �  �� ��G@��G EC �  � � \  �  �� ��G EC �  �C � \  �  ��ƂH�ɑ�BI�ɑƂI�ɑł  �	 A
 �  �  � ܂  �  AC
 ��
 �     � �  F�HI˕F�HICˆF�H� �C � � ��  I��F�HII�F�HIC̑�  ��FCII˕FCII�̆FCI� �C � � ��  I��FCIII�FCIIC̑�B   �  ��FCII˕FCII͆FCI� �C D � ��  I��FCIII�FCIIC̑�   �  ��F�II˕F�II͆F�I� �C D � ��  I��F�III�F�IIC̑K�M\C  � 7   
   nx_string        nx_execute 	   util_gui    util_get_form ,   form_stage_main\form_relation\form_npc_info    nx_is_valid    npc_id    get_npc_info 	   lbl_name    Text    lbl_shenfen 
   lbl_photo 
   BackImage 
   lbl_shane 
   lbl_group       �? 
   lbl_scene 
   ui_scene_    nx_widestr 
   util_text C   form_stage_main\form_relation\form_relation_shili\form_group_karma    get_npc_karma            lbl_yinxiang    get_karma_name    get_npc_relation    lbl_guanxi    ui_haoyou_01    ui_zhiyou_01        @   ui_guanzhu_01    ui_sns_npcinfo_noinfo2    lbl_npc_special_value_1    Visible     lbl_npc_special_value_2    lbl_npc_special_value_3 1   form_stage_main\form_relation\form_avenge_search    is_avenge_npc 3   form_stage_main\form_relation\form_enchou_npc_list    is_zhibao_npc 	   DrawMode 
   FitWindow 3   gui\special\sns_new\btn_enchou_price\money1_on.png 	   HintText    tips_npcfunc_award    Transparent    gui\special\karma\avenge.png    tips_npcfunc_avenge (   gui\special\btn_main\btn_zhibao_out.png    tips_npcfunc_zhibao    Show     �                                                                       !   %   (   (   (   *   *   +   +   ,   ,   -   -   .   .   /   /   /   0   0   0   2   2   2   2   2   3   3   3   3   3   3   3   3   3   7   7   7   7   7   8   8   9   ;   ;   ;   ;   ;   ;   ;   ;   >   >   >   >   >   @   @   A   A   A   A   A   A   A   A   A   A   B   B   C   C   C   C   C   C   C   C   C   C   D   D   E   E   E   E   E   E   E   E   E   E   G   G   G   G   G   G   G   G   G   K   K   L   L   M   M   S   S   T   T   T   T   S   W   W   X   X   X   X   W   \   \   ]   ]   ^   ^   ^   ^   ^   ^   ^   _   _   `   `   c   c   e   e   f   f   g   g   g   g   g   g   g   h   h   i   i   l   l   l   l   n   n   o   o   p   p   p   p   p   p   p   q   q   r   r   u   u   u   u   w   w   x   x   y   y   y   y   y   y   y   z   z   {   {   �   �   �         npc_id     �      arg     �      form    �      name    �      origin    �      photo    �      character_str    �   
   shili_str    �   
   scene_str    �   
   scene_str /   8      karma =   �   	   relation M   �      is_avenge_npc �   �      is_baowu_npc �   �           �   �     �   �  B  ܁ �  @�� B    � � �  E �B �  � \  �  @     A� �@  A� � FBKB��B   � \�  Z   �E�  � �B   � �  \�  � ���E�  � �B � � �  \�  � �K���B    ܂ C A  \�  � �@�  ��� K���B    ܂ C A�  \�  � ���� � C ܂ �����  � � � ��     �� ���� � � ܂ �����  �  � ��    @	�� ���� � C ܂ �����  � � � ��    ��� ���� � � ܂ �����  �  � ��    ����  � C AC  �  ��    �  �� �� ł    ܂ �B    � � ��FEC �  \ ܂  C @�� W@C���  E � �C  �܃ ��\ �  @ @��  E �C \ �  @ � EC �� �  � \�  �A EC � \ �  EC � \� W@ ��  E �C � � \  �  � ���  E �C �C � \  �  �  � @ ���  �@ � �     	   nx_value 
   ItemQuery    nx_is_valid    nx_widestr 
   util_text 
   nx_string    _1    gui    TextManager 	   IsIDName    ui_karma_none    GetItemPropByConfigID    Photo     -   gui\special\sns_new\sns_head\common_head.png 
   Character 
   nx_number       �?
   ui_xiashi        @   ui_eren       @   ui_xie       @	   ui_kuang    ui_sns_npcinfo_noinfo1    Karma    GetGroupKarma    group_karma_    ui_sns_npcinfo_noinfo2 
   ui_scene_    get_scene_id     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         npc_id     �      name     �      origin     �      photo     �      character_str     �   
   shili_str     �   
   scene_str     �   
   ItemQuery    �      gui    �      Flag D   �   	   karmamgr �   �   	   shili_id �   �           �   �     	I   E   �   \� @� @ �A�  ^  E�  �  \� �@ � � �� �    ��� ��  ����  ��  �@ �� �@   ܀ �   ��ŀ �BA ܀��@  @ ���  �  ��B� �A @��  �  ��  � ܀ A @��   ����KD�  \���A ���� �  @��� ��B ����  � ��� �A�� �  �    �    
   nx_string           �	   nx_value 2   form_stage_main\form_relation\form_relation_fujin    nx_is_valid    nx_execute /   form_stage_main\form_relation\form_friend_list    get_scene_id 3   form_stage_main\form_relation\form_relation_renmai    nx_find_custom    form_friend_list 	   relation    get_scene_id_by_relation 2   form_stage_main\form_relation\form_relation_shili    groupbox_npc    Find    Scene    nx_int     I   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         npc_id     H      form_fujin 
   H   	   scene_id          form_renmai    H   	   relation &   +      form_shili .   H      groupbox_npc 4   F      gb_select_npc 7   F           �   	    6   �  �   A  �@ ŀ  �  ܀ �� EA � \� ZA  @ �A� ^ A� � �  �� � B ܁ �  �AA ��BB����A  @ ��� � ��BBA �B �� �� � ��  C@ ��� � Ł �C�B� � �܁  �  �       rec_npc_relation    rec_npc_attention 	   nx_value    game_client 
   GetPlayer    nx_is_valid       �      �?
   nx_number        @   FindRecord    FindRecordRow         
   nx_string    nx_int    QueryRecord     6   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                           	     	   relation     5      npc_id     5      table_name    5      client    5      player 	   5      index    5      row )   5   	   scene_id 4   5                    	@@�E�  �   \@  �       Visible     nx_destroy                        self                         F @ �@� �@ ��  �   �       ParentForm    Close       �?                         self           form                        F @ F@� ��  ��   EA �� �� � \    �@   �       ParentForm    npc_id    nx_function    ext_copy_wstr    nx_widestr 
   util_text 
   nx_string                                        btn           npc_id                  "        �            "        btn                 &  (        �            (        btn                                              �      �   �   �   �   	  �               "     (  &  (          