LuaQ  Z   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_world_war\form_world_war_neiying.lua           (      E@  ��  \@ A�  �   �  �@  �@ ��  �� ��      �� �  �  �@ �@ �� �� ��   � �� �  �  �@ �@ �� �� �� �� �  �  �@ �@ �� �� �� ��  �    6   form_stage_main\form_world_war\form_world_war_neiying    require 5   form_stage_main\form_world_war\form_world_war_define       (@   main_form_init    on_main_form_open    on_main_form_close    close_form    on_btn_1_click 
   vote_info 	   vote_end    Grid_Refresh    on_Grid_Btn_Rec_click    on_Grid_Btn_Add_click    on_btn_2_click    on_btn_3_click    on_btn_4_click    on_btn_5_click    on_btn_6_click    send_world_war_custom_msg                   	@@�	�@�	@A�	@A�	@��E  �@ �� � \� 	@ � �       Fixed     Current_Page       �?
   info_list     wstrPlayerVoted    nVotes    nx_call 	   util_gui    get_arraylist    worldwar:info_list                                                  form                    "        E   �   \@  �       Grid_Refresh        !   !   !   "         form                %   -        E   �@@ \� Z   @�F@@ K�� \@ E�  �@@ \@ E�  �   \@  �       nx_is_valid 
   info_list    ClearChild    nx_destroy        '   '   '   '   '   (   (   (   )   )   )   ,   ,   ,   -         form                0   5           A@  ��  �     B  � E�  �   \� Z   @ �K A \@  �       nx_execute 	   util_gui    util_get_form    nx_is_valid    Close        1   1   1   1   1   1   1   2   2   2   2   2   3   3   5         form          
   form_name     8   =        F @ I������ �@  �       ParentForm    Visible     Close        9   ;   <   <   =         btn           form               @   ^    B   �   A  A�  ��  �� ܀� @��   � �ɀ����A   AA  ��  � � B  � KAB\A E  �A  ��   B� �  \� I �IA���A �A  � A� �� I�����D�A �A Ł ���  ܁ B ������EC ����� C܂ ������� ���� �  � �I�������A  �       nx_execute 	   util_gui    util_get_form :   form_stage_main\form_world_war\form_world_war_neiying_tip    nx_is_valid    Visible    Show 6   form_stage_main\form_world_war\form_world_war_neiying    Close    wstrPlayerVoted    nVotes 
   info_list    nx_call    get_arraylist    worldwar:info_list    ClearChild       �?   table    getn    CreateChild        name    nx_widestr     B   B   B   B   B   B   B   D   D   D   D   D   E   F   F   I   I   I   I   I   I   I   J   J   L   L   L   L   L   L   L   N   O   Q   Q   Q   Q   Q   Q   S   S   S   T   T   T   T   T   T   T   U   U   U   U   V   V   V   V   T   Y   Y   Y   Y   Y   [   \   \   ^         wstrPlayerVoted     A      nVotes     A      arg     A      form    A      form    A      form    A      (for index) /   9      (for limit) /   9      (for step) /   9      i 0   8      info 4   8           a   m        E   �@  ��  �  B� \���  � � �� �   @ ��@� �@ �   �@  �  A� �� ���@  �  � � �� �   @ ��@� �@  �       nx_execute 	   util_gui    util_get_form 6   form_stage_main\form_world_war\form_world_war_neiying    nx_is_valid    Close :   form_stage_main\form_world_war\form_world_war_neiying_tip        c   c   c   c   c   c   e   e   e   e   e   f   f   i   i   i   i   i   i   i   j   j   j   j   j   k   k   m         arg           form               p   �    �  F @ K@� \@ F�@ K@� \@ F�@ K � \� @�� �F�A �  ��@ � �܀ �@�̀�  � ��� ��BI���@ �F�A I�E  ��A ��B\� �  �� �� �� � �F�A I�@�E  ��A ��B\� �  ƀA ����� @ � �F�A ��A ��AI���B   �  �@C �� �  A ܀ ��  �B � �  ƀA ����� 	� ���C �B@�	�B���A �� � ܀ �����  �@ �� ŀ   ܀ �    L��� �D ܀ � A � W � ��@E � F�EK��� �D \ �  � ���@F � F�EK����  FBC  \  �  � ��� @ ���AA �� ƁE��AB ���  �@  � @ ���A� �� ƁE��A� ���  �@  � @ ���A �� ƁE��AB ���  �@  � @ ˀ��@ ��H � ��@ ��   A� ��(��  �C �B��́��@ A� BB � &��@ �A�A�	 ܁�@ �I���B � F�@ K�ƃC ̓�  ���BDB���C�\��FC� B  @ �I���� � F�@ K�ƃC ̓�  ���BDB��̃�\��FC� B  @ �I��� � F�@ K�ƃC ̓�  ���BDB��̃�\��FC� B  �J��
 ��F�H K�� \B�E� ��B\� 	B��	̗	�̘	͙	�͚E� ��@ �J�BCBCA����BJ\� �� �� �D � ��  W��  �BB  B� 	B��E � �B �� \B  E� � ��  \B F@ KB���� \B F@ K����� @ \B�K�J��
 \����H �K ��B��� ͂B�� I���I̗I�ϘIЙIBКIB��� ��C � �B  �� ��� A� �B �@ �BO �AC �B �@ ��O �AC ���B�߀��  � ܀ �� KAQ�A \���� ��@ ��܁ �A�� ����� ��@ ��M��NC�LC�܂��B��� ��  �܂ �@
���@ ��H�B ��@ ��FC E� ��@ �J��DBDA����CJ\ �B  ��@ ��F� E� ��@ �J��DB�B����CJ\ �B  ��@ ��F E� ��@ �J��DB�G����CJ\ �B  ���� @ ˀ��@ ƀ@ ˀ��@  � G      textgrid_1    BeginUpdate    textgrid_2 
   info_list    GetChildCount            ipt_1 	   MaxDigit    nx_int       @      �?   Text 
   nx_number    nVotes    Current_Page    nx_widestr 	   nx_value    gui    nx_is_valid    wstrPlayerVoted        lbl_playervoted    TextManager    GetFormatText    ui_lxc_tpname 
   lbl_votes    ui_lxc_tpnum    SetColTitle    GetText    ui_lxc_name        @   ui_lxc_nydepiao       @   ui_lxc_nyxianyi 	   ClearRow    groupbox_1 
   DeleteAll 
   InsertRow       �   SetGridText    GetChildByIndex    name    Create    Button    Add    Name 
   nx_string 	   DrawMode 
   FitWindow    NormalImage '   gui\common\button\btn_minimum1_out.png    FocusImage &   gui\common\button\btn_minimum1_on.png 
   PushImage (   gui\common\button\btn_minimum1_down.png    Visible    nx_bind_script    nx_current    nx_callback 	   on_click    on_Grid_Btn_Rec_click    ClearGridControl    SetGridControl '   gui\common\button\btn_maximum1_out.png &   gui\common\button\btn_maximum1_on.png (   gui\common\button\btn_maximum1_down.png    on_Grid_Btn_Add_click    game_client 
   GetPlayer 
   QueryProp 
   EndUpdate     �  r   r   r   s   s   s   u   u   u   u   u   v   v   v   v   v   v   v   v   v   v   v   v   v   x   x   {   {   {   {   {   {   {   {   {   |   |   |   }   }   }   }   }   }   }   }   }   }   ~   ~   ~   ~   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     �     isIncVisible 5   �     gui O   �     (for index) �   =     (for limit) �   =     (for step) �   =     i �   <     row �   <     Grid_Btn_Rec �   <     Grid_Btn_Add   <     client_player @  �     client_player B  �  
   self_name E  �     (for index) K  �     (for limit) K  �     (for step) K  �     i L  �        SINGLE_PAGE_MAX     �   �        F @ @�   � � E�  ��@ \� � A �@Aˀ�E�  �� \� ��  �� � ܀   EA �� ��� A   �       Visible     nx_int    Name    ParentForm    textgrid_1    GetGridText            send_world_war_custom_msg $   CLINET_WORLDWAR_TRAITOR_VOTE_CANCEL    nx_widestr        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         btn           index          form          target               �   �        F @ @�   � � E�  ��@ \� � A �@Aˀ�E�  �� \� ��  �� � ܀   EA �� ��� A   �       Visible     nx_int    Name    ParentForm    textgrid_1    GetGridText            send_world_war_custom_msg    CLIENT_WORLDWAR_TRAITOR_VOTE    nx_widestr        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         btn           index          form          target               �   �     
   F @ F@� ��  �  �� I� �E@ � @ \@  �       ParentForm    ipt_1    Text    nx_widestr    1    Grid_Refresh     
   �   �   �   �   �   �   �   �   �   �         btn     	           �          F @ F@� @ � �F @ F�� �@ � @ �@�̀��� I� �@�F @ F�� �@ �� �� I� �E� � @ \@  �       ParentForm    Current_Page       �?   ipt_1    Text    nx_widestr    1    Grid_Refresh        �   �   �   �   �   �   �   �   �   �   �   �   �                                   btn                         F @ F@� � @ ��@��@��  �F @ F�� �@ � @ �@�̀��� I� ���F @ F�� �@ � @ ƀ������ I� �E� � @ \@  �       ParentForm    Current_Page    ipt_1 	   MaxDigit    Text    nx_widestr       �?   Grid_Refresh                      	  	  	  	  	  	  	  	  	                                btn                         F @ F@� ��  � @ �@�� ��� I� �E@ � @ \@  �       ParentForm    ipt_1    Text    nx_widestr 	   MaxDigit    Grid_Refresh                                      btn                         E   �@@ \@  �       Grid_Refresh    ParentForm                      btn                  &   	   �   �@  �� ŀ    ܀ �@  @ ��   �  ��@E �A \� � �  �� Ł  � � �@   �    	   nx_value    game_visual    nx_is_valid    CustomSend    nx_int    CLIENT_CUSTOMMSG_WORLD_WAR    unpack                 !  !  !  !  !  "  "  %  %  %  %  %  %  %  %  %  %  %  &        sub_msg           arg           game_visual           (   
                     "       -   %   5   5   0   =   8   ^   @   m   a   �   �   p   �   �   �   �   �   �     �               &    &     
   form_name    '      SINGLE_PAGE_MAX    '       