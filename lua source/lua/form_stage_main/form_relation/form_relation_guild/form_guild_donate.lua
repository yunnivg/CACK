LuaQ  h   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_relation_guild\form_guild_donate.lua                 A@  @    A  @ ΐ  A  €   @ €@   €  ΐ €ΐ           €  @ €@  € ΐ €ΐ                  require    custom_sender B   form_stage_main\form_relation\form_relation_guild\form_guild_util     .A     @@   main_form_init    on_main_form_open    on_main_form_close    on_btn_confirm_click    on_btn_cancel_click    on_btn_close_click    refresh_contribution    on_ipt_changed                   	@@        Fixed                     self                   ,     
<   E   @  \ ΐΐ Ζΐ@ ΐ  A	 Α ΖA ΐ  A	 B I@B Εΐ  ά ΐ    Α@  ΛCά ΔA 	 Α FΔ KΑΔΑ B FΒC  \    E  \  ΑΑ  @FF Α ΑΑ  I FF Α ΐ  IAA ^      	   nx_value    gui    Left    Width        @   Top    Height    Focused    ipt_price_ding    lbl_contribution    Text    nx_widestr    0    game_client 
   GetPlayer    cur_capital 
   QueryProp    CapitalType2    TextManager    GetFormatText    ui_gc_money    nx_int 
   nx_number            lbl_capital       π?    <                                                                                #   #   #   #   $   $   $   $   $   $   $   $   $   %   %   %   %   %   %   %   %   &   &   &   &   &   &   (   (   (   (   (   +   +   ,         self     ;      gui    ;      game_client    ;      client_player    ;      remain_money &   ;           /   2        E      \@ A@  ^          nx_destroy       π?       0   0   0   1   1   2         self                5   P    <   F @ @  ΐ   @        Ζΐΐ Ζ Α Ε  AΑ Aά   FΑ FΑ D  NA LLΑ ΐ ΕΑ  ά ΐ    A Bΐ   ΐ Ε   ά Α Α B E  \ A  Γ A Α          ParentForm    nx_is_valid    nx_int    ipt_price_ding    Text    ipt_price_liang    ipt_price_wen 	   nx_int64            string    len    nx_execute L   form_stage_main\form_relation\form_relation_guild\form_guild_donate_confirm 
   on_donate    Close       π?    <   6   8   8   8   8   8   9   >   >   >   >   ?   ?   ?   ?   @   @   @   @   B   B   B   B   B   B   E   E   E   E   E   E   E   E   F   J   J   J   J   J   J   J   J   J   J   J   J   J   J   K   K   K   K   K   K   K   N   N   O   O   P         btn     ;      form    ;      ding    ;      liang    ;      wen    ;      capital    ;         money_ding_wen    money_siliver_wen     S   X        F @ @ΐ @             ParentForm    Close       π?       T   V   V   W   W   X         btn           form               [   _        F @ @ΐ @             ParentForm    Close       π?       \   ]   ]   ^   ^   _         self           form               b   j           ΐ    @      @  Ξΐ  Ζΐ@ A @  Ι         nx_is_valid    nx_int       ψ?   lbl_contribution    Text    nx_widestr        c   c   c   c   c   d   g   g   g   i   i   i   i   i   j         form           capital           num_contri 	              m       \   F @ @  Ζΐ Ζΐΐ Ε@  Α Α@ά A  FAΑ FΑΐ A A  ΐ  ΕA   ά ΐ A  Δ   NA  ΐ ΕA   ά ΐA  ΐ ΕA   ά ΑLA  ΐ  ΕA   ά ΐ A  ΐ  LΑΑ AΕ B ά  FΒΒKΓΑB C  @  \    E  \  Α  @FΒΓ  Α  I FΒΓ  ΐ  IE  ΐ\B        ParentForm    nx_int    ipt_price_ding    Text    ipt_price_liang    ipt_price_wen            cur_capital 	   nx_value    gui    nx_widestr    TextManager    GetFormatText    ui_gc_money 
   nx_number    lbl_capital    refresh_contribution     \   o   r   r   r   r   s   s   s   s   t   t   t   t   v   x   x   x   x   x   x   x   x   y   y   y   y   |   |   |   |   |   |   |   |   }   }   }   }   }   }   }   }                                                                                                                                                         	      ipt     [      form    [      ding    [      liang 	   [      wen    [      silver    [      left_capital 8   [      gui ;   [      remain_money D   [         money_ding_wen    money_siliver_wen             	   	   	               ,      2   /   P   P   P   5   X   S   _   [   j   b            m            money_ding_wen          money_siliver_wen           