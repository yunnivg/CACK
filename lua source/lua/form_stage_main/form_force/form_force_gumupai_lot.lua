LuaQ  V   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_force\form_force_gumupai_lot.lua                 A@  @    A  @ À  d   G  d@  G@ d  G dÀ  GÀ d  G  d@     G@ d     G dÀ GÀ         require 	   util_gui    custom_sender 2   form_stage_main\form_force\form_force_gumupai_lot    main_form_init    on_main_form_open    on_main_form_close    on_btn_close_click    on_rbtn_checked_changed 
   open_form    close_form    on_update_time                   	@@        Fixed                     form                   "        E   @  \   À      @ Á Æ A À @A	ÀÁ ÆÀA À @A	 	@BB @      	   nx_value    gui    nx_is_valid    Left    Width        @   Top    Height    Visible    Show                                                                  !   !   "         form           gui               %   -        E   @  \   À      @ÀÀ   AA   @ À   @      	   nx_value    GAME_TIMER    nx_is_valid    UnRegister    nx_current    on_update_time    nx_destroy        '   '   '   (   (   (   (   (   )   )   )   )   )   )   ,   ,   ,   -         form           timer               /   1        E   \@         close_form        0   0   1         btn                3   8        F @ @À ÀE  À  Á  A E ÁA \ \@          Checked    nx_execute    custom_sender    custom_ancient_tomb_sender       5@
   nx_string    answer        4   4   4   6   6   6   6   6   6   6   6   8         rbtn                :   m       E   @  Á    B    \ À  À      @  Á @    Á@    D   Â   @  À  À   @      IÁÀÁ @  Â @B@  Â BÁ E AC \   A @    ÁÀ  AA àÅA ÆÄ  F ÜAÅÁ ÆÅB EB B EÀ  \  Ü  ÂEB FÅ \ FB@EB FÅ \  ßÀøÆÀÅ É@FÆÆ É@FÆÀÆ É@FÆ Ç É@FÆÀÅ Á E AC\   É ÆÀÅ ACÉ ÆÆ Á E ÁC\   É ÆÆ ÁCÉ ÆÀÆ Á E ÁG\   É ÆÀÆ ÁGÉ Æ Ç Á E H\   É Æ Ç HÉ Æ@È ÉÀHÅ 	 A	 Ü ÉÁ	 Á 
  AB
  Á  A  *      nx_execute 	   util_gui    util_get_form    nx_is_valid    Close    Visible    Show 	   mltbox_q    Clear    AddHtmlText    nx_widestr 
   util_text       ð?      ð¿       @      @   table    insert    math    random 
   nx_number    getn    rbtn_1    Checked     rbtn_2    rbtn_3    rbtn_4    Text    answer       @      @   pbar_1    Value       Y@	   nx_value    GAME_TIMER 	   Register      @@   nx_current    on_update_time        ;   ;   ;   ;   ;   ;   ;   <   <   <   <   <   >   >   B   B   B   B   B   B   B   B   C   C   C   C   C   D   G   H   H   K   K   K   L   L   L   L   L   L   L   L   L   O   P   P   P   P   Q   Q   Q   Q   Q   U   U   U   U   U   U   U   U   U   U   V   W   W   W   W   W   W   X   X   X   X   X   P   [   [   \   \   ]   ]   ^   ^   _   _   _   _   _   _   _   `   `   `   a   a   a   a   a   a   a   b   b   b   c   c   c   c   c   c   c   d   d   d   e   e   e   e   e   e   e   f   f   f   h   h   k   k   k   l   l   l   l   l   l   l   l   l   l   m   
      arg           form          s_list ,         (for index) /   L      (for limit) /   L      (for step) /   L      i 0   K      rand ?   K      temp @   K      timer          
   FORM_NAME     o   t           A@    Ä     B   EÀ     \ Z   @ K A \@         nx_execute 	   util_gui    util_get_form    nx_is_valid    Close        p   p   p   p   p   p   p   q   q   q   q   q   r   r   t         form          
   FORM_NAME     v   ~        E   @@ @\    ÁÀ     E  \@   F@@ @@ @@AI         nx_int    pbar_1    Value            close_form       $@       w   w   w   w   w   w   w   w   w   x   x   y   }   }   }   }   }   ~         form               	   	   	   
   
   
            "      -   %   1   /   8   3   m   m   :   t   t   o   ~   v   ~      
   FORM_NAME           