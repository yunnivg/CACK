LuaQ  V   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_outland\form_outland_war_map.lua           i      A@  @    A�  @    A�  @    A  @ @ A� �� �   �  �@  �@ �  ǀ ��  �� �  �  �@ �@ � ǀ �� �� �  �  �@ �@ � ǀ �� �� �  �  �@ �@ � ǀ �� �� �  �  �@ �@ � ǀ �� �� �  �  �@ �@ � ǀ �� �� �  �  �@ �@ � ǀ �� �� �  � 	 �@ �@	 � ǀ	 �� ��	 �  � 
 �@ �@
 � ǀ
 �� ��
 � 	   �    �  �@	 �@ �	     ǀ ��	 �� � 
 �  �@
 �@ �
 ǀ  � 3      require    utils 	   util_gui    define\gamehand_type    util_functions    crash_npc_rec      ��@     �x@   main_form_init    on_main_form_open    data_bind_prop    del_data_bind_prop 	   load_map    on_main_form_close    on_btn_close_click    load_map_pic    on_update_role_position    set_map_center 
   is_in_map    on_pic_map_drag_move    on_pic_map_mouse_move    mouse_right_up    on_pic_map_right_down    on_pic_map_right_up    trans_scene_pos_to_map    trans_pos_to_map    trans_pos_to_scene    set_lbl_position    update_outland_stage    on_update_stage    on_btn_up_click    on_btn_up_push    on_btn_down_click    on_btn_down_push    on_btn_left_click    on_btn_left_push    on_btn_right_click    on_btn_right_push    on_tbar_zoom_value_changed    set_map_zoom    on_btn_zoom_in_push    on_btn_zoom_in_click    on_btn_zoom_out_push    on_btn_zoom_out_click    set_camp_to_map_center    refresh_campsite    camp_is_alive    init_outland_campsite    update_outland_campsite    getCampsitePos    getAllCampsiteName +               	   	@@�E�  �   ��   \@ A  ^   �       Fixed     nx_set_custom    last_stage       �?    	                                    self                   +     >   E   �   \@ E@  ��  \� � � �@A�@A �� ��A	���� � � B� B �� ��A	����@B �@B ���AB C� �π��� ��@ �   �C �C�AF�C F�O���@ �@ �@� �@  ŀ �� ��DA �A Ł ܁� � @  �B �B �@��     �@ �@    �@ ŀ    �@ �� �   �    	   load_map 	   nx_value    gui    Left    Desktop    Width        @   Top    Height 
   tbar_zoom    Value    Maximum    Minimum    set_map_zoom    pic_map    MaxZoomWidth    MaxZoomHeight    mouse_right_up    GAME_TIMER 	   Register      @@      �   nx_current    on_update_role_position    update_outland_stage    set_camp_to_map_center    data_bind_prop       �?    >                                                                                                                    "   "   "   #   #   #   #   #   #   #   #   #   #   %   %   %   &   &   &   )   )   )   *   *   +         self     =      gui    =      timer (   =           .   9        E   �   \� Z@    � � E@  ��  \� �   � � �� �@    � � ���  @  �A ��� �� �@  �       nx_is_valid 	   nx_value    data_binder    AddTableBind    crash_npc_rec    nx_current    refresh_campsite        /   /   /   /   /   0   3   3   3   4   4   4   4   4   5   8   8   8   8   8   8   8   9         self           databinder 	              ;   F        E   �   \� Z@    � � E@  ��  \� �   � � �� �@    � � ���  @  �@  �       nx_is_valid 	   nx_value    data_binder    DelTableBind    crash_npc_rec        <   <   <   <   <   =   @   @   @   A   A   A   A   A   B   E   E   E   E   F         self           databinder 	              J   �     �   E   �@  \� ��  � � �� �@    � � ��� �� ŀ    ܀ �@    � � � AAA ܀��A A ���A  �A� UA�	A�� @��A ��� E � \� ��  ���� �A    � � ��A ˁ�A� � �B ܁�������A ˁ�A� �� �B ܁������A ˁ�A� �B �� ܁������A ˁ�A� � �� ܁������  �� �� 	�����A �EƁA �����ƁA ����A G���A F�A FB���A ��FO��	B���A F�A F���A �GO��	B��A NH	B���A N�	B���A F�A F��O��	B��A F�A F�O��	B��A 	�ɒ�A 	�ɓ�A BIF�A FB�BF�A F����A �BGM��B�FJ �J ��J�J ���J �J������I���E  � \� �AC ���Ƃ����@ ܂� F��KC��� \��  E �� \� � ���� �FM � � �� I��� � 6   	   nx_value    game_client    nx_is_valid 	   GetScene 
   QueryProp 	   Resource    pic_map    Image    gui\map\scene\    \    .dds    .ini    get_ini    TerrainStartX    ReadInteger    Map    StartX            TerrainStartZ    StartZ    TerrainWidth    Width       �@   TerrainHeight    Height 
   map_query 	   MapQuery    ImageWidth    ImageHeight    MinZoomWidth    MinZoomHeight    MaxZoomWidth       �?   MaxZoomHeight    CenterX        @   CenterY 
   ZoomWidth       �?   ZoomHeight 
   tbar_zoom    Value    Minimum    Maximum    gui 	   ConfigID    TextManager    GetFormatText    nx_widestr    GetText    ui_current_scene    :     lbl_current_scene    Text     �   N   N   N   O   O   O   O   O   P   S   S   T   T   T   T   T   U   X   X   X   Z   Z   Z   Z   Z   Z   Z   Z   ]   ]   ]   ]   ]   ]   _   _   _   `   `   `   `   `   a   d   d   d   d   d   d   d   e   e   e   e   e   e   e   f   f   f   f   f   f   f   g   g   g   g   g   g   g   i   i   i   i   k   k   k   k   k   l   l   l   l   l   n   n   n   n   n   n   n   o   o   o   o   o   o   o   q   q   q   r   r   r   t   t   t   t   t   u   u   u   u   u   w   w   x   x   {   {   {   {   {   {   {   {   {   {   {   |   }   }   }   }   }   }   }   }   }   }   }   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     �      game_client    �      client_scene    �   	   resource    �   
   file_name "   �      ini %   �      real_zoom_width P   �      real_zoom_height U   �      ratio �   �      gui �   �      scene_config �   �      scene_name �   �      current_scene �   �           �   �        E   �@  \� ��� �  �� A �  �@��@ �@� �� �@� �� �   �@  �    	   nx_value    GAME_TIMER    UnRegister    nx_current    on_update_role_position    mouse_right_up    del_data_bind_prop    nx_destroy        �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         self           timer               �   �     	   F @ �@  � � �� �   @ ���� �@  �       ParentForm    nx_is_valid    Close     	   �   �   �   �   �   �   �   �   �         self           form               �   �     =   � @ �@����  � � �  @� � ��	�����   � A�  �� �� ���� @�� E � \� ZA    � � KAB�� \����  � � �AC �A� �� ���	���AC �A �� ���	����AC �A� �� ���	����AC �AB �� ���	����E �F	����F �F	��� �       ParentForm    current_map    gui\map\scene\    \    .dds    Image    .ini    get_ini    nx_is_valid    FindSectionIndex    Map            TerrainStartX    ReadInteger    StartX    TerrainStartZ    StartZ    TerrainWidth    Width       �@   TerrainHeight    Height    CenterX    ImageWidth        @   CenterY    ImageHeight     =   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         pic_map     <   	   resource     <   	   pic_name    <   	   ini_name    <   	   ini_file    <   
   sec_index    <           �   �     N   �   A  ܀ �  @�� A    � � ��� E�  � \� ZA    � � FA ��AI���FA �BI���FA ��BI���E� �A �C \A�FA ��C� �� ����I���EA \�� �� �� �� �܁ � ����B �  C�����   ��� �  C����ł    ܂ �  � ���   FC �B������E A �A���  �F �� �  � ���E F �A� �    	   nx_value    game_visual    nx_is_valid 
   GetPlayer 	   lbl_role    x 
   PositionX    y 
   PositionY    z 
   PositionZ    set_lbl_position    pic_map    AngleZ    AngleY    math    pi    getAllCampsiteName       �?   table    getn    nx_find_custom 
   nx_custom    ToFront    groupbox_move     N   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     M      param1     M      param2     M      game_visual    M      visual_player    M      camptbl '   M      (for index) -   B      (for limit) -   B      (for step) -   B      i .   A      lbl 8   A           �       	5   � @ �@�π�@ �@� �@ AF@ FA�O���@ ��@O��AF@ FA�O���@ ��AO���@ ��A�@ �A�ρ�@ �A������   �@ �@   �@  @  �� ��   ��  �@ �A ��@ Ɂ��ƁB ����A �    �A  �       pic_map    Width        @
   ZoomWidth    ImageWidth    Height    ZoomHeight    ImageHeight    CenterX    CenterY 
   map_query    UpdateMapLabel    on_update_role_position     5   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                 form     4   	   center_x     4   	   center_z     4      center_x_min    4      center_x_max    4      center_z_min    4      center_z_max    4                    �   �@  �� ŀ    ܀ �    ���@@  �� �  �   �   �   �    	   nx_value 	   MapQuery    nx_is_valid    IsInMap                                              control           pic_map        
   map_query                        �      AA  ܀��@    � � � � �@ � ���� FA A�@FA@ LA��AA ��ƁA � @���� B  �       nx_find_custom    click_center_x 
   ZoomWidth       �?   ZoomHeight    click_center_z    ParentForm    set_map_center                                                                  pic_map        	   offset_x        	   offset_y           sx          sz          map_x          map_z          form                 0    *   � @ A@ �@� F�@ O��MA�A �AA ����ƁA �A ��� @ ���BB �B F�B �C �CC �C ����B � E� � \ �  A �� ��  �� ��  �܂ ��� �       ParentForm    Width        @   Height    CenterX 
   ZoomWidth    CenterY    ZoomHeight    trans_pos_to_scene    ImageWidth    ImageHeight    TerrainStartX    TerrainStartZ    TerrainWidth    TerrainHeight    lbl_pos    Text    nx_widestr 
   nx_string    nx_int    ,     *      #  #  #  $  $  $  '  '  '  '  (  (  (  (  +  +  +  +  +  ,  ,  -  -  +  /  /  /  /  /  /  /  /  /  /  /  /  /  /  /  /  0  
      pic_map     )   	   offset_x     )   	   offset_y     )      form    )      sx    )      sz    )      map_x    )      map_z    )      pos_x    )      pos_z    )           3  :           A@  � E�  �   \� Z   ��E�  � A �@ \��Z    �F A F@� Z    �E� � A �� � \@  �    	   nx_value 6   form_stage_main\form_outland\form_outland_eren_warmap    nx_is_valid    nx_find_custom    pic_map    right_down    on_pic_map_right_up                4  4  4  5  5  5  5  5  6  6  6  6  6  6  6  6  6  6  7  7  7  7  7  :        form               =  M       � @ A  @�� A    � � �  A�  � 	@A�F�A 	@�FAB 	@�	@ �	��� �       ParentForm    nx_is_valid 	   nx_value    gui    right_down    click_center_x    CenterX    click_center_z    CenterY    click_offset_x    click_offset_y        >  @  @  @  @  @  A  D  D  D  G  I  I  J  J  K  L  M        pic_map           x           y           form          gui 
              P  V       �   A  ܀ ���@A 	@A� �    	   nx_value    gui 	   GameHand 
   ClearHand    right_down         Q  Q  Q  R  R  R  T  V        pic_map           x           y           gui               X  j       E  �  �� B@F�@��@�ACAF�A\��  � �F�AMA��BN���AB��ƁB����B��L���AC������  �� �       trans_pos_to_map    ImageWidth    ImageHeight    TerrainStartX    TerrainStartZ    TerrainWidth    TerrainHeight    CenterX 
   ZoomWidth    CenterY    ZoomHeight    Width        @   Height        \  \  \  ]  ]  ^  ^  _  _  \  _  _  b  b  b  b  c  c  c  c  f  f  f  g  g  g  i  i  i  j        x           z           pic_map           map_x           map_z           sx          sz               m  s        �� MB� ON� ���� �            o  o  o  o  p  p  p  r  r  r  s  
      x     
      z     
   
   map_width     
      map_height     
      terrain_start_x     
      terrain_start_z     
      terrain_width     
      terrain_height     
      map_x    
      map_z    
           v  |       � � N OLB�� ���� �            x  x  x  x  y  y  y  {  {  {  |  
      x     
      z     
   
   map_width     
      map_height     
      terrain_start_x     
      terrain_start_z     
      terrain_width     
      terrain_height     
      pos_x    
      pos_z    
             �    4   � � �@     ܀ �@    � � ŀ     A�  ܀��@  ��ŀ     A ܀��@    � � ��@ A EA ��@ �A  � \� Ł � ܁ � BFBB O��B	 ��� �FC O��B	 ��� @  �� ��	 ��B F�B �BC   �       ParentForm    nx_is_valid    nx_find_custom    x    z    trans_scene_pos_to_map 	   nx_value    gui    AbsLeft    Width        @   AbsTop    Height    Visible 
   is_in_map     4   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        label     3      pic_map     3      form    3      x    3      z    3      sx    3      sz    3      gui    3           �  �       E   �@  \� �  ŀ   � ܀ �   @���   AA �� ܀ � ��A  � � ��    @ �@� �    	   nx_value 9   form_stage_main\form_outland\form_outland_eren_war_title    nx_is_valid    nx_execute 4   form_stage_main\form_outland\form_outland_war_title    get_cur_outland_stageid     on_update_stage        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        self           title_form       
   cur_stage               �  �    8   W @  ��@  �   �� �@    � � ��  �   �  ����   @���@ W @� ���@ W@ ��	@���  �   �@ �@ �    � �@���A � �@B � ��B � ��B �  � � ���A �@Ã@��� � ��@B �@Ã ��� � ���B �@Ã� � � @ ���B �@Ã �        nx_is_valid    nx_find_custom    last_stage    init_outland_campsite    refresh_campsite    btn_1    Enabled     btn_2    btn_3    btn_4       �?       @      @      @    8   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        self     7      stage     7           �  �       	@@� �       mouse_down_move_up         �  �        self                �  �    
<   F @ 	������ � A�@A��� ƀ��� ��� ����� AAAF�� F��A� ��� BAAF�� FA�AF�� F����� �B�AA��� �A���M���A@ �  ���� � �� �A  � ܁ �A    � � ��� Ɓ���� �  �� �� 	�� @� B  ���  � � �       ParentForm    mouse_down_move_up    pic_map    Width        @
   ZoomWidth    ImageWidth    Height    ZoomHeight    ImageHeight 	   nx_pause �������?   nx_is_valid    CenterY       $@   on_update_role_position     <   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        self     ;      form    ;      center_x_min    ;      center_x_max    ;      center_z_min    ;      center_z_max     ;      sec &   :   	   center_y /   :           �  �       	@@� �       mouse_down_move_down         �  �        self                �      
<   F @ 	������ � A�@A��� ƀ��� ��� ����� AAAF�� F��A� ��� BAAF�� FA�AF�� F����� �B�AA��� �A���M���A@ �  ���� � �� �A  � ܁ �A    � � ��� Ɓ������  ����� 	�� @� B ����  � � �       ParentForm    mouse_down_move_down    pic_map    Width        @
   ZoomWidth    ImageWidth    Height    ZoomHeight    ImageHeight 	   nx_pause �������?   nx_is_valid    CenterY       $@   on_update_role_position     <   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                	  	  
                            self     ;      form    ;      center_x_min    ;      center_x_max    ;      center_z_min    ;      center_z_max     ;      sec &   :   	   center_y /   :                    	@@� �       mouse_down_move_left                   self                  =    
<   F @ 	������ � A�@A��� ƀ��� ��� ����� AAAF�� F��A� ��� BAAF�� FA�AF�� F����� �B�AA��� �A���M���A@ �  ���� � �� �A  � ܁ �A    � � ��� Ɓ������  �� �� 	�� @� B ����  � � �       ParentForm    mouse_down_move_left    pic_map    Width        @
   ZoomWidth    ImageWidth    Height    ZoomHeight    ImageHeight 	   nx_pause �������?   nx_is_valid    CenterX       $@   on_update_role_position     <       !  !  !  !  !  !  #  #  #  #  #  #  #  #  #  %  %  %  %  %  %  '  '  '  '  '  '  '  '  '  )  )  )  *  *  *  ,  ,  ,  ,  ,  -  0  0  0  1  1  2  5  5  7  7  7  9  9  :  ;  =        self     ;      form    ;      center_x_min    ;      center_x_max    ;      center_z_min    ;      center_z_max     ;      sec &   :   	   center_x /   :           @  B       	@@� �       mouse_down_move_right         A  B        self                D  e    
<   F @ 	������ � A�@A��� ƀ��� ��� ����� AAAF�� F��A� ��� BAAF�� FA�AF�� F����� �B�AA��� �A���M���A@ �  ���� � �� �A  � ܁ �A    � � ��� Ɓ������  ����� 	�� @� B ����  � � �       ParentForm    mouse_down_move_right    pic_map    Width        @
   ZoomWidth    ImageWidth    Height    ZoomHeight    ImageHeight 	   nx_pause �������?   nx_is_valid    CenterX       $@   on_update_role_position     <   E  F  I  I  I  I  I  I  K  K  K  K  K  K  K  K  K  M  M  M  M  M  M  O  O  O  O  O  O  O  O  O  Q  Q  Q  R  R  R  T  T  T  T  T  U  X  X  X  Y  Y  Z  ]  ]  _  _  _  a  a  b  c  e        self     ;      form    ;      center_x_min    ;      center_x_max    ;      center_z_min    ;      center_z_max     ;      sec &   :   	   center_x /   :           i  |    
=   F @ �@@ ƀ@ �@ � ��� �� ��@� ƀ�A� �AFA� F��A� �A� BFA� FA��A� �BM��NAAF�� �� �AC��B�� �A�Ɓ�����CI����� ��C�� �A������� �A�Ɓ�����CI��X� �  ��A  �� I����� ��  �@ �A � �� �A  �       ParentForm    Value    Maximum    Minimum       �?   pic_map    MinZoomWidth    MaxZoomWidth    MinZoomHeight    MaxZoomHeight 
   lbl_track    AbsTop 
   tbar_zoom    TrackButton    Height        @   Top    Visible  ���MbP?   set_map_zoom    on_update_role_position     =   j  l  l  l  l  l  m  n  n  n  n  n  n  n  n  n  o  o  o  o  o  o  o  o  o  r  t  t  t  t  t  t  t  t  t  u  u  u  u  u  u  u  u  u  u  u  u  v  v  v  v  v  y  y  y  y  y  {  {  {  |        self     <      form    <      ratio    <      zoom_width    <      zoom_height    <   	   lbl_back    <             �    	;   � @ �@��� @ ɀ �� @ ���� �@ A@� �@ AAF@ F��O��@ �A@O��AF@ F��O��@ ��@O���@ ��A�@ Ɓ���@ �@�����@ ����@ ��@ �� ��@ ���@ ��@ ���@ �A�@�@ ��@ �A���@ �A��@ ��@ Ɂ�� � 
      pic_map 
   ZoomWidth    ZoomHeight    Width        @   ImageWidth    Height    ImageHeight    CenterX    CenterY     ;   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     :      zoom_width     :      zoom_height     :      center_x_min 
   :      center_x_max    :      center_z_min    :      center_z_max "   :           �  �    
?   F @ 	����@@ �    ���  �  �� �@  � ܀ �@    � � ƀ� ���� ��� ABBF�� F��Y��� �F�� F�� �� �F�� ƀ�F�� ��F�� F�MA���� ��BƁ� ����O��MA����� Ɓ� ���� BDF�� F�BB�������� ��  �@ �A �� �� �A �� �       ParentForm    mouse_down_zoom_in 	   nx_pause �������?   nx_is_valid    pic_map 
   ZoomWidth �������?   ZoomHeight    MaxZoomWidth    MaxZoomHeight    MinZoomWidth       �?
   tbar_zoom    Value    Minimum    Maximum    set_map_zoom    on_update_role_position     ?   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        self     >      form    >      sec    =      zoom_width    =      zoom_height    =      ratio )   =           �  �       F @ 	��� �       ParentForm    mouse_down_zoom_in         �  �  �        self           form               �  �    
?   F @ 	����@@ �    ���  �  �� �@  � ܀ �@    � � ƀ� ���� ��� ABBF�� F��Y@�� �F�� F��@� �F�� ƀ�F�� ��F�� F��MA���� �CƁ� Ɓ���O��MA����� Ɓ� ���� BDF�� F�BB�������� ��  �@ �A �� �� �A �� �       ParentForm    mouse_down_zoom_out 	   nx_pause �������?   nx_is_valid    pic_map 
   ZoomWidth �������?   ZoomHeight    MinZoomWidth    MinZoomHeight    MaxZoomWidth       �?
   tbar_zoom    Value    Minimum    Maximum    set_map_zoom    on_update_role_position     ?   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        self     >      form    >      sec    =      zoom_width    =      zoom_height    =      ratio )   =           �  �       F @ 	��� �       ParentForm    mouse_down_zoom_out         �  �  �        self           form               �  �   =   E   �@@ ��  \��Z@  ��E   �@@ ��  \��Z@    � � D   � � �   � @ �AA ��A�AA ���BA BFBA FB��BA ��B�BA ������FAA F�MA��AA �ACN���AA ��C���AA ������AA ��BA BC���BA �CFBA F��OBBE �  ��  \B  �       nx_find_custom 	   lbl_role    x    z    trans_pos_to_map    pic_map    ImageWidth    ImageHeight    TerrainStartX    TerrainStartZ    TerrainWidth    TerrainHeight    CenterX 
   ZoomWidth    CenterY    ZoomHeight    set_map_center     =   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  	      form     <      x    <      z    <      map_x    <      map_z    <      sx %   <      sz +   <   	   center_x 1   <   	   center_z 7   <         FOCUS_X    FOCUS_Z     �      (   �   � � �� @@  � � ŀ  �  ܀ �� AA �� ��A� �� �A `��E ��BA� \��Z  ��EB �  ��B�� \B @�EB �  ��B�  \B _�� � 
      getCampsitePos  	   nx_value    game_client 	   GetScene       �?   table    getn    camp_is_alive    update_outland_campsite     (   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                   �    	      self     '      stage     '   	   tbl_camp    '      game_client 	   '      client_scene    '      (for index)    '      (for limit)    '      (for step)    '      i    &                &   �   � � �� �@  @ ��   �  �@�   ����@  @ ��   �  ���   ����@@ ��   �  �    A � ��A� D  �A� ܁� �@ ��� � �@��   �   �       nx_is_valid    FindRecord    GetRecordRows               �?   QueryRecord     &             	  	                                                                      npc_configid     %      client_scene     %      rows    %      (for index)    #      (for limit)    #      (for step)    #      i    "         CRASH_NPC_REC       ]    �   W @  �E@  �   \� Z@  @ �B   ^  E�  �   ��  \��Z@  @ �B   ^  E  ��@ \�  � @ ��   �  �@ ��A� � �� �A@ ��   �  �  �@ �� ŀ ܀� W � 	�A �A@�� W�A��� EA F����\� ��  ���  @  ���   � @  ���EB  � \� Z  � �KBC� \B�E� �  � \B ��� EA F���� \� ��  � EB F��� \� @��@�C���  �  �B����  @�� �  �B��� @@��DC ���@ ��BI��IŉI�ŊIƋ�BF  ��B��� �  �B@��B  �� �  �B���@ ��FI���BGI����GI��� ��CH �B�A�A  F�H �   � ��H ��H A� � $       nx_is_valid    nx_find_custom    last_stage    getCampsitePos    table    getn         	   nx_value    gui    getAllCampsiteName       �?
   nx_custom    Delete    nx_set_custom       @   Create    Label    Name 	   AutoSize 
   BackImage    gui\special\outland\huoxi.png    NoFrame     Add    x        @   y       @   z       @   set_lbl_position    pic_map    groupbox_move    ToFront     �                     !  !  !  !  !  !  "  "  %  %  %  &  &  '  '  )  )  )  )  )  )  *  *  .  .  .  1  1  2  2  2  2  2  2  2  2  4  4  4  4  4  4  4  5  5  5  5  5  5  6  6  6  6  7  7  7  7  7  8  8  8  :  :  :  :  :  4  @  @  @  @  @  @  @  A  B  B  B  B  B  B  C  D  D  D  D  D  D  E  E  E  E  E  E  G  G  G  G  H  H  I  J  K  L  L  L  M  M  M  M  M  M  O  O  O  O  O  R  R  S  S  T  T  V  V  V  V  @  Z  Z  Z  Z  Z  [  [  [  ]        self     �   	   tbl_camp    �      gui #   �      all_camp_name %   �      (for index) 3   L      (for limit) 3   L      (for step) 3   L      i 4   K      lbl >   K      (for index) R   �      (for limit) R   �      (for step) R   �      i S   �   	   pos_info T   �      lbl [   �           _  s       W @ ���@     ܀ �   @�W � � �W�� @ � @  � � ��     @� ܀��@    � � �     @� ܀�@A@ ���A�  �� B� � 	       nx_is_valid        nx_find_custom 
   nx_custom 
   BackImage    gui\special\outland\huo.png    gui\special\outland\huoxi.png        `  `  a  a  a  a  a  b  b  c  c  d  d  e  h  h  h  h  h  h  i  l  l  l  l  n  n  o  o  q  s        self           npc_configid        	   is_alive        	   camp_lbl               u  �    �   W @ ��E@  �   \� �@  ��  �� �� @ �C � ^  E�  �  �@ � \� �� � � �� �   � �� � A A�  ��  ��� @ �A � �� �A ܀�� EA ��\� �� ��E FA�� \�  �@ �C�^ E� �A � �� �� \��� �AD���� @C@ �� � �  ��   AB �� ܁ @ ���  � ܁ �  ����   BD@�� A�  ����� EC ���\ ܂  �� ���C  ܃ D ��K�� ��D A� � AD \�����  �ED � \� �D ���˃� @��D �D �� �D ܃��� ���D � ܄ E ��J  � ��F	��  �D�� ��F	�� ��D�� ��F	��  �D�� ��F	�� ��D�� ��F	��  �D�� ��F	�  ��D�����  �        nx_int       �?   nx_execute    util_functions    get_ini #   share\WorldEvent\bad_guy_vally.ini    nx_is_valid    FindSectionIndex 
   nx_string    Stages    ReadString 
   CreateNpc            util_split_string    ;    table    getn    , '   share\WorldEvent\bad_guy_vally_npc.ini    ID     
   ReadFloat 	   TransInX 	   TransInY 	   TransInZ 	   TransInO    insert     �   v  v  v  v  v  v  v  v  v  v  w  w  z  z  z  z  z  {  {  {  {  {  |  |  |  |  |  }  }  }  }  }  }  }  ~  ~  ~  ~  ~  ~  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        stage     �      ini    �   
   sec_index    �      content "   �      content_list (   �   
   camp_paks 6   �   	   tbl_camp ?   �      (for index) P   �      (for limit) P   �      (for step) P   �      i Q   �   
   sec_index V   �      camp_id ]   �      camp_x d   �      camp_y k   �      camp_z r   �      camp_o y   �   
   camp_info z   �           �  �        
   E   �@  ��  �  \� �  � � �� �   @��@ ˀ� ܀ A ������ B�E �B \� �� ����� ��   @ �A����   �       nx_execute    util_functions    get_ini '   share\WorldEvent\bad_guy_vally_npc.ini    nx_is_valid       �?   GetSectionCount    ReadString 
   nx_string    ID        table    insert        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     	   tbl_camp          ini          (for index)          (for limit)          (for step)          i          camp_id           i                                          
            +      9   .   F   ;   �   J   �   �   �   �   �   �   �   �     �           0    :  3  M  =  V  P  j  X  s  m  |  v  �    �  �  �  �  �  �  �  �  �  �    �      =    B  @  e  D  |  i  �    �  �  �  �  �  �  �  �  �  �  �  �    �        ]    s  _  �  u  �  �  �        CRASH_NPC_REC    h      FOCUS_X    h      FOCUS_Z    h       