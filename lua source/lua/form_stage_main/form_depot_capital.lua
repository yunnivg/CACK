LuaQ  G   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_depot_capital.lua           2      A@  @    A�  @    A�  @    A  @ @ A� �� �   �  �@  �@ �  ǀ ��  �� �      �  �@     �@ �     ǀ ��   �    �� �    �    �  �@   �    �@ �   �        ǀ  �       require 	   util_gui    util_functions    share\capital_define    share\view_define #   form_stage_main\form_depot_capital     ��.A     @�@   showDepotMoney    on_main_form_init    on_main_form_open    on_main_form_close    on_close_click    show_form_save    show_form_putout    on_ipt_1_changed    on_ipt_2_changed    check_value    on_ok_click           2     9   E   �   \� Z@    � � E@  ��  \� ���  EA  ��  �     ܀ �@    � � �@  � ܀   @�� A    � � � KB�A \��  E� �B� ��\�  ��B �A�E� �� � � ܁  �����C �A�E �� ��� ܁  ��� �  �       nx_is_valid 	   nx_value    game_client    GetView 
   nx_string    VIEWPORT_DEPOT    CapitalModule 	   nx_int64 
   QueryProp    DepotSilver    DepotSilverCard 	   mltbox_1 	   HtmlText    FormatCapital    CAPITAL_TYPE_SILVER 	   mltbox_2    CAPITAL_TYPE_SILVER_CARD     9                                                                 "   %   %   %   &   &   &   &   &   '   +   +   +   +   +   ,   ,   ,   ,   ,   .   .   .   .   .   .   .   .   /   /   /   /   /   /   /   /   1   2         form     8      game_client 	   8      box    8      capital    8      silver "   8      silver_card '   8           9   A        	@@�E�  ��  \� �@� �@A �� ��A	� �� � � B �� ��A	��� � 	      Fixed  	   nx_value    gui    Left    Width        @   Top    Height        ;   >   >   >   ?   ?   ?   ?   ?   @   @   @   @   @   A         form           gui               F   P        	@@�	@@�	@��	@@�	@��E� �   \@ E� �   \@  �       type         
   maxsilver    maxcard 
   cursilver    curcard    check_value    showDepotMoney        G   H   I   J   K   M   M   M   O   O   O   P         form                U   W        E   �   \@  �       nx_destroy        V   V   V   W         form                \   ^       E   �   �   \@� �       util_show_form        ]   ]   ]   ]   ^         btn              g_form_name     `   �    {     D  �� A�A  D  � E�  � \� ZA    � � 	��	��	A �	���	� �EA  �A \� ��  ���� �A    � � ��B� B ܁ ������C� � ܁ �����D��Ĉ��D��Ĉ�D�  KB�ł � @   \  ܁  ������D�  KB��B � @�  \  ܁  ������ ˁ�E� ����  �� ���B �܁  � A� �� @ �A� � ��� � �� @ �  @ �� � ��� ͂  ��   �� � �� �� � ܂ �  �� � � �� �   ܂ ��  �  � ���� �  �܂ ��  �@��BG����G�B� �        util_show_form 	   nx_value    nx_is_valid    type        @
   maxsilver    maxcard 
   cursilver    curcard    CapitalModule    lbl_3    Text    util_format_string    ui_depot_tip_1    lbl_9    ui_store_amount    lbl_1    Visible    lbl_2    ui_deposit_limit_1    FormatCapital    CAPITAL_TYPE_SILVER 	   nx_int64    ui_deposit_limit_2    CAPITAL_TYPE_SILVER_CARD    GetCapital         
   nx_number    ipt_1 
   Max_Digit    ipt_2     {   a   a   a   a   b   b   b   c   c   c   c   c   d   h   i   j   k   l   p   p   p   q   q   q   q   q   r   v   v   v   v   v   y   y   y   y   y   |   |   }   }                                    �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   
   
   maxsilver     z      maxcard     z   
   cursilver     z      curcard     z      form    z      capital    z      now_silver D   z   	   now_card I   z      save_silver J   z   
   save_card K   z         g_form_name     �   �    2   �   �   � �@��@  �   �� ŀ    ܀ �@    � � � ��� ���@ ��@  � ܀ �  @�� A    � � BE� �� \� 	A��CE� �A \� 	A���C	ćAD	ć�DE �  \� 	A��AEE �� \� 	A�� �       util_show_form 	   nx_value    nx_is_valid    type       @
   cursilver    curcard    CapitalModule    lbl_3    Text    util_format_string    ui_depot_tip_2    lbl_9    ui_take_amount    lbl_1    Visible     lbl_2    ipt_1 
   Max_Digit 	   nx_int64    ipt_2     2   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �      
   cursilver     1      curcard     1      form    1      capital    1         g_form_name     �   �    	�   F @ �@  ƀ� ����� �@   ܀ �  ���� �@  ܀ �����@  ƀ� ����� �@   ܀ �  ���� �@  ܀ �����@  ��� ����� �@   ܀ �  ���� �@  ܀ �����@  �@  �� �@܀   � �A  F�� F��� D� A� �A  F�� F��� � ��� �    ܀  F�� FA�� � ���@  �� AB܀ � �ƀ� A EA  �  ��\ �  � ��ƀ� A EA  �A  � �� �A  �� �@܁   ������ ��\ �  � ����� A EA  � \� �A  Ɓ� ����� �  ��M���A  Ɓ� ����� �� ��M��� � ��ŀ @ �@  �       ParentForm 	   nx_int64    ipt_1    Text            nx_widestr    ipt_sliver_liang    ipt_sliver_wen 
   nx_number 
   Max_Digit    check_value     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         ipt           form          tmp_max_silver ?            Ding    Liang     �   �    z   F @ �@  ƀ� ����� �@   ܀ �  ���� �@  ܀ �����@  ƀ� ����� �@   ܀ �  ���� �@  ܀ �����@  ��� ����� �@   ܀ �  ���� �@  ܀ �����  �  �� �@܀   � � F�� F��� D� A� � F�� F��� � ��� �@    ܀ A  F�� FA�� � @��  �� AB܀ � �ƀ� A E �  ��\ �  � ��ƀ� A E � Ɓ� ����� �  ������ ��\ �  � ����� A E ��� ��@\� �  N��MA� Ɓ� ����� �� ��M��� � ��ŀ @ �@  �       ParentForm 
   nx_number    ipt_2    Text            nx_widestr    ipt_card_liang    ipt_card_wen 	   nx_int64 
   Max_Digit    check_value     z   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         ipt     y      form    y      tmp_max_card ?   y         Ding    Liang     �      Y   E   �   �@@ ƀ��� �   �� �   �@ �@܀ � � ��� �   A �@܀ �� \� �   �   AA �@܀   � �  F�A F��� D� A� �  F�A F��� � ��� �  A ܀ � @�� A    � � � @� � E� � \� X@��� @ � E� � \� @� �AC 	�C� � AC E� �� \� �� � �� X@ �E� � \� �� � �� X@  �BA  B� 	A� �    	   nx_int64    ipt_1    Text    ipt_sliver_liang    ipt_sliver_wen    ipt_2    ipt_card_liang    ipt_card_wen 	   nx_value    CapitalModule    nx_is_valid 
   nx_number            btn_2    Enabled      Y   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                                                                           form     X      silver    X      card (   X      capital +   X         Ding    Liang       )   	M   F @ �@  �@  �� �@܀   � �A  F� F��� D� A� �A  FA� F��� � ��� ŀ   ܀ � A� � � ���  A A� ��� �   �@ �@  A  FA� F��� D  AEA  ��� ��@\� �� N��AEA  ��� ��@\� A܀ � �ŀ   ܀ � A� � � ���  A A� ��� �   �@ �@  B  �@� �       ParentForm 	   nx_int64    ipt_1    Text    ipt_sliver_liang    ipt_sliver_wen 
   nx_number            nx_execute    custom_sender    send_depot_msg    type    CAPITAL_TYPE_SILVER    ipt_2    ipt_card_liang    ipt_card_wen    CAPITAL_TYPE_SILVER_CARD    util_show_form     M                                                                           "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  "  $  $  $  $  $  $  $  $  %  %  %  %  %  %  %  (  (  (  (  )        btn     L      form    L      value    L         Ding    Liang    g_form_name 2                                                2      A   9   P   F   W   U   ^   ^   \   �   �   `   �   �   �   �   �   �   �   �   �   �   �         �   )  )  )  )    )        g_form_name    1      Ding    1      Liang    1       