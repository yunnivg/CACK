LuaQ  P   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation.lua           �      A@  @    A�  @    A�  @    A  @    A@ @    A� @    A� @   A@ �� ��  AA �� � B A� �� � C A� �� � D A� � �D � A� � �E � A� � �  �� �F  � �  �F ��  ǆ � �� �F � � �F �� ǆ �     �� �F       
� �   � �F ��    ǆ �   ��� �F    � �    �F ��   �ǆ � �� �F   �  ��	 �       
�F	 ��      �ǆ	 �       ��	 �F   �  ��
 �       
�F
 ��      �ǆ
 �       ��
 �F � � �F �� ǆ � �� �F �  � 1      require 	   util_gui    util_functions    share\client_custom_define    share\logicstate_define    share\view_define    game_object .   form_stage_main\form_relation\relation_define       �?       @      @      @      @      @      @       @      "@      $@           main_form_init    main_form_open    main_form_close    on_size_change    turn_to_full_screen    update_form_pos    on_btn_close_click    on_rbtn_checked_changed    on_rbtn_friend_checked_changed    on_relation_add    on_rbtn_zhiyou_checked_changed     on_rbtn_xiongdi_checked_changed     on_rbtn_chouren_checked_changed     on_rbtn_xuechou_checked_changed     on_rbtn_guanzhu_checked_changed "   on_rbtn_blacklist_checked_changed    on_cancel_btn_click    interface_add_friend    interface_add_chouren    interface_add_filter    interface_add_attention    on_add_btn_click    on_btn_add_chouren_click    on_btn_add_filter_click    on_btn_add_guanzhu_click    InitPlayerListForm    InitPlayerModelListForm    show_players_model    sender_message    show_role_model        /   9        	@@�	�@�	@A�	�@�	@��A  ^   � 	      Fixed    form_friend_list     isinit_form_friend_list     form_friend_model_list    isinit_form_friend_model_list       �?       0   2   3   5   6   8   8   9         self                <   A        E   �   \@ A@  ^   �       InitPlayerListForm       �?       >   >   >   @   @   A         self                D   S        	@@�F�@ Z   ��E�  � A \� Z   � �E@ � A \@ F�A Z   ��E�  ��A \� Z   � �F�A K � \@ E@ �   \@ A@ ^   � 
      Visible     isinit_form_friend_list    nx_is_valid    form_friend_list    nx_destroy    isinit_form_friend_model_list    form_friend_model_list    Close       �?       E   G   G   G   G   G   G   G   G   H   H   H   K   K   K   K   K   K   K   K   L   L   L   Q   Q   Q   R   R   S         self                U   [            A@  � E�  �   \� Z   � �E�  �   \@  �    	   nx_value ,   form_stage_main\form_relation\form_relation    nx_is_valid    turn_to_full_screen        V   V   V   X   X   X   X   X   Y   Y   Y   [         form               ]   �     �   @   �   �@  �� I�@�I�@�ƀA�@�I���ƀA���I���� � ����� � ��B�� � A� � ��� � �� C� ���@� A� �C� ���@� �� �C� �� � A� AD� ��� � �� �D� ���� A� E� ����� �� �D� ��@� A� �E� ���@� �� �D� ���� A� �C� ����� �� �D� �� � A� AF� ��� � �� �D� �ƀ� �   @��� � ܀ �    �� � �@Ǆ� � ɀG�� � �� �G� ��� � � ��� AH� �ƀ� �    ��� �� ܀ �   ����� � Ʉ��� ɀG���� A� �E� ����� �� AH� ����� �@�������� �@���@���� �@��� AA� ����� �@��� �A� �� � &   	   nx_value    gui    AbsLeft            AbsTop    Width    Desktop    Height    groupbox_playerlist    Left    Top       T@     @`@   groupbox_iteminfo      ��@      i@   add_btn      @@      I@   btn_add_guanzhu       y@   btn_add_chouren      �r@   btn_add_filter    cancel_btn       Y@   isinit_form_friend_list    nx_is_valid    form_friend_list       $@      4@     @e@   groupbox_page      �k@   isinit_form_friend_model_list    form_friend_model_list      @o@	   scenebox     �   ^   _   _   _   `   a   b   b   b   c   c   c   e   e   f   f   g   g   g   h   h   h   h   j   j   j   j   k   k   k   k   m   m   m   m   n   n   n   n   p   p   p   p   q   q   q   q   s   s   s   s   t   t   t   t   v   v   v   v   w   w   w   w   y   y   y   y   z   z   z   z   |   |   |   |   |   |   |   |   }   }   ~   ~               �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         self     �      form    �      gui    �           �   �        E   �@  \� ��� ��@ �� � A	� ���� ƀA �� � A	��� �    	   nx_value    gui    Left    Width        @   Top    Height        �   �   �   �   �   �   �   �   �   �   �   �   �   �         form           gui               �   �        F @ �@� �@  �       ParentForm    Close        �   �   �   �         btn           form               �   �        � @ �@    ܀ �@    � � ƀ@ �����@  A܀ �   ��� A�@��ŀ � A �A�@  � 	      ParentForm    nx_is_valid    Checked    form_friend_list    PlayerType    nx_execute /   form_stage_main\form_relation\form_friend_list    refresh_playerlist        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         btn           playerType           form               �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              FRIEND_TYPE     �   �    l   �   A  ܀   A�  � A  ��E�  ��\� ��  � �� W��  � � EA �� ��  B� �  \� �A ���� �A    � � �  �� �� ��B��AB �� �  � ܁  B A �� �� �B�B A � ��� @   B  B�B � A� ��� � @E��E� �� �  �� ł    ܂ � D� � E� � \ \B   �@F��E� �� �  �� ł    ܂ � D� � E� � \ \B  EB �� ��    \B �� G �EB �B ��    \B  �    	   nx_value    stage_main    loading 
   nx_string    success    nx_execute 	   util_gui    util_get_form 4   form_stage_main\form_relation\form_relation_confirm    nx_is_valid    gui    TextManager    GetFormatText    ui_menu_friend_confirm_add    nx_widestr    show_common_text    get_arrest_flag 
   ShowModal    nx_wait_event     �חA   relation_confirm_return    ok    sender_message    nx_int       �   ok_publish 0   form_stage_main\form_arrest\form_publish_arrest    on_add_publish    ok_add_money 2   form_stage_main\form_arrest\form_arrest_add_money 
   add_money     l   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   	      name     k   	   relation     k      relation_old     k      stage_main_flag    k      loading_flag    k      dialog    k      gui !   k      text (   k      res =   k         SUB_MSG_RELATION_ADD_ENEMY    RELATION_TYPE_ENEMY     �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              BUDDY_TYPE     �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              BROTHER_TYPE     �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              ENEMY_TYPE     �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              BLOOD_TYPE     �   �       E   �   �   \@� �       on_rbtn_checked_changed        �   �   �   �   �         btn              GUANZHU_TYPE     �         E   �   �   \@� �       on_rbtn_checked_changed                            btn              FILTER_TYPE       	    
   F @ �@  � � �� �@    � � ��� �@  �       ParentForm    nx_is_valid    Close     
                     	        btn     	      form    	                   E   �   �@     ܀ � E�  ��  \ \@   �       sender_message    nx_widestr    nx_int       �                                   name     
         SUB_MSG_RELATION_ADD_APPLY    RELATION_TYPE_FRIEND             E   �   �@     ܀ � E�  ��  \ \@   �       sender_message    nx_widestr    nx_int       �                                   name     
         SUB_MSG_RELATION_ADD_ENEMY    RELATION_TYPE_ENEMY             E   �   �@     ܀ � E�  ��  \ \@   �       sender_message    nx_widestr    nx_int       �                                   name     
         SUB_MSG_RELATION_ADD_SELF    RELATION_TYPE_FLITER             E   �   �@     ܀ � E�  ��  \ \@   �       sender_message    nx_widestr    nx_int       �                                   name     
         SUB_MSG_RELATION_ATTENTION_ADD    RELATION_TYPE_ATTENTION        4   6   E   �@  \� ��  ��   AA �� �  �� ƀA FA� K���� \��  � ��� C�@ ƀ� �C� ���������@� AD� ������ �ŀ � @ � �� @���W�E@�E� � �  �� �   ܁  D� � E �B \ \A   �    	   nx_value    gui    nx_execute 	   util_gui    util_get_form .   form_stage_main\form_relation\form_input_name 
   lbl_title    Text    nx_widestr    TextManager    GetText    ui_menu_friend_add 
   ShowModal    Left    Width        @   Top    Height    nx_wait_event     �חA   input_name_return    ok        sender_message    nx_int       �    6   !  !  !  #  #  #  #  #  #  #  %  %  %  %  %  %  %  %  '  '  *  *  *  *  *  +  +  +  +  +  .  .  .  .  .  /  /  0  0  1  1  1  1  1  1  1  1  1  1  1  1  1  1  4        btn     5      gui    5      dialog 
   5      res #   5      name #   5         SUB_MSG_RELATION_ADD_APPLY    RELATION_TYPE_FRIEND     7  K   6   E   �@  \� ��  ��   AA �� �  �� ƀA FA� K���� \��  � ��� C�@ ƀ� �C� ���������@� AD� ������ �ŀ � @ � �� @���W�E@�E� � �  �� �   ܁  D� � E �B \ \A   �    	   nx_value    gui    nx_execute 	   util_gui    util_get_form .   form_stage_main\form_relation\form_input_name 
   lbl_title    Text    nx_widestr    TextManager    GetText    ui_menu_friend_add_chouren 
   ShowModal    Left    Width        @   Top    Height    nx_wait_event     �חA   input_name_return    ok        sender_message    nx_int       �    6   8  8  8  :  :  :  :  :  :  :  <  <  <  <  <  <  <  <  >  >  A  A  A  A  A  B  B  B  B  B  E  E  E  E  E  F  F  G  G  H  H  H  H  H  H  H  H  H  H  H  H  H  H  K        btn     5      gui    5      dialog 
   5      res #   5      name #   5         SUB_MSG_RELATION_ADD_SELF    RELATION_TYPE_ENEMY     M  a   6   E   �@  \� ��  ��   AA �� �  �� ƀA FA� K���� \��  � ��� C�@ ƀ� �C� ���������@� AD� ������ �ŀ � @ � �� @���W�E@�E� � �  �� �   ܁  D� � E �B \ \A   �    	   nx_value    gui    nx_execute 	   util_gui    util_get_form .   form_stage_main\form_relation\form_input_name 
   lbl_title    Text    nx_widestr    TextManager    GetText    ui_menu_friend_add_filter 
   ShowModal    Left    Width        @   Top    Height    nx_wait_event     �חA   input_name_return    ok        sender_message    nx_int       �    6   N  N  N  P  P  P  P  P  P  P  R  R  R  R  R  R  R  R  T  T  W  W  W  W  W  X  X  X  X  X  [  [  [  [  [  \  \  ]  ]  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  ^  a        btn     5      gui    5      dialog 
   5      res #   5      name #   5         SUB_MSG_RELATION_ADD_SELF    RELATION_TYPE_FLITER     d  x   6   E   �@  \� ��  ��   AA �� �  �� ƀA FA� K���� \��  � ��� C�@ ƀ� �C� ���������@� AD� ������ �ŀ � @ � �� @���W�E@�E� � �  �� �   ܁  D� � E �B \ \A   �    	   nx_value    gui    nx_execute 	   util_gui    util_get_form .   form_stage_main\form_relation\form_input_name 
   lbl_title    Text    nx_widestr    TextManager    GetText     ui_menu_friend_item_add_guanzhu 
   ShowModal    Left    Width        @   Top    Height    nx_wait_event     �חA   input_name_return    ok        sender_message    nx_int       �    6   e  e  e  g  g  g  g  g  g  g  i  i  i  i  i  i  i  i  k  k  n  n  n  n  n  o  o  o  o  o  r  r  r  r  r  s  s  t  t  u  u  u  u  u  u  u  u  u  u  u  u  u  u  x        btn     5      gui    5      dialog 
   5      res #   5      name #   5         SUB_MSG_RELATION_ATTENTION_ADD    RELATION_TYPE_ATTENTION     z  �       E   �@  � �   \� ��@ ��@ � ����   ��	@A�	@ ���A �@����A �@B���A ��B���A �@C���A ƀC ����� ���A � DƀC �@��� � �       util_get_form /   form_stage_main\form_relation\form_friend_list    groupbox_playerlist    Add    isinit_form_friend_list    form_friend_list    Visible    Fixed     Left       $@   Top       4@   Height      @e@   groupbox_page      �k@       {  {  {  {  {  |  |  |  |  |  |  }  ~      �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form           form_friend_list               �  �    .   E   �@  � �   \� ��@ ��@ � ����   @�	@A�	@ ���A �@����A �@B���A ��B���A �@C���A ƀC ����� ���A � D �@��� ���A ��D��D���A ��D��D���A ��DƀA ƀ��� ���A ��DƀA � ��� � �       util_get_form "   form_stage_main\form_relationship    groupbox_playerlist    Add    isinit_form_friend_model_list    form_friend_model_list    Visible    Fixed     Left      @o@   Top       4@   Width      �r@   Height      �k@	   scenebox             .   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     -      form_friend_model_list    -           �  �    
2   E   �@  \� ��  � � �� �@    � � ���  ���ŀ    ܀ �@    �� � �@A ƀ����A �B�B� ��@A ƀ����� �AA �� �� �@��@A ƀ����� �EA F���@��@ AA �A@ �A �� � A� �@� �    	   nx_value    main_player    nx_is_valid    GetLinkObject    actor_role    scenebox_players    Scene    camera    Fov    math    pi �������?   SetPosition         �������?������	@	   YawAngle    show_role_model       �?    2   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     1      role    1      actor_role    1           �  �    	     AA  ��  �   � @ ��A� �       nx_execute    custom_sender    custom_add_relation     	   �  �  �  �  �  �  �  �  �        submsg           name           relation_new           relation_old                �  �       �  �A  �  @  �� �  �@ ���A� �       nx_execute "   form_stage_main\form_relationship    show_role_model        �  �  �  �  �  �  �  �  �  �  �        scene     
      actor     
      x     
      y     
      z     
      orient     
       �                                                                                                                     "   #   $   %   &   '   (   )   *   +   9   /   A   <   S   D   [   U   �   ]   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �       �   	                                    4  4  4     K  K  K  7  a  a  a  M  x  x  x  d  �  z  �  �  �  �  �  �  �  �  �        FRIEND_TYPE    �      BUDDY_TYPE    �      BROTHER_TYPE    �      ENEMY_TYPE    �      BLOOD_TYPE    �      FILTER_TYPE    �      GUANZHU_TYPE    �      SUB_MSG_RELATION_ADD_APPLY    �      SUB_MSG_RELATION_ADD_CONFIRM    �      SUB_MSG_RELATION_ADD_CANCEL    �      SUB_MSG_RELATION_ADD_SELF     �      SUB_MSG_RELATION_ADD_BOTH !   �      SUB_MSG_RELATION_REMOVE_SELF "   �      SUB_MSG_RELATION_REMOVE_BOTH #   �      SUB_MSG_RELATION_ATTENTION_ADD $   �   "   SUB_MSG_RELATION_ATTENTION_REMOVE %   �      SUB_MSG_RELATION_ADD_ENEMY &   �      RELATION_TYPE_FRIEND '   �      RELATION_TYPE_BUDDY (   �      RELATION_TYPE_BROTHER )   �      RELATION_TYPE_ENEMY *   �      RELATION_TYPE_BLOOD +   �      RELATION_TYPE_ATTENTION ,   �      RELATION_TYPE_ACQUAINT -   �      RELATION_TYPE_FANS .   �      RELATION_TYPE_FLITER /   �      RELATION_TYPE_STRANGER 0   �       