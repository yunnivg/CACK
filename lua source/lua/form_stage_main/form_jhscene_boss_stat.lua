LuaQ  K   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_jhscene_boss_stat.lua                 A@  @    A  @ ΐ  A  €   @ €@   €      ΐ €ΐ           €  @ €@  €     ΐ         require 	   util_gui    util_functions '   form_stage_main\form_jhscene_boss_stat            main_form_init    on_main_form_open    on_btn_close_click    on_btn_prize_click    on_main_form_close    clear_grid    on_server_msg                   E      \ Z@      	ΐ	 ΑA@ ^          nx_is_valid    Fixed     npcid        π?                                              form     
           "   6     3   E      \ Z@      E@    \  Α Ζ A ΐ @A	ΐΑ ΖΐA ΐ @A	   ΐ   @ @B BΑ E A Α  \  @  @B BΑ E A Α  \  @  @B BA E A ΑA  \  @            nx_is_valid 	   nx_value    gui    Left    Width        @   Top    Height    clear_grid 
   grid_info    SetColTitle            nx_widestr 
   util_text    ui_jhscene_boss_player_rank       π?   ui_jhscene_boss_player_name    ui_jhscene_boss_player_amount     3   #   #   #   #   #   $   '   '   '   *   *   *   *   *   +   +   +   +   +   .   .   .   1   1   1   1   1   1   1   1   1   2   2   2   2   2   2   2   2   2   3   3   3   3   3   3   3   3   3   5   6         form     2      gui 	   2           9   @       E      \ @  ΐ   @      @ ΐ@@      	   nx_value    nx_is_valid    ParentForm    Close        :   :   :   ;   ;   ;   ;   ;   <   ?   ?   ?   @         btn           form          
   FORM_NAME     C   J       E      \ @  ΐ   @        Αΐ   D AΑ @     	   nx_value    nx_is_valid    nx_execute    custom_sender    custom_send_world_boss    npcid        D   D   D   E   E   E   E   E   F   I   I   I   I   I   I   J         btn           form          
   FORM_NAME    CLIENT_MSG_JHSCENE_BOSS_PRIZE     M   Q        E      \@           nx_destroy        N   N   N   P   Q         form                T   `        E      \ Z@      F@@ ΐ @ ΐΐ @  Α @         nx_is_valid 
   grid_info    BeginUpdate 	   ClearRow 
   EndUpdate        U   U   U   U   U   V   Y   Z   Z   ]   ]   _   _   `         form           grid               c       g   E      Β  \@E@     \   ΐ   @      ΐ  ΐ  @ @A I  Ζ Α  Ε Α ά ΐ @  Β Βΐ Ζ C  Εΐ   ά Α AA   ΐΖΓ  AΑ  Ι Ζ Β ΙΒ ΖΓ  @  Ι Τ   Ν Γ X E FΑΔΐ \W@Γ    AA ΑA `ΑFΕ KBΕΑ \Ε ΒE AC  ΐ  B  Ε ΒE AC  ΞΜCΑΖΓ  B  Ε ΒE A  ΞΜΓΖΓ  B  _χ        util_show_form 	   nx_value    nx_is_valid    clear_grid    npcid       π?
   nx_string     
   btn_prize    Visible     nx_int        @           lbl_myrank    Text    nx_widestr    Enabled    math    mod 
   grid_info 
   InsertRow       πΏ   SetGridText     g   d   d   d   d   f   f   f   g   g   g   g   g   h   l   l   l   n   n   p   p   p   p   p   p   p   p   r   r   v   v   v   x   x   x   x   x   x   x   x   y   y   y   y   y   |   |   |   ~   ~   ~   ~   ~                                                                                                                                                            
      arg     f      form    f      rank    f      count 6   f      PlayerInfoSize 7   f      (for index) D   f      (for limit) D   f      (for step) D   f      i E   e      row I   e      
   FORM_NAME    	   	   	   
   
   
               6   "   @   @   9   J   J   J   C   Q   M   `   T         c         
   FORM_NAME          CLIENT_MSG_JHSCENE_BOSS_PRIZE           