LuaQ  ]   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_guild_domain\form_guild_war_history.lua           1      A@  @    A�  @    A�  @    A�  @    A  @    A@ @    A� @ � A  �@ �   ǀ �@  �� �  �  ��  �@ �  ǀ �@ �� �    �  ��       � �@ �    � ǀ �@ ��  �       require 	   util_gui    share\client_custom_define    util_functions    define\sysinfo_define    share\itemtype_define    util_static_data 9   form_stage_main\form_guild_domain\form_guild_war_history       $@     `k@   main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_pre_click    on_btn_next_click ,   on_textgrid_war_history_mousein_row_changed    update_form_info    request_page_info    get_max_info 
                  	@@�	�@�	�@� �       Fixed     page_index       �?
   max_index                          form                   ,     B   E   �@  \� ��� ��@ �� � A	� ���� ƀA �� � A	����  ��� 	����@B ��B� E �A �� � \  �@  �@B ��B� E �A � � \  �@  �@B ��B E �A �A � \  �@  �@B ��B� E �A �� � \  �@  �@B ��B E �A �A � \  �@  �� �   � �@� �    	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height 
   max_count    get_max_info    textgrid_war_history    SetColTitle            nx_widestr 
   util_text    ui_dr_col_name_2       �?   ui_dr_col_name_0    ui_dr_col_name_1       @   ui_dr_col_name_4       @   ui_dr_col_name_5    request_page_info     B                                               #   #   #   %   %   %   %   %   %   %   %   %   &   &   &   &   &   &   &   &   &   '   '   '   '   '   '   '   '   '   (   (   (   (   (   (   (   (   (   )   )   )   )   )   )   )   )   )   +   +   +   +   ,         form     A      gui    A           /   0         �            0         form                 3   5        F @ K@� \@  �       ParentForm    Close        4   4   4   5         btn                8   H        F @ �@� �@@ �	 �� � �@� ������ � � A� �@�@��@� �@  �	 �� �       ParentForm    page_index       �?   Enabled  	   btn_next    request_page_info        9   ;   ;   ;   <   =   @   @   C   C   C   C   C   E   E   E   F   H         btn           form               K   [        F @ �@� ƀ� ��@ �	 �� � �@� ������ � � A� B�@��@� ƀ� �   �	 �� � 	      ParentForm    page_index 
   max_index    Enabled     btn_pre    request_page_info       �?       L   N   N   N   N   O   P   S   S   V   V   V   V   V   X   X   X   X   Y   [         btn           form               ^   }    6   �   A  ܀ �  @�� A    � � ���  ��    � � A @� @ �	�A� � E  � \� ��  ���� �A    � � �A ƁB�� ���@ ܁��A    � � ��@ �B �� � ܁  B E� �� �  �� \  �  	 � �    	   nx_value    SwitchManager    nx_is_valid    CheckSwitchEnable    ParentForm         	   HintText        common_array 
   nx_string    Name 
   FindArray 
   FindChild    nx_widestr    util_format_string    ui_guild_war_history_tips    nx_int     6   _   _   _   `   `   `   `   `   a   d   d   d   d   d   e   h   j   j   k   l   o   o   o   p   p   p   p   p   q   t   t   t   v   v   v   v   v   w   z   z   z   z   z   z   |   |   |   |   |   |   |   |   |   }         grid     5      new_row     5      old_row     5      switch_manager    5      form    5      common_array    5      array_name     5      reduce_occvalue ,   5         ST_FUNCTION_NEW_GUILDWAR     �   �   �   �   �@@� � �  ���W�@  � � �  �   �� �@   ܀ �@    � � �  � ܀ A @�� A    � � � FB� KA�� \��Z  � �K��� \A�K���   A �� \A EA �  \� �A ƁC�� @  ��CE  F��� �� \� �@��FADK��\A T� O����  ���� ����E��D�� ���BƂC��  ����BD�BE� ����BD���@ ��  � ��DF� � �B  �BD���@ �� � ���F� � �B  �BD���@ �C � � A �� ΄��D�	�Ą �� U�� �  �B  �BD���@ �� � ���G� � �B  �BD���@ �C � ���D� � �B  ���@ �� � �� � ���@� � �B  ��� �        math    mod       @        	   nx_value    nx_is_valid    common_array 
   nx_string    Name 
   FindArray    RemoveArray 	   AddArray       N@   nx_int 
   max_count 
   max_index    ceil    textgrid_war_history 	   ClearRow       �?   page_index 
   InsertRow       �   SetGridText    nx_widestr        @      @
   util_text 
   ui_dipan_       @      @	   AddChild     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         rows     �      arg     �      form    �      common_array    �      array_name    �      count ?   �      (for index) B   �      (for limit) B   �      (for step) B   �      i C   �      row P   �         FORM_GUILD_WAR_HISTORY    PAGE_COUNT     �   �    0    �   � � 	@����@ �   � ܀  AA � E ��A \� �@�������� �   �� ��A�  A ܀ � @�� A  @ �   � K��A � ܁ B @ � EB � \� �B �  ������ \A   �               page_index 	   lbl_page    Text    nx_widestr    / 
   max_index       �?	   nx_value    game_visual    nx_is_valid       ;@   CustomSend    nx_int    CLIENT_CUSTOMMSG_GUILD_WAR     0   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     /      page_index     /      from    /      game_visual    /   "   CLIENT_SUBMSG_REQUEST_WAR_HISTORY    /         PAGE_COUNT     �   �            A@  ��  ��  � E  �   \� Z@  @ �A@ ^  K�A �� \��@� @ ��@ �  � B  � AA �A ����   � 
      nx_execute    util_functions    get_ini    share\War\GuildWar.ini    nx_is_valid            FindSectionIndex    history_count    ReadInteger    r        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         ini          section_index       	   max_info           1                                                                  	               ,      0   /   5   3   H   8   [   K   }   }   ^   �   �   �   �   �   �   �   �   �   �         FORM_GUILD_WAR_HISTORY    0      PAGE_COUNT    0      ST_FUNCTION_NEW_GUILDWAR    0       