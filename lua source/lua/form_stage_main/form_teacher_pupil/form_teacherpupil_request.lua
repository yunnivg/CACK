LuaQ  a   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_teacher_pupil\form_teacherpupil_request.lua           )      A@  @    A�  @    A�  @    A  @ � @   � $   @ $@  � $�  � $�    $  @ $@ � $� � $�   $  @ $@ � $� � $�    �       require 	   util_gui    util_functions    define\request_type 7   form_stage_main\form_teacher_pupil\teacherpupil_define    REQUEST_BAISHI       �?   REQUEST_SHOUTU        @   on_main_form_init    on_main_form_open    on_main_form_close    on_btn_ok_click    on_btn_cancel_click    on_combobox_ng_selected    on_rbtn_jingmai_click    on_rbtn_neigong_click    custom_request_teacher_pupil    get_neigong_level    on_server_msg    show_tip_dialog                   	@@� �       Fixed                     form                   >     p   E   �@  \� ��� ��@ �� � A	� ���� ƀA �� � A	����   �� �� �    ܀ �@    � � �@B܀ � �� C��� ���� ��   ܁ ��@ �@   �@�� �� ����� �BC �� �� � ܂ �����C �D�BD� E� � ����\   �B  ����C �D�BD� E� �C ����\   �B  ����� �AC �� �� � ܁ � ���C Ł � A�  ܁  ����F �� B ܁ �������C Ł � A�  ܁  ����F �� � ܁ ���	@�	 ����G �ȏ � !   	   nx_value    gui    Left    Width        @   Top    Height    SwitchManager    nx_is_valid    GetMainGameStep    get_neigong_level    nx_int       �?   request_type    REQUEST_BAISHI    combobox_ng    DropListBox 
   AddString    nx_widestr 
   util_text    ui_shixiong_ 
   ui_shidi_    Text    ui_shixiong_2    lbl_6    ui_shitu_jinmai    ui_shidi_2    ui_shitu_jinmai_1    max_neigonglevel    level    btn_ok    Enabled      p                                                                                   !   #   #   #   #   #   #   #   #   $   $   &   )   )   )   )   *   *   *   *   *   *   *   *   +   +   +   +   +   +   +   +   +   +   +   +   -   -   -   -   -   -   -   -   -   -   -   )   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   3   3   3   3   3   3   5   5   5   5   5   5   5   6   6   6   6   6   9   :   =   =   >   
      form     o      gui    o      switch_manager    o      cur_main_game_step    o      neigonglevel    o      max_neigonglevel    o      (for index) )   J      (for limit) )   J      (for step) )   J      i *   I           A   C        E   �   \@  �       nx_destroy        B   B   B   C         form                E   h     X   F @ �@  � � �� �@    � � ��� ��  �� ܀ �  A �  �  � � �@� �� �A  �� @�� E �A \� @@�� A� � �A �  @ � E� A �	�� A� � �� �  @ � E� A @�� E ��\� � �A �� ����E� �� � B E�  � \� �B � \A�@�E� �� � � E�  � \� �B � \A�� @� �� � A A� A  �       ParentForm    nx_is_valid    target_name    nx_widestr        request_type    rbtn_jingmai    Checked    nx_int    REQUEST_BAISHI    nx_execute    custom_sender    custom_teacher_pupil       "@   ShiTuType_JingMai       @   level    ShiTuType_NeiGong    nx_gen_event    confirm_return    ok    Close     X   G   I   I   I   I   I   J   M   N   N   N   N   N   N   N   N   O   R   T   T   T   T   U   U   U   U   U   U   U   U   W   W   W   W   W   W   W   W   W   W   Y   Y   Y   Y   Y   Y   Y   Y   Y   Z   \   ]   ]   ]   ]   ]   ]   ]   ]   _   _   _   _   _   _   _   _   _   _   _   a   a   a   a   a   a   a   a   a   a   e   e   e   e   e   g   g   h         btn     W      form    W      name    W      rq_type    W      teacher_level 3   P           k   t        F @ �@  � � �� �@    � � ��  � � �  A �@ �@� �@  �       ParentForm    nx_is_valid    nx_gen_event    confirm_return    cancel    Close        l   m   m   m   m   m   n   q   q   q   q   q   s   s   t         btn           form               v   �     
0   F @ �@  � � �� �@    � � ��  ���  ����A Ɓ� �� �A � ܁ �@�� �A � @�B� ��  � �B ܁ ���I@� �� �A B @�B� ��  � �B ܁ �  �I@���� �       ParentForm    nx_is_valid        @   max_neigonglevel       �?   nx_int    request_type    REQUEST_BAISHI    nx_widestr 
   util_text    ui_shixiong_    Text    level 
   ui_shidi_     0   w   x   x   x   x   x   y   |   |   |   |   }   }   }   }   }   }   }   }   ~   ~   ~   ~   ~   ~   ~   ~   ~   ~   ~   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   |   �         combox     /      form    /      (for index) 
   /      (for limit) 
   /      (for step) 
   /      i    .           �   �        F @ F@� I�@� �       ParentForm    btn_ok    Enabled        �   �   �   �         btn                �   �        F @ F@� I�@� �       ParentForm    btn_ok    Enabled        �   �   �   �         btn                �   �     	9   �   �@  �� ŀ    ܀ �@    � � ��   ܀ �  @  �  � ��@Aˀ�A� �@�� ��@Aˀ�A �@��@ � A� � ��   ܀ �  @�� A    � � A��CA AA�C� FA�K��A   ܁ � \� � ���@ ��A��A  �    	   nx_value    gui    nx_is_valid    nx_int       �?   TextManager    Format_SetIDName    ui_shitu_desc_01    ui_shitu_desc_02    nx_execute 	   util_gui    util_get_form =   form_stage_main\form_teacher_pupil\form_teacherpupil_request    mltbox_info    Clear    Format_GetText    AddHtmlText    nx_widestr       �   request_type    target_name 
   ShowModal     9   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         rq_type     8      name     8      gui    8      dialog !   8      info -   8      index 4   8           �   �            A@  ��  ��  � E  �   \� Z@  @ �A@ ^  K�A ��  �  \�  @� @ ��@ �  �@B  � A� �A ����   �       nx_execute    util_functions    get_ini "   share\rule\shitu\teacherpupil.ini    nx_is_valid            FindSectionIndex 
   nx_string    BaseConfig    ReadInteger    OpenNeiGong        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         ini          index          nOpenNeiGong               �   /   5  �   �   �� �   A  ܀ �   ��J��   �   �� �   �  ܀ �  ���  �  � �@�@G��   �   �� �   A ܀ � ���� �� �� �    ܀ �@    � � �   A� ܀   AA  � E  ��\� @@�A F�� � E  �A� \� �  Ɓ� �� ��B��AB �A���Bˁ�EB � \ �A  ��Bˁ�E  ��\ �A  ��Bˁ�E  � \ �A  ��B���܁  @�� W@D  � � E  ��� \� �� ��  AC �C � �� �C   ��B��2�A F�� � E  �A� \� �  Ɓ� �� ��B��A� �A���Bˁ�EB � \ �A  ��Bˁ�E  ��\ �A  ��Bˁ�E  � \ �A  ��B���܁  @�� W@D  � � E� �� � C EC � \� ��  \B @&��   �   �� �   � ܀ � @
��� ��  AA �� �  �� �    ܀ �@    � � ˀF�@ ��F� ��@ �@ A A�  ܀  � AA �� �  �A� AA � �� � @D@�E� �� �� 	 \A ���   �   �� �   A	 ܀ � ���� �� �� �    ܀ �@    � � �   A� ܀ A F�� � E  �A� \� ��B�C�	 �A���B��CB @  �A  ��B��C  @� �A  ��B��C�� �   ܁ W@�  � �   E�	 � E  ��\� @@�� A� � �
 C @ � E�	 B ��  F�� � E� �� � 
 EC � \� �C
 � \B� ��   �   �� �   �
 ܀ �  ��  �@ �
 �  ��  W@D  � � ŀ � A� � �@  � -      nx_int       �?       @   util_show_form C   form_stage_main\form_teacher_pupil\form_teacherpupil_register_info       @	   nx_value    gui    nx_is_valid    nx_widestr       @   TextManager    Format_SetIDName    ui_shitu_shoutu    Format_AddParam    Format_GetText    show_tip_dialog    ok    nx_execute    custom_sender    custom_request       K@   ui_shitu_shoutu_1 	   util_gui    util_get_form    form_common\form_confirm 
   ShowModal    mltbox_info    Clear 
   util_text    ui_shitu_jingmai_buf_01    show_common_text    nx_wait_event     �חA   confirm_return    custom_teacher_pupil       @      @   ui_shitu_baishi_1    ShiTuType_JingMai      �J@   ShiTuType_NeiGong    TP_STC_CHISHI    ui_shitu_chushi_vip    TP_CTS_CHISHI     5  �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                                              
  
  
  
  
                                                                                                                      "  "  "  $  $  $  $  $  $  $  $  $  $  %  &  &  &  &  &  &  &  &  '  '  '  '  '  )  )  *  -  -  -  -  -  /        submsg     4     arg     4     gui !   �      shitu_type *   �      name 5   g      neigonglevel 8   g   	   npersent ;   g      info T   g      res W   g      teacher_level ]   g      name k   �      xuewei_count n   �   
   inc_times q   �      info �   �      res �   �      dialog �   �      text �   �      res �   �      gui �        shitu_type �        name �        count �        info �        res �        teacher_level        res ,  4          1  A        E   �@  ��  �  B� �  \� �  � � �� �@    � � �@� �@ ��� ��A�@ ��� � BA @  � A� �� ��  @� �A ܀ �   �       nx_execute 	   util_gui    util_get_form    form_common\form_confirm    nx_is_valid 
   ShowModal    mltbox_info    Clear    AddHtmlText    nx_widestr       �   nx_wait_event     �חA   confirm_return         2  2  2  2  2  2  2  3  3  3  3  3  4  8  8  ;  ;  ;  <  <  <  <  <  <  <  >  >  >  >  >  @  A        text           dialog          index          res           )                                             	   	         >      C   A   h   E   t   k   �   v   �   �   �   �   �   �   �   �   /  �   A  1  A          