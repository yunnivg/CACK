LuaQ  I   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_die_battlefield.lua                 A@  @    A  @    Aΐ  @ $     $@  @ $   $ΐ  ΐ $    $@ @ $          require 	   util_gui    util_functions    form_stage_main\form_die_util    main_form_init    main_form_open    main_form_close    on_btn_return_city_click    on_btn_relive_near_click    show_ok_dialog    on_time_over                   	@@        Fixed                     form                   %     	2   E   @  \ ΐΐ Ζΐ@ ΐ  A	 Α ΖA ΐ  A		 Β ΐB  C	  	   Αΐ  Λ DAA   Ε Β ά ά@  Ε    ά A @    Ε ΑE  Aΐ Ε F  A     	   nx_value    gui    Left    Width        @   Top    Height    no_need_motion_alpha    revert    os    time       >@
   LuaScript    nx_current    common_execute    AddExecute    relive_fresh_timer 	   nx_float       ΰ?   form_common\form_loading    nx_is_valid    Desktop    ToBack    ToFront     2                                                                                                                                !   !   !   !   !   #   #   #   #   %         form     1      gui    1      asynor    1   
   form_load #   1           (   2        E   @  \ ΐ Α  @  @    Α   Ε@   ά Ϊ   @ ΛAά@ Εΐ    ά@      	   nx_value    common_execute    RemoveExecute    relive_fresh_timer    form_stage_main\form_relive_ok    nx_is_valid    Close    nx_destroy        )   )   )   *   *   *   *   ,   ,   ,   -   -   -   -   -   .   .   1   1   1   2         form           asynor          dialog 
              5   7        E   @   Α  Α@ E \@        nx_execute    nx_current    show_ok_dialog    ParentForm    RELIVE_TYPE_RETURNCITY        6   6   6   6   6   6   6   7         self                :   <        E   @  Α  Α  \@         nx_execute    custom_sender    custom_relive    RELIVE_TYPE_BATTLEFIELD        ;   ;   ;   ;   ;   <         btn                ?   k     T      Α@   Ε     ά Ϊ@  @ Αΐ  ή  Ε    ά   @ A  @ Α   AΑ E   \ ZA  @ AΑ  ^ E Α Β   \   ΐ A  @ Α    ΐ B AΒ     ΖΒΛΑΒάA ΖΒΛΓEB  \  άA ΖΑΓΙADΛΔάA ΖEΕΝΟAΕIΑΖΑEΒΕΝΟAΕIΑΕ B @ ά ΐΖ  AB  ΐ B      	   nx_value    gui    nx_is_valid            game_client 
   GetPlayer    util_get_form    form_stage_main\form_relive_ok    get_confirm_info    nx_int    mltbox_info    Clear    AddHtmlText    nx_widestr       πΏ   lbl_remain_count    Visible  
   ShowModal    Left    Width        @   Top    Height    nx_wait_event     ΧA   confirm_return    ok    nx_execute    custom_sender    custom_relive     T   @   @   @   B   B   B   B   B   C   C   F   F   F   G   G   G   G   G   H   H   K   K   L   L   L   L   L   M   M   Q   Q   Q   Q   Q   R   R   R   R   R   S   S   W   W   W   W   W   W   Y   Y   Y   Z   Z   Z   Z   Z   Z   Z   ]   ]   `   `   c   c   c   c   c   d   d   d   d   d   f   f   f   f   f   h   h   i   i   i   i   i   k         form     S      relive_type     S      gui    S      game_client    S      player    S      dialog "   S      str /   S      res L   S           n   p            A@    Εΐ  @         nx_execute    custom_sender    custom_relive    RELIVE_TYPE_BATTLEFIELD        o   o   o   o   o   p                                	   	   	         %      2   (   7   5   <   :   k   ?   p   n   p           