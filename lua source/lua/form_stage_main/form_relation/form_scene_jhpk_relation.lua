LuaQ  [   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_scene_jhpk_relation.lua                 A@  @    A  @    Aΐ  @   A@ €    €@  ΐ €    €ΐ  @ €      €@ ΐ €       €ΐ @         require    utils 	   util_gui    util_functions 7   form_stage_main\form_relation\form_scene_jhpk_relation       @   main_form_init    on_main_form_open    on_main_form_close    on_form_close_click    ok_btn_click    cancel_btn_click    custom_jhpk_bund    InitListBox                   	@@	ΐ@        Fixed     PlayerName                           form                   !        E   @  \   ΐ   @       Α Ζ A ΐ @A	ΐΑ ΖΐA ΐ @A	   ΐ   @   	   	   nx_value    gui    nx_is_valid    Left    Width        @   Top    Height    InitListBox                                                                          !         form           gui               $   &        E      \@         nx_destroy        %   %   %   &         form                )   2        F @ @  ΐ   @      Iΐ@ Α @         Parent    nx_is_valid    Visible     Close        +   ,   ,   ,   ,   ,   -   0   1   1   2         btn     
      form    
           5   E    '   F @ @  ΐ   @        Ζΐΐ Ζ Α Ε@   ά Α Εΐ  AA  Α  A Β ά@ Εΐ  AA   Ε  Γ ά   @  ά@  ΛΐΓ ά@         ParentForm    nx_is_valid    nx_widestr 	   combobox    Text    nx_ws_length            nx_execute    custom_handler    custom_sysinfo        @   sns_new_10    custom_sender    custom_send_scene_jhpk    PlayerName    Close     '   6   8   8   8   8   8   9   <   <   <   <   =   =   =   =   =   >   >   >   >   >   >   >   >   >   A   A   A   A   A   A   A   A   A   A   A   D   D   E         btn     &      form    &   
   text_name    &         CLIENT_MSG_JHPK_BUND     H   K        F @ @ΐ @         ParentForm    Close        I   J   J   K         self           form               N   _       E   @  \   ΐ   @      ΐ  Α  A D   Β   Ε    ά Ϊ@        ΛΐAά@      	   nx_value    gui    nx_is_valid    nx_execute 	   util_gui    util_get_form    PlayerName    Show        O   O   O   Q   Q   Q   Q   Q   R   V   V   V   V   V   V   V   W   W   W   W   W   X   \   ^   ^   _         name           gui          dialog          
   FORM_NAME     b        d   E   @  \   ΐ   @      ΐΐ  Ε    ά Ϊ@      Λ AAA άΪ   ΛAAA άΐ@ΛAAA άΗ  Αΐ  ABAA ΰΐΛBAB  ΑB άΒB CBC ΐ B  ίόΛ AAΑ άΪ   ΛAAΑ άΐ@ΛAAΑ άΗ  Αΐ  ABAA ΰΐΛBAΒ  ΑB άΒB CBC ΐ B  ίόΕ   A ά ΑB FΑΔKΕΑA \	AE FΑΔKΑΕΑ  FBF  \  	A     	   nx_value    game_client    nx_is_valid 
   GetPlayer    FindRecord 
   rec_blood    GetRecordRows            rows_blood       π?   QueryRecord 	   combobox    DropListBox 
   AddString    nx_widestr 
   rec_enemy    rows_enemy    gui    Text    TextManager    GetText        lbl_1    GetFormatText    ui_sns_systemfriends_02    PlayerName     d   c   c   c   e   e   e   e   e   f   i   i   k   k   k   k   k   l   o   o   o   o   o   o   o   o   o   o   q   q   q   q   s   s   s   s   s   u   u   u   u   u   x   x   x   x   x   x   x   s   |   |   |   |   |   |   |   |   |   |   ~   ~   ~   ~                                                                                                                        form     c      game_client    c      client_player    c      (for index) #   1      (for limit) #   1      (for step) #   1      i $   0      blood_name )   0      (for index) C   Q      (for limit) C   Q      (for step) C   Q      i D   P      enemy_name I   P      gui T   c                                        	         !      &   $   2   )   E   E   5   K   H   _   _   N      b         
   FORM_NAME 
         CLIENT_MSG_JHPK_BUND           