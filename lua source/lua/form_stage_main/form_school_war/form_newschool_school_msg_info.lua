LuaQ  c   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_school_war\form_newschool_school_msg_info.lua           �     A@  @    A�  @    A�  @    A  @    A@ @    A� @    A� @    A  @    A@ @    A� @    A� @   A@ �� �� �@ �  �� �� �@ �  �  �� � A �A �@ �  � A� � �A �@ 
 	�G�	AH�	�H�	AI�J I�I�IAJ�I�J�IAK�I�K�IAL�I�L�IAM�� ��M���M��N��AN���N���N��O��AO��  
 	�O�	�O�	P�	BP�	�P�	�P�	Q�	BQ�J  � �� � �B �B  AC �� �� $   $D  D $�  � $�       �   � $  $D D $� � $� � $  $D     D $� � $� � $  $D D $� � $� � $  $D D $� � $� � $  $D D $� � $� � $  $D D $�    � $� � $  $D D $� � $� � $  $D D $� � $� � $	  $D	 D $�	 � $�	 � $
   � $D
 D $�
 � $�
 � $   � $D D $� � $� � $   � $D D $�     � $� � $   $D D  $� �  $� �  $ ! $D D! $� �! $� �! $ " $D D" $� �" $� �" $ # $D D# $� �# $� �# $ $ $D D$ $�     �$ $� �$ $ % $D D% $� �% $� �% $ & $D D& $� �& $�       �  � �& $     ' $D D' $� �' $� �' $ ( $D D( $� �( $� �( $ ) $D D) $� �) $� �) $ * $D D* $� �* $� �* $ + $D D+ $� �+ $� �+ $   �, $D    D, $� �, $�   ��, $ - $D D- $� �- $� �- $ . $D D. $� �. $� �. $ / $D D/ $� �/ $� �/ $ 0 $D       �D0 $�     �0 $�     �0 $ 1 $D D1 $� �1 $� �1 $ 2 $D D2 $� �2 $�        �2 $  3 $D  D3 $�  �3 $�  �3 $! 4 $D! D4 $�! �4 $�!    �4 $" 5 $D" D5 $�" �3 $�" �3 $# �5 $D# �5 $�# 6 $�# D6 $$ �6 $D$ �6 $�$ 7 $�$ D7  � �      require    util_functions 	   util_gui    role_composite    define\gamehand_type 	   util_vip    share\view_define 
   tips_data    share\server_custom_define    util_static_data    share\static_data_type    custom_sender ?   form_stage_main\form_school_war\form_newschool_school_msg_info            INI_FORCE_INFO     share\War\new_school_config.ini    INI_DEVELOP_PROP '   share\NewSchool\NianLuoDevelopProp.ini    FORM_WIDTH_WANFA      0�@   FORM_WIDTH      ��@#   gui\create\school_select\bq_1n.png #   gui\create\school_select\bq_2n.png #   gui\create\school_select\bq_3n.png #   gui\create\school_select\bq_4n.png #   gui\create\school_select\bq_dz.png #   gui\create\school_select\bq_zs.png #   gui\create\school_select\bq_zl.png #   gui\create\school_select\bq_zm.png    ArtPack    Cloth    HatArtPack    Hat    PlantsArtPack    Pants    ShoesArtPack    Shoes    newschool_gumu       �?   newschool_xuedao        @   newschool_huashan       @   newschool_damo       @   newschool_shenshui       @   newschool_changfeng       @   newschool_nianluo       @   newschool_wuxian        @   repute_gumu    repute_xuedao    repute_huashan    repute_damo    repute_shenshui    repute_changfeng    repute_nianluoba    repute_wuxian    ui_schoollaw_rule_gumu    ui_schoollaw_rule_xuedao    ui_schoollaw_rule_huashan    ui_schoollaw_rule_damo    ui_schoollaw_rule_shenshui    ui_schoollaw_rule_changfeng    ui_schoollaw_rule_nianluo    ui_schoollaw_rule_wuxian    0,199,ui_lot_title_01    200,999999,ui_lot_title_02    gg    ry    cf       y@   main_form_init    on_main_form_open    hide_or_show    InitMsg 	   InitDate    on_main_form_close    on_btn_close_click    BingBoxToBtn 
   get_force    on_m_checked_changed    is_player_in_xuedao 
   freshPag1    LoadNewSchoolInfo    on_btn_cloth_left_right_click     on_btn_neigong_left_right_click    on_btn_taolu_left_right_click    show_cloth    show_neigong    show_taolu $   on_ImageControlGrid4_select_changed $   on_ImageControlGrid3_select_changed "   on_ImageControlGrid2_mousein_grid "   on_ImageControlGrid3_mousein_grid '   on_ImageControlGrid_skill_mousein_grid #   on_ImageControlGrid3_mouseout_grid $   on_ImageControlGrid2_select_changed    change_cloth    show_skill    show_taolu_info 	   set_star )   on_ImageControlGrid_skill_select_changed    get_skill_id    get_cur_taolu_id    show_skill_action    add_weapon    get_weapon_name    on_rbtn_desc_checked_changed    on_ma_checked_changed 
   freshPag2    on_rbtn_mb_click    CreateChlieAndBindP2    get_treeview_bg    on_btn_mb_click 
   freshPag3    on_rbtn_mc_click 
   freshPag4    hide_or_show_child4    CreateChlieAndBindP4    on_rbtn_md_click    get_tvt_times    on_textgrid_select_row 
   freshPag5    CreateChlieAndBindP5    LoadDevelopInfo    on_rbtn_fm_changed 
   freshPag6 
   freshPag8 
   freshPag9    freshPag10    freshPag12    freshPag13    freshPag15    loadDevelopProp    on_imagegrid_1_mousein_grid    on_imagegrid_1_mouseout_grid    CreateChlieAndBindP6    on_btn_mg_click    on_mltbox_mhb_click_hyperlink 
   freshPag7    request_school_notice    refresh_school_notice    is_school_leader    on_btn_notice_modify_click    on_btn_notice_click    on_btn_notice_close_click    LoadTreasureInfo    LoadNewSchoolPoseInfo    get_xiae_text 
   GetTitles    request_msg    refresh_new_school_trends    CreateChlieAndBindP7    on_btn_hl_click    set_player_info    on_btn_hr_click    show_left_box    clone_button    clone_checkbutton    clone_mltboxbox    clone_groupbox    clone_label    clone_Image    create_model    on_right_click    on_right_push    on_left_click    on_left_push $   on_cbtn_player_info_checked_changed    on_btn_player_info_hide_click 
   open_form    GetShenfen    get_player_repute_record_force    send_msg_get_taskinfo    on_school_msg    fresh_round_task    fresh_task    CreateImage    set_copy_ent_info    clear_grid_data 
   set_force    clear_tree_view    get_school_rule_value    get_powerlevel_title_one    on_mousein_grid    on_mouseout_grid 
   show_tips    on_btn_fb1_1_click    query_condtion_msg    show_task_price    on_btn_task_click    CreateZaXueImage    show_new_school_contribute    on_btn_lot_exchange_click    on_imagegrid_lot_mousein_grid    on_imagegrid_lot_mouseout_grid    load_page_shimen    on_btn_paihang_click    update_lot_info 
   load_fqfs    load_ssg_yjp    on_icg_mousein_grid    on_icg_mouseout_grid    on_rbtn_ss_1_checked_changed    on_rbtn_ss_2_checked_changed    on_rbtn_ss_3_checked_changed    InitRuleDate    freshPag14    load_guzhong_tool "   on_ImageControlGrid5_mousein_grid #   on_ImageControlGrid5_mouseout_grid "   on_ImageControlGrid6_mousein_grid #   on_ImageControlGrid6_mouseout_grid "   on_ImageControlGrid7_mousein_grid #   on_ImageControlGrid7_mouseout_grid "   on_ImageControlGrid8_mousein_grid #   on_ImageControlGrid8_mouseout_grid �       z   }        	@@� �       Fixed         |   }         form                   �     W   E   �@  \� ��  � � �� �@    � � � � � A �� �@A��A	���� � � B �� �@A	����@ �   �@ �� �   �@ �  �� �� 	�����B �@C�@ �  �� �� 	� ���C �@C�@ �  �� �� 	�����C �@C�@ �@ �   �� 	� ��� �   �@ �� �   �@ �  �   �@ �@ �   �@ 	�E��  �   �@ �@F ��F�� G ��F��@G ��F�	�G�	�G��@ �@� �� 	� �	�G�	 ɑ	�ǒ	 I�	�Ǔ	 I�	�ǔ � *   	   nx_value    gui    nx_is_valid    Left    Width        @     �[@   Top    Height 
   load_fqfs    load_ssg_yjp    new_school_info    get_arraylist    ClearChild    force_round_task_info    force_task_info    school 
   get_force    InitMsg 	   InitDate    BingBoxToBtn    InitRuleDate    actor2  
   set_force    grp_tvt_info    Visible     grp_shaqi_info 	   grp_task    task_id         	   tvt_type    query_condtion_msg    FORM_WIDTH    cloth        cloth_offset    neigong    neigong_offset    taolu    taolu_offset     W   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     V      gui    V           �   �     \   E   �@  ��  �  \� �  � � �� �@    � � �@� � F�A  ��  � � @ �A �� ܀�� @�� ��J  �A Ł ���  ܁ B ���D �BD� E� ��\� C����D �B�A� �� �C�� U��܂�� @�� E� �C\� W@ �
�  F�	C�FC�	C��E� �C\� I�� @�� ��E �E��CE������ @�� �E��� @�� �CE����Ƌ�A� �       nx_execute    util_functions    get_ini (   share\ForceSchool\forceUI\ShiLibase.ini    nx_is_valid    FindSectionIndex 
   nx_string    school    ReadString    Label        util_split_string    ,       �?   table    getn    groupbox_main_menu    Find    rbtn_m 
   nx_number    Top    Left     Visible     \   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     [   	   base_ini    [      nIndex    [      str_lal    [   
   name_list    [      t_btn    [      (for index)     [      (for limit)     [      (for step)     [      i !   Z      pos_btn )   Z      btn 1   Z      op >   B           �   �       F @ K@� ŀ    �  \@  F @ K@� ŀ  � �  \@  F @ K@� ŀ   �  \@  	 ��	 ��	 A� �       new_school_info    CreateChild 
   nx_string    msg_num_gg            msg_num_ry    msg_num_cf        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form              gg_msg    ry_msg    cf_msg     �   >    r   E   �@@ \� W��  �E   �@@ \� ��   � � E  �@ \� ��A �  A� �B�A@ �܀  ������B �@C���C �@C���C �@C�� D �@C��@D �@C���D �@C���D �@C�� E �@C��@E �@C���E �@C���E �@C�� F �@C��@F �@C���F �@C���B �@Í��C �@Í��C �@Í� D �@Í�@D �@Í��D �@Í��D �@Í� E �@Í�@E �@Í��E �@Í��E �@Í� F �@Í�@F �@Í��F �@Í�@@ W� �@ ��@G �@Í�@@ W� �@ ���G �@Í�@@ W� �@ �� H �@Í�@@ W���@ ���H �@Í�@@ W���@ �� I �@Í�@@ W���@ ���I �@Í�@@ W���@ �� J �@Í � )   
   nx_string    school    0     	   nx_value    gui 
   lbl_Title    Text    nx_widestr    TextManager    GetFormatText    groupbox_m1    finsh_fresh     groupbox_m2    groupbox_m3    groupbox_m4    groupbox_m5    groupbox_m6    groupbox_msg    groupbox_gumu    groupbox_shimen    groupbox_nianluo    groupbox_changfeng    groupbox_shenshui    groupbox_wuxian    groupbox_jingshu    Visible    newschool_nianluo    rbtn_m5    newschool_gumu    rbtn_m8 	   rbtn_m12    newschool_changfeng 	   rbtn_m10    newschool_shenshui 	   rbtn_m13    newschool_wuxian 	   rbtn_m14    newschool_damo 	   rbtn_m15     r   �   �   �   �   �   �   �   �   �   �   �                                                	  	  
  
                                                                                    !  !  #  #  #  $  $  '  '  '  (  (  +  +  +  ,  ,  /  /  /  0  0  3  3  3  4  4  7  7  7  8  8  ;  ;  ;  <  <  >        form     q      gui    q           @  R    '   E   �@  ��  �@ \@ F A K@� \@ F�A K@� \@ F�A K@� \@ E  �@B �� � \@ E  � C �� A \@ E� �� \� �  � � �� �   � ��@ � � �@ �@ �   �@  �       nx_execute 	   util_gui    ui_ClearModel    scenebox_2    new_school_info    ClearChild    force_round_task_info    force_task_info    clear_grid_data    textgrid_1        @      @   textgrid_2       @	   nx_value    form_create_introduce    nx_is_valid    nx_destroy     '   A  A  A  A  A  C  C  C  D  D  D  E  E  E  H  H  H  H  H  I  I  I  I  I  K  K  K  M  M  M  M  M  N  N  N  Q  Q  Q  R        form     &      form_create_introduce    &           T  \    
   F @ �@  � � �� �@    � � ��� �@  �       ParentForm    nx_is_valid    Close     
   U  W  W  W  W  W  X  [  [  \        btn     	      form    	           _      G   F @ ��@ I���F�@ � A I���F@A ��A I���F�A � B I���F@B ��B I���F�B � C I���F@C ��C I���F�C � D I���F@D ��D I���F�D � E I���F@E ��E I���F�E � F I���F@F ��F I���F�F � G I���F @ I�ǎF�@ I�ǎF@A I ȎF�A I@ȎF@B I�ȎF�B I�ȎF@C I ɎF�C I@ɎF@D I�ɎF�D I�ɎF@E I ʎF�E I@ʎF@F I�ʎF�F I�ʎ � ,      rbtn_m1    box    groupbox_m1    rbtn_m2    groupbox_m2    rbtn_m3    groupbox_m3    rbtn_m4    groupbox_m4    rbtn_m5    groupbox_m5    rbtn_m6    groupbox_m6    rbtn_m7    groupbox_msg    rbtn_m8    groupbox_gumu    rbtn_m9    groupbox_shimen 	   rbtn_m10    groupbox_changfeng 	   rbtn_m12    groupbox_nianluo 	   rbtn_m13    groupbox_shenshui 	   rbtn_m14    groupbox_wuxian 	   rbtn_m15    groupbox_jingshu    freshUI 
   freshPag1 
   freshPag2 
   freshPag3 
   freshPag4 
   freshPag5 
   freshPag6 
   freshPag7 
   freshPag8 
   freshPag9    freshPag10    freshPag12    freshPag13    freshPag14    freshPag15     G   a  a  a  b  b  b  c  c  c  d  d  d  e  e  e  f  f  f  g  g  g  h  h  h  i  i  i  j  j  j  k  k  k  l  l  l  m  m  m  n  n  n  q  q  r  r  s  s  t  t  u  u  v  v  w  w  x  x  y  y  z  z  {  {  |  |  }  }  ~  ~          form     F           �  �    s   E   �@  \� ��  � � �� �@  @ ���  �  � � �� ŀ    ܀ �@  @ ���  �  �@AA� ܀�� A �A �� � K�B�  �� \�  �AC �A� �� ����AC@�� �� ܁�BC���B � ��KBA�   � \�  �� ���� 	���� ���� 	��� � �� 	����BA� ���	���BA ���	����BA� ���	����� � �  ܂  FCF  ��  �  � �� �� �� 	����� �  ����	����� �  �� ��  �   ܂  F��K��� \��  	 �� @�    � $   	   nx_value    game_client    nx_is_valid    0 
   GetPlayer 
   QueryProp 
   NewSchool    nx_execute    util_functions    get_ini (   share\NewSchool\NewSchoolSkillPoint.ini    FindSectionIndex 
   nx_string    ReadString    Name        MaxAll    Tips    skill_point    nx_int    skill_point_max    skill_point_tips    player_name    player_shili    PowerLevel    player_guild 
   GuildName    nx_ws_equal    nx_widestr    player_repute    get_player_repute_record_force    GetShenfen    gui 
   player_sf    TextManager    GetFormatText     s   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     r      game_client    r      client_player    r      playerschool    r   
   skill_ini    r      nIndex     r      skill_point_name %   r      skill_point_max *   r      skill_point_tips /   r      skill_point 4   r      str_sf d   r      gui g   r           �  �   �   F @ �@  � � �� �@    � � ��@ �   @���@ � A�@  @��@ �   �A @� ��@ �@���@ ƀ@ ����� � �@��� ��@�   ����� �@� � �@�@� �@��� ��Ã�@ I� ������ ��@�@  � ���� �@�� I� ���� ��@�   ����� ��Ã� � �@�@� ��Ã��� �@�@ I� ������ ��@�@  ����� �@� � �@�@� �@�� I� �� � ��@@B� ��@� �@ ���� W� �@ ��@� ��Ã� � ��@�    ��@ �� �� �@    ܀ �@    � � ��FE �A \� � �� � �@  �� ��� � �  @ �A� �@� ���@� ƀ��   ���   � ��@ I� �@ ��� I� � � "      ParentForm    nx_is_valid    Checked    box    finsh_fresh    nx_execute    freshUI    Visible 	   grp_task     rbtn_m4    groupbox_notice    btn_notice    btn_notice_close    grp_tvt_info    Width    FORM_WIDTH_WANFA    rbtn_m7    FORM_WIDTH    rbtn_m9    groupbox_paihang    newschool_nianluo    school    rbtn_m5 	   nx_value    game_visual    CustomSend    nx_int      ��@           is_player_in_xuedao    grp_shaqi_info    rbtn_m6     �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           form          game_visual ^   l      is_xue_dao n         
   form_name            (      A@  � E�  �   \� Z@  @ �B   ^  K�@ \� ��  � � �� �@  @ ��   �  � � A ���W� �����  ܀ � @ �  �@ ��   �  W@B  ��@  � � �   � 
   	   nx_value    game_client    nx_is_valid 
   GetPlayer 
   QueryProp 
   NewSchool  
   nx_string        newschool_xuedao     (                       
  
                                                                client    '      player    '      force    '             #       �   �   �@ �@  �   �@ ��  � � �� �     �I �� �       LoadNewSchoolInfo    create_model    nx_is_valid    finsh_fresh                                   !  #        form           box                &  T    b   E   �   \� Z@    � � E@  ��  \� �   � � �� �   �����  FAA  ��  � ������ @ � �A ܀��� � �� B ��K�� � � AB \�����   A �B ����AC �� ���C ���D �A��AD Ɂ��@C ��D��@  �  �� @  �   � � �� �    	����  FAE  ��  � �@���� @ �� �A ܀�	� ���� @ �� �A ܀�	������ @ � �A ܀�	� ��@    F�E �@�ŀ    F�E �@���    FF �@� �       nx_is_valid    get_ini .   share\NewSchool\NewSchoolUI\NewSchoolInfo.ini    FindSectionIndex 
   nx_string 	   force_id            ReadString    r1        r2    r3    r4    rbtn_5    desc    rbtn_6    rbtn_7    rbtn_8    Checked    ini\form\menpai_create.ini    school    cloth    neigong    taolu    show_cloth    show_neigong    show_taolu     b   '  '  '  '  '  (  +  +  +  -  -  -  -  -  .  .  .  .  .  0  0  1  1  1  1  1  2  2  2  2  2  3  3  3  3  3  4  4  4  4  4  6  6  7  7  8  8  9  9  =  =  ?  ?  ?  ?  A  A  A  A  A  B  B  B  B  B  D  D  F  F  F  F  F  F  H  H  H  H  H  H  J  J  J  J  J  J  M  M  M  M  O  O  O  O  Q  Q  Q  Q  T        form     a      ini 	   a      index    1      desc1    1      desc2    1      desc3 $   1      desc4 )   1      index A   a           W  g       F @ �@  � � �� �@    � � ��@ �    ܀ ���� ��@� ̀�I������    ܀ ���� ��@� ̀�I����   � FA� �@� � 
      ParentForm    nx_is_valid    DataSource    0 
   nx_string    cloth_offset       �?   1    show_cloth    cloth        X  Z  Z  Z  Z  Z  [  ^  `  `  `  `  `  a  a  a  a  b  b  b  b  b  c  c  c  f  f  f  f  g        btn           form          datasource               j  z       F @ �@  � � �� �@    � � ��@ �    ܀ ���� ��@� ̀�I������    ܀ ���� ��@� ̀�I����   � FA� �@� � 
      ParentForm    nx_is_valid    DataSource    0 
   nx_string    neigong_offset       �?   1    show_neigong    neigong        k  m  m  m  m  m  n  q  s  s  s  s  s  t  t  t  t  u  u  u  u  u  v  v  v  y  y  y  y  z        btn           form          datasource               }  �       F @ �@  � � �� �@    � � ��@ �    ܀ ���� ��@� ̀�I������    ܀ ���� ��@� ̀�I����   � FA� �@� � 
      ParentForm    nx_is_valid    DataSource    0 
   nx_string    taolu_offset       �?   1    show_taolu    taolu        ~  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           form          datasource               �  �    P   �@@  @  �	 ����  � � �  ����@@ � �A �A@ � � @��@ ƀ�  ܀ � �	����@@  �  �	 ����A �A AB A �  �A@ ́�B �A@ � A� ���Ƃ� @�� � � KC��   E� ��\� �� �� \C���B��  �  �����D B@  @  �B  � ���ƁD B �A@ � AFB@ X �  �B  � ��� �               cloth_offset    util_split_string    ,       @   table    getn    ImageControlGrid2    Clear    sex       �?   item_query_ArtPack_by_id    Photo    AddItem    nx_widestr       �   btn_9    Visible    btn_8     P   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     O      cloth     O      cloth_list    O      grid    O      sex    O      size    O      grid_index     O      (for index) '   <      (for limit) '   <      (for step) '   <      i (   ;   	   cloth_id )   ;      photo .   ;           �  �    Y   �   �   �� �@    � � ��@ @@  �	@@���  � �  ���ƀ@ �@�� �A@ � � @�ŀ ���  ܀ �@�	� �ƀ@ @�  �	@@�� B A�A A  F�@ L���� ��A� �� �� `��F�� �  �AC �� �����   A ܂�C�� ��� @�� A� �� C��B ��  �  �_��FE ��@ @@  ��A  �� I���F�E �� ��A� �� �AAƁ@ X��  ��A  �� I��� �       nx_is_valid            neigong_offset    util_split_string    ,       @   table    getn    ImageControlGrid3    Clear       �?   get_ini_prop     share\Skill\NeiGong\neigong.ini    StaticData        neigong_static_query    Photo    AddItem    nx_widestr       �   btn_11    Visible    btn_10     Y   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     X      neigong     X      ng_list    X      grid !   X      grid_index $   X      (for index) +   E      (for limit) +   E      (for step) +   E      i ,   D      id -   D      staticdata 3   D      photo 7   D           �      l   �   �   �� �@    � � ��@ @@  �	@@���  � �  ���ƀ@ �@�� �A@ � � @�ŀ ���  ܀ �@�	� �ƀ@ @�  �	@@��  A ܀   @�� A  ��� AA � �  � AA ��A�C KAC\A AA  ��@ ��CŁ ���  ܁ � ���B���@ ܂�D����D @ � A� �� C�L��@��  �  ��A�@������ �C B  �A��C �EB  �A��AE Ɓ@ @�  ��A  �� �����E Ł ���  ܁ �A��@ X�  ��A  �� ��� �       nx_is_valid            taolu_offset    util_split_string    ,       @   table    getn 	   nx_value    form_create_introduce 
   nx_create    nx_set_value    ImageControlGrid4    Clear       �?   GetTaoluPic    AddItem    nx_widestr       �$   on_ImageControlGrid4_select_changed    SetSelectItemIndex    btn_13    Visible    btn_12     l   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                    
  
                                                                        form     k      taolu     k      taolu_list    k      form_create_introduce #   k      grid 1   k      grid_index 4   k      (for index) ;   N      (for limit) ;   N      (for step) ;   N      i <   M      id =   M      photo @   M             &    	   � @ �@@� �  � � �  KA �� B \ �  E� � ��  \A F�A�A � �� I�� � 
      ParentForm    school     
   nx_string    GetItemAddText            show_skill    lbl_79    Text 
   util_text                  !  !  !  !  !  !  #  #  #  #  #  %  %  %  %  %  &        grid           index           form       
   school_id       	   taolu_id               (  ,       � @ �@@��@� �       ParentForm    rbtn_7    Checked        )  +  +  ,        grid           index           form               /  <    !   � @  � ����     � � �@  ˀ@ @� ��  �  ��  �  A A� ܀�ɀ��A � ���B� AA � ��BC � K�C \� ��C �D CD A� �       IsEmpty 
   nx_string    GetItemAddText            nx_execute 
   tips_game    get_tips_ArrayList 	   ConfigID 	   ItemType    ITEMTYPE_ORIGIN_SUIT 
   is_static    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop 
   GridWidth    GridHeight    ParentForm     !   0  0  0  0  0  1  4  4  4  4  4  4  5  5  5  5  6  7  7  8  :  :  :  :  ;  ;  ;  ;  ;  ;  ;  :  <        grid            index            cloth           item                ?  d    O   � @  � ����     � � �@  ��  �� ��    ܀ �@    � � �  AA �� ��  ܀  � A ���A � ��E� � � \���� �A  L��� A� �� � B A� �� ��	� �E� 	B��E� � \� 	B��	��	���	�ƌKG��\��	B��EB  �B \� ��  ���� �    �I�F��B �� � @ �H �� �CH ܃ �H F�H �I �B� � %      IsEmpty 	   nx_value    faculty_query    nx_is_valid 
   nx_string    GetItemAddText            get_ini_prop     share\Skill\NeiGong\neigong.ini    StaticData        neigong_static_query    MinVarPropNo (   share\Skill\NeiGong\neigong_varprop.ini      �A@   BufferLevel       B@   nx_execute 
   tips_game    get_tips_ArrayList 	   ConfigID 	   ItemType    ITEMTYPE_NEIGONG 
   nx_number    Level 
   is_static    WuXing 
   GetWuXing    tips_manager    InShortcut    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop 
   GridWidth    GridHeight    ParentForm     O   @  @  @  @  @  A  D  D  D  F  F  F  F  F  G  J  J  J  J  J  J  K  K  K  K  K  K  M  M  M  M  O  O  P  P  P  P  O  S  T  T  T  T  U  V  V  W  W  W  W  X  Y  Z  [  [  [  [  ]  ]  ]  ^  ^  ^  ^  ^  _  b  b  b  b  c  c  c  c  c  c  c  b  d  
      grid     N      index     N      faculty_query 	   N      neigong    N      staticdata    N      min_varpropno    N      bufferlevel &   N      level '   N      item +   N      tips_manager <   N           g  y    ,   � @  � ����     � � �@  ˀ@ @� ��  �  ��  �  A @ �� �� ܀� AA �� ��	���EA 	A�E� ��\� 	A�	ć	�ĈE �A ��   KE \� �BE �� ƂE �E FF \A� �       IsEmpty 
   nx_string    GetItemAddText            get_ini_prop    share\Skill\skill_new.ini    StaticData        nx_execute 
   tips_game    get_tips_ArrayList 	   ConfigID 	   ItemType    ITEMTYPE_ZHAOSHI 
   nx_number    Level       �?
   is_static    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop 
   GridWidth    GridHeight    ParentForm     ,   h  h  h  h  h  i  l  l  l  l  l  l  n  n  n  n  n  n  p  p  p  p  q  r  r  s  s  s  s  t  u  w  w  w  w  x  x  x  x  x  x  x  w  y        grid     +      index     +      skill    +      staticdata    +      item    +           {  }       �   �@  �  F�@ �@  �       nx_execute 
   tips_game 	   hide_tip    ParentForm        |  |  |  |  |  }        grid           index                  �    	   � @ �@    ܀ �@    � � ƀ@�  KA �� B \ �  E� � ��A �\A  �       ParentForm    nx_is_valid    sex 
   nx_string    GetItemAddText            change_cloth    actor2        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        grid           index           form          sex       	   cloth_id               �  �   �   W  �@ � ��  � � ŀ  �  ܀  @�� A    � � �  AA � E � \� ZA    � � E�  �� \� � ���� �A    � � � �� �� �A    � � �� � �  ��A I�B��    AB � ܁ ���� �  �܂   ��J��B �� � A �C �� � A �D �� � bB�� ���� ��C�@� � �C ��  @���� � A� � �  �B � �  �@��C �H�  �� ܃  ����	 A�  �D	 ��   D�	 A�  �D	 �� �	 �I
@  D  @���������� �  �܄   ��W��@ ���� �KD���   \D K���� � @ ��
 U��
�  \D ��K����   @ ��
 U��
�  \D ��  ��I K� � -        	   nx_value    role_composite    nx_is_valid 
   ItemQuery    data_query_manager 
   MaleModel       �?   FemaleModel 
   AsyncLoad     item_query_ArtPack_by_id    ArtPack    Query    STATIC_DATA_ITEM_ART    nx_int 
   headdress    mask    scarf 
   shoulders 	   pendant1 	   pendant2    cloth    shoes    pants    hat    cloth_h    pairs    UnLinkSkin 	   LinkSkin    Hat      
   nx_number    GetItemPropByConfigID            nx_execute    unlink_skin    string    lower    Cloth    LinkClothSkin    _h.xmod    .xmod     �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        cloth     �      actor2     �      sex     �      role_composite    �      item_query    �      data_query    �      model_name '   �   	   nArtPack 0   �      model 7   �      part D   �      (for generator) G   N      (for state) G   N      (for control) G   N      _ H   L      v H   L      (for generator) W   �      (for state) W   �      (for control) W   �      id X   �      prop X   �      art_id ^   �      model y   �         ArtPack     �  �    4   �      ܀ �@    � � �@  �  ܀   @�� A    � � �@ K�� \���A ��� �����A�A � B @ @�E� � �� \���C �@��D � �� �� � �C�́�!�  �� @  �� � B  �       nx_is_valid 	   nx_value    form_create_introduce    ImageControlGrid_skill    GetTaoluSkill    util_split_string    ,    Clear            ipairs    skill_static_query_by_id    Photo    AddItem    nx_widestr       �?      �   show_taolu_info     4   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     3   
   school_id     3   	   taolu_id     3      form_create_introduce 	   3      grid    3      skill    3      skill_list    3      grid_index    3      (for generator)    .      (for state)    .      (for control)    .      _    ,      id    ,      photo "   ,           �      3   �   A  ܀ �  @�� A    � � ��� ��K�� \���A�  ���ˁ�@ ܁���� ��E �BB � \B�E ��B ��\B�E ��B � \B�E �C ��\B�FBC K��\B FBC K���   ܂ C \B  �    	   nx_value    form_create_introduce    nx_is_valid    GetTaoluAttack    GetTaoluDefend    GetTaoluRecover    GetTaoluOperate    GetTaoluSite 	   set_star    groupbox_attack    groupbox_defend    groupbox_recover    groupbox_operate    mltbox_site    Clear    AddHtmlText 
   util_text       �    3   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                            	      form     2   
   school_id     2   	   taolu_id     2      form_create_introduce    2      taolu_attack    2      taolu_defend    2      taolu_recover    2      taolu_operate    2      taolu_site    2             *    3   �   �@  �� ŀ    ܀ �@    � � ŀ     ܀ �@    � � ��@ �@ � � A @��A  ���A�� ��KB � \B�MB�N��	B��	Å	�Æ	ć���  ����K�A�� \���B  ��A�����ADI���IÅI�ĆIć �    	   nx_value    gui    nx_is_valid 
   DeleteAll        @      �?   Create    Label    Add    Left       4@   Top         
   BackImage 2   gui\special\helper\school_introduction\star_2.png 	   AutoSize       $@2   gui\special\helper\school_introduction\star_1.png     3         	  	  	  	  	  
                                                         "  "  #  #  #  $  $  $  %  %  %  &  '  (  *     	   groupbox     2      num     2      gui    2   
   quotientr    2      (for index)    #      (for limit)    #      (for step)    #      i    "   	   lbl_star    "   
   remainder $   2   	   lbl_star )   2           ,  :       � @ �@    ܀ �@    � � ŀ   � ܀ W���@ �� �  � � A @���AA� �       ParentForm    nx_is_valid    get_skill_id         show_skill_action    actor2        -  /  /  /  /  /  0  3  3  3  5  5  5  5  6  9  9  9  9  :        grid           index           form       	   skill_id 
              =  T        E   �@  \� ��  � � �� �@    � � ��  ��� � �  � � �@� @ ܀�� @��� ��E FA�� \�  �  � � L�B FA^  �    	   nx_value    form_create_introduce    nx_is_valid    get_cur_taolu_id        GetTaoluSkill    util_split_string    ,    table    getn       �?        >  >  >  @  @  @  @  @  A  D  D  F  F  G  J  J  J  K  K  K  K  M  M  M  M  M  M  N  Q  Q  S  T        skill_grid_index           form_create_introduce       	   taolu_id          skill          skill_list          name               W  f           E@  \ � �  E�  �   \� Z@  @ �A�  ^  F A �@� �� � ����� � � ��   �   @ ���  �   � 	   	   nx_value    nx_current    nx_is_valid        ImageControlGrid4    GetSelectItemIndex         
   nx_string    GetItemName        X  X  X  X  Z  Z  Z  Z  Z  [  [  ^  _  _  a  a  b  b  b  b  b  b  b  d  d  f        form          grid          index               i  �    
4   �   �@  �� ŀ    ܀ �@    � � ŀ   � ܀ �@    � � �   �  ܀ �  @�� A    � � ��� �A A �A�� A��A�� A�B�� A�AB�� �� � B� A ���� �  A  @� �  A� �    	   nx_value    action_module    nx_is_valid    skill_effect    EndShowZhaoshi        ActionInit    ClearAction    ClearState    BlendAction    stand    BeginShowZhaoshi    add_weapon     4   k  k  k  m  m  m  m  m  n  q  q  q  q  q  r  v  v  v  x  x  x  x  x  y  |  |  |  |        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     	   skill_id     3      actor2     3      action    3      skill_effect    3           �  �    �    � @ ��   �  �@  ��  �� ��    ܀ �@  @ ��   �  ��     ܀ �@  @ ��   �  �@   ܀ �  @�� A  @ �   AA�  A�� @  �� ��  @ �	 �� � @  �� �A A � A� � �� B ��E� �� ��  \� ��  ���� �A  @ ��  � �A�� ����D@ ��  � ��@ �B � �� �B ܁�� A� �� �  � AC �C ��W @��E� � \� �� �� �� ��@ �B  ^ EB  �� \� ��  ���� �B  @ ��  � ��� @  ��  W @��ł   ܂ � A� �  �@ ��  � �B�@  �C ��� �B  ł   ܂ ͂�� @�� E� �� \� Y ���� @�� E� � \� @@�C @�� AC CE �  ��   \C �H�  ���@  ܃�	 E� � \ C  � @ � E� �C	 \� @ ��I�  ��	 
 AD
 C ���  ��K�J��	 \��ICK����  �� C �   � /    	   nx_value    role_composite    nx_is_valid    game_visual    UnLinkWeapon    nx_find_custom    wuxue_book_set    nx_set_custom        nx_execute    util_static_data    skill_static_query_by_id    TaoLu    util_functions    get_ini    ini\ui\wuxue\skill_weapon.ini    FindSectionIndex    weapon_name            ReadString 
   nx_string 
   tips_data    get_ini_prop    share\Skill\skill_new.ini 	   UseLimit    nx_int    SkillQuery    GetSkillWeaponType    SetRoleWeaponName       Y@      �?       @   h 
   UseWeapon    QueryRoleWeaponName        @      ]@   LinkWeapon    ShotWeapon    main_model::H_weaponR_01    ini\npc\hw_fz001    QueryActRole    GetLinkObject    Visible     SetRoleLogicState     �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        actor2     �      skill_name     �      role_composite    �      game_visual    �      taolu 5   �      g_weapon_ini :   �   
   sec_index D   �      weapon_name O   �      LimitIndex W   �      skill_query f   �   	   ItemType r   �   
   set_index �   �      action_set �   �      actor_role �   �      shot_weapon �   �           �      ^     �@ �A@  ^  E�  �   \� ��  ��  �� �� � �A  ^  ��E�  �   \� ��  �@ �� �� � �A� ^   �E�  �   \� ��  �� �� �� � �A  ^  @�E�  �   \� ��  �@ �� �� � �A� ^  �
�E�  �   \� ��  �� �� �� � �A  ^  ��E�  �   \� ��  �@ �� �� � �A� ^   �E�  �   \� ��  �� �� �� � �A  ^  @�E�  �   \� ��  �@ �� �� @ �A� ^  A@  ^   �            nx_int      @Y@   blade_0024      �Y@   sword_0020      �Y@   thorn_0005       Z@   sblade_00232      @Z@   ssword_0004      �Z@   sthorn_00141      �Z@   npcitem210       [@   cosh_00223     ^                                                         	  	  	  	  	  	  	  	  
  
  
                                                                                                                       
   item_type     ]             2    '   F @ Z@    � � E@  ��  \� ��  � � �� �@    � � � A ��    ܀ �@    � � �@    A� ܀��@    � � ��A� ��@ ��A�@�F�� K��ƁA \��� �@  �       Checked 	   nx_value    gui    nx_is_valid    ParentForm    nx_find_custom    desc 	   mltbox_5    Clear    AddHtmlText    TextManager    GetFormatText       �    '                    "  "  "  "  "  #  &  (  (  (  (  (  )  ,  ,  ,  ,  ,  ,  -  0  0  0  1  1  1  1  1  1  1  1  2        rbtn     &      gui    &      form    &           5  T    Z   F @ �@  � � �� �@    � � ��@ �@  � � �  �@ � A� �� � BEA ��B \ ܀  �B��� B ��K�B��� AB \���� � �� �A� � F�DK�� \��  ���A� � F�DK���\��  ����� B AB � ���A� � AB � ���A �F ܁ B A� �  � ��A� ���A ��B@��B �B ܁��� EB ��\� 	B�B� E� ��D�E ���\�  	B� �       ParentForm    nx_is_valid    Checked     nx_execute    util_functions    get_ini (   share\ForceSchool\forceUI\ShiLiInfo.ini    FindSectionIndex 
   nx_string    info    ReadString    Text        Info 	   nx_value    gui    lbl_5    nx_widestr    TextManager    GetFormatText 	   mltbox_5 	   HtmlText    lbl_ra2 
   BackImage    mltbox_ra2    Name    rbtn_a2    Clear    Logo     Z   7  8  8  8  8  8  9  <  <  <  =  @  @  @  @  @  B  B  B  B  B  D  D  D  D  D  E  E  E  E  E  G  G  G  H  H  H  H  H  H  H  H  I  I  I  I  I  I  I  I  L  L  L  L  L  M  M  M  M  M  N  N  N  N  N  N  N  N  O  O  O  P  P  P  P  P  Q  Q  Q  Q  Q  R  R  R  R  R  R  R  R  T        btn     Y      form    Y   
   nInfo_ini    Y      nIndex    Y      Text    Y      Info    Y      gui "   Y      photo L   Y           W  `       �   �   �@ �@  �   �@ I�@� �       CreateChlieAndBindP2    show_new_school_contribute    finsh_fresh        Y  Y  Y  \  \  \  _  `        form           box                b  l       F @ �@  � � �� �@    � � ��@ �@  � �  �       ParentForm    nx_is_valid    Checked         d  e  e  e  e  e  f  i  i  i  j  l        btn           form               o     a  F @ K@� \@ F @ I�@�E  �@ �� � \� �  � � �� �@    � � �@� �� ŀ � ܀  MAC�A  '��� ����  ��EB ��D \� ���  �A � ���@@#��B C ܂ C D  �C � �� F���  �@ �ł �E ܂ @ F��C� �K�� � D A \�����   A� � ���˃� @ �� � ܃��� � �  ��K�� � E A \�����   A� � ���˄� @ �� � ܄��� � �  ��EE ��H \� Iɑ��H �EII�����	 ��
�	 � �E  �
 ��
F
 A�
 �E I���I��I���IEC��� �L �� �E�˅�@ �E��E����EF ��\ �E  �MFF�KF�\� �F �� � �E  � F ܅  FF�K����\��  ��IŅ��� �Ņ��ϝ��@�
�E���@ �E��@ �E�܅ �������
 �� ��O 	���P 	FП� ��O 	FПP 	����
 @�
F A� MAC�A  '��� ����  ��EB ��D \� ���  �A � ���@@#��B C ܂ C D  �C � �� F��� W �@ �ł �E ܂ @ F��C� �K�� � D A \�����   A� � ���˃� @ �� � ܃��� � �  ��K�� � E A \�����   A� � ���˄� @ �� � ܄��� � �  ��EE ��H \� I�Б��H �EII�����	 ��
�	 � �E  �
 ��
F
 A�
 �E I���I��I���IC��� �L �� �E�˅�@ �E��E����EF ��\ �E  �MFF�KF�\� �F �� � �E  � F ܅  FF�K����\��  ��IŅ��� �Ņ��ϝ��@�
�E���@ �E��@ �E�܅ �������
 �� ��O 	���P 	FП� ��O 	FПP 	����
 @�
F A��E 	AП@ �PA @ 	AP� � D      groupscrollbox_1 
   DeleteAll    IsEditMode    nx_execute    util_functions    get_ini .   share\NewSchool\NewSchoolUI\NewSchoolGrow.ini    nx_is_valid    GetSectionCount 	   nx_value    gui               �?   ReadString 
   NewSchool     
   nx_string    school    ReadInteger 
   Condition    nx_int    clone_groupbox    groupbox_funnpcsimple    Add 	   Chapters    NpcDesc    NpcID 	   NpcTrack    SchoolFunc    SchoolLogo    SchoolPicture    type    clone_button    btn_7 
   ForeColor    255,255,255,180    Align    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_mb_click    school_logo    school_picture 	   npc_desc 
   condition    clone_mltboxbox 	   mltbox_8    TextManager    Format_SetIDName    Format_AddParam    AddHtmlText    Format_GetText       �   Text    nx_widestr           GetFormatText    Left       i@   GetChildControlCount 	   lbl_pass    Visible    lbl_ban     255,220,0,0    ResetChildrenYPos     a  p  p  p  q  q  t  t  t  t  t  v  v  v  v  v  w  z  z  |  |  |          �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �          ,      form     `     ini 
   `     nCount    `     gui    `     (for index)    �      (for limit)    �      (for step)    �      i    �      force    �      forceId !   �   
   condition &   �      clonegroupbox 7   �      nIndex <   �   	   Chapters A   �      NpcDesc F   �      NpcID K   �   	   NpcTrack P   �      SchoolFunc U   �      SchoolLogo Z   �      SchoolPicture _   �      ntype d   �      btn g   �      pos |   �      _k �   �      (for index) �   Y     (for limit) �   Y     (for step) �   Y     i �   X     force �   X     forceId �   X  
   condition �   X     clonegroupbox �   X     nIndex �   X  	   Chapters �   X     NpcDesc �   X     NpcID �   X  	   NpcTrack �   X     SchoolFunc �   X     SchoolLogo �   X     SchoolPicture   X     ntype   X     btn 	  X     pos   X     _k G  X        condition_pack              �   �@     ܀ �  EA  �� \� ��  ���@    �  �    �       gui\common\treeview\tree_ 
   nx_string    _    .png                                            bglvl           bgtype           path 
              
  $    9   F @ �@  � � �� �@    � � ��� �  �@ ܀ �����@� �� B ܀ �� ��@� �� �B ܀ �� ��� �  �� �@    ܀ �@    � � �@Cˀ�E� ��C \ �@  � �  FACK��\ �  � ����D  � ��@� ��E�� � �@F�� ��@� �@F�� � ��E� �       ParentForm    nx_is_valid    lbl_104    Text    nx_widestr    lbl_105 
   BackImage 
   nx_string    school_picture    lbl_106    school_logo 	   nx_value    gui    TextManager    Format_SetIDName 	   npc_desc 	   mltbox_6 	   HtmlText    Format_GetText 
   condition       �?	   lbl_pass    Visible    lbl_ban      9                                                                                                           !  !  "  "  $        btn     8      form    8      gui    8           '  1       � @ ������@ � ��� @ ����I��� �       rbtn_cs 	   ruleType       �?   rbtn_xs            Checked    finsh_fresh        )  )  *  *  -  -  0  1        form           box                4  �   �   F @ �@  � � �� �@    � � ��@ �@    � � ��@ �  A A� �� ܀  AA � EA  ��\� ZA    � � F�� �A  ��� �� �A    � � � ��� �A ��� �AC�A    ܁ �A   ���� ˁ�E� � \ ܁  ����Ĉ�ŉ�A�܁ � @���  ���� ��� �   �@�KC�� � A \���� ���� ��  �܃ � ���  ����C�@ �� �� ܃�D�� �� � ��KD��  A \���D�  AE � �����   ܄ � @��  �	@���	� @�� E� �� \� @
@ �� @��H�� ��� �  � 
E  @�	�   ����	�� �I�E�@ 	���  �  E� � \� 	E��	�I�	EJ�	�J�	EK�	�K�	̉	�ʘ��� �	�L�	EM�	EM�� �	�M�	N�	N�B�BNB � �� E� � \� �� �  �� @@ �F�� IBO�F�� I�F�� �I�BIC �����   ܂ ��I�� � B      ParentForm    nx_is_valid    Checked 	   ruleType    nx_execute    util_functions    get_ini    share\War\school_rule.ini 	   nx_value    gui 	   force_id    tree_ex_force_rule    clear_tree_view 	   RootNode    CreateRootNode    nx_widestr        Mark         	   DrawMode    Tile    GetSectionCount       �?   FindSectionIndex 
   nx_string    ReadString    School    nx_int    GetSectionByIndex    ReadInteger 	   Chapters    Crime    Type    UiRes    FindNodeByMark    CreateNode    TextManager    GetText    Font    font_treeview    ShadowColor 
   0,200,0,0    TextOffsetX       >@   TextOffsetY       @
   ForeColor    255,128,101,74 
   FitWindow    ItemHeight    NodeBackImage $   gui\common\treeview\tree4_1_out.png    NodeFocusImage #   gui\common\treeview\tree4_1_on.png    NodeSelectImage $   gui\common\treeview\tree4_2_out.png #   gui\common\treeview\tree4_2_on.png 
   ExpandAll    get_school_rule_value    pbar_crime    ProgressImage !   gui\common\progressbar\pbr_1.png    Value 
   lbl_Crime    Text    ui_schoollaw_punishment     �   5  7  7  7  7  7  8  ;  ;  ;  <  ?  B  B  B  B  B  D  D  D  F  F  F  F  F  G  J  L  L  L  L  L  M  P  P  P  S  S  U  U  U  U  U  V  V  V  V  V  V  V  W  X  [  [  ]  ]  ]  ]  ^  ^  ^  ^  ^  `  `  a  a  a  a  a  c  c  c  c  c  c  c  c  d  d  d  e  e  e  e  e  f  f  f  f  f  g  g  g  g  g  h  h  h  h  h  j  j  j  j  j  j  j  j  l  n  n  n  n  n  n  n  n  o  o  q  q  q  q  q  q  t  t  t  t  t  u  u  u  u  u  u  u  u  w  w  w  w  x  y  z  {  |  }  ~  �  �  �  �  �  �  �  �  �  ]  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn     �      form    �      rulekey    �      ruleini    �      gui    �      force    �   
   root_node &   �      nCount 6   �      (for index) 9   �      (for limit) 9   �      (for step) 9   �      i :   �   
   sec_index ?   �      School F   �      section Q   �   	   Chapters V   �      Crime [   �      Type `   �      UiRes e   �   
   main_node n   �   
   rule_node �   �      value �   �         kickout_force_value     �  �    *   �   �   �@ �@  �   �@ ��@ ��@�   � ���@ �@A�����A ��@�   � ���A �@A�����A ��@�   � ���A �@A� �� B ��@�   � �� B �@A�@��@B ��@�   @ ��@B �@A�I@A� �       CreateChlieAndBindP4    hide_or_show_child4    rbtn_0    Visible    Checked    rbtn_1    rbtn_2    rbtn_3    rbtn_4    finsh_fresh     *   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     )      box     )           �  �    ]   E   �@  ��  �  \� �  � � �� �@    � � �@� � F�A  ��  � � @ �A �� ܀�� @�� ��J  �A Ł ���  ܁ B �A��B��D �B�A� �� � �� U��܂�D CD�� Ń D܃ ����E� �C\� �� � �� W�� �J�  �EI���CEI����� �C�� IAE� � \� FC�@� �F�	C�FC�	C����E� � \� FC�F�	C�E� � \� FC�FC�	C��	Ƌ�� �       nx_execute    util_functions    get_ini .   share\NewSchool\NewSchoolUI\NewSchoolBase.ini    nx_is_valid    FindSectionIndex 
   nx_string    school    ReadString 	   Tasktype        util_split_string    ,       �?   table    getn    groupscrollbox_2    Find    rbtn_ 
   nx_number    Top    Left     Visible     ]   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     \   	   base_ini    \      nIndex    \      str_lal    \   
   name_list    \      tm4_btn    \      (for index)     \      (for limit)     \      (for step)     \      i !   [      k "   [      pos_btn *   [      btn 2   [      op ?   C           �      �   F @ I���F�@ I ��F@A I���F�A I F@B I�F @ � C I���F�@ � C I���F@A � C I���F�A � C I���F@B �@C I���F C K�� �  � E �A \   \@  F C K�� �� � E �� \   \@  F C K�� �  � E �� \   \@  F C K�� �� � E � \   \@  F C K�� �@ � E �� \   \@  F@C K�� �  � E �� \   \@  F@C K�� �� � E �� \   \@  F@C K�� �  � E �� \   \@  F@C K�� �� � E � \   \@  F@C K�� �@ � E � \   \@  F@C K�� �@ � E �� \   \@  F@C K�� �� � A � E� � �� � \�  A\@ F C I�ǎF@C I�ǎF C I���F@C I���F @ I�ǎF�@ I�ǎF@A I�ǎF�A I�ǎF@B I�ǎ �        rbtn_0    type            rbtn_1       �?   rbtn_2        @   rbtn_3       @   rbtn_4       @   grid    textgrid_1    textgrid_2    SetColTitle    nx_widestr 
   util_text    ui_force_name    ui_force_prize    ui_force_time    ui_force_round       @   ui_force_npc    ui_force_firsttask    ui_force_loop       @   ui_force_giveup       @                  Visible  	   true_num     �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                    form     �             �   .�  F @ �@  � � �� �@    � � �@  ƀ� �� �@    � � �@  ��� �� �@    � � � A �@  ���@A �@A ƀ������ ��@A ��A� �@ ��@A �� � �@A ���@A �@A ƀ������ ��  �@ �� �@    ܀ �@    � � ƀC �� FAA K�\A FAA KA�\A E� �� � B \� �A  ���� �A    � � � �� �� �A    ܁ �A    � � � � ܁ B  @�� B    � � �� EB  � \� ZB    � � E �B \� �B  ���� �B    � � ����� � �AA� ������@ � � ܃���� �D  ��K��� � A \������� @���� �� �� ��   E ��\� E
܄ �	@���DA �DH	� ������@ ܄��� �E	 �	 ��K�� �	 A�	 \�����  A
 � �����@ �F
 ��	 ܅��� ��
 �	 ��K�� �
 A�	 \����  A ��	 �����@ �G ��	 ܆���� ��  ��E� ��\� � ��  ܇ � @ �  ���Ƈ� ��E � \ ܇  �G   �Ƈ� �G�E � \ ܇  � @��� �� 	 � H  � @�� �� 	 � H  � @��H ň � E	 �	�	\	 	  �  H  � @�� �� 	 � H  � @��H �� 	 � H  � @��� ��  	 � H  � A � H�@�Ƈ� �G�E � \ ܇  HA �O� 	�� � F	�	 H  Ƈ� �G�E � \ ܇  � A � E� ���\�  �  ��� A � E� ��\�  �  ��B����W���� ���  �����   ܇ � @ �  �  �� ��  ܇ � @ � �  �� ��  ��  ������PA ܇�ɇѢ��£HA R� 	�  	�H�HA HR� �� H �GA ˇ�@ 	�� ň � @	�		 �  �G  ��   
A ܇�H @�� FHA K�� 		 @	 \H�FHA K��� 	� E� �� �	�
�	 \	  \H  E� � \� �� � �� �� �FHA K��� 	I E� �� \	 \H  ��FHA K��� 	I E� �	 \� �� �	 �� ŉ  
 ܉ Uɉ\H�FHA K��� 	I E� �	 \	 \H  FHA K��� 	� E� �	 \	 \H  FHA K��� 	� E� �	 \	 \H  FHA K��� 		 E� �� \	 \H  E� � \� �� � �� �� �FHA K��� 	I E� �� \	 \H  ��FHA K��� 	I E� �	 \	 \H  F�UK����\H�F�UK��  	 � \H  K�P�H \���� �� � @	��H �� ƈU��� ��  �H��H ˈ�E� �� \� �� �	 �� ŉ 
 ܉ Uɉ�� �� �	 �H  ����6����@	 �	 �	 ܈����	 �I 
 ��F�� K	��	  
��	 \�  ZI  @�F�� KI��	  
��	 \�  �� �	�
 E� �
 \
 �I  �� �	�� E� �
 \
 �I  �� �	�J E� �JA ��X  	A� �
 \
  �I  �� �	�� E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� �	�J E� �
�\
 �I  �� �	�� E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� ��  
��I���F�� KI��	  
 �	 \�  �IA ��O 
 	AJ �� �
��
 �I  �IA ��O 
 	A� �� �
��
 �I  �� �	��� �� ��܉ �	 ��IA ��O 
 	AJ �� �� �
 �I  ���IA ��O 
 	AJ �� �
 �
 �I  F�� KI��	  
��	 \�  �� �	 �� �� ��܉ �	  �I����� �	 �� �� 
�܉ �	  �I		��IA ��O 
 	AJ �� ����� Ŋ  ܊ � @ � �
�I��IA ��O 
 	AJ �� �
��� Ŋ  ܊ � @ � �
�I��IA �	R 
 	A� �
��I��IA ��O 
 	A� �� �
 �
 �I  �IA ��O 
 	A� �� �
 �
 �I  @��HA ��@	 	�I �	��H��HA ˈ�@	 	�� ŉ � E
 �
�\
 
  �	  �H  �B^� �AA� �������@ � � ܃���� �D  ��K��� � A \����@�� ����� �� �� ��   E ��\� E
܄ W�	����DA �DH	� ������@ ܄��� �E	 �	 ��K�� �	 A�	 \�����  A
 � �����@ �F
 ��	 ܅��� ��
 �	 ��K�� �
 A�	 \����  A ��	 �����@ �G ��	 ܆���� ��  ��E� ��\� � ��  ܇ � @ �  ���Ƈ� ��E � \ ܇  �G   �Ƈ� �G�E � \ ܇  � @��� �� 	 � H  � @�� �� 	 � H  � @��H ň � E	 �	�	\	 	  �  H  � @�� �� 	 � H  � @��H �� 	 � H  � @��� ��  	 � H  � A � H�@�Ƈ� �G�E � \ ܇  HA �O� 	�� � F	�	 H  Ƈ� �G�E � \ ܇  � A � E� ���\�  �  ��� A � E� ��\�  �  ��B����W���� ���  �����   ܇ � @ �  �  �� ��  ܇ � @ � �  �� ��  ��  ������PA ܇�ɇѢ��£HA R� 	�  	�H�HA HR� �� H �GA ˇ�@ 	�� ň � @	�		 �  �G  ��   
A ܇�H @�� FHA K�� 		 @	 \H�FHA K��� 	� E� �� �	�
�	 \	  \H  E� � \� �� � �� �� �FHA K��� 	I E� �� \	 \H  ��FHA K��� 	I E� �	 \� �� �	 �� ŉ  
 ܉ Uɉ\H�FHA K��� 	I E� �	 \	 \H  FHA K��� 	� E� �	 \	 \H  FHA K��� 	� E� �	 \	 \H  FHA K��� 		 E� �	 \	 \H  E� � \� �� � �� �� �FHA K��� 	I E� �� \	 \H  ��FHA K��� 	I E� �	 \	 \H  F�UK����\H�F�UK��  	 � \H  K�P�H \���� �� � @	��H �� ƈU��� ��  �H��H ˈ�E� �� \� �� �	 �� ŉ 
 ܉ Uɉ�� �� �	 �H  ����6����@	 �	 �	 ܈����	 �I 
 ��F�� K	��	  
��	 \�  ZI  @�F�� KI��	  
��	 \�  �� �	�
 E� �
 \
 �I  �� �	�� E� �
 \
 �I  �� �	�J E� �JA ��X  	A� �
 \
  �I  �� �	�� E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� �	�J E� �
�\
 �I  �� �	�� E� �
 \
 �I  �� �	�
 E� �
 \
 �I  �� ��  
��I���F�� KI��	  
 �	 \�  �IA ��O 
 	AJ �� �
��
 �I  �IA ��O 
 	A� �� �
��
 �I  �� �	��� �� ��܉ �	 ��IA ��O 
 	AJ �� �� �
 �I  ���IA ��O 
 	AJ �� �
 �
 �I  F�� KI��	  
��	 \�  �� �	 �� �� ��܉ �	  �I����� �	 �� �� 
�܉ �	  �I		��IA ��O 
 	AJ �� ����� Ŋ  ܊ � @ � �
�I��IA ��O 
 	AJ �� �
��� Ŋ  ܊ � @ � �
�I��IA �	R 
 	A� �
��I��IA ��O 
 	A� �� �
 �
 �I  �IA ��O 
 	A� �� �
 �
 �I  @��HA ��@	 	�I �	��H��HA ˈ�@	 	�� ŉ � E
 �
�\
 
  �	  �H  �HA ��@	 	�� �I �H���\�BA ˂��B �BA ����B �BA ��A �B��� � ܂ � FCA K��� � \ �   ����� � ܂ � FCA K���  \ �   ����B� ���� CA �X� ��  ܂  I����� � ܂ � FCA K��� D \ �   � �Ƃ� ɂ·Ƃ� � AC � ��ł � A  �B  @�Ƃ� ��·Ƃ� � A� � ��ł CA �X� ��  �B  I B�@ ��B� ɂ � u      ParentForm    nx_is_valid    force_task_info    force_round_task_info    Checked    grid 	   true_num       �?           Visible  	   nx_value    gui    type 	   force_id    BeginUpdate 	   ClearRow    nx_execute    util_functions    get_ini .   share\NewSchool\NewSchoolUI\NewSchoolPlay.ini    InteractManager    game_client 
   GetPlayer    TaskManager    GetSectionCount    ReadInteger    Type    Force 
   Condition    nx_int 
   nx_string 
   InsertRow       �   GetSectionByIndex    ReadString    Prize        Time    MaxRoundNumber    Npc 
   Npcsearch 	   Tvt_type    Task_id 	   Tvt_info    OneKey    get_tvt_times 
   FindChild    CreateChild    nx_set_custom    round 
   max_round    name    nx_widestr 
   util_text    price    task_id    one_key    send_msg_get_taskinfo        @	   GetChild    SetGridText       "@   circle       @    Create    Label 
   BackImage #   gui\special\forceschool\onekey.png 	   AutoSize    SetGridControl    SetColAlign    center    util_split_string    ,    CreateImage       @   -/-    /       @      $@      &@      *@      ,@   TextManager    Format_SetIDName    Format_AddParam    MultiTextBox    set_copy_ent_info    mltbox_ex4    Format_GetText    Clear    AddHtmlText 	   <center> 
   </center>    MaxLoop    GetGridText    max_circle    giveup       @      @       @   SetGridForeColor    255,220,0,0 
   EndUpdate    ClearSelect 
   SelectRow 	   grp_task 	   btn_task    Enabled    Text    ui_taskfinish    show_task_price    ui_onekeyfinish 	   tvt_type     �                "  "  "  "  "  #  &  &  &  &  &  '  *  *  *  +  +  +  +  +  -  -  -  -  .  .  1  4  4  5  5  5  5  5  7  7  7  9  9  9  9  9  :  =  >  A  A  A  B  B  B  D  D  D  D  D  F  F  F  F  F  G  J  J  J  L  L  L  L  L  M  P  P  P  R  R  R  R  R  S  V  V  X  X  X  X  X  Y  \  \  \  ^  ^  ^  ^  ^  _  b  b  e  e  e  e  f  f  f  f  f  g  g  g  g  g  h  h  h  h  h  j  j  j  j  j  j  j  j  j  j  j  j  j  j  j  j  l  l  l  l  n  n  n  o  o  o  o  o  p  p  p  p  p  q  q  q  q  q  r  r  r  r  r  s  s  s  s  s  t  t  t  t  t  u  u  u  u  u  v  v  v  v  v  w  w  w  w  w  z  z  z  }                  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                                            	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
  
  
  
  
  
                                                                        e                                                                                         !  !  !  !  !  "  "  "  "  "  #  #  #  #  #  $  $  $  $  $  %  %  %  %  %  &  &  &  &  &  '  '  '  '  '  (  (  (  (  (  )  )  )  )  )  ,  ,  ,  /  1  1  1  1  1  1  1  1  2  2  2  2  2  2  2  2  3  3  3  3  3  3  5  5  5  5  5  5  5  6  6  6  6  6  6  6  7  7  7  7  7  7  7  7  7  7  7  8  8  8  8  8  8  8  9  9  9  9  9  9  9  :  :  :  :  :  :  :  =  =  =  =  =  ?  ?  ?  ?  ?  ?  @  @  @  @  @  @  @  @  C  C  C  C  C  C  E  E  E  E  E  E  E  E  F  I  I  I  I  I  I  I  I  J  M  O  O  P  Q  S  V  V  V  V  V  V  V  V  W  Z  Z  Z  Z  Z  Z  Z  Z  [  ^  ^  _  b  b  c  c  c  d  e  f  f  f  f  f  f  g  g  g  g  g  j  j  j  j  j  j  j  j  j  j  m  m  m  m  n  n  n  p  p  p  p  p  p  r  r  r  r  r  r  r  r  r  r  t  t  t  t  t  t  t  t  u  u  u  u  u  u  u  u  u  w  w  w  w  w  w  w  w  w  w  w  w  w  w  w  z  z  z  z  z  z  z  z  {  {  {  {  {  {  {  {  |  |  |  |  |  |  |  |  }  }  }  }  }  }  }  }                  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  M      btn     �     form    �     gui ,   �     nType 3   �     forceId 4   �     RW_ini ?   �     mgr H   �     game_client Q   �     client_player Y   �     taskmgr b   �     count j   �     (for index) m   �     (for limit) m   �     (for step) m   �     nIndex n   �     Type s   �     Force x   �  
   condition }   �     nRow �   �     Name �   �     Prize �   �     Time �   �     MaxRoundNumber �   �     NpcPos �   �     Npc �   �  	   tvt_type �   �     task_id �   �  	   tvt_info �   �     one_key �   �  
   tvt_times �   �  	   show_num �   �     op �        op        child "  8     label T  a     prize_list o  �     taa r  �     mText �  �  	   npc_info �  �     Task_id 
  �     MaxLoop   �     op   d     op k  �     child �  �     (for index) �  �     (for limit) �  �     (for step) �  �     nIndex �  �     Type �  �     Force   �  
   condition   �     nRow   �     Name   �     Prize #  �     Time (  �     MaxRoundNumber -  �     NpcPos 2  �     Npc 7  �  	   tvt_type <  �     task_id A  �  	   tvt_info F  �     one_key K  �  
   tvt_times N  �  	   show_num O  �     op e  �     op �  �     child �  �     label �  �     prize_list �  �     taa �  �     mText r  �  	   npc_info |  �     Task_id �  j     MaxLoop �  j     op �  �     op �       child $  j        condition_pack     �  �    	%   E   �@  \� ��� �� ��    ܀ �@  @ ��  �  �@AA� ܀��@  @ ��  �  ��AA� � �    � ܀   �@ �  AB�� ��� �   �    	   nx_value    game_client 
   GetPlayer    nx_is_valid            FindRecord    new_school_activity_record    FindRecordRow    nx_int    QueryRecord       @    %   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     	   tvt_type     $      game_client    $      client_player    $      row    $           �  	   ^   �   �   �� �@    ܀ �@    � � ƀ@A �� �A � � ��ƀAA �� � � � ���@ A �� ��  ܀  A AA �  ����@ A �� ��  ܀  A AA �  ���� CɀÆ�@ A �� �  ܀  �����@ A �� �A  ܀  A AA �  � �ƀD� ŉƀDA A� � � ���� A A  �@   �ƀDɀÉƀDA AA � � ���� A �� ��  �@  � ƍ@ �� C� ņ �    	   nx_value    nx_is_valid    lbl_tvt_name    Text    GetGridText       �?   mltbox_tvt_info 	   HtmlText        @   nx_int       &@      *@	   grp_task    Visible    task_id       $@      ,@	   btn_task    Enabled  
   util_text    ui_taskfinish    show_task_price            ui_onekeyfinish       "@	   tvt_type     ^   �  �  �  �  �  �  �  �  �  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  		  		  
	  
	  
	  
	  
	  
	  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	        self     ]      row     ]      form    ]      
   form_name     	  *	    
   �   �   �@ �@  �   �@ ��@ � ��I �� �       CreateChlieAndBindP5    LoadDevelopInfo    rbtn_f1    Checked    finsh_fresh     
    	   	   	  #	  #	  #	  &	  &	  )	  *	        form     	      box     	           -	  9	       F @ ��@ I���F�@ � A I���F@A ��A I���F�A � B I���F�@ I�F A I�F�A I�F B I� �       rbtn_f1    box    groupbox_fb1    rbtn_f2    groupbox_fb2    rbtn_f3    groupbox_fb3    rbtn_f4    groupbox_fb4    Visible         /	  /	  /	  0	  0	  0	  1	  1	  1	  2	  2	  2	  5	  5	  6	  6	  7	  7	  8	  8	  9	        form                <	  �	      E   �   \� Z@    � � E@  ��  \� �   � � �� �@    � � ��  �  �� �     ܀ �@    � � �@AE� ��A \ ܀   �  � � AB���� � ��KAB�� A� \���AB �AB �� ���Ł BB���� � ��A ܁�� KBB��C A� \��� ��E� �BB �A� �� ���� \���� �BB@��� �� ܂� ���ł CB��� � ��A ܂�� KCB��D A� \��� ��F�E I��FF KC�\C FF K����� ��@�܃�D \C F�G KC�\C F�G K����� ��@ ܃�D \C E FC���\� @��@�F�H ��� �G����I���FCI ��� �G�����I���F�I ��� �G�����I���E FC�� \� @��@�FJ ��� �GI���I���FCJ ��� �G�G���I���F�J ��� �G�I���I���E FC���\� @��@�F�J ��� �G����I���FK ��� �G�����I���FCK ��� �G�����I���E FC�� \� @��@�F�K ��� �GI���I���F�K ��� �G�G���I���FL ��� �G�I���I���E FC���\� @��@�FCL ��� �G����I���F�L ��� �G�����I���F�L ��� �G�����I���E FC�� \� @��@�FM ��� �GI���I���FCM ��� �G�G���I���F�M ��� �G�I���I��� � 7      nx_is_valid 	   nx_value    gui    get_ini 1   share\NewSchool\NewSchoolUI\NewSchoolDevelop.ini    FindSectionIndex 
   nx_string 	   force_id            ReadString    image        info    desc    util_split_string    r0    ,    r1    r2    r3    r4    r5    lbl_21 
   BackImage 	   mltbox_3    Clear    AddHtmlText    TextManager    GetFormatText       �	   mltbox_2        @   table    getn    lbl_7    Text       �?   lbl_13    lbl_14       @   lbl_23    lbl_24    lbl_25    lbl_45    lbl_55    lbl_67    lbl_52    lbl_63    lbl_68    lbl_53    lbl_64    lbl_69    lbl_54    lbl_65    lbl_70       =	  =	  =	  =	  =	  >	  A	  A	  A	  C	  C	  C	  C	  C	  D	  G	  G	  G	  I	  I	  I	  I	  I	  J	  M	  M	  M	  M	  M	  O	  O	  P	  S	  S	  S	  S	  S	  T	  T	  T	  T	  T	  U	  U	  U	  U	  U	  W	  W	  W	  W	  W	  W	  W	  W	  X	  X	  X	  X	  X	  X	  X	  X	  Y	  Y	  Y	  Y	  Y	  Y	  Y	  Y	  Z	  Z	  Z	  Z	  Z	  Z	  Z	  Z	  [	  [	  [	  [	  [	  [	  [	  [	  \	  \	  \	  \	  \	  \	  \	  \	  ^	  ^	  _	  _	  _	  `	  `	  `	  `	  `	  `	  `	  `	  a	  a	  a	  b	  b	  b	  b	  b	  b	  b	  b	  d	  d	  d	  d	  d	  d	  e	  e	  e	  e	  e	  e	  f	  f	  f	  f	  f	  f	  g	  g	  g	  g	  g	  g	  j	  j	  j	  j	  j	  j	  k	  k	  k	  k	  k	  k	  l	  l	  l	  l	  l	  l	  m	  m	  m	  m	  m	  m	  p	  p	  p	  p	  p	  p	  q	  q	  q	  q	  q	  q	  r	  r	  r	  r	  r	  r	  s	  s	  s	  s	  s	  s	  v	  v	  v	  v	  v	  v	  w	  w	  w	  w	  w	  w	  x	  x	  x	  x	  x	  x	  y	  y	  y	  y	  y	  y	  |	  |	  |	  |	  |	  |	  }	  }	  }	  }	  }	  }	  ~	  ~	  ~	  ~	  ~	  ~	  	  	  	  	  	  	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	        form          gui 	        ini         index         image %        info *        desc /        r0 7        r1 ?        r2 G        r3 O        r4 W        r5 _             �	  �	       F @ �@  � � �� �@    � � ��@ � A ���� �       ParentForm    nx_is_valid    box    Visible    Checked        �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	        btn     
      form    
           �	  �	       �   �   �@ I��� �       CreateChlieAndBindP6    finsh_fresh        �	  �	  �	  �	  �	        form           box                �	  �	       �   �@  �  A�  �@ I@A� �       nx_execute    custom_sender    custom_ancient_tomb_sender       8@   finsh_fresh        �	  �	  �	  �	  �	  �	  �	        form           box                �	  �	       �   �   �@ I��� �       load_page_shimen    finsh_fresh        �	  �	  �	  �	  �	        form           box                �	  �	       � @ ����I��� �       groupbox_changfeng    Visible    finsh_fresh        �	  �	  �	  �	        form           box                �	  �	       �   �   �@ I��� �       loadDevelopProp    finsh_fresh        �	  �	  �	  �	  �	        form           box                �	  �	       � @ ����I��� �       groupbox_shenshui    Visible    finsh_fresh        �	  �	  �	  �	        form           box                �	  �	    ]   � @ ������  �  �� �@   ܀ �@    � � ƀA ��A  E� ��B  A � \�  GA KA��� B E� � \� � �B \A�ƀD K��\A � E� ��B  A � \�  GA KA��� B E� � \� � �B \A�� E K��\A A E� ��B  A � \�  GA KA��� B E� � \� � �B \A�ƀE K��\A � E� ��B  A � \�  GA KA��� B E� � \� � �B \A�I�@� �       groupbox_jingshu    Visible 	   nx_value 
   ItemQuery    nx_is_valid    ImageControlGrid5    Clear    jsbook_dm_01    photo 
   nx_string    GetItemPropByConfigID    Photo    AddItem            nx_widestr       �?      �   ImageControlGrid6    jsbook_dm_02    ImageControlGrid7    jsbook_dm_03    ImageControlGrid8    jsbook_dm_04    finsh_fresh     ]   �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	        form     \      box     \   
   ItemQuery    \      grid    \      item_id    \           �	  
    =   E   �@  \� ��  � � �� �@    � � ��@ �  A ܀ �  @�� A    � � �� �� �� B  � � KAB\A K�� � \��� ���� ����   EC ���\� �� ���W�C���B �� �C  ܂  �� ˂D@��� ��   ܃ � A �B��A� �       get_ini    INI_DEVELOP_PROP    nx_is_valid    imagegrid_1 	   nx_value 
   ItemQuery    FindSectionIndex    props            Clear    GetSectionItemCount       �?   ReadString 
   nx_string        photo    GetItemPropByConfigID    Photo    AddItem    nx_widestr       �    =   �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	   
   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  �	  
        form     <   	   item_ini    <      grid 
   <   
   ItemQuery    <      index    <      counts    <      (for index) !   <      (for limit) !   <      (for step) !   <      i "   ;      item_id )   ;           	
  
    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        

  

  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
        grid           index           item_config               
  
       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        
  
  
  
  
        grid           index                
  N
    �   E   �@  \� ��  ��   AA �� ˀAE� �B \ ܀  AB���� � ��E � �A \���� ��C���� �D �A��A �D ��D��   A ����B �E ܂ D �E��C�C F�� K���� ��� \  �  ��� F��� ��C @��� �� C  � @�� �C C  E� �C @�C ���ƁE ��H��D ���A �D ��H��A �� �F�� �BI �   ܁  �I EB ��\� 	B��I EB �J \� 	B��I 	�D�BJ E�
 �K \� 	B�BJ E�
 �J \� 	B��BJ 	�D�� A� � E� �B \� W@ ��I E� � \� 	B��I 	�H�BJ 	�H� � 1   	   nx_value    gui    nx_execute    util_functions    get_ini .   share\NewSchool\NewSchoolUI\NewSchoolBase.ini    FindSectionIndex 
   nx_string    school    ReadString    Zaxue        util_split_string    ,    table    getn    groupscrollbox_4 
   DeleteAll    IsEditMode       �?   clone_button    rbtn_gl    Add    Text    nx_widestr    TextManager    GetFormatText    type    nx_bind_script    nx_current    nx_callback 	   on_click    on_btn_mg_click    Visible     ResetChildrenYPos    skill_point_tips    lbl_18    lbl_47    skill_point    pbar_3    Maximum 
   nx_number    skill_point_max    Value    newschool_xuedao 
   util_text    ui_gumu_mpjy_22     �   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
   
   
   
  "
  "
  "
  "
  #
  #
  #
  $
  $
  &
  &
  &
  &
  (
  (
  (
  )
  )
  )
  )
  ,
  ,
  ,
  ,
  ,
  ,
  ,
  ,
  ,
  -
  -
  -
  -
  /
  /
  /
  /
  /
  0
  0
  0
  0
  0
  3
  3
  4
  4
  4
  &
  8
  8
  :
  :
  :
  ;
  ;
  >
  >
  >
  >
  >
  >
  >
  >
  ?
  ?
  ?
  ?
  ?
  @
  @
  @
  @
  @
  A
  A
  C
  C
  C
  C
  C
  D
  D
  D
  D
  D
  E
  E
  G
  G
  G
  G
  G
  G
  G
  G
  H
  H
  H
  H
  H
  J
  J
  L
  L
  N
        form           gui       	   base_ini          nIndex       
   str_ZaXue          ZaXue_list          nCoutn          (for index) "   G      (for limit) "   G      (for step) "   G      i #   F      rbtn &   F      nTips V              Q
  �
    -�  F @ �@  ��  �� ��@ � EA �� ��  \� �A ���� �A    � � ����� ��� ���A ��� ɁÆ�A  � ܁ B @�� B    � � B  A � KBD\� �B ���� �B    � � �� ��D� ��T��� �AD �� ������@�� �� ܃������D � ��E� � \� �� ���� ���N�E� ��\� �� � �� ���L�K���\���� �AE �� �����@��� �� ܄������ � ��K��� A� \���� �AF �� �����@��� �� ܅������ � ��E	 �F� \� ��� ��I ��F���	 �� �� ��	 G� ܆ G� �J���	 F�� � E �G� \� � Ƈ� �� � HL�L�� ���   ܇  �Ƈ��͙Ň  �
܇ 	��� HL�L�� � 	�   ܇  IǇ��GLˇ�E� � 
\ �G  Ň  �	܇ W��@��GL���E� ��	\ �G  � HLN ܇  �Ǉ���	 H� ܇ �	 F�� � E�	 ��� \� � � I ����� � ܈ � E� F	��	 \	 �   �@�ň �D܈ �H ň �O܈  �� IL�L�� �I �	 	  ܈  IȈ�ˈ�@	��	���  
 �	 ܈  �  @ �Iѡ� �IHѡ  �I�ŗ��	 �� ܈ 	 @	��I ��E� �� \� �� �� �	� 
 �	 ��  ��@�E� ��D\� GI E� ��O\�  �E	 �IL��L� EJ 
 �	  \�  �H��K���	� 
�E� �
 \
 \�  Z	  @ ��ѡ� ��Hѡ  �ɈŗE�	 ��� \� �	 �	 J ����� � ܉ � E� F
��
 \
 �   �@�ŉ �D܉ �I ŉ �O܉  ��	 JL�L�� �J �
 
  ܉  Iɉ�ˉ�@
��
���   �
 ܉  �	  @ �I	ѡ� �IIѡ  �I�ŗˉ�@
��I�ˉ�@
 �I�ˉ�@
 �I�ˉ�@
��I�ˉ�@
 �I�ˉ�@
��I�ˉ�@
 �I�ˉ�@
��I�ˉ�@
��I�ˉ�@
��I�ŉ  
�	܉ �	�@��	  
 EJ \
� �I  ŉ  
 A� �
 �I IFS��ª�B� ��S���� �T�B ��� ��ӆ � Q      ParentForm 	   nx_value    gui    type 	   force_id    nx_execute    util_functions    get_ini 3   share\NewSchool\NewSchoolUI\NewSchoolCharacter.ini    nx_is_valid    GetSectionCount    groupscrollbox_6 
   DeleteAll    IsEditMode    ConditionManager    game_client 
   GetPlayer               �?   ReadString    Type        ReadInteger    Force 
   Condition 
   nx_string    nx_int    GetSectionByIndex    Desc    Npcid 	   NpcTrack    Photo    Origin1    Origin2    Origin3    clone_groupbox    groupbox_expss    Add    clone_label    lbl_26    lbl_10 
   BackImage    lbl_11    clone_mltboxbox 	   mltbox_9 	   mltbox_7    Text    nx_widestr    TextManager    GetFormatText    Align    Left 	   HtmlText    Format_SetIDName    Format_AddParam    Format_GetText    lbl_leader    lbl_origin    lbl_origin1    util_split_string    ,        @   table    getn    text    CanSatisfyCondition 
   ForeColor    255,0,125,0    255,220,0,0    lbl_origin2    lbl_origin3    nx_bind_script    nx_current    nx_callback    on_click_hyperlink    on_mltbox_mhb_click_hyperlink       .@   Visible     ResetChildrenYPos     �  R
  S
  S
  S
  U
  V
  X
  X
  X
  X
  X
  Z
  Z
  Z
  Z
  Z
  [
  ^
  ^
  `
  `
  `
  a
  a
  d
  d
  d
  f
  f
  f
  f
  f
  g
  k
  k
  k
  l
  l
  n
  n
  n
  n
  n
  o
  r
  r
  r
  r
  s
  s
  s
  s
  s
  t
  t
  t
  t
  t
  u
  u
  u
  u
  u
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  w
  x
  x
  x
  y
  y
  y
  y
  y
  z
  z
  z
  z
  z
  {
  {
  {
  {
  {
  |
  |
  |
  |
  |
  }
  }
  }
  }
  }
  ~
  ~
  ~
  ~
  ~
  
  
  
  
  
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  r
  �
  �
  �
  �
  �
  �
  �
  �
  '      btn     �     form    �     gui    �     nType    �     forceId    �     ini    �     nCount    �     condition_manager    �     game_client $   �     player &   �     (for index) /   �     (for limit) /   �     (for step) /   �     nIndex 0   �     Type 5   �     Force :   �  
   condition ?   �     Name R   �     Desc W   �     Npc \   �  	   NpcTrack a   �     Photo f   �     origin1 k   �     origin2 p   �     origin3 u   �     clonegroupbox x   �     name    �     lbl_bg �   �     lbl_pt �   �     mutext �   �     mutext1 �   �     lbl_leader �   �     lbl_origin �   �     lbl_origin1 �   �     origin_list1 �   �     lbl_origin2 �   �     origin_list2 �   �     lbl_origin3 '  �     origin_list3 +  �          �
  �
        �            �
        self            index            data                 �
  	       �   �   �@ �@  �   �@ I�@��  �@� �@ �   �@  �       LoadTreasureInfo    LoadNewSchoolPoseInfo    finsh_fresh    request_msg    request_school_notice        �
  �
  �
  �
  �
  �
              	        form           box                      %   E   �@  \� ��  � � �� �@    � � ��  �  A A� �@ ��A �@B���B � � �@�E� �� \ ܀  ����� D �@��D ��Ĉ� E �@�@ ��� �@  @ ���B ��D� �    	   nx_value    gui    nx_is_valid    nx_execute    custom_sender +   custom_send_request_look_school_fight_info       5@   redit_notice 	   ReadOnly    btn_notice_modify    Text    TextManager    GetText 
   nx_string 
   ui_bianji    groupbox_notice    Visible    btn_notice     btn_notice_close    is_school_leader    Enabled     %                                                                                   form     $      gui    $           !  (      E   �   � � \���@  � � �� �@    � � ��� �     ܀ ���� �       util_get_form    nx_is_valid    redit_notice    Text    nx_widestr        "  "  "  "  #  #  #  #  #  $  '  '  '  '  '  (        notice_info           form          
   form_name     +  D     
.      A@  � E�  �   \� Z@    � � K�@ \� ��  � � �� �@    � � � � A ���ˀ� A� � � ܀������� K�� ��  �AB \��P�OA�� E� � \� @@ �B� ^     �    	   nx_value    game_client    nx_is_valid 
   GetPlayer 
   QueryProp    Name    FindRecordRow    SchoolPoseRec       �?           nx_int    QueryRecord       Y@      $@    .   ,  ,  ,  .  .  .  .  .  /  2  2  4  4  4  4  4  5  8  8  8  9  9  9  9  9  ;  ;  <  <  <  <  <  <  <  <  <  >  >  >  >  >  ?  ?  C  C  D        game_client    -      client_player    -      name    -      rows    -      rank $   +           G  i    I   F @ �@  � � �� �@    � � ��  ��� �@    � � ��  �  �� �@� ƀ��   ���@� ��A�� � �B�B� �A � �  � ��@
��@� ɀC�� � �B�B� �� � �  � ����   ܀ A  @�� A  @ �A  � K��Ł B� BB� \  �  E � \� @��  � � E� �� � B E� � \ \A   �       ParentForm    nx_is_valid    is_school_leader 	   nx_value    gui    redit_notice 	   ReadOnly     btn_notice_modify    Text    TextManager    GetText 
   nx_string    ui_complete 
   ui_bianji    CheckWords            nx_widestr    CleanWords    nx_ws_length       �@   nx_execute    custom_sender +   custom_send_request_look_school_fight_info       6@    I   H  I  I  I  I  I  J  N  N  N  N  O  R  R  R  T  T  T  T  U  U  V  V  V  V  V  V  V  V  V  X  X  Y  Y  Y  Y  Y  Y  Y  Y  [  [  [  \  \  \  \  \  ]  ]  `  `  `  `  `  `  `  `  b  b  b  b  b  c  f  f  f  f  g  g  g  f  i        btn     H      form    H      gui    H      CheckWords +   H   	   new_word :   H           l  w       F @ �@  � � �� �@    � � ��� ��@�@  @���� � ���@� ������� � �� �       ParentForm    nx_is_valid    groupbox_notice    Visible    btn_notice     btn_notice_close        m  n  n  n  n  n  o  r  r  r  r  s  s  t  t  u  u  w        btn           form               y  �       F @ �@  � � �� �@    � � ��� ��@�   @���� � ���@� ������� � �� �       ParentForm    nx_is_valid    groupbox_notice    Visible     btn_notice    btn_notice_close        z  {  {  {  {  {  |          �  �  �  �  �  �  �        btn           form               �  �    
3   E   �   \� Z@    � � E@  ��  \� �   � � �� �@    � � ��  �  �� �     ܀ �@    � � �@AE� ��A \ ܀   �  � � AB���� � ��KAB�� A� \���AC ����C �A� ˁ�@�܁���� �       nx_is_valid 	   nx_value    gui    get_ini 2   share\NewSchool\NewSchoolUI\NewSchoolTreasure.ini    FindSectionIndex 
   nx_string 	   force_id            ReadString    image        info    lbl_school_tresure 
   BackImage    mltbox_treasure_info 	   HtmlText    TextManager    GetFormatText     3   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     2      gui 	   2      ini    2      index    2      image %   2      info *   2           �  �    �   E   �   \� Z@    � � E@  ��  \� �   � � �� �@    � � �@  ��  �� � A܀   @�� A    � � AA E� ��B ��\�  	A�� K��� \��AFC �� �A� ˁ�E� � \ �  ��  I��K�� \��@��  �A� ��D �� E ܁ ����A ��A� ����  �A ��� �܁   @ ����FBF �� � �� I��F�F IǍFBG IǍF�G I�ǍFBF I�ǍE� � \� �� �BH �� ��@�EB ��� ��\�  �BG �� 	 E� ��\� C܂ �����G �Ǎ�BF �Ǎ��F ��Ǎ�BG ��ǍEB	 ��	 \� W@�� ��
 �BJ���� �������J �� C� �C��
 �
 �C� �܃ �Ã���܂  ��� ���J �� � ܂ ����K �BK��K��  ܂   @�� C    � � C��� �C   ��@D  � � K����   � \�  @�  � � ��
 ��@��D �� ܃���˃�A� � �� ܃�� K����   A \��ADN E� �D� ��C	� @� �  \�  	D��N E� �D� ��C	� @  �  \�  	D��N E� �D� ��C	  ��\�  	D� � <      nx_is_valid 	   nx_value    gui    game_client 
   GetPlayer    lbl_my_name    Text    nx_widestr 
   QueryProp    Name    desc_    LevelTitle    lbl_my_power    TextManager    GetFormatText 
   nx_string 
   GuildName                lbl_my_guild    player_repute 
   nx_number    CharacterFlag    CharacterValue    get_xiae_text    lbl_my_shane    lbl_121    Visible     lbl_faction    lbl_219    newschool_xuedao    school    XueDaoFaction 
   util_text    ui_xuedaopaixi_ 
   GetTitles        @    table    getn    lbl_my_origin    role_title_ 	   force_id       Y@      &@   get_ini    share\War\SchoolPose_Info.ini    FindRecordRow    SchoolPoseRec    FindSectionIndex    ReadString 
   GetOrigin    QueryRecord       �?      @   lbl_school_zhangmen_name    lbl_school_zhangmen_power    lbl_school_zhangmen_origin     �   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     �      gui 	   �      game_client    �      client_player    �      level_title &   �   
   guildname 3   �      CharacterFlag @   �      CharacterValue E   �      text I   �      faction c   t   	   titlerec w   �      zhangmenid �   �      ini �   �      rows �   �      index �   �   	   postitle �   �   	   poseuser �   �                     �   �@  �  @  �� ����   �       nx_execute .   form_stage_main\form_role_info\form_role_info    get_xiae_text                              CharacterFlag           CharacterValue           text                 "    .   E   �@  \� ��� �� � AAA ܀���@ �� ��  �   A�A ��A�  ��A�� `��K�A�B   A� \��� ���� �    ܂ �@���AC @ ��  ����B Ƃ� �@ �B�_���   �    	   nx_value    game_client 
   GetPlayer            GetRecordRows 
   title_rec       �?   QueryRecord    nx_int    table    insert     .   
  
  
                                                                                    !  "        type     -      game_client    -      client_player    -      list_titles    -   
   row_count    -      (for index)    ,      (for limit)    ,      (for step)    ,      r    +   	   rec_type    +   
   rec_title &   +           $  5    	$      A@  � E�  �   \� Z@    � � E�  �   � � \����  � � �� �@    � � � � �  A� ܀ �� ˀA E� � \� �� � �� ��   � �@   � 	   	   nx_value    game_visual    nx_is_valid    util_get_form 
   nx_string    school    CustomSend    nx_int #   CLIENT_CUSTOMMSG_NEW_SCHOOL_TRENDS     $   %  %  %  '  '  '  '  '  (  +  +  +  +  -  -  -  -  -  .  1  1  1  1  1  3  3  3  3  4  4  4  4  4  4  3  5        game_visual    #      form    #   	   force_id    #      
   form_name    str_to_int    SUB_REQUEST_NEW_SCHOOL_TRENDS     8  r  �   �   �   � ����@    ܀ �    ��@  �@܀ �@    � � ƀ@����@ �  A ܀ A  @�� A    � � � A� � �A � EA  � \� ZA    � � A� �� �C�� �� �� `��F� �B ��� A�  ��  �� ��  ܂ ��@�ƂBCDFD��D� @� ��  �  ���@�K�E� � A \����K�E�  A \�� �FD�K����\D�E� �� ���� � \���D ���� ��E�˅�@ �E���  @��D���G	� @  ��  ń  ܄ � @ � E� � \� �� �E��E�� ��  ��	Ƅ@˄�	E� � 	\� �� ͅB� �D  _�� � $      util_get_form    nx_is_valid    mltbox_school_msg_info    Clear 	   nx_value    gui    nx_execute    util_functions    get_ini 0   share\NewSchool\NewSchoolUI\NewSchoolTrends.ini       �?   table    getn    util_split_wstring    nx_widestr    |       @       @   FindSectionIndex 
   nx_string                ReadString    DescID    TypeDescID    TextManager    Format_SetIDName    util_split_string    ;    pairs    Format_AddParam    GetText          Format_GetText    AddHtmlText    nx_int     �   9  9  9  9  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  <  ?  ?  ?  A  A  A  C  C  C  C  C  D  G  G  G  G  G  I  I  I  I  I  J  M  M  M  M  M  M  M  N  P  P  P  P  P  P  R  R  R  R  R  R  S  T  U  W  W  W  W  W  X  Y  [  [  \  \  \  \  \  \  ]  ]  ]  ]  ]  ]  _  _  _  _  `  `  `  `  `  `  c  c  c  c  d  d  d  d  c  d  h  h  h  h  h  h  i  i  i  j  j  j  k  k  k  l  l  l  l  l  l  n  n  n  n  n  n  n  n  n  M  r        new_school_id     �      arg     �      form    �      gui    �      ini     �      (for index) ,   �      (for limit) ,   �      (for step) ,   �      i -   �      info .   �   
   info_list 4   �      msgtype ;   �   
   startTime <   �      msginfo =   �      index B   �      desc C   �   	   typedesc D   �      paralst \   �      (for generator) _   f      (for state) _   f      (for control) _   f      i `   d      buf `   d      wcsInfo {   �      
   form_name     u  |       F @ I��� �       groupbox_4    box       �?       v  v  |        form                  �       F @ �@� ��@�@  � � �@� ��@�@� A� �@�@� ��   � @ �@� �       ParentForm    groupbox_4    box       �?   show_left_box        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           form          nOld               �  �        E   �@  \� ��@ �  AA ܀ ������A �  �A ܀ ����� B �@� ˀ�E� �C \ ܀  �����@C �  �C ܀ ������C �  D ܀ ���� �    	   nx_value    gui 
   lbl_name1    Text    nx_widestr    player_name    lbl_shenfeng1 
   player_sf    lbl_force1    TextManager    GetText    get_powerlevel_title_one    player_shili 
   lbl_guid1    player_guild    lbl_shengw1    player_repute         �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form           gui               �  �       F @ �@� ��@�@  � � �@� ��@�@� A� �@A� ��@  � @ �@� �       ParentForm    groupbox_4    box        @      �?   show_left_box        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           form          nOld               �  �       � @ �@@�  E�  �� \� A���� @ �@�A�  ��  �@ ���� U��܀�ɀ������B E� �@ �A\� �� �� �� U��	A�� �       groupbox_4    Find    groupbox_mh_a 
   nx_string    box    Visible     lbl_12    Text    nx_widestr    /2        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form           old           old_box          new_box               �  �    0   E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A ����� B �� ��@B ����ƀB �� ���B ����� C �� ��@C ����ƀC �� ���C ����� D �� ��@D ����ƀD �� ���D ����ƀB �� �� E �� ��@E ����ƀE �� ��   �    	   nx_value    gui    Create    Button    Name    Left    Top    Width    Height 
   ForeColor    ShadowColor    Font    NormalImage    FocusImage 
   PushImage    NormalColor    FocusColor 
   PushColor    DisableColor 
   BackColor    Text 	   AutoSize 	   DrawMode     0   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        source     /      gui    /      clone    /           �  �    4   E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A ����� B �� ��@B ����ƀB �� ���B ����� C �� ��@C ������C �� �� D �� ��@D ����ƀD �� ���D ����� E �� �ƀB �� ��@E ����ƀE �� ���E ����� F �� ��@F �����   �    	   nx_value    gui    Create    CheckButton    Name    Left    Top    Width    Height 
   ForeColor    ShadowColor    Font    NormalImage    FocusImage 
   PushImage    CheckedImage    NormalColor    FocusColor 
   PushColor    DisableColor 
   BackColor    Text 	   AutoSize 	   DrawMode    ClickEvent    HideBox     4   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        source     3      gui    3      clone    3           �      0   E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A ����� B �� ��@B ����ƀB �� ���B ����� C �� ��@C ����ƀC �� ���C ����� D �� ��@D ����ƀD �� ���B ������D ������C ����ƀC �� ��@C �����   �    	   nx_value    gui    Create    MultiTextBox    Name    Left    Top    Width    Height    HAlign    VAlign 	   ViewRect 	   HtmlText    MouseInBarColor    SelectBarColor 
   TextColor    Font    NoFrame 
   LineColor    LineHeight     0   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                      source     /      gui    /      clone    /           
         E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A �����@B��@B���B ����� C �� ��@C ������C�� D �� ��@D �����   �    	   nx_value    gui    Create 	   GroupBox 	   AutoSize    Name 
   BackColor    NoFrame    Left            Top    Width    Height 
   LineColor    NoForm  	   DrawMode 
   BackImage                                                                        source           gui          clone               "  2       E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A ����� B �� ��@B ����ƀB �� ���B ����� C �� ��@C ����ƀC �� ��   �    	   nx_value    gui    Create    Label    Name    Left    Top    Width    Height 
   ForeColor    ShadowColor    Font    Text 
   BackImage 	   DrawMode        #  #  #  $  $  $  &  &  '  '  (  (  )  )  *  *  +  +  ,  ,  -  -  .  .  /  /  0  0  1  2        source           gui          clone               5  L    %   E   �@  \� ��� �  ���� A �� ��@A ����ƀA �� ���A ����� B �� ��@B ����ƀB �� ���B ����� C �� ��@C ����ƀC �� ���C ����� D �� ��@D ������ă�   �    	   nx_value    gui    Create 
   ImageGrid 	   AutoSize    Name 
   BackColor    NoFrame    Left    Top    Width    Height 
   GridWidth    GridHeight 
   LineColor    RowNum 	   ClomnNum    DrawGridBack     %   7  7  7  8  8  8  ;  ;  <  <  =  =  >  >  ?  ?  @  @  A  A  B  B  C  C  D  D  E  E  F  F  G  G  H  H  J  K  L        source     $      gui    $      clone    $           O  �    �   E   �   \� Z@    � � F@@ �   � � �� �     � � ��  ��  �� �     ܀ �@    � � � A܀   @�� A    � � �  AA � E  � \� ZA    � � E� �� � BB \A E� �� �� BB \A E� � \� �  ���� �  @��A ��� A� �BB �D�A��AB �D�A��AB �D�AD� ����AB ��Ɂ��Ł B A �BB �D��  ܁   @  �    �  @��   ��B AB �� ��  ���  � � AB B @�  @  � B    � � ��� ����� A� �B �BB  �B��  A� � E  � \� Z  @�K�G�� B  �� \B KB�Ƃ���F�\B�FBB F�FB���	 �J������EI��	��� � *      nx_is_valid    actor2 	   nx_value    game_client 
   GetPlayer    role_composite    nx_execute 	   util_gui    ui_ClearModel    scenebox_2    util_addscene_to_scenebox 
   nx_create    GameEffect    nx_bind_script    game_effect    game_effect_init    Scene    Create    Terrain    terrain    create_scene_obj_composite    nx_call    is_loading        @	   nx_pause            modify_face 
   QueryProp    ModifyFace    util_add_model_to_scenebox    action_module    BlendAction    stand 	   SetAngle    AngleX    AngleY    AngleZ    camera    Fov    math    pi r�q��?    �   P  P  P  P  P  Q  U  W  W  W  W  W  X  [  [  [  ]  ]  ]  ]  ]  ^  a  a  c  c  c  c  c  d  g  g  g  i  i  i  i  i  j  m  m  m  m  m  n  n  n  n  n  q  q  q  s  s  s  s  s  t  t  t  t  t  t  t  u  u  u  y  y  y  y  y  z  z  z  |  |  |  |  |  |  |  |  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~          �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  	      form     �      actor2    �      game_client    �      client_player    �      role_composite !   �      game_effect 4   �      terrain H   �      actor2 S   �      action |   �           �  �       	@@� �    
   MouseDown         �  �        btn                �  �    !   	@@�F�@ ��  � � �� �@    � � �@ � @ �   ��ŀ � ܀ � E�  �� \� Z  ��E�  �� \� ZA    � �EA �� � \A� � � 
   
   MouseDown    ParentForm    nx_is_valid    actor2 J�M�!	�	   nx_pause            scenebox_1    ui_RotateModel     !   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn            form           speed 	          elapse          dist               �  �       	@@� �    
   MouseDown         �  �        btn                �  �    !   	@@�F�@ ��  � � �� �@    � � �@ � @ �   ��ŀ � ܀ � E�  �� \� Z  ��E�  �� \� ZA    � �EA �� � \A� � � 
   
   MouseDown    ParentForm    nx_is_valid    actor2 J�M�!	@	   nx_pause            scenebox_1    ui_RotateModel     !   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn            form           speed 	          elapse          dist               �  �       F @ �@  � � �� �@    � � ��@ �   ����� �@A��� I� ��  � � �@ � ��@ I� ���� ��B� �       ParentForm    nx_is_valid    Checked    grp_tvt_info    Visible    Width    FORM_WIDTH_WANFA    set_player_info    FORM_WIDTH         �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        cbtn           form               �  �    
   F @ �@  � � �� �@    � � ��� � �� �       ParentForm    nx_is_valid    cbtn_1    Checked      
   �  �  �  �  �  �  �  �  �  �        btn     	      form    	           �  �           A@  � E�  �   \� Z   � �K�@ \@ @�E  �@  � � \��  � K@A \@ 	�A�F B I��� � 
   	   nx_value ?   form_stage_main\form_school_war\form_newschool_school_msg_info    nx_is_valid    Close    util_get_form    Show    Visible    rbtn_m7    Checked        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form                 1   I   E   �   \� W@�  �E   �   \� �� @ �A�  ^  D   F � �� @ ���  �  �  �@ �� ˀA܀ �� BKA��� \�� �@ �A�  ^ @� ��� �� `�E �B\� �B�� @��� ����BÂ�E � � �� ��\� �� �C� ��������L��C  �܃ ������ ���   ��� _A�A�  ^  �    
   nx_string    0      	   nx_value    game_client 
   GetPlayer       "@      @@   GetRecordRows    Origin_Completed       �   nx_int    QueryRecord                @      ?@
   nx_number       �?   origin_     I                                   	  	                                                          "  "  "  "  "  "  $  &  &  '  '  '  '  *  *  *  *  *  *  ,  ,  ,  ,    0  0  1        force     H      pos_end    H      game_client    H      client_player    H      min_pos    H      (for index) #   F      (for limit) #   F      (for step) #   F      i $   E      row '   E   
   row_value ,   E      pos -   E   
   pos_value .   E      result 4   E      result1 5   E         force_sf_pos     4  C   	   �   �   �� �@  @ ��@  �  �   ŀ   � ܀ �� ��@ A �A  Ł    ܁ B  ܀ @�@ �A   AA � ��� �   �       nx_is_valid         
   nx_string    FindRecordRow    Repute_Record    QueryRecord       �?       5  5  5  5  5  6  6  9  9  9  9  9  ;  ;  ;  ;  ;  ;  ;  ;  =  =  >  >  B  B  B  B  B  B  C        client_player           force           repute          rows             force_to_repute     F  L       �   � � �� �   A  ܀ �   � � ��  ��   E  �  \� �  �� � �@   �       nx_int            nx_execute    custom_sender    custom_send_query_round_task        G  G  G  G  G  G  G  G  H  K  K  K  K  K  K  K  K  K  K  L     	   sub_type           task_id                O  �  �  �   �@  � � ��  ŀ    ܀ �@    � � ���    ��!��  A A� �� ܀ �  @�� A    � � � KA�Ł   � \�  � ������@�������@����@�� ��  ܁�@��������� �  ������� � �������  ��EB � �� \���� �B��� ������ ���� �����������  ��K����C A�  \����� �A� � �����F��E� ��\ ܂  C�� K��Ń   � \�  �� �� E� ��\ �C  �� ��� @ �C �� �� E� � \ �C  �� ��D E� ��\ �C  �� ��� E� � \ �C  �  � �C� � ܃ � @��D  D �ń ��	�� @��� � D �B��� �   B��@� � E� ��\� �� �A �� ��@�F�� �� �A� �� F�� �� ł    ܂ �B    � � �B
   A�
 ܂��B    � � ł  �J܂ �B    � � ��   ܂ � A�  � Y �����  �܂ � @ � �  � � ƂJ��E� � \ ܂  �B    � � ƂJ���E� � \ ܂  � @�� ��� @�� ���� @ � ��� @ � ���� @�� ��� @ � ���� @ � ��� @ ��C� )�E� ��\� �� � �� ����E�  � \� ZA    � � EA
 � � \��ZA    � � E�  �M\� ZA    � � FMK�Ł   � \�  ZA    � � FMK��Ł   � \�  �� Ɓ� �� I����� �� �� I����� �A� �� I���� � �� I����A �  ��A�@�E� ��\� �� �	 �� ��@�E�  � \� ZA    � � E� �� \� �� Ɓ� �� ƁJ��E� �BL\ ܁  �A    � � ƁJ���E� �BL\ ܁  � @ � E� ��  \� @  � � � O�M� E� ��M��\� �� ���� ł N�܂   AC � E� ��N�OD E� � \� �� � �� ��  �܄ � F�� �  \�  �� Ń  �� ��  �C    � � ��  � �� �  @�� � D E� �	 \� �� �DL� �C   � B   	   nx_value    nx_current    nx_is_valid            nx_execute    util_functions    get_ini    share\War\School_MsgInfo.ini        @   FindSectionIndex 
   nx_string    hour    ms    ntimes    del    ReadInteger    DeleteType       �?   DeleteTime    ReadString        util_split_string    ;    nx_int    DescID 	   Priority    TypeDescID    new_school_info 
   FindChild    GetChildCount    CreateChild    nx_set_custom    table    getn       @   SERVER_CUSTOMMSG_ROUND_TASK       @      @      @      @       @   nx_find_custom    force_round_task_info 	   GetChild    circle    round    max_circle 
   max_round    price    task_id    giveup    fresh_round_task    force_task_info    fresh_task 	   nx_int64     ��.A     @�@   gui    nx_widestr    TextManager    GetFormatText    ui_yijianwancheng_tips    name    ShowTipDialog    custom_sender    custom_send_query_round_task     �  Q  Q  Q  Q  S  S  S  S  S  T  W  W  W  W  X  X  X  X  X  Y  Y  Y  Y  Y  Z  \  ]  ]  ]  ]  ]  _  _  _  _  _  `  `  `  `  `  b  b  c  c  c  c  c  c  c  e  e  f  f  f  f  f  g  g  g  g  h  h  h  h  i  i  i  i  l  m  m  m  m  m  n  n  n  n  n  o  o  o  o  o  q  q  q  q  q  q  s  s  u  u  u  u  u  w  w  w  w  w  w  w  x  x  x  x  x  y  y  y  y  y  y  y  z  z  z  z  z  z  z  {  {  {  {  {  {  {  ~          �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  )   	   msg_type     �     arg     �     form    �     ini    �      ss    �      nIndex    �      DeleteTime $   �      DeleteType )   �   	   str_time 9   E   
   time_list =   E      DescID K   �   	   Priority P   �      TypeDescID U   �      f_child [   �      nCount ]   �      child b   �      info_ss �   �      num �   �      (for index) �   �      (for limit) �   �      (for step) �   �      i �   �   	   sub_type �   �     task_id �   �     circle �   �      max_circle �   �      round �   �   
   max_round �   �      price �   �      giveup �   �      child �   �      child &  :     task_id L  �     task_money O  �     child ^  �     price_ding j  �     temp n  �     price_liang q  �  
   price_wen u  �     gui x  �     text �  �        STC_SchoolMsg     �      �   �   �   �� �@    � � �@@ ��  �@AA �@��A � K�A�  \ �  E� �� \ ܁  �   ��AB@ �� ł �� ܂ � A � E� �C� \� �B��A��AB@ �� ł �� ܂ � A � E� �� \� �B��A��AB@ �B ł �� � �A  �AB@ �� ł � � �A  �A �� ܁ B FB� �  ����AB@ �� ł  � �A  ���AB@ �� ł �  � �A  �@@���� 	����A �A� ��  ܁  B A �  ����F Ɂƌ�F  AB � ���Ł �  �A @��F ��ǌ�F  A � ���Ł � �A � � � !      nx_is_valid    textgrid_2         	   RowCount       �?   nx_ws_equal    nx_widestr    GetGridText    name    SetGridText       @   round    / 
   max_round       @   circle    max_circle       @   giveup       "@   price    nx_int       ,@   task_id 	   btn_task    Enabled     Text 
   util_text    ui_taskfinish    show_task_price    ui_onekeyfinish     �   �  �  �  �  �  �  �                                                                                                                                               	  	  	  	  	  	  	  	                                                                                                   form           child           list          (for index)          (for limit)          (for step)          i    ~              C    k   �   �   �� �@    � � �@@ ��  �@AA � ��A � K�A�  \ �  E� �� \ ܁  �  ���AB@ �� ł �� ܂ � A � E� �C� \� �B��A��AB@ �� ł �� � �A  � �� ܁  FB� �  ����AB@ �B ł  � �A  ���AB@ �B ł �  � �A  �@@�Ɓ� 	��� �A� �B  ܁   A �  �����D �AE���D � A � ���A �  �A @���D ɁF���D � A� � ���A �� �A �@� �       nx_is_valid    textgrid_1         	   RowCount       �?   nx_ws_equal    nx_widestr    GetGridText    name    SetGridText       @   round    / 
   max_round       "@   price    nx_int       ,@   task_id 	   btn_task    Enabled     Text 
   util_text    ui_taskfinish    show_task_price    ui_onekeyfinish     k   !  !  !  !  !  "  %  (  (  (  (  (  )  )  )  )  )  )  )  )  )  )  )  )  )  *  *  *  *  *  *  *  *  *  *  *  *  *  *  +  +  +  +  +  +  +  .  .  .  .  .  .  .  .  /  /  /  /  /  /  /  /  1  1  1  1  1  1  1  4  4  5  5  7  7  7  7  7  7  7  7  7  7  7  8  8  9  9  9  9  9  :  :  :  :  <  <  =  =  =  =  =  >  >  >  (  C        form     j      child     j      list    j      (for index)    j      (for limit)    j      (for step)    j      i    i           F  r    Q   E   �@  \� ��� �  ����    � ܀  A @��� � A � @ � �� A   @ �A �A A  @ �� �� A  @ �� �� A   A � EA � \� ZA    � � K�C\A E� F��  \� �A �@���  �A� �A�� � ܂ CE���� � K�E�   A �� �D \C���DE� � ��   �� �\C ���   �    	   nx_value    gui    Create 
   ImageGrid    nx_current    set_copy_ent_info    imagegrid_ex4    nx_bind_script    nx_callback    on_mousein_grid    on_mouseout_grid    on_select_changed 
   ItemQuery    nx_is_valid    Clear    table    getn         	   ClomnNum       �?
   nx_string    GetItemPropByConfigID    Photo    AddItem           �   nx_set_custom    config     Q   G  G  G  H  H  H  J  J  J  J  K  K  K  K  K  M  M  M  M  M  N  N  N  N  N  O  O  O  O  O  P  P  P  P  P  S  S  S  T  T  T  T  T  U  X  X  Y  Y  Y  Y  [  ^  _  _  _  _  a  a  a  b  b  b  b  d  d  d  d  d  d  d  f  h  h  h  h  h  h  h  _  q  r     
   item_list     P      gui    P      tmp_imagegrid    P      form 
   P   
   ItemQuery &   P      count 2   P      grid_index 3   P      (for index) 7   O      (for limit) 7   O      (for step) 7   O      i 8   N      nItem ;   N      photo ?   N           u  �       �      @� ܀�A  @�� A    � � �  @�� E�  � \@�W@����B �  �E� ����\��B  a�  �� �    
   nx_custom    nx_is_valid    nx_property_list    ipairs    Name    nx_set_property    nx_property        v  v  v  v  x  x  x  x  x  y  |  |  |  ~  ~  ~  ~      �  �  �  �  �  �  �  �  ~  �  �  
      form           source           target_ent           source_ent       
   prop_list          (for generator)          (for state)          (for control)          i          prop               �  �   !   �   �@@� � �� ŀ     ܀ �   ����  A AAAA � ��A   AB ���˂A @ ��� ܂ �  @��   � �� @�C ߁��@� �       table    getn    nx_is_valid         	   RowCount       �?   GetGridTag    nx_destroy     !   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        grid            arg            count           (for index)           (for limit)           (for step)           i          (for index)          (for limit)          (for step)          j          data               �  �    B   E   �@  \� ��  � � �� �@    � � ��� �� ŀ    ܀ �@    � � � AAA ܀�W� ���� A � E� ��\� @  � � A E� � E�  � \� ZA    � � K�B��\���C �AB �� �����    A �B � � �A  �AA� ܁�� @  �� �B  �� B   �    	   nx_value    game_client    nx_is_valid 
   GetPlayer 
   QueryProp 
   NewSchool  
   nx_string        get_ini    INI_FORCE_INFO    FindSectionIndex    ReadInteger    ID            nx_set_custom 	   force_id    nx_int    Sex    sex     B   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     A      client    A      player    A      force    A   
   force_ini "   A      index +   A   	   force_id 0   A      sex :   A           �  �    
   E   �   \� Z@    � � F@@ �   � � �� �@    � � ��� �� ��    � @ ��B �  ��� � �@  �       nx_is_valid 	   RootNode    GetNodeList    pairs 
   ClearNode        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     
   tree_view        
   root_node          table_main_node          (for generator)          (for state)          (for control)          i       
   main_node               �  �           A@  � E�  �   \� Z@  @ �A�  ^  K A \� ��  � � �� �@  @ ���  �  ��  �@� A� ܀��   � ���� A� ܀�� ��   �    	   nx_value    game_client    nx_is_valid         
   GetPlayer 	   FindProp    SchoolRuleValue 
   QueryProp        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        client          player          value               �      5   E   �   \� @� � ���  �  @�@��� ��  �   �@��� ��� �  � �@��@ ��  �  �@B �@B ���@ ��@  @�� �@ ��� @��@  � @ � E� � \�  �  ���BA E� �� � �� �AB�� \� A  �    
   nx_number       @   tips_title_0      �b@   tips_title_151       a@   tips_title_136      @^@   tips_title_121       $@      �?   nx_int            tips_title_ 
   nx_string     5   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                         	  	  	  	  	  	  	  	  
                              powerlevel     4      pl    4      s    4      y    4                    L � �@  �   �  @� A����    ���  �    @  ��  �� ����@   �          �?   nx_find_custom    config 
   show_tips 
   nx_custom                                                    grid           index                         �   �@  �  F�@ �@  �       nx_execute 
   tips_game 	   hide_tip    ParentForm                          grid           index                  G    �   �   � � �� �   A  ܀ W� ���   � � �� �   �  ܀ �   � � ��  �  �� ��  A ܀ � @ �    �� @�� A    � � �A�  �� � �     �B�  �� �� �  B � �  KB�   � ܁   A�  \�  �B  @� � E  �� \ ��  �BE  �� \� �  � � ܁  
  E  �� \� 	B��E� � \� 	B��E� ��\� 	B�E� � \� 	B��E  ��\� 	B�E� �D \� ZB  � �EB �� \� 	@�FD K��\B E � \ ��C �D   @��C a�   �E� �� � D KCF \� ��F �� ��F G FDG \B� �  �    
   nx_string        nil 	   nx_value 
   ItemQuery    IniManager    nx_is_valid    FindItemByConfigID    GetItemPropByConfigID 	   ItemType    Level    sellPrice1    Photo 	   ConfigID    nx_int    SellPrice1    Data 
   nx_create 
   ArrayList    ClearChild    pairs    nx_set_custom    nx_execute 
   tips_game    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop 
   GridWidth    GridHeight    ParentForm     �                                     "  "  "  #  #  #  %  %  %  %  %  &  &  &  &  &  '  *  *  *  *  *  *  *  +  +  +  +  +  +  +  +  ,  ,  ,  ,  ,  ,  ,  ,  -  -  -  -  -  -  -  -  .  .  .  .  .  .  .  .  1  2  2  2  2  3  3  3  3  4  4  4  4  5  5  5  5  6  6  6  6  9  9  9  9  9  :  :  :  :  <  <  <  >  >  >  >  ?  ?  ?  ?  ?  >  ?  C  C  C  C  D  D  D  D  D  D  D  C  E  G        grid     �      item_config     �   
   ItemQuery    �      IniManager    �   
   item_type 1   �      item_level 9   �      item_sellPrice1 A   �      item_photo I   �      prop_array J   �      (for generator) m   u      (for state) m   u      (for control) m   u      prop n   s      value n   s           I  T       F @ �@  � � �� �@    � � ��  ��  �@ � � �@  �       ParentForm    nx_is_valid    util_auto_show_hide_form 0   form_stage_main\form_force_school\form_wgm_info    Close        J  L  L  L  L  L  M  P  P  P  S  S  T        btn           form               V  �    q      D   � � ��E@  �   \� Z@    � � F�@ I ��F@A I ��F@A I�A�E  �@ \� �@  � � �� �@    � � �  �� �� ��B܀ A  @�� A    � � ��A ��W �@ � ��  � � E �A �� � \� �A  ���� �A    � � ��B ����A  � � �� � K��� \��M����  B	��� ��� KC��  �\� �� �� �� Ń   ܃ �@�@�����  �@��� � � ��  �  @��� �   ܃ ��� ��� �   ܃ �����@ 	BǁBA 	Bǁ �       util_get_form    nx_is_valid    lbl_loading    Visible    ani_loading 	   PlayMode         	   nx_value    ConditionManager    game_client 
   GetPlayer 
   QueryProp 
   NewSchool         nx_execute    util_functions    get_ini 3   share\NewSchool\NewSchoolUI\NewSchoolCondition.ini    FindSectionIndex 
   condition    GetSectionItemCount       �?   GetSectionItemKey    GetSectionItemValue    nx_int    CanSatisfyCondition 
   nx_string      q   W  W  W  W  Y  Y  Y  Y  Y  Z  ]  ]  ^  ^  _  _  b  b  b  d  d  d  d  d  e  i  i  i  j  j  l  l  l  l  l  m  p  p  p  r  r  r  r  s  v  v  v  v  v  x  x  x  x  x  y  |  |  |  ~  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form    p      condition_manager    p      game_client    p      player    p      player_force '   p      ini 1   p   
   sec_index :   p      condition_pass >   p      (for index) D   l      (for limit) D   l      (for step) D   l      i E   k   
   condition I   k      force M   k      
   form_name    condition_pack     �  �   
:   E   �   � � \���@  � � �� �@    � � ��  �   �� ŀ    ܀ �  A�  �  ���� � ɀ����� ɀ��� � ɀ�� � �@ �B܀ A N��MA� EA ��B\� �A ������� ��  @�� ������  @�� �����  @ � ��� �       util_get_form    nx_is_valid    nx_int         	   lbl_ding    Text     
   lbl_liang    lbl_wen 	   nx_int64     ��.A     @�@   nx_widestr     :   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        _price     9      form    9      price    9      price_ding    9      temp #   9      price_liang &   9   
   price_wen *   9      
   form_name     �  �   x   E   �   \� �@  � � �� �@    � � �   ��  �� ��  � ܀ �  AA �  �  � � � �  F�� K��� � � \�  Z   �F�� KA�� � � \�  � ��  �F�� K��� � � \�  Z  ��F�� KA�� � � \�  � �  � �   ��EA  �� \� Z  ��E� � �A �  A� � E�  �� \ \A  �
�E� �D�AD� E�  ��� �E\� ��  �B� ���� ��  �� E܂ � F�� �  \�  � ��  �� ��  �A    � � �A  �� �� �  @��� � B E�  �� \� ��  �� � �A   �    	   nx_value    nx_is_valid    gui    nx_int    task_id            force_round_task_info 
   FindChild 
   nx_string 	   GetChild    force_task_info    nx_execute    custom_sender    custom_send_query_round_task       @   nx_widestr    TextManager    GetFormatText    ui_yijianwancheng_tips 	   lbl_ding    Text 
   lbl_liang    lbl_wen    name    ShowTipDialog    send_task_msg       (@    x   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn     w      form    w      gui    w      child    w   	   is_round    w      text `   w      
   form_name     �  �    @   E   �@  \� ��� �  ����    � ܀  A @��� � A � @ � �� A   @ �A �A A  @ �� �� A   A� � E � \� ZA    � � KAC\A K�C�  � \� �DB @��� ��  �A��A ��D�A �A � � E� BE �A �   �    	   nx_value    gui    Create 
   ImageGrid    nx_current    set_copy_ent_info    imagegrid_ex4    nx_bind_script    nx_callback    on_mousein_grid    on_mouseout_grid 
   ItemQuery    nx_is_valid    Clear    GetItemPropByConfigID    Photo    AddItem    grid_index           �?      �   nx_set_custom    config    i    nItem     @   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        path     ?      gui    ?      tmp_imagegrid    ?      form 
   ?   
   ItemQuery !   ?      photo -   ?           �          E   �   \� Z@    � � E@  ��  \� ��� �� �     ܀ �@    � � � AAA ܀�W� �@ ����  � � A� ��KA�A \�� � 
      nx_is_valid 	   nx_value    game_client 
   GetPlayer 
   QueryProp 
   NewSchool         NewSchoolContribute    NewDailyContribute         �  �  �  �  �  �                        	  	  	                                form           game_client 	         client_player          new_school          total_score       
   day_score                        E   �@  ��  �  A \@� �       nx_execute    custom_sender    custom_ancient_tomb_sender       9@      �?                           btn                       
   �   �@  �  A�  � �AA ܁ �A � F�A �@  �       nx_execute 
   tips_game    show_skill_tips    CS_single_sjhb      H�@   GetMouseInItemLeft    GetMouseInItemTop    ParentForm                                       grid           index                #  %       �   �@  �  F�@ �@  �       nx_execute 
   tips_game 	   hide_tip    ParentForm        $  $  $  $  $  %        grid           index                (  A    <   F @ �@  � � �� �@  �  ܀ � @ ��   �  ��  �  �� �@   ܀ �@  @ ��   �  ˀAEA  �� \ ܀  ��@ �   B���A �  ��KB��� A�  \����B �A    ܁ ����AC ��C�A �AC ��C EB ��\ �  A� �A �� �  �       school 
   nx_string        get_ini !   share\ForceSchool\gmp_shimen.ini    nx_is_valid    FindSectionIndex            ReadString    back    text    lbl_shimen 
   BackImage    mltbox_shimen    Clear    AddHtmlText    nx_widestr 
   util_text       �    <   )  *  *  *  *  *  *  *  *  +  +  .  .  .  /  /  /  /  /  0  0  4  4  4  4  4  5  5  6  6  9  9  9  9  9  :  :  :  :  :  <  <  <  <  <  =  =  =  >  >  >  >  >  >  >  >  >  @  @  A        form     ;      new_school    ;      ini    ;   
   sec_index    ;      back #   ;      text (   ;           D  h    x   F @ �@  ��  �� �@  �� ܀ �  ��  �@ � �@� ��@  �� �� �@  �� ܀ �  ��  �  � �@����@  �@ �� �@  �� ܀ �  ��  �� � �@����@  �� �� �@  �� ܀ �  ��  �  � �@�@��@  �@ �� �@  �� ܀ �  ��  �� � �@� ��@  �� �� �@  �� ܀ � ���  �@ �@ �� �@ �� ��   ܀ �@    � � �  A A � �A �@�@��@  �� �� �@  �� ܀ � @��  �@ �@ �� �@ �� ��   ܀ �@    � � �  A A � �� �@� �       ParentForm 
   nx_string    newschool_gumu    school    nx_execute 3   form_stage_main\form_force\form_force_gumupai_smdh 
   open_form    newschool_changfeng 3   form_stage_main\form_force\form_force_longmen_smdh    newschool_shenshui /   form_stage_main\form_force\form_force_ssg_smdh    newschool_wuxian /   form_stage_main\form_force\form_force_wxj_smdh    newschool_damo /   form_stage_main\form_force\form_force_dmp_smdh    newschool_xuedao    util_auto_show_hide_form )   form_stage_main\form_rank\form_rank_main 	   nx_value    nx_is_valid    set_select_node_state    rank_8_xdm_sqz    newschool_huashan    rank_8_hsp_qclj     x   E  G  G  G  G  G  G  G  G  H  H  H  H  H  I  I  I  I  I  I  I  I  J  J  J  J  J  K  K  K  K  K  K  K  K  L  L  L  L  L  M  M  M  M  M  M  M  M  N  N  N  N  N  O  O  O  O  O  O  O  O  P  P  P  P  P  Q  Q  Q  Q  Q  Q  Q  Q  R  R  R  T  T  T  V  V  V  V  V  W  Z  Z  [  [  [  Z  [  \  \  \  \  \  \  \  \  ]  ]  ]  _  _  _  a  a  a  a  a  b  e  e  f  f  f  e  h        btn     w      form    w   
   rang_form P   \   
   rang_form k   w           k  �   j   E   �   \� �@  � � �� �@    � � ��� �  AA ܀ �����  �@A �� �  � ܀ � @���� �  � A  ܀  �����@� �  � A  ܀  ������� � Å�@� �  � A  ܀  ������� � ć ��@� �  A A� ��D �E BE �܀  ������� �  �E ܀ ������� �  AF ܀ �����  ��E �� �@ � �FD� � AA ���� B D� F��� A� ܁� FB�� � �� F���  ��B� E �� ��� \�  	B��߀�ƀ� ��Ǉ �     	   nx_value    nx_is_valid    lbl_lot_name    Text    nx_widestr       �?    
   util_text    ui_lot_005    lbl_lot_time    pbar_lot_value    Value            lbl_lot_title    btn_lot_exchange    Enabled     util_format_string    ui_lot_004        @      @      @   lbl_lot_value       @   nx_int       @   table    getn    util_split_string 
   nx_string    ,     j   l  l  l  m  m  m  m  m  n  q  q  q  q  q  r  r  r  r  r  r  r  r  s  s  s  s  s  s  s  t  t  t  t  t  t  t  u  u  v  v  v  v  v  v  v  y  y  y  {  {  {  {  {  {  {  {  {  {  |  |  |  |  |  }  }  }  }  }        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        arg     i      form    i   
   lot_value G   i      (for index) M   g      (for limit) M   g      (for step) M   g      i N   f      var U   f      
   form_name 
   lot_title     �  �    a   E   �@  \� ��  � � �� �@    � � ��  � � @ �A ܀ � A� � FB KA�\A FB K����  �A � �B \A�FB K���� � A� � E� � \ \A  A ��  �AB �� Ł � ܁ BD BBB BD �B�� �  @��C B�BD �C�� ł � ܂ � @� B  � K� � C \� �� �� �� ��D �B��B ��D ˂�A� ���   AD �B���D ˂�A� �� �� �� ��   � �B   �    	   nx_value 
   ItemQuery    nx_is_valid    item_cfbj_gezi001    GetItemPropByConfigID    Photo    nx_int       �?   ImageControlGrid_gezi    Clear    AddItem                   �   SetItemAddInfo    nx_widestr    item_cfbj_ying001    ImageControlGrid_ying    item_cfbj_jiu001    ImageControlGrid_jiu     a   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     `   
   ItemQuery    `   	   item_id1 
   `      item_photo1    `      item_count1    `   	   item_id2 '   `      item_photo2 +   `      item_count2 .   `   	   item_id3 D   `      item_photo3 H   `      item_count3 K   `           �  �    )   E   �@  \� ��  � � �� �@    � � ��  � � @ �A ܀ � A� � FB KA�\A FB K����  �A � �B \A�FB K���� � A� � E� � \ \A  FD I�Ĉ �    	   nx_value 
   ItemQuery    nx_is_valid    item_yjp_1    GetItemPropByConfigID    Photo    nx_int       �?   ImageControlGrid_ss_yjp    Clear    AddItem                   �   SetItemAddInfo    nx_widestr 
   rbtn_ss_1    Checked     )   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     (   
   ItemQuery    (      item_id 
   (      item_photo    (      item_count    (           �  �    7   � @ A  @� � EA  ��  \ ��  ��    ܀ �  A � W �����    ܀ �  AA �  �  � � ŀ � A ܀�� @ � � �� AA �� � �� �� � ��� ��� A� �� ��D � KBD \� �� �� �D A� �       GetItemAddText    nx_int       �?   nx_widestr        nil    nx_execute 
   tips_game    get_tips_ArrayList 	   ConfigID 
   nx_string 	   ItemType    get_ini_prop    share\Item\tool_item.ini    0    show_goods_tip    GetMouseInItemLeft    GetMouseInItemTop       @@   ParentForm     7   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        grid     6      index     6      item_config    6      item    6           �  �    	   � @ A  �@���  ��   FAA �@  �       SetSelectItemIndex       �   nx_execute 
   tips_game 	   hide_tip    ParentForm     	   �  �  �  �  �  �  �  �  �        grid           index                �  �       F @ �@@ �   @���� � ���@� ������� ���� �       ParentForm    Checked    groupbox_ss_1    Visible    groupbox_ss_2     groupbox_ss_3        �  �  �  �  �  �  �  �  �  �  �        btn     
      form    
           �  �       F @ �@@ �   @���� � ���@� ������� � �� �       ParentForm    Checked    groupbox_ss_1    Visible     groupbox_ss_2    groupbox_ss_3        �  �  �  �  �  �  �  �  �  �  �        btn     
      form    
           �  �       F @ �@@ �   @���� � ���@� � ����� ���� �       ParentForm    Checked    groupbox_ss_1    Visible     groupbox_ss_2    groupbox_ss_3        �  �  �  �  �  �  �  �  �  �  �        btn     
      form    
           �     %   E   �@@ \� W��  �E   �@@ \� ��   � � E  �@ \� �� � � �� �@    � � �   �   A@ ܀ �� ��A A� �B�� ��FA� K��� \��A� � �    
   nx_string    school    0     	   nx_value    gui    nx_is_valid    mltbox_rule 	   HtmlText    TextManager    GetFormatText    ui_schoollaw_rule     %   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           form     $      gui    $      repute    $         force_to_rule       	       � @ ������  �   �@ I�@� �       groupbox_wuxian    Visible    load_guzhong_tool    finsh_fresh                    	        form           box                  1    Z   E   �@  \� ��  � � �� �@    � � ��@ � A�@ �@ � K� ��B \ �  � �B�� Ł  @�� AB �� A���C AA �  � K� ��B \ �  � �B�� Ł  @�� AB �� A��@D AA �� � K� ��B \ �  � �B�� Ł  @�� AB �� A���D AA �  � K� ��B \ �  � �B�� Ł  @�� AB �� A� �    	   nx_value 
   ItemQuery    nx_is_valid    ImageControlGrid_guchong01    Clear    item_wxinsect_a    photo 
   nx_string    GetItemPropByConfigID    Photo    AddItem            nx_widestr       �?      �   ImageControlGrid_guchong02    item_wxinsect_b    ImageControlGrid_guchong03    item_wxinsect_c    ImageControlGrid_guchong04    item_wxinsect_d     Z                                                                                                     !  "  "  $  &  &  &  &  &  &  &  '  '  '  '  '  '  '  '  '  )  *  *  ,  .  .  .  .  .  .  .  /  /  /  /  /  /  /  /  /  1        form     Y   
   ItemQuery    Y      grid 
   Y      item_id    Y           4  =    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        5  5  5  7  7  7  7  7  8  ;  ;  ;  ;  <  <  <  <  <  ;  =        grid           index           item_config               @  B       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        A  A  A  A  B        grid           index                E  N    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        F  F  F  H  H  H  H  H  I  L  L  L  L  M  M  M  M  M  L  N        grid           index           item_config               Q  S       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        R  R  R  R  S        grid           index                V  _    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        W  W  W  Y  Y  Y  Y  Y  Z  ]  ]  ]  ]  ^  ^  ^  ^  ^  ]  _        grid           index           item_config               b  d       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        c  c  c  c  d        grid           index                g  p    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        h  h  h  j  j  j  j  j  k  n  n  n  n  o  o  o  o  o  n  p        grid           index           item_config               s  u       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        t  t  t  t  u        grid           index                x  �    
   � @  � ����@    ܀ ��  � � ��   AA � ˁA ܁ �A � @  �@� �       GetItemName 
   nx_string        nx_execute 
   tips_game    show_tips_by_config    GetMouseInItemLeft    GetMouseInItemTop        y  y  y  {  {  {  {  {  |          �  �  �  �  �    �        grid           index           item_config               �  �       �   �@  �  �@� �       nx_execute 
   tips_game 	   hide_tip        �  �  �  �  �        grid           index            �           	   	   	   
   
   
                                                                                                         !   #   $   %   '   '   )   +   ,   -   /   /   1   1   1   1   1   4   6   7   8   9   :   ;   <   =   A   C   D   E   F   G   H   I   J   N   W   Y   Z   [   \   ]   ^   _   `   d   i   k   m   m   p   s   t   u   x   }   z   �      �   �   �   �   �   �   �   >  �   R  @  \  T    _  �  �  �  �  �      #    T  &  g  W  z  j  �  }  �  �  �  �    �  &    ,  (  <  /  d  ?  y  g  }  {  �    �  �  �  �  �    �  *    :  ,  T  =  f  W  �  i  �  �    �  2    T  5  `  W  l  b      o      $  
  1  '  �  �  4  �  �  �  �    �  �  �    �  �  	  	  �  *	  	  9	  -	  �	  <	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  
  �	  
  	
  
  
  N
  
  �
  Q
  �
  �
  	  �
      (  (  !  D  +  i  G  w  l  �  y  �  �  �  �       "    5  5  5  5  $  r  r  8  |  u  �    �  �  �  �  �  �  �  �  �  �    �    
  2  "  L  5  �  O  �  �  �  �  �  �  �  �  �  �  �  �  �  �  1  1    C  C  4  L  F  �  �  O    �  C     r  F  �  u  �  �  �  �  �  �  �  �    �          G    T  I  �  �  �  V  �  �  �  �  �  �  �  �    �           %  #  A  (  h  D  �  �  �  k  �  �  �  �  �  �  �  �  �  �  �  �  �  �      �  	    1    =  4  B  @  N  E  S  Q  _  V  d  b  p  g  u  s  �  x  �  �  �     
   form_name "   �     SUB_REQUEST_NEW_SCHOOL_TRENDS #   �     Cover_Ng_Img 1   �     Cover_Cloth_Img 7   �     ArtPack <   �     str_to_int E   �     force_to_repute N   �     force_sf_pos O   �     force_to_rule X   �     condition_pack Y   �  
   lot_title ]   �     STC_SchoolMsg ^   �     gg_msg _   �     ry_msg `   �     cf_msg a   �     kickout_force_value b   �      