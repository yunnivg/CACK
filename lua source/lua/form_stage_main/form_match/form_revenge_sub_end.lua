LuaQ  T   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_match\form_revenge_sub_end.lua           &      A@  @    A  @   ΐ   @ 
ΐ 	 Β	Β	 Γ	Γ	 Δ	Δ	 Ε	Ε	 Ζ	Ζ	 ΗJ      δ   Η@ δ@  Η δ  Ηΐ δΐ  Η  δ            Η@   "      require    util_functions 	   util_gui 
   FORM_PATH 0   form_stage_main\form_match\form_revenge_sub_end    ALL_FORM_PATH 0   form_stage_main\form_match\form_revenge_all_end       π?   ui_Match_end1_1        @   ui_Match_end1_6       @   ui_Match_end1_5       @   ui_Match_end1_3       @   ui_Match_end1_4       @   ui_Match_end1_10       @   ui_Match_end1_2        @   ui_Match_end1_9       "@   ui_Match_end1_8       $@   ui_Match_end1_7       &@   ui_Match_end1_11    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click 
   open_form        .   2        	@@	ΐ@        Fixed     LimitInScreen        0   1   2         form                5   F     (   E   @  \    Ε   Εΐ    ά Ϊ   ΐ	@AΖΐΑ ΑA Ν Ο Β	ΐ Ζ@Β Ο ΒΜΒΐ ΖΐΑ ΑA Ν Ο Βΐ @Ζ@Β AB Ν Ο Β	ΐ ΖΐΑ ΑA Ν Ο Β	ΐ ΖΐB Ι@C     	   nx_value    gui    ALL_FORM_PATH    nx_is_valid    Left      ΐb@   Top    Height        @   Width       Y@   grid_battle    CanSelectRow      (   7   7   7   9   9   9   :   :   :   :   :   ;   <   <   <   <   <   >   >   >   >   ?   ?   ?   ?   ?   ?   A   A   A   A   A   B   B   B   B   B   E   E   F         form     '      gui    '   	   all_form    '           I   K        E      \@         nx_destroy        J   J   J   K         form                N   U     
   F @ @  ΐ   @      ΐ @         ParentForm    nx_is_valid    Close     
   O   P   P   P   P   P   Q   T   T   U         btn     	      form    	           X   ±       E   @@ \   Ζΐ@  Ε   A ά A FA  E  ΑA \   ΖB  Ε  BB ά   FB  EB ΒB \   ΖC  ΕB  B άBΕΒ  ά  @ C      Γ AC  FΔ  ΐ  IFΕ  ΐ IFCΕ  ΐ  IE   \ ΕΐFΓΕ  Ε D ά   IFΓΕ  Ε   ά   IE  \  ΐΔ ΑC   DG@  AD  ΰ Δ  Ι	ίΓώΖΗ  @  ΙΖΓΗ  @  ΙΖΘ  @ ΙΕ   ά ΕΐΖCΘ  E D \   ΙΖCΘ  E \   ΙΕ    ά  @Δ AD   DG	ΐ  ΑD  ` D I
_ΔώE FDΗ \  DG	ΐ  ΐE FDΗ \  DG	Δ  @E FDΗ \  DG	Δ  W    A  ΛΔHA	 άΙΙΙΚEΚJ
E E  E FEΗ
 \ E   EΐΚΐFΚKF EF   Ζ\ F Δ ΖΖ @ΐFFΚKΛΐ  @	\FLDΐ EF   Ζ\ F Δ ΖΖ FFΚKΛΐ  @	\FD@	FFΚKΖΛΐ G  E    Η\ \F  FFΚKΖΛΐ Η  E   Δ ΖΗ \  \F  FFΚKΖΛΐ  E   Η\ \F  ξΜE  \ 	EEΜE   	\ 	E  2      nx_widestr       π?
   nx_string        @      @   nx_int       @      @      @      @       @      "@      $@   util_show_form 
   FORM_PATH 	   nx_value    nx_is_valid    gui    lbl_win_name    Text    lbl_win_guild    lbl_win_point        lbl_win_school 
   util_text    ui_Match_end_wmp    util_split_string    ;    table    getn    lbl_lost_name    lbl_lost_guild    lbl_lost_point    lbl_lost_school            Create    Label 
   BackImage     gui\special\tianti\end\good.png 	   AutoSize    grid_battle 	   ClearRow       &@
   InsertRow       πΏ   SetGridControl    SetGridText    lbl_win_single    lbl_lost_single       Z   Z   Z   [   [   [   \   \   \   ]   ]   ]   ^   ^   ^   `   `   `   a   a   a   b   b   b   c   c   c   d   d   d   f   f   f   f   h   h   h   i   i   i   i   i   j   m   m   m   p   p   p   p   p   q   q   q   q   q   r   r   r   r   r   s   s   s   s   s   t   t   t   t   t   t   t   t   v   v   v   v   v   v   v   y   y   y   z   z   z   z   {   {   {   {   {   {   {   |   |   |   {                                                                                                                                                                                                                                                                                                                                    ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ‘   ’   ’   ’   ’   ’   ’   £   £   €   €   €   €   €   €   €   €   €   €   ₯   ₯   ₯   ₯   ₯   ₯   ¦   ©   ©   ©   ©   ©   ©   ©   ©   ©   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   ͺ   «   «   «   «   «   «   «   «   «      ―   ―   ―   ―   ―   °   °   °   °   °   ±   !      arg       	   win_name         win_school      
   win_guild 	     
   win_point      	   win_hurt      
   lost_name         lost_school         lost_guild         lost_point      
   lost_hurt         form %        gui .     	   win_hurt T        win_hurt_list X        (for index) ^   c      (for limit) ^   c      (for step) ^   c      i _   b   
   lost_hurt         lost_hurt_list         (for index)          (for limit)          (for step)          i          win_single Έ        lost_single Ή        label Ό        (for index) Η        (for limit) Η        (for step) Η        i Θ        row Ξ           win_hurt_data    lost_hurt_data 
   hurt_type &   	   	   	   
   
   
                                  !   "   #   $   %   &   )   +   2   .   F   5   K   I   U   N   ±   ±   ±   ±   X   ±      
   hurt_type    %      win_hurt_data    %      lost_hurt_data    %       