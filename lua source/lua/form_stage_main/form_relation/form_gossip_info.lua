LuaQ  S   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_gossip_info.lua                 A@  @    A�  @ $   �  $@    $�  @ $�  � $  � $@   $� @ $� � $  � $@   $� @  �       require 	   util_gui    util_functions    on_main_form_init    on_main_form_open    change_form_size    add_gossip_list_form    add_gossip    on_btn_share_click    on_btn_del_click    on_get_capture    on_lost_capture    close_form    on_main_form_close           	         �            	         form                            E   �@  \� ��  � � �� �@    � � ���  FAA �� ��� �� �@ �  �   �@  � 	   	   nx_value    data_binder    nx_is_valid    AddTableBind    Gossip_Record    gsb_gossip    nx_current    add_gossip_list_form    change_form_size                                                                          form           databinder                          E   �@  \� ��� ��@ �� � A	� ���� ƀA �� ��A	��� �    	   nx_value    gui    AbsLeft    Width       $@   AbsTop    Height        @                                                       form           gui               !   l      �      A@  � E�  �   \� Z@    � � E   ��  \� � � �� �@A ˀ��@ ��AA ܀��@   ��@B ��B�� C ��B� � �@CA ܀��� �AB 	�B�C 	�B� � AA �AA AA 	�C� EA �  �� \��Z    ��D W D@
�W�D�	�KE� B E� � \� �� \� @����C � B ܁ �����AB ��C��C ��C��AF @��� ���Ł    @ � �� �A��AA ��@��AB ��B��C ��B��AA ��B� � FC � ���� I���FAB I�C�FC I�C�A� �A��A `��KBF�   A� \���BF @ �C ���ł    @�� � �B�_��FAA I�EA �  � \��Z  @�EA �G \� �A �A �� ��@�FC I�B�FAB I�B�FAA I�G� �     	   nx_value /   form_stage_main\form_relation\form_gossip_info    nx_is_valid    game_client 
   GetPlayer    gsb_gossip 
   DeleteAll    FindRecord    Gossip_Record    lbl_bg    Visible     lbl_bg_num    GetRecordRows                nx_find_custom    select_npcid    all_npc    FindRecordRow       �?
   nx_string    Text    nx_widestr    QueryRecord    add_gossip    IsEditMode    type    nx_int    Top       8@    �   #   #   #   $   $   $   $   $   %   (   (   (   )   )   +   +   +   -   -   -   -   -   .   .   /   /   0   3   3   3   5   5   6   6   7   7   8   <   <   <   =   =   ?   @   @   @   @   @   @   A   E   E   E   E   G   G   G   G   G   G   G   G   H   H   I   I   I   I   I   J   J   K   K   L   L   L   L   L   M   M   M   M   M   M   N   N   N   P   P   Q   Q   R   R   T   X   X   X   X   X   Y   Y   Z   Z   [   [   [   [   \   \   \   \   \   ]   ]   ]   ]   ]   _   _   _   _   _   _   [   a   a   d   d   d   d   d   d   e   e   e   e   e   e   e   e   f   f   g   g   h   h   l         form    �      game_client    �      client_player    �      rows    �      select_npcid +   �      row >   ^      bg_id N   V      (for index) j   |      (for limit) j   |      (for step) j   |      i k   {      bg_id p   {      npc_id u   {           o   �     �     AA  � K�@��  \���A Ł �� I���B ��A�ABI���I�B�IAC�I�C�IAD���@� ����� B E� � ������Ń�AE���E��AF���F��AG���  EB � \   ܁  ����A�@ �A�ˁ@A� ܁�� EB �� \� B���A����B���E��F�HF�AB���I��AI�  A�	 BF�IK�� \��Z  ��E �B � � \�   �@�E �B �B
 � \�   �E� � \� �A�KB���\B�K�@��
 \����
 �B � ܂ ��I����EI�����������I��II�IBI�I�˖I̗I�̘IBÙIM�IB���� ��� � �B  � ��C A� �B �B� ��B���@�
 ����� C E� � �����ƂE�������O������I��BI���Ϟ��ϖ�З�BИ�BÙ�B��ł   E� \� �B  �   AC �� �B �B�@ �B�˂@A� ܂� EC �� \� C���������F�BC���B���BQ���Q���E�ɂϤɂϙɂO���R�ɂO��Bɦ��Q���ѧ�BT��BC��թ� @��� �� C   @��C �C C  @��� �� C �I�U�� ��K���   ܃ D \C KC���\C�F��L��NC�IA�FB KC���\C� � [   	   nx_value    gui    Create 	   GroupBox    Name 
   nx_string    i    Width    gsb_gossip       2@   Height      �Q@   NoFrame 
   BackImage !   gui\special\sns_new\bg_event.png 	   DrawMode    ExpandH    Label 	   lbl_npc_       N@      4@   Top       @   Left       .@   Font    font_sns_event_mid 
   ForeColor    255,255,255,255    Text    nx_widestr 
   util_text    Add    lbl_npc_origin_        @   font_sns_list    255,214,204,191    _1    TextManager 	   IsIDName    ui_karma_none    Button    btn_share_ 333333�?   NormalImage -   gui\language\ChineseS\sns_new\btn_fx_out.png    FocusImage ,   gui\language\ChineseS\sns_new\btn_fx_on.png 
   PushImage .   gui\language\ChineseS\sns_new\btn_fx_down.png 	   AutoSize    Tile    DataSource    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_share_click 	   btn_del_ �������?   Transparent  .   gui\language\ChineseS\sns_new\btn_del_out.png -   gui\language\ChineseS\sns_new\btn_del_on.png /   gui\language\ChineseS\sns_new\btn_del_down.png    on_btn_del_click    MultiTextBox    mltbox_    Expand 
   LineColor    0,0,0,0    LineHeight    Solid    HasVScroll    font_system_news 
   TestTrans 
   TextColor    SelectBarColor    MouseInBarColor 
   BackColor    0,255,255,255    TransImage 	   ViewRect    5,0,270,50    on_get_capture    on_lost_capture    GetText    AddHtmlText       �      $@    �   q   q   q   s   s   s   t   t   t   t   u   u   u   u   v   w   x   y   |   |   |   }   }   }   }   }   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     �      bg_id     �      npc_id     �      index     �      gui    �      groupbox_npc    �      lbl_npc    �      lbl_npc_origin /   �      origin E   �   
   btn_share b   �      btn_del �   �      multi_text_box �   �      gossip_info �   �           �       (   F @ �@  ��  �  A �� �  �� �@   ܀ �@    � � ŀ � ܀ BF��K��� \��	A��ACA � A� � � � @D���A  �� � A ���� �A  �       DataSource    nx_execute 	   util_gui    util_get_form '   form_stage_main\form_share_gossip_info    nx_is_valid 	   nx_value    gui    combobox_friend    Text    TextManager    GetText 	   ui_input 
   ShowModal    nx_wait_event     �חA   input_search_return    ok    custom_sender    custom_gossip       �?    (   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                self     '   	   bagua_id    '      dialog    '      gui    '      res    '      text    '             *    9   E   �@  ��  �  B� �  \� �  � � �� �@    � � �@ �� �� �� BAB�� �� �   ܀    A�  � ��  �A�A� A � A� �� � � W@D� �J  G�  � E �  \� ZA    � � F�D �  � B A� �� ���A  �       nx_execute 	   util_gui    util_get_form    form_common\form_confirm    nx_is_valid 	   nx_value    gui    nx_widestr    TextManager    GetText 
   nx_string    ui_gossip_del    show_common_text 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    table_selected    DataSource    custom_sender    custom_gossip        @        9                 	  	  	  	  	  
                                                            #  #  #  #  #  $  '  )  )  )  )  )  )  )  *        self     8      dialog    8      gui    8      text    8      res %   8   	   bagua_id 1   8           ,  O    	?   K @ �@  \����@ ��   ܀ A @�� A    � � �A�� ��EA � \� ZA  ��K��A \�� �	�A�K�B� \A�FC 	A�FAC NA�	A��FAC �D L��	A��F�D 	A��	ŉ	�Ŋ	Ƌ	�ƌ	Ǎ	�ǎ	�ŏ	AH�	�H�	AI�K�I\A K�I�
  � ܁ B
 \A E
 �� \� 	@� � +      GetHtmlItemText            ParentForm 	   nx_value    gui    nx_is_valid    Find    mltbox_desc    Create    MultiTextBox    Name    Add    Width    Height        @   Top    AbsTop    Left    AbsLeft 	   DrawMode    Expand 
   LineColor    0,0,0,0    LineHeight       $@   HasVScroll     Font    font_system_news 
   TextColor    255,204,204,204    SelectBarColor 
   BackColor    255,255,180,40 	   ViewRect    5,6,270,144 
   BackImage !   gui\common\combobox\bg_list1.png    Clear    AddHtmlText    nx_widestr       �	   HintText     ?   -  -  -  .  /  /  /  0  0  0  0  0  1  4  4  4  5  5  5  5  5  6  6  6  6  7  8  8  8  ;  ;  <  <  <  =  =  =  =  >  >  ?  @  A  B  C  D  E  F  G  I  L  L  M  M  M  M  M  M  N  N  N  N  O        self     >      str    >      form    >      gui    >      mlt_box_desc    >           Q  Z       F @ �@  ��  �� ��� A ܀�A @��   � ��A��A� �       ParentForm 	   nx_value    gui    Find    mltbox_desc    nx_is_valid    Delete        R  S  S  S  U  U  U  W  W  W  W  W  X  X  X  Z        self           form          gui          mlt_box_desc               \  e           A@  ��  ��    B  � E  �   \� Z   � �	���K�A \@  �       nx_execute 	   util_gui    util_get_form /   form_stage_main\form_relation\form_gossip_info    nx_is_valid    Visible     Close        ^  ^  ^  ^  ^  ^  ^  `  `  `  `  `  a  b  b  e        form               g  m    
   E   �   \� Z   � �	���E�  �   \@  �       nx_is_valid    Visible     nx_destroy     
   i  i  i  i  i  j  k  k  k  m        form     	                            	                  l   !   �   o     �   *    O  ,  Z  Q  e  \  m  g  m          