LuaQ  O   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_relation\form_present.lua           )      A@  @    A  @    AĄ  @    A  @    A@ @    A @ $   Ą $@    $  @ $Ą   $  Ą $@   $ @ $Ą  $  Ą $@   $ @         require 	   util_gui    util_functions    share\client_custom_define    share\logicstate_define    share\view_define    game_object    main_form_init    on_main_form_open    on_main_form_close    hide_other_control    on_init    show_send_page    show_acpect_page    cancel_btn_click     on_rbtn_accpect_checked_changed    on_rbtn_send_checked_changed    on_show_xitie        
        	   	@@	@@	@Ą	@A	@A	 ĀA@ ^    
      Fixed     IsInitSendPresentForm    IsInitAcpectPresentForm    SendPlayerName        SendPlayerUid 	   TypeMode               š?    	                                    self                   ,         E   @  \ ĄĄ ĘĄ@ Ą  A	 Į ĘA Ą  A	Ą Į  A A @    ĮĄ  Å    Ü Ś   Ą’Å@    Ü@ Į Ž       	   nx_value    gui    Left    Width        @   Top    Height    nx_execute 2   form_stage_main\form_main\form_main_request_right    del_request_item       @"   form_stage_main\form_relationship    nx_is_valid    on_init       š?                                               !   !   !   !   !   #   #   #   $   $   $   $   $   )   )   )   +   +   ,         self           gui          relationForm               .   >        F @ Z   ĄE@  @ \ Z    F@ KĄĄ \@ F A Z   ĄE@  @A \ Z    F@A KĄĄ \@ E    \@ AĄ ^          IsInitSendPresentForm    nx_is_valid 
   page_send    Close    IsInitAcpectPresentForm    page_acpect    nx_destroy       š?       0   0   0   1   1   1   1   1   2   2   2   6   6   6   7   7   7   7   7   8   8   8   <   <   <   =   =   >         self                A   K        F @ Z   @ F@@ IĄ@F A Z   @ F@A IĄ@        IsInitSendPresentForm 
   page_send    Visible     IsInitAcpectPresentForm    page_acpect        C   C   C   D   D   G   G   G   H   H   K         form     
           M   T     
   F @ @Ą Ą E     \@ @ FĄ@ I@A     	   TypeMode            show_send_page    rbtn_accpect    Checked     
   N   N   N   O   O   O   O   Q   Q   T         form     	           W   l     )   E      \@ F@@ Z@   E  Ą  Ā    \  A      	@@A ĄA@A @B@A ĄB@A @CC WĄC@@A  DÅ C Ü Ą	@ĀF@A I@BKĄD Ę@A \@        hide_other_control    IsInitSendPresentForm    util_get_form 0   form_stage_main\form_relation\form_send_present    Add 
   page_send    Visible     Fixed    Left       @   Top      N@   SendPlayerName        ipt_players    Text    nx_widestr    ToFront     )   Y   Y   Y   Z   Z   Z   [   [   [   [   [   \   \   \   \   \   ]   ^   ^   _   _   `   `   a   a   b   b   b   c   c   c   c   c   c   f   j   j   k   k   k   l         form     (   
   page_send    #           o            E      \@ F@@ Z@  ĄE  Ą  Ā    \  A      @	@@A ĄA@A @B@A ĄB@A @C	@ĀF@A I@BKC Ę@A \@        hide_other_control    IsInitAcpectPresentForm    util_get_form 2   form_stage_main\form_relation\form_acpect_present    Add    page_acpect    Visible     Fixed    Left       @   Top      N@   ToFront         p   p   p   q   q   q   r   r   r   r   r   s   s   s   s   s   t   u   u   v   v   w   w   x   x   z   ~   ~                     form           page_acpect                          F @ @Ą @             Parent    Close       š?                               self           form                          F @ @@       Ą  @         ParentForm    Checked    show_acpect_page                                      btn           form                          F @ @@       Ą  @         ParentForm    Checked    show_send_page                                      btn           form                  Ø           Į@   Å    Ü Ś@  @ ĮĄ  Ž  Ė AÜ   @ A  @ Į   A @   EA A\ W@@ Į        	   nx_value    game_client    nx_is_valid         
   GetPlayer 
   nx_string    PlayerIdent                                      ”   ”   ¢   ¢   ¢   ¢   ¢   £   £   „   „   „   „   „   „   „   „   ¦   ¦   Ø         player           carrywords           game_client          mainplayer           )                                                            
   ,      >   .   K   A   T   M   l   W      o                     Ø      Ø           