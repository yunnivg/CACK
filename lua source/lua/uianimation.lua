LuaQ  0   @H:\yuenanl_60512\01_Client\lua\uianimation.lua           "      A@  @ $   �  $@  �  $�    $�  @ $  � $@ � $�   $� @ $  � $@ � $�   $� @ $  � $@ � $�    �       require    const_define    SetIniDocument    open_animation    create_animation    start_item_animiation    play_item_animation    start_animation    start_itemlist_animation    play_itemlist_animation    show_itemlist    animation_event_end    get_step_info 	   hideitem    close_animation_ini    close_animation    check_is_form_close           	        �@  ��  �� �   �   �  A �� @� A܀ �����   ��A�@ �� �     ܀   �@� �       animationini 
   nx_create    IniDocument 	   FileName 
   nx_string    nx_resource_path    LoadFromFile    nx_set_value                                                                       	         name           ini                        	     @  �� �  �A� �       create_animation                                   form           index           flag           name                   :     m     @  �     � � A  @� �����@@ �A�  ^ F�@ � �EA �� \� �A ���� �� ܁� B@B��B F�B� � ��� ��� ɁÆ���ɁC������D ��B�� @  ����   B�@�F�@ ���EA �  Ł �B� \�  I����� ���� �A  @ ���  � I�C��A �  � FB ��  �A    E� �F\ ܁  B @  ���  �@ � B���F�@����EA �  Ł �B� \�  �� �B�� �    @�� �   �A  �       check_is_form_close    get_step_info        �?
   animation 	   nx_value    gui    nx_null       @   true        @   Create 
   Animation    Visible     form    endflag    name    Add    start_animation    item 
   nx_custom 
   nx_string    nx_is_valid       @   start_item_animiation 	   itemlist 
   nx_number    start_itemlist_animation     m                                                                                                       !   !   !   !   "   #   $   %   &   &   &   '   '   '   '   '   '   (   *   *   *   +   +   +   +   +   +   ,   -   -   -   -   -   .   .   0   1   1   1   1   1   1   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   5   5   5   6   6   6   6   6   6   7   7   7   8   8   8   8   8   8   8   :         form     l      index     l      flag     l      name     l      animation_info 
   l      gui    1      ini    1   
   animation    1      group ;   X   
   startitem J   X      enditem P   X      group b   l   	   playtime e   l           =   �     v   �  �  �� �    � � �A@I�����@I����@I����AI���AA Ł �A܁ � FB� FBB�� �� ܂�  @  �� �� �@ �����B �B ��C� �� �BB������BB��
  A� �C �� �� �C  @ ��� � ���  E@ ��� � �C �� � F�� � E� � \� �� ���� @	  ��A� ���� `��F�W@�
� �F�ZE  ��E� ��D��\�  �
 ��� �� ܅� � @  �� Ɔ�� ���F �E�	E  ��  �D_���    ���E �� \� LC�E  �  \� Z  @� � �� �       check_is_form_close    VAnchor    HAnchor    Top    Left    ParentForm    nx_int       @      @      @   nx_execute    nx_current    play_item_animation    table    getn                @   nx_is_valid       �?   endflag        @
   nx_number 	   playtime      @�@    create_animation    name 	   nx_pause     v   >   >   >   >   >   ?   A   A   B   B   C   C   D   D   E   F   F   F   G   G   G   H   I   I   I   I   I   I   I   I   I   I   I   I   K   K   K   K   M   M   M   O   O   Q   R   U   U   U   U   U   V   V   Y   Y   Y   Z   Z   ]   ^   `   `   `   c   c   c   c   c   c   c   c   d   i   i   i   i   k   k   k   k   k   k   n   n   n   n   p   p   q   q   q   q   q   q   q   q   q   q   q   s   s   u   y   i   ~   ~      �   �   �   �   �   �   �   �   �   �   �   �         form     u      item     u   
   startitem     u      enditem     u      animation_info     u      flag     u      parentform    u      startaphle    u   	   endaphle    u      finishtime    u      num &   u      count +   u      created_table ,   u      real_time_count -   u   
   new_index :   t      all_create ;   t      time_count >   t      (for index) J   g      (for limit) J   g      (for step) J   g      i K   f   
   need_time U   e           �   �     u   �  B  ܁ I�@�I@A�� C ƂA I���M� ��� FC� �CB�C� ���B� ��  B  ��  ��  �  E� � \� ��
@ �� @�E� ��\� ��
  �B� E� ��\� @	��E� �  \� ZE  @ �A ^ FE� @�
  � �  @�OE	NŃ
�DE� �� \� Z   �I����Z   �OE	N��
E�E� �� \� Z    �I ��OE	NE�
LEI@��E� �� \� ZE  @ �A ^ LC	�� ��  �� ��C���
E� �� \� ZE  � �A ^   �I��E� �  \� ZE  @�A ^ ��FBI@�FEBI@��LEI@�� �    	   nx_value    gui 	   playtime            Visible    ParentForm    BlendAlpha    Top    Left 
   nx_number    nx_is_valid       �?   endflag 	   nx_pause      @�@    u   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     t      item     t      enditem     t      startaphle     t   	   endaphle     t      finishtime     t      flag     t      gui    t      res    t      finish_alpha    t      start_alpah    t      parentform    t   	   startTop    t   
   startLeft    t      offleft    t      offTop    t      topmove    t   	   leftmove    t      itemplaytime    t      itemtop    t   	   itemleft    t           �   9    �     @  �     � � A  A�  � EA  ��  \� �� �A   E� ���\ ܁   @��    �B�I ����I ���I ���I �@ �I@ÅI@C�I� ��CD�B�B�B�I �I ŉ��B � EB ����E ��\� ZB    � � E� ��\� �����BF ��B��BF � �B�����@��BF � �B��BF ��B�I ō��E �� �B ܂� � \B I�ǍE �� �B � \B E� ���\� ��@ �I E�� ���  �I�G��B� �B ��� �B �
 �B
 �
 A�
 �� �� �� � � FD�� U��� ��	 ��	 ł C�܂ ����	 �B ���K�L�	 �B��B ��L���� �F������F�B�
  AC � �� �� �  � ����  E  ���� ��  �AD ���D `D�F�W��
� �F�ZE  ��E� �EM���\� �N��
���E �E ܅� � @ �� Ɔ��� � � FO �E  	E  ��  �CD_��    �@�ED �D \� LC�E  � \� Z   �E �� \� Z  @ �KD� \D  � �� � >      check_is_form_close 	   nx_value    gui    GAME_TIMER    form 
   nx_custom 
   nx_string       @   nx_is_valid    VAnchor    HAnchor    Top    Left            index    AnimationManager    StartAnimation        @   AnimationImage    Visible    flag       @   true       "@   ToFront    false    Loop    nx_bind_script    nx_current    animation_init     nx_callback    on_animation_end    animation_event_end       @   Athwart    Stop    Play    child_data    nx_call 	   util_gui    get_arraylist    UIAnimation_    _    Name 
   animation    Data 	   AddChild    table    getn    endflag       $@      �? 
   nx_number      @�@   nx_execute    create_animation    nx_int    name 	   nx_pause     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                   	                                                                                                                      !  !  !  !  !  !  "  "  "  "  #  #  #  $  $  $  $  $  $  $  $  $  $  $  $  $  %  %  '  *     -  -  .  0  0  0  0  1  1  1  1  1  2  2  2  2  2  3  3  5  6  9        form     �   
   animation     �      index     �      animation_info     �      gui 	   �      timer    �      form    �      controlitem    �   
   startflag .   �      upflag :   L      Athwartflag \   �      num �   �      count �   �      created_table �   �      real_time_count �   �   
   new_index �   �      all_create �   �      time_count �   �      (for index) �   �      (for limit) �   �      (for step) �   �      i �   �   
   need_time �   �           <  �    d   E  �  \� Z  @ �AA  ^ E�  ��  ��� �    @� ��\A EA F��� \� ����� �����AB�   E� �� \� ZB  @ �AB  ^ E� F�@�@ �AB  ^ A� �� �� � ܂ � @�� E� ��\�  �  ��BDC  @ �C   ��D�W�D� �D�D  ��� LD�FD� � �E�  ��  ��� ��    E �E\� � �EE \D��A�  ��  LB����    ���� A �   @  �    � � �� �       check_is_form_close       �?   nx_execute    nx_current    play_itemlist_animation    table    getn       @               @   nx_is_valid    item    endflag       @
   nx_number 	   playtime      @�@    create_animation    nx_int    name 	   nx_pause     d   =  =  =  =  =  >  >  A  A  A  A  A  A  A  A  C  C  C  C  E  E  E  G  G  I  J  M  M  M  M  M  N  N  Q  Q  Q  Q  R  R  U  V  X  X  X  [  [  [  [  [  [  [  [  \  a  a  a  a  c  c  c  c  c  c  f  f  f  f  h  h  i  i  i  i  i  i  i  i  i  i  i  k  k  m  q  a  v  v  w  z  z  z  z  |  |  |  |  |  }  ~  �        form     c      group     c      animation_info     c   	   playtime     c      flag     c      num    c      count    c      created_table    c      real_time_count    c   
   new_index (   b      all_create )   b      time_count ,   b      (for index) 8   U      (for limit) 8   U      (for step) 8   U      i 9   T   
   need_time C   S           �  �    1   �   A  ܀ I�@��  E  � \� �A� �� Ł ���  ܁ �A ��� `B�KC�� E� \�� �� � A�  \C�_�E � \� @ �LB�B ��  �� ��C��E� �� \� Z  ��I �@� �    	   nx_value    gui 	   playtime            GAME_TIMER    GetChildControlList    table    getn       �?	   Register    nx_current    show_itemlist 
   nx_number 	   nx_pause      @�@   nx_is_valid     1   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     0      item     0   	   playtime     0      gui    0      itemplaytime    0      timer    0   
   itemtable 
   0      count    0      offtime    0      (for index)          (for limit)          (for step)          i               �  �       	@@� �       Visible        �  �        item                �  �    7   � @ A@ E�  ����  A � \�  �A�Ł   E�  ���\ ܁   @�� B  ��BB E� � ��  ��� \�  ����E ��\� Z  @� C� �FBC ��  ��ćE ��\� Z  � �@D  �ɁÇE� �� \� ��   �B� �       index    ParentForm    get_step_info 
   nx_string    name        @
   nx_custom       @   nx_is_valid    Parent       @       @   true    endflag     Visible    false 	   nx_value    gui    Delete     7   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     
   animation     6   	   ani_name     6      mode     6      index    6      form    6      animation_info    6      name 	   6      controlitem    6      group          flag    6      gui 3   6           �  �       �   � � �� �@@A�  ��  �  �� � ܀� �  � � A A� ���� �   �    	   nx_value    ReadString    creat_animation 
   nx_string        nx_function    ext_split_string    ,        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        step           name           ini          ani_info_str 
         str_lst               �  �    I   �   �@   � �  ��  ˀ@A�  ܀� EA F����\� �  ���A��  �B   �܂  ��EB �� � � \� �B  ����  C���B    EC  ���\ ܂  �ć��@D���B    EC  ���\ ܂  �ć ��D���B    EC  ���\ ܂  �� EC F��� \� � �� �C ��D�ć���� �    	   nx_value 
   nx_string    GetItemList    creat_animation       �?   table    getn    ReadString        nx_function    ext_split_string    ,    item 
   nx_custom        @   Visible  
   animation       @	   itemlist    GetChildControlList     I   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     H      name     H      ini    H   	   itemlist    H      (for index)    H      (for limit)    H      (for step)    H      i    G      ani_info_str    G      str_lst    G      flag    G      item &   '      item 0   1      item :   G   
   itemtable <   G      count @   G      (for index) C   G      (for limit) C   G      (for step) C   G      i D   F           �  �       E   \�� �@  � � �@  �    	   nx_value    nx_destroy        �  �  �  �  �  �        file           ini               �  �    
   F @ K@� \� ��  � � � @���  A܁ �   ��AɁ���A����A �@ ��FBB�A���  �� � 
      Data    GetChildList    pairs    nx_is_valid 
   animation    Visible     Stop    RemoveChild    Name        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form           animation_table          (for generator)          (for state)          (for control)          i          item               �  �       E   �   \� Z@  @ �B � ^  F@@ Z@  @ �B � ^  B   ^   �       nx_is_valid    Visible        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form            "            	            :      �   =   �   �   9  �   �  <  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �          