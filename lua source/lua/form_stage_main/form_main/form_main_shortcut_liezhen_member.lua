LuaQ  `   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_main\form_main_shortcut_liezhen_member.lua                 A@  @    A�  @ �  A  �   �   �@ �@  ǀ �  �� ��    � �  �  �@ �@ ǀ �    �� �� �   �       require    util_static_data    util_functions     ini\ui\wuxue\zhenfa_liezhen.ini    share\Skill\skill_new.ini    main_form_init    on_main_form_open    on_main_form_close 
   show_form 
   hide_form    change_form_size    timer_callback    on_space_up                   	@@�A�  ^   �       Fixed       �?                         self                   F     ,   E   �@  \� ��  � � �� �@    � � I ���@ �@� �   ƀA�AF����L��@  ��@B�����Bɀ��  �� �� Ł    ܁ �  @��CAB �� �� ܂�  @  �C �C �A�	�Ĉ �    	   nx_value -   form_stage_main\form_main\form_main_shortcut    nx_is_valid    Visible     change_form_size    lbl_skill_block    Width    Left                @   GAME_TIMER 	   Register       I@      �   nx_current    timer_callback    is_new_game     ,                              !   1   1   3   4   5   6   6   6   7   7   8   :   :   :   =   =   =   >   >   >   >   >   A   A   A   A   A   A   A   A   A   A   E   F         self     +      shortcut_grid    +      form    +      label_block    +   
   formWidth    +      pos    +      timer    +           I   d     "   E   �@  \� ��  � � �� �@    � � I ���   �@ �� ŀ    ܀ �   @�ˀAE� \�� � �  �@��@    �@ ŀ � �� E� \� �@   �    	   nx_value -   form_stage_main\form_main\form_main_shortcut    nx_is_valid    Visible    GAME_TIMER    UnRegister    nx_current    timer_callback    nx_destroy    nx_set_value    nx_null     "   K   K   K   L   L   L   L   L   M   O   ]   ]   ]   ^   ^   ^   ^   ^   _   _   _   _   _   _   b   b   b   c   c   c   c   c   c   d         self     !      shortcut_grid    !      timer    !           g   �    
;   E   �@  ��  �  B� \���  � � �� �@    � � �@ �   � A� �  ܀  @�� A  � � A�  � A��� �  � �     ����� �  � �   �@�KA�� � A \���� �� ����  A� 	� �E  �A  �� �  B� \A� �       nx_execute 	   util_gui    util_get_form <   form_stage_main\form_main\form_main_shortcut_liezhen_member    nx_is_valid        util_functions    get_ini 
   hide_form    FindSection 
   nx_string    FindSectionIndex            ReadInteger    StaticData    skill_static_query    Photo    lbl_skill_block 
   BackImage    util_show_form     ;   i   i   i   i   i   i   j   j   j   j   j   k   n   p   p   p   p   p   q   q   q   q   q   s   s   t   w   w   w   w   w   w   w   x   x   x   x   x   y   y   z   z   z   z   z   |   |   |   |   |   �   �   �   �   �   �   �   �   �      	   begin_id     :      form    :   
   photo_res    :   	   skillini    :   
   sec_index &   2      static_data -   2      label_block 3   :         LIEZHEN_SKILL_INI_PATH     �   �            A@  � E�  �   \� Z   @ �K�@ \@  �    	   nx_value <   form_stage_main\form_main\form_main_shortcut_liezhen_member    nx_is_valid    Close        �   �   �   �   �   �   �   �   �   �   �         form    
           �   �            A@  � E   ��  \� ��  �   �� �@    � � �   �  �� ƀA����A �A� �	����@� ƀ��B � �� �	� � �    	   nx_value <   form_stage_main\form_main\form_main_shortcut_liezhen_member -   form_stage_main\form_main\form_main_shortcut    nx_is_valid    gui    Left    Width        @   Top    groupbox_shortcut_1    AbsTop    Height      �U@       �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form          shortcut_grid          gui               �      "   � @ A@ F�@ ���Ɓ�������� �� ��	���	������@��  �A  � �	��� �  ������@��  �  � �	�  �  ��������� �       lbl_skill_block 
   lbl_space    Width    Left       T@   is_new_game 
   BackImage ,   gui\animations\liezhen\liezhen_space_on.png      p|@   liezhen_space      `}@       @    "   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                          form     !      para1     !      para2     !      label_block    !      label_space    !   
   formWidth    !      pos    !         liezhen_space_animation       9     <      A@  � E�  �   \� Z@  @ �B   ^  F�@ Z@  @ �B   ^  F A Z@  @ �B � ^  F@A ��A �� �� � �@� � ����@� �B ��� �@C��� ��C��� �@D��� ��  AA �� �@����� ��E��� ��C��� �@D��� ��  AA �� �@�	�C�� � �   �    	   nx_value <   form_stage_main\form_main\form_main_shortcut_liezhen_member    nx_is_valid    Visible    is_new_game    lbl_skill_block    ani_res    ani_result    Left      �|@     `}@   AnimationImage    liezhen_win    Loop  	   PlayMode            nx_execute    custom_sender    custom_send_liezhen_skill        @       liezhen_fail     <                                             "  "  #  #  %  %  %  %  %  %  )  )  *  *  +  +  ,  ,  ,  ,  ,  ,  ,  1  1  2  2  3  3  4  4  4  4  4  4  7  8  8  9        form    ;      label_block    ;          
   
   
                           F      d   I   �   �   g   �   �   �   �       �   9    9        LIEZHEN_INI_PATH          LIEZHEN_SKILL_INI_PATH          liezhen_space_animation 	          