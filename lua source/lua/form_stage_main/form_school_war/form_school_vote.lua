LuaQ  U   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_school_war\form_school_vote.lua           "      A@  @    A�  @    A�  @ @   � � $     $@  @ $�  � $�  � $    $@ @ $� � $� � $    $@ @  �       require    util_functions 	   util_gui 	   util_vip    VoteZhangmen       *@   ChangeVoteDesc       ,@   main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_btn_votezhangmen_click    on_btn_editzhanglaodesc_click    on_btn_votezhanglao_click    on_btn_editzhangmendesc_click    CheckRight    show_voteform 
                  	@@� �       Fixed                     form                           E   �@  \� ��� ��@ �� � A	� ���� ƀA �� � A	��� �    	   nx_value    gui    Left    Width        @   Top    Height                                                        self           gui                          E   �   \@  �       nx_destroy                          form                           F @ K@� \@  �       ParentForm    Close                          btn                !   =     0   F @ �@  ��� �@    � � ��  ��  �� �  A A� �� ��   ܀ BAB�� A�B�B�� �ACA�� FBK��\ �  F�I��K��\A E� � ��B \� ��@�� ��  EB �� �A� �       ParentForm    CheckRight 	   nx_value    gui    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    TextManager    Format_SetIDName    ui_schoolcontest_prompt_1    Format_AddParam    lbl_zhangmenname    Text    nx_widestr    Format_GetText    mltbox_info 	   HtmlText 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    custom_sender !   custom_request_school_pose_fight    VoteZhangmen             0   "   $   $   $   $   %   (   (   (   *   *   *   *   *   *   *   ,   ,   ,   ,   -   -   -   -   -   0   0   0   0   0   2   2   4   4   7   7   7   7   7   8   8   9   9   9   9   9   9   =         btn     /      form    /      gui 	   /      dialog    /      Text    /      res '   /           @   S     &   F @ �@  ��  �� ��   AA �� ��   ܀ � FBKA�Ł � � \  �  F�I��K��\A E� � ��B \� ������  ��  EB ��� ��E�A� �       ParentForm 	   nx_value    gui    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    nx_widestr    TextManager    GetFormatText 
   nx_string    ui_schoolcontest_prompt_4    mltbox_info 	   HtmlText 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    custom_sender !   custom_request_school_pose_fight    ChangeVoteDesc    redit_zhanglao    Text     &   A   C   C   C   E   E   E   E   E   E   E   H   H   H   H   H   H   H   H   J   J   L   L   O   O   O   O   O   P   P   Q   Q   Q   Q   Q   Q   Q   S         btn     %      form    %      gui    %      dialog    %      Text    %      res    %           U   n     0   F @ �@  ��� �@    � � ��  ��  �� �  A A� �� ��   ܀ BAB�� A�B�B�� �ACA�� FBK��\ �  F�I��K��\A E� � ��B \� ��@�� ��  EB �� �A� �       ParentForm    CheckRight 	   nx_value    gui    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    TextManager    Format_SetIDName    ui_schoolcontest_prompt_1    Format_AddParam    lbl_zhanglaoname    Text    nx_widestr    Format_GetText    mltbox_info 	   HtmlText 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    custom_sender !   custom_request_school_pose_fight    VoteZhangmen       �?    0   V   X   X   X   X   Y   \   \   \   ^   ^   ^   ^   ^   ^   ^   `   `   `   `   a   a   a   a   a   c   c   c   c   c   e   e   g   g   j   j   j   j   j   k   k   l   l   l   l   l   l   n         btn     /      form    /      gui 	   /      dialog    /      Text    /      res '   /           q   �     &   F @ �@  ��  �� ��   AA �� ��   ܀ � FBKA�Ł � � \  �  F�I��K��\A E� � ��B \� ������  ��  EB ��� ��E�A� �       ParentForm 	   nx_value    gui    nx_execute 	   util_gui    util_get_form    form_common\form_confirm    nx_widestr    TextManager    GetFormatText 
   nx_string    ui_schoolcontest_prompt_4    mltbox_info 	   HtmlText 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    custom_sender !   custom_request_school_pose_fight    ChangeVoteDesc    redit_zhangmen    Text     &   r   s   s   s   u   u   u   u   u   u   u   x   x   x   x   x   x   x   x   z   z   |   |                  �   �   �   �   �   �   �   �   �   �         btn     %      form    %      gui    %      dialog    %      Text    %      res    %           �   �      
V      A@  � E�  �   \� Z@  @ �B   ^  K�@ \� ��  � � �� �@  @ ��   �  �  � � A ����   ����� � ���� �@ �� � �  �@ �� � A �� �  B ���ŀ    ܀ �@  @ ��   �  �   � ܀ �CFA�K���� \��	A�A�E�A ��EA � ��   @ \A�K�E\A E �A � � \� @����� �A �� �A  � ��� �A �A �  �  �    	   nx_value    game_client    nx_is_valid 
   GetPlayer    is_vip 
   VT_NORMAL 
   QueryProp    PowerLevel       :@   nx_execute 	   util_gui    util_get_form    form_common\form_confirm 	   chat_vip    gui    ok_btn    Text    TextManager    GetText    ui_chat_vip_btn    GetFormatText    ui_chat_vote_tips    show_common_text 
   ShowModal    nx_wait_event     �חA   confirm_return    ok    util_is_form_visible    form_stage_main\form_vip_info    util_auto_show_hide_form     V   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         game_client    U      client_player    U      dialog (   U      gui 2   U      text <   U      res I   U           �       �     AB  � E�  ��  �� \��� ���� �B    � � �B���A�B ��A�BC @   ��  �  ����A��BC @   ��     ��A�BC @  ��  �  ����A��BC @  ��    ��A��B �B���A�BC   �B���A�BC  �B��B���C� F�AK�\ �  AC �B �����    ܂ ������   ܂ ���B �� � A �� �   ܂ �  @��BFEC � \ ܂  ����� KG��D A� \��CF���� ��A˃�@ ����  I���CF�C � � �  � ����� KG��D A� \��C C�E� ��A��B ��\�  	C��Ƃ�� @� � ������� @�� �����ɂɒ���ɂɒ��ɂʔ���ɂʔ�   ܂  @�� C    � � C��� ��� �  E� � \� �� �� �� �� �F�AK���� \�� �F��� � �� I���KC���  �� \�   �E� � \� �� �� �� �� �F�AK���� \�� �F���� � �� I���E  �� \� ���� �   ܃ �C    � � �CLA� ܃� �� ��	�ʒ��	�ɔ �� ���	�ʒ�	�ɔ� A�  �� D� � 4   	   nx_value    gui    util_get_form 1   form_stage_main\form_school_war\form_school_vote    nx_is_valid    mltbox_votedesc    Clear    TextManager 	   IsIDName 
   nx_string    GetFormatText    Format_SetIDName    ui_schoolcontest_announce    Format_AddParam    AddHtmlText    nx_widestr    Format_GetText       �   lbl_zhangmenname    Text    lbl_zhanglaoname    nx_execute    util_functions    get_ini    share\War\SchoolPose_Info.ini    FindSectionIndex            role_title_    ReadString 
   GetOrigin        lbl_zhangmenoriginname 	   postitle    lbl_zhanglaooriginname    lbl_piaonum1    lbl_piaonum2    redit_zhangmen 	   ReadOnly    redit_zhanglao    btn_editzhanglaodesc    Visible     btn_editzhangmendesc    CheckWords    CleanWords !   ui_schoolcontest_manifesto_first    game_client 
   GetPlayer 
   QueryProp    Name    util_show_form     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                         zhangmenname     �      zhangmenvote     �      zhangmentitle     �      zhangmendesc     �      zhanglaoname     �      zhanglaovote     �      zhanglaotitle     �      zhanglaodesc     �      gui    �      form    �      ini R   �      index \   �   	   postitle e   m      CheckWords �   �   	   votedesc �   �      game_client �   �      client_player �   �   	   playname �   �       "            	   	   	   
   
   
                                       =   !   S   @   n   U   �   q   �   �     �             