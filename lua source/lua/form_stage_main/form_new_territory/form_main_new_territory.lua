LuaQ  _   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_new_territory\form_main_new_territory.lua                 A@  @    A  @    AÀ  @ $     $@  @ $   $À  À $    $@ @ $  $À À $            require    util_functions 	   util_gui    share\client_custom_define    main_form_init    on_main_form_open    on_main_form_close    on_btn_show_click    on_pk_value_change    on_inform_camp_count    on_ani_pk_animation_end    play_add_ani    play_sub_ani 	                  	@@	@@AÀ  ^          Fixed     Visible       ð?                            self                   %     
*   E   @  \ ÀÀ ÆÀ@ À  AÆÀÀ Á@ Í Ï@ÁÀ 	 ÀÁ ÆÀA À  B	 	ÂÀB @CC @C   ÁÀ  Å    Ü Ú   ÀË@DA Á À    AB Ü@Á Þ       	   nx_value    gui    AbsLeft    Width        @      @   AbsTop    Height        @	   pk_value         
   ani_addpk    Visible  
   ani_subpk    data_binder    nx_is_valid    AddRolePropertyBind    NewTerritoryPKVal    int    nx_current    on_pk_value_change       ð?    *                                                                                                     !   !   !   !   !   !   !   !   $   $   %         self     )      gui    )      databinder    )           (   -        E      \@ A@  ^          nx_destroy       ð?       *   *   *   ,   ,   -         form                0   8        F @ @À @À@ @À  A@ @À À@        ParentForm 	   groupbox    Visible         1   3   3   3   3   4   4   4   6   6   8         btn     
      form    
           ;   K     	,     @   A      A@ 	Á Á@ EA \ A Á  ÅA B@ ÂAÜ UÁ	A @ E AB \    A @ @ E AB \ @@ Á A 	À        nx_is_valid    pbar_pk    Value    pkvalue_percent    Text    nx_widestr    /    Maximum 
   nx_number 	   pk_value    play_add_ani    play_sub_ani     ,   <   <   <   <   <   =   @   @   B   B   B   B   B   B   B   B   B   B   B   B   B   D   D   D   D   D   D   D   D   E   E   E   F   F   F   F   F   F   F   F   G   G   J   K         form     +   	   PropName     +   	   PropType     +      Value     +           N   W           Á@   Å    Ü Ú@      ÆÀ@A  É ÆÀ@É ÆA @   E A \  À  É   
   	   nx_value ;   form_stage_main\form_new_territory\form_main_new_territory    nx_is_valid 
   pbar_camp    Maximum    Value    camp_count_percent    Text    nx_widestr    /        O   O   O   P   P   P   P   P   Q   T   T   T   U   U   V   V   V   V   V   V   V   V   V   V   V   V   W         light_count           dark_count           form               Z   ]        	@@F@ 	@         Visible     AnimationImage        [   \   \   ]         self                `   i            A@   E     \ Z@      FÀ@ I@AFÀ@ IÀAFÀ@ I@B  
   	   nx_value ;   form_stage_main\form_new_territory\form_main_new_territory    nx_is_valid 
   ani_addpk    Visible    Loop  	   PlayMode                a   a   a   b   b   b   b   b   c   f   f   g   g   h   h   i         form               l   u            A@   E     \ Z@      FÀ@ I@AFÀ@ IÀAFÀ@ I@B  
   	   nx_value ;   form_stage_main\form_new_territory\form_main_new_territory    nx_is_valid 
   ani_subpk    Visible    Loop  	   PlayMode                m   m   m   n   n   n   n   n   o   r   r   s   s   t   t   u         form                                               %      -   (   8   0   K   ;   W   N   ]   Z   i   `   u   l   u           