LuaQ  7   @H:\yuenanl_60512\01_Client\lua\client_npc_manager.lua                 A@  @    A  @    Aΐ  @ $     $@  @ $   $ΐ  ΐ $      	      require    util_functions    share\logicstate_define    role_composite    create_scene_npc    init    on_npc_create    self_add_heart    on_npc_delete           0     
+      Α@   Ζ@ Α   W Α  EA FΑ \ @E \  EA  \ ZA  @ AΑ ^ 	ΑBE  ΑA   A ΥA\ZA  @ΑΓ  AΑ           	   nx_value    world    scene    nx_null     string    len            create_actor2    nx_is_valid 
   AsyncLoad    load_from_ini    ini\    .ini    Delete     +   
   
   
                                                                                                                     /   0         terrain     *   	   res_name     *      world    *      scene    *      actor2    *      result !   )           2   5        E      Α@  A  \@ E      Α    \@         nx_callback    on_npc_create    on_npc_delete        3   3   3   3   3   4   4   4   4   4   5         manager     
           ?   ^     ,   E  A@ ΐ \  ΐ   ΐIΑAA   @A IΑ I ΐ  @B@   Α Α  Ε    ά Ϊ  @ΛACA Β Ε ά C @Γ ΑΓ άA          create_scene_npc    Terrain    nx_is_valid    Color    0,255,255,255    SetNpcModel    name    info 
   nx_string           π?	   nx_value    timer_game 	   Register      Σ@      πΏ   nx_current    self_add_heart     ,   @   @   @   @   A   A   A   A   A   C   E   E   E   E   G   H   Q   Q   Q   Q   Q   R   R   U   U   U   V   V   V   V   V   X   X   X   X   X   X   X   X   X   X   ]   ]   ^         manager     +      name     +   	   resource     +      nameid     +      info     +      actor2    +      timer    )           `   i     	   E      \ Z   ΐE@    \ ΐ  Α  A @  @ @  Α  ΖΐAΛ ΒFAB άΒ   ΐΒ A        nx_is_valid 	   nx_value 	   HeadGame    nx_execute 
   head_game    create_client_npc_head    gui    TextManager    GetText    info    ShowClientNpcChatTextOnHead      ³@       a   a   a   a   a   c   c   c   d   d   d   d   d   e   e   e   f   f   f   f   g   g   g   g   g   i         actor2        	   headgame          gui          text               q   {     
   Ζ @ Ζ@ΐ  @     Α  A  E   \ Z  @KAAΕ ά Β @ \AKΒΐ \A  	      Terrain    scene    nx_is_valid 	   nx_value    timer_game    UnRegister    nx_current    self_add_heart    Delete        s   s   t   t   t   t   t   u   u   u   v   v   v   v   v   w   w   w   w   w   w   y   y   y   {         manager           name           model           scene          timer 
                                        0      5   2   ^   ?   i   `   {   q   {           