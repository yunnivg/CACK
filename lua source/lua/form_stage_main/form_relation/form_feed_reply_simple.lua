LuaQ  Y   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_feed_reply_simple.lua           0      A@  @    A�  @    A�  @ $     $@  @ $�  � $�  � $    $@ @ $� � $� � $    $@ @ $� � $� � $    $@ @ $� � $� � $    $@ @ $� �  �       require    util_functions 	   util_gui -   form_stage_main\form_relation\form_feed_info    main_form_init    main_form_open    change_form_size    on_mainform_close    on_btn_close_click    update_reply_count    show_reply    init_topic    on_btn_reply_click 
   add_reply    on_sub_btn_reply_click    on_lbl_good_click    on_lbl_bad_click    on_btn_gift_click    on_btn_lucky_click    on_btn_face_click    add_chatface_to_chatedit    on_redit_reply_changed    on_redit_reply_enter                   	@@�A�  ^   �       Fixed        �?                         form                   !        E   �@  \� ��� ��@ �� 	� ��@� �@A �� ��A	� ���A �@B�	�B��  �   �    	   nx_value    gui    AbsLeft    Width    AbsTop    Height        @   redit_reply    facenum            Visible       �?                                                            !         form           gui               $   )        E   �@  \� ��� ��@ �� 	� ��@� �@A �� ��A	� � �    	   nx_value    gui    AbsLeft    Width    AbsTop    Height        @       &   &   &   '   '   '   '   (   (   (   (   (   )         form           gui               ,   7        	@@�E�  �   \@ E�  �  \� �@ � � �� �   @ ���� �@ �� �   �       Visible     nx_destroy 	   nx_value )   form_stage_main\form_main\form_main_face    nx_is_valid    Close       �?       /   0   0   0   2   2   2   3   3   3   3   3   4   4   6   6   7         form        
   form_face               :   =        F @ �@� �@  �       ParentForm    Close        ;   <   <   =         btn           form               ?   `     	/   �   A  ܀ �     � � ŀ  �  A �A ��   ܀ �@ �ɀ���  �A @  � �B� �� A A  � A @��� ��  ���  A� � �A ��� A  ��E � \� 	A��A F��A  �       util_is_form_visible "   form_stage_main\form_relationship    nx_execute 	   util_gui    util_get_form 5   form_stage_main\form_relation\form_feed_reply_simple    good    bad    Reply 
   nx_number            show_reply        nx_find_custom    FeedId -   form_stage_main\form_relation\form_feed_info 
   get_reply 
   nx_string    redit_reply    Text    nx_widestr    on_redit_reply_changed     /   C   C   C   C   C   D   H   H   H   H   H   H   H   K   L   R   T   T   T   T   T   U   U   U   V   Z   Z   Z   Z   Z   Z   [   [   [   [   [   [   [   ^   ^   ^   ^   ^   _   _   _   `         reply     .      good     .      bad     .      form    .           c   �     �   E   �@  �   �� ��  \����  �  A A� �� �  �� ��A� �܀ A E� F����\� �A  �� FBC� E �\� W@� ��A�C�B����A	ćA @ � A    � � � E� F���� \� �� ���� Ł � ܁ ����� ��AB ����  ����A�ACƁ�BC�E�������A ��B �A�� � C  FC�  �B  ��� ��AB ����   ���A��A�A�������  ��A�ACƁ�BC�E��������A��Ƈ��A�č��A�G��Ď��G�ȏ��G��AƁ��A�E������AHƁGƁ��G�E��́�������H�ɏ��H�AHƁ�BH�E���������H��E��H�������H�����A	 ��	 �� ��E�E���������J�A  � )      util_split_wstring    nx_widestr    *    nx_execute 	   util_gui    util_get_form 5   form_stage_main\form_relation\form_feed_reply_simple    groupscrollbox_reply    GetChildControlList       �?   table    getn 
   nx_string    groupbox_topic    Remove    IsEditMode    init_topic 
   nx_number            nx_find_custom 
   CurHeight    Top    Height 
   add_reply 
   MaxHeight     HasVScroll    VScrollBar    Value    groupbox_submit    Left       =@	   lbl_back       @   groupbox_function       @	   nx_value    gui        @
   ShowModal     �   g   g   g   g   g   g   j   j   j   j   j   j   j   m   m   m   p   p   p   p   p   p   p   s   s   s   s   s   s   s   s   t   t   t   t   p   x   x   {   {   {   {   {   |   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         text     �      table_reply    �      form    �      table_subobj    �      (for index)    $      (for limit)    $      (for step)    $      i    #   	   HasReply -   �      num 1   �      (for index) I   Q      (for limit) I   Q      (for step) I   Q      i J   P      gui �   �           �   �     �   E   �   �@  \��Z   @�E   �   ��  \��Z   ��E   �   ��  \��Z   @�E   �   �  \��Z   ��E   �   �@ \��Z   @�E   �   �� \��Z@  @ �B   ^  F�A K � \@ F�A K@� ŀ �@ ܀ � \@ F�A ��A �@C�� I� �F�A �� �  �A C܀ �� I� �F�A I�ĈF�D �� �@ � �  ��  ŀ � E �AA \� � �܀ �� I� �F@F �� �@ � �  ��  ŀ � E ��A \� � �܀ �� I� �F�D ��A �@D��A � ��� ��FI���F@F ��D �@DI���F G ��D �@DI���F@G ��D �@DI���F�G �� �@ � �  ��  ŀ � E �A \� � �܀ �� I� �F�G ��D �@DI���F H ��D �@D�@HI���F�H I�ƈF�H � H �@D� H � ��� ��HI� �B � ^   � $      nx_find_custom    FeedId 	   FeedDesc    Owner    Reply    good    bad    mltbox_topic    Clear    AddHtmlText    nx_widestr       �   Height    GetContentHeight 	   ViewRect 	   0,0,340, 
   nx_string    Top         	   lbl_good    Text 
   util_text 
   ui_sns_up    (    )    lbl_bad    ui_sns_down       $@   lbl_icon_good    lbl_icon_bad 
   lbl_reply    ui_sns_review 
   lbl_split       9@   groupbox_topic       @    �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �         form     �           �   *    �   F @ �@  � � �  ����   @��@  � � �  ����@    � � � � �@Aŀ � @ � E� � \ ܀  �     � � �@ ƀ�� @ � A ܀�A �BE� � \� �A ��W��@�E� ��\� @�  � � W�C@�E� � \� @�  � � EA �� \� �� � �� ��  �܁ �  @�� B A� ����   ܂ � ܁ ���A  ܁ B AB � E� �� � �� ��   � \�  ZB  @�F��K��� \���� � �� �  � ��BG �A� �B  � E� �B ��G��   � �  \�  �� � �� @@�F��K���B \���� � �� �  � ��BG �A� �B  � E �� �� � F�� � E� ��� \� �� � � \B   � $      ParentForm    nx_find_custom    FeedId    Owner    redit_reply    Text    nx_ws_equal    nx_widestr        string    find 
   nx_string    *    &  
   nx_number         	   nx_value    CheckWords    nx_is_valid    nx_execute    custom_sender    check_word       �?   gui    SystemCenterInfo    TextManager    GetFormatText    9721    ShowSystemCenterInfo        @   len       �@   9738 -   form_stage_main\form_relation\form_feed_info    submit_reply     �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                                                                                                                                                                                      !  !  !  !  !  "  "  "  "  %  (  (  (  (  (  (  (  (  (  (  (  (  (  *        btn     �      form    �      text_reply    �      pos1 "   �      pos2 )   �      check_words <   �   	   new_word ?   �      gui Q   �      SystemCenterInfo T   �      info b   l      info }   �           -  �    �   �   �@   � ܀ �  �����@AFAA�� ��  EB ��\ ��  �A  � ܁ B  A� � EB  ��\� �B  � �� �B   �܂ C  AC � ��� A� � KD�B \��I�D�IBE�I�E�I�E�I�ƌ�D� ����G���ǎ�ȏ��E���Ȑ��ő��E���ɒ��IEC  ��\� �
 �B �B
   E�
 \� �B  ��
   A � �B �BK܂ ����� � FE� ������@ �B�����A��DA� ܂��M��BM���M�ɂɒ�BN�C  @ � �����C�CLF�DCA����A�D�� ��	O�	CO�	�O�	�ɒ	CN�	П	�Р	ѡ	CьEC  �� �� � \�  	C�EC  ��\� 	C�EC
 � Ń
 �� \C  E�
 � �C � \C K�� \C�	�Ҙ	S�KD�� \��I�D�ICS�I�ǎI�ӏI�E�ICΐI�őI�E�I�ɒIԧICԌI�T����D  @ � A
 �C �C��� �CMI��� �� �܃ ��I����� ��C��C� ��C�I�՘��L�E��I���D� �����D��A���Ռ�֧��T���@ �C��C�@ �C���՘ƃ���������IB֘ƃLE����I��ƃV ��@��C��� �V A ܃��C  ��ƃV DW �LFDW F�D��ƃV ��I��ƃV �V WF�D��ƃV ����� �ƃV �V W��� � `      util_split_wstring    nx_widestr    &       @      @      @   nx_execute -   form_stage_main\form_relation\form_feed_info    format_time_left 
   nx_double 
   <a href="    PLAYER,    " style="HLStype2">    </a> 	   nx_value    gui    Create 	   GroupBox    Width      @u@   Height       i@
   LineColor    0,0,0,0 
   BackColor 	   DrawMode    Expand    MultiTextBox       N@   LineHeight       .@	   ViewRect 
   0,0,60,15 
   TextColor    255,06,68,99    SelectBarColor    MouseInBarColor    Font    font_sns_list    AddHtmlText       �   nx_bind_script    nx_current    nx_callback    on_right_click_hyperlink    GetContentHeight    0,0,60, 
   nx_string    Add    Left    Top    Label       I@      4@   Align    Right 
   ForeColor    255,101,80,63    Text    Button      �F@      0@   Center    NormalImage "   gui\special\sns\btn_reply_out.png    FocusImage !   gui\special\sns\btn_reply_on.png 
   PushImage #   gui\special\sns\btn_reply_down.png    ExpandH 
   util_text    ui_sns_reply 
   ReplyName 	   on_click    on_sub_btn_reply_click      pr@      @     @j@   5,15,330,200 
   BackImage    gui\special\sns\bg_talk.png    ExpandV    BlendColor 
   255,0,0,0 
   5,15,330,    ToFront            Title "   gui\common\form_line\line_bg2.png       <@   groupscrollbox_reply    nx_find_custom 
   CurHeight    groupbox_topic      �z@
   MaxHeight     �   1  1  1  1  1  1  3  4  5  8  8  8  8  8  8  8  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  ;  =  =  =  ?  ?  ?  @  A  B  C  E  H  H  H  I  J  K  L  M  N  O  P  R  R  R  R  R  R  T  T  T  T  T  U  U  U  U  U  W  W  W  X  X  X  X  X  X  Z  Z  Z  \  ]  `  `  `  a  b  c  d  e  f  f  f  f  h  h  h  j  j  j  j  j  k  n  n  n  o  p  q  r  s  t  u  v  w  x  x  x  x  x  x  {  {  {  {  ~  ~  ~  ~  ~            �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        form     �      text     �      table_reply    �      target_name    �      desc    �   
   time_left 	   �      text_time_left    �   
   html_name #   �      gui &   �      groupbox_reply )   �      mltbox_name 1   �   	   lbl_time Z   �   
   btn_reply o   �      mltbox_desc �   �   
   lbl_split �   �           �  �       E   �   �@  \��Z@    � � F@@ ��  � � �� �@  � � � A �@A� E �A \ �  E� �� \� �� �� �� �� � �       nx_find_custom 
   ReplyName 
   nx_string        ParentForm    redit_reply    Text    nx_widestr 
   util_text    ui_sns_reply    ��        �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           name          form               �  �    	   F @ �@  � � �  ����@    � � ��� ��    ܀  �  � � �@ � A� � �A �� ��    � �@   � 
      ParentForm    nx_find_custom    FeedId 
   nx_string        nx_execute    custom_sender    custom_sync_recent_feeds    nx_int       @       �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        btn           form          feed_id 	              �      	   F @ �@  � � �  ����@    � � ��� ��    ܀  �  � � �@ � A� � �A �� ��    � �@   � 
      ParentForm    nx_find_custom    FeedId 
   nx_string        nx_execute    custom_sender    custom_sync_recent_feeds    nx_int       @       �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                        btn           form          feed_id 	                       F @ �@  � � �  ����@    � � ��  �  A A� �� �  �� ƀ� ����� B�@  � 	      ParentForm    nx_find_custom    Owner    nx_execute 	   util_gui    util_get_form +   form_stage_main\form_relation\form_present    SendPlayerName 
   ShowModal                                                      btn           form       
   form_gift                        F @ �@  � � �  ����@    � � ��  �  A A� �� �  �� ƀ� ����� B�@  � 	      ParentForm    nx_find_custom    Owner    nx_execute 	   util_gui    util_get_form (   form_stage_main\form_relation\form_qifu    SendPlayerName 
   ShowModal                                                      btn           form          form_lucky               "  >    B   F @ �@  ��  �� � � �����@  A ܀ � @��   ��� @�� �A � A��	��B E �A �� � B� �  �� � \� � �A  ��A��ADƁD��I�����D�E������I���I�Ŋ����A IAF��� ��  �A ��  G� �B @�B ��B  AA � A� �       ParentForm 	   nx_value    gui    Focused    redit_reply .   form_stage_main\form_main\form_main_face_chat    nx_is_valid    nx_gen_event    selectface_return    cancel        Parent    nx_execute 	   util_gui    util_get_form )   form_stage_main\form_main\form_main_face    nx_set_value    AbsLeft    Width    AbsTop    Height    type       �?
   ShowModal    Visible    nx_wait_event     �חA   ok    add_chatface_to_chatedit    Close     B   #  $  $  $  %  %  '  '  '  (  (  (  (  (  )  )  )  )  )  )  )  +  -  -  -  -  -  -  -  -  -  .  .  .  .  /  /  /  /  0  0  0  0  0  0  1  3  3  4  6  6  6  6  6  7  7  8  8  8  :  :  =  =  =  =  >        self     A      form    A      gui    A   
   face_form 	   A   	   groupbox    =      form_main_face    =      res 6   =      html 6   =           B  L       E   �@  \� ��  ��� � ��� @A ���� ��A   A� �@ �   �  �� ŀ ܀� ������� ������ �� �@  �    	   nx_value 5   form_stage_main\form_relation\form_feed_reply_simple 
   nx_number    redit_reply    facenum       @   Append       �   gui    Focused    nx_null    on_redit_reply_changed        C  C  C  D  D  D  D  D  D  E  E  E  E  E  H  H  H  I  I  I  J  J  K  K  K  L        html        
   form_main          gui               N  \    	   F @ �@  ŀ  ��� FAA � A� � �  ���A�@   �	� ��@B ���@�  ��@  �� E� � ��B �\� 	A�� �       ParentForm            string    gmatch 
   nx_string    Text    img       �?   facenum    Size    lbl_word_count    nx_widestr        /150        O  Q  R  R  R  R  R  R  R  R  S  R  S  U  W  W  X  X  Y  [  [  [  [  [  [  [  [  \        self           form          count          (for generator) 	         (for state) 	         (for control) 	         w 
         str_len               ^  h       A   �@  ��@��  A ܀ A � �  �L�� �@   �@��� �� B �@ �B�@  �               string    gmatch 
   nx_string    Text    <br/>       �?      $@   ParentForm    on_btn_reply_click 
   btn_reply        `  a  a  a  a  a  a  a  a  b  a  b  d  d  e  f  f  f  h        self           count          (for generator)          (for state)          (for control)          w 	   
      form           0                     	   	   	         !      )   $   7   ,   =   :   `   ?   �   c   �   �   *  �   �  -  �  �  �  �    �          >  "  L  B  \  N  h  ^  h          