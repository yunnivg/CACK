LuaQ     @decode.lua                 A@  @   d   GÀ  d@  G  d  G@ dÀ      G d      GÀ d@     G  d G@ dÀ G d  GÀ d@ G  d G@         require    auto_tools\tool_libs    auto_tools\tools_config    on_form_main_init    on_main_form_open    on_main_form_close    on_btn_close_click    change_form_size    reload_form    on_btn_neigong_click    on_btn_jingmai_in_click    on_btn_jingmai_out_click    on_btn_reload_cache_click    save_jingmai_config                   	@@	@@        Fixed     is_minimize                       form                
           E   \@ 	ÀEÀ  \@         change_form_size    is_minimize     reload_form                                form                           E      \@         nx_destroy                          form                          E      \ @  À   @        À  @      	   nx_value    nx_is_valid    on_main_form_close                                                     btn           form          
   THIS_FORM        &           D    E@     \ Z@      E     \ 	 Á	Á     	   nx_value    nx_is_valid    gui    Left       Y@   Top      a@                                  !   !   !   $   %   &         form          gui          
   THIS_FORM     +   q     õ      D    E@     \ Z@      E     \ ÀÀ Å  A Ü A  @ A        AÁ AÉ 
  J   ËAÂÜ Ú  ÀÁ Â A àAËÃEC  \ C ÁÃ   Õ Á ÜW Â  CD@ CßûÁ Â A àAËÃEC  \ C ÁÃ   Õ Á ÜW Â  CD@CßûËÃEB Â \ B Á  Á ÜÅA  ÜA Å ÆÅ  Ü ÀÅÀÆF  AÂ  ÉÆF  A  É@
ÆF  AÂ  E  EÀ  \   ÁÂ  ÉÅ  Ü  E FÅ \    E C \  ÅC ÄÜ   Å Ä Ü ÕÁBüF 	ÂÅ ÆÅ Ü ÀÅÀÆI  AÂ  ÉÆI  A  É@
ÆI  AÂ  E  EÀ \   ÁÂ  ÉÅ  Ü  E FÅ\    E C \  ÅC ÄÜ   Å Ä Ü ÕÁBüI 	ÂW B@ ÀEÀÆAI  AÂ  ÉÆAI  A  ÉÀÆAI  AÂ  E B À  \  BÉÆAI  A  É  &   	   nx_value    nx_is_valid    game_config    login_account 
   nx_create    IniDocument 	   FileName    \tools_config.ini        LoadFromFile       ð?       @   ReadString 
   nx_string    jingmai_in    jingmai    table    insert    jingmai_out    neigong    max    nx_destroy    getn            lbl_jingmai_in    Text    nx_function    ext_utf8_to_widestr       ChÆ°a thiáº¿t láº­p 	   HintText    nx_widestr        1    máº¡ch. Äá» chuá»t vÃ o Äá» xem chi tiáº¿t    <s>-  
   util_text    <br>    lbl_jingmai_out    lbl_neigong     õ   ,   ,   ,   -   -   -   -   -   .   1   1   1   2   3   3   3   4   4   4   4   4   5   7   7   7   7   8   9   :   ;   ;   ;   ;   =   =   =   =   >   >   >   >   >   >   >   >   >   >   >   ?   ?   @   @   @   @   @   =   D   D   D   D   E   E   E   E   E   E   E   E   E   E   E   F   F   G   G   G   G   G   D   K   K   K   K   K   K   K   K   K   K   M   M   M   N   N   N   N   N   N   P   P   P   P   P   P   Q   Q   Q   Q   Q   Q   T   T   T   T   T   T   T   T   T   T   T   T   T   T   T   T   U   U   U   V   V   V   V   V   V   V   W   W   W   W   W   W   W   W   W   W   W   W   W   V   Y   Y   [   [   [   [   [   [   ]   ]   ]   ]   ]   ]   ^   ^   ^   ^   ^   ^   a   a   a   a   a   a   a   a   a   a   a   a   a   a   a   a   b   b   b   c   c   c   c   c   c   c   d   d   d   d   d   d   d   d   d   d   d   d   d   c   f   f   h   h   h   h   j   j   j   j   j   j   k   k   k   k   k   k   n   n   n   n   n   n   n   n   n   n   n   o   o   o   o   o   q         form    ô      game_config    ô      account    ô      ini    ô      jingmais_in    ô      jingmais_out    ô      max_neigong    ô      (for index) $   8      (for limit) $   8      (for step) $   8      i %   7      jm 0   7      (for index) ;   O      (for limit) ;   O      (for step) ;   O      i <   N      jm G   N      text          (for index)          (for limit)          (for step)          i          text ½   Ô      (for index) Ã   Ò      (for limit) Ã   Ò      (for step) Ã   Ò      i Ä   Ñ      
   THIS_FORM     t        A   F @ @  À   @        ÁÀ   Æ AA A  E  Á \ Â ÅA    Ü ÚA      ÁA  AÂ B	CB BC À B  ÂC À B  D À ÁB DÃ B  EB B @ B  B Â E B Á \B          ParentForm    nx_is_valid 	   nx_value    game_config    login_account 
   nx_create    IniDocument    game_client 
   GetPlayer    neigong 	   FileName    \tools_config.ini    LoadFromFile    DeleteSection 
   nx_string    AddSection    WriteString    max 
   QueryProp    CurNeiGong    SaveToFile    nx_destroy    reload_form    tools_show_notice    nx_function    ext_utf8_to_widestr %   Ná»i cÃ´ng ÄÃ£ ÄÆ°á»£c lÆ°u láº¡i     A   u   v   v   v   v   v   w   y   y   y   z   {   {   {   |   |   |   }   }   ~   ~   ~   ~   ~                                                                                                                                    btn     @      form    @      game_config 
   @      account    @      ini    @      game_client    @      player_client    @      section_config    @                      F @ @  À   @        ÁÀ  @   @ @ Å Á A Ü @    	      ParentForm    nx_is_valid    save_jingmai_config    jingmai_in    reload_form    tools_show_notice    nx_function    ext_utf8_to_widestr &   Máº¡ch ná»i ÄÃ£ ÄÆ°á»£c lÆ°u láº¡i                                                                       btn           form                  ¢        F @ @  À   @        ÁÀ  @   @ @ Å Á A Ü @    	      ParentForm    nx_is_valid    save_jingmai_config    jingmai_out    reload_form    tools_show_notice    nx_function    ext_utf8_to_widestr (   Máº¡ch ngoáº¡i ÄÃ£ ÄÆ°á»£c lÆ°u láº¡i                                              ¡   ¡   ¡   ¡   ¡   ¡   ¢         btn           form               ¥   ¬        F @ @  À   @        @ À  Å  A A Ü @          ParentForm    nx_is_valid    tools_reload_cache    tools_show_notice    nx_function    ext_utf8_to_widestr \   Cache ÄÃ£ ÄÆ°á»£c xÃ³a. Dá»¯ liá»u sáº½ ÄÆ°á»£c Äá»c láº¡i tá»« táº­p tin cáº¥u hÃ¬nh        ¦   §   §   §   §   §   ¨   ª   ª   «   «   «   «   «   «   ¬         btn           form               ±   Ë     B   E   @  \ À ÅÀ   Ü   AA  KA\ Á À A       ÁA ÁÉÂA ÁÂ @   A  AÃ @   A  ÃÂ  ÁA   AB àÁËÄAÃ CDÁÃ ÜWÀÄ Å À   ÁC   Õ CßûËÅÜA ÅÁ  ÜA      	   nx_value    game_config    login_account 
   nx_create    IniDocument    game_client 
   GetPlayer    nx_is_valid 	   FileName    \tools_config.ini    LoadFromFile    DeleteSection 
   nx_string    AddSection    GetRecordRows    active_jingmai_rec               ð?   QueryRecord        WriteString    jingmai    SaveToFile    nx_destroy     B   ²   ²   ²   ³   ´   ´   ´   µ   µ   µ   ¶   ¶   ·   ·   ·   ·   ·   ¸   º   º   º   º   »   »   ½   ½   ½   ½   ½   ¾   ¾   ¾   ¾   ¾   À   À   À   Á   Á   Â   Â   Â   Â   Ã   Ã   Ã   Ã   Ã   Ä   Ä   Å   Å   Å   Å   Å   Å   Å   Å   Å   Â   É   É   Ê   Ê   Ê   Ë         type     A      game_config    A      account    A      ini    A      game_client 
   A      player_client    A      total %   A      (for index) *   <      (for limit) *   <      (for step) *   <      i +   ;      jingmai 0   ;                               
                  &   &      q   q   +      t         ¢      ¬   ¥   Ë   ±   Ë      
   THIS_FORM           