LuaQ  S   @H:\yuenanl_60512\01_Client\lua\form_stage_main\form_outland\form_outland_main.lua           I      A@  @    A  @    AÀ  @    A  @ @ J  ÁÀ  AA  b@À Ê   AA  ÁÁ  AB  ÁÂ â@ Á A  ä  ÇA äA         Ç ä  ÇÁ äÁ                Ç ä ÇA äA Ç ä            ÇÁ äÁ     Ç ä ÇA äA        Ç ä    ÇÁ          require 	   util_gui    util_functions    define\sysinfo_define %   form_stage_main\switch\switch_define /   form_stage_main\form_outland\form_outland_main     /   form_stage_main\form_outland\form_outland_play 1   form_stage_main\form_outland\form_outland_person 1   form_stage_main\form_outland\form_outland_origin :   form_stage_main\form_outland_war\form_outland_war_achieve            ui_outland_play_desc_1_47    ui_outland_play_desc_1_6    ui_outland_play_desc_1_5    ui_outland_play_desc_1_4    ui_outland_play_desc_1_8    sys_outlandwar_lpf006    sys_outlandwar_lpf007    sns_new_05       ð?
   open_form    on_server_msg    main_form_init    on_main_form_open    on_main_form_close    on_btn_cancel_click !   on_rbtn_sub_form_checked_changed    on_btn_signup_click    common_form_confirm    open_outland_origin_subform    init_outland_subform        4   H      $      A@   E     \ Z@      KÀ@ Å  \Z@  ÀE   @ \   À       ÁÀ  Ë Â @ A Ü@   E À Á  A \@      	   nx_value    SwitchManager    nx_is_valid    CheckSwitchEnable    ST_OUTLAND_ORIGIN_FORM    SystemCenterInfo 
   util_text    sys_school_convert_01    ShowSystemCenterInfo    CENTERINFO_PERSONAL_NO    nx_execute    custom_sender    custom_outland_war       @    $   7   7   7   8   8   8   8   8   9   <   <   <   <   <   >   >   >   ?   ?   ?   ?   ?   @   @   @   A   A   A   A   D   G   G   G   G   G   H         switch_manager    #      SystemCenterInfo          info               K   Q       F @ H   E@    Â  \@           ð?   util_show_form        N   N   P   P   P   P   Q         arg              SIGNUP_TIMES    FORM_OUTLAND_MAIN     S   V        	@@        Fixed         U   V         form                X       	Q   E   @  \   À   @       Á Æ A À @A	ÀÁ ÆÀA À @A	 	@B	ÀB  Å@ ÆÃ Ü       ÀÃ  DA D FÄ @  ÀÃ ÀD D @  @E ÆÀÃ ËÀÅÜ À  F Ë@FÜ A C@ ÀB    D  A A Ä  UÁ À   Å    Ü Ú    AGFG  Ä ÆAÈ I  "   	   nx_value    gui    nx_is_valid    AbsLeft    Width        @   AbsTop    Height    cur_subform     refresh_time         
   nx_number    table    getn    TextManager    Format_SetIDName 
   nx_string       @   Format_AddParam    nx_int    btn_signup 	   HintText    Format_GetText    groupbox_radio    GetChildControlList    rbtn_ 
   nx_custom    Checked 	   lbl_name    Text 
   util_text       ð?    Q   Z   Z   Z   [   [   [   [   [   \   _   _   _   _   _   `   `   `   `   `   c   f   i   i   i   i   i   i   i   l   l   l   l   l   l   l   m   m   m   m   m   m   n   n   n   n   n   p   q   q   r   r   r   r   s   s   t   w   w   w   y   y   y   y   y   z   z   z   z   {   {   {   {   {   |                              form     P      gui    P      gbox_rbtns /   P      childs 1   P      childs_count 5   P   	   tmp_text @   J      rbtn D   J         SUBFORM_COUNT    OUTLAND_FORM    COMMON_TEXTID    SIGNUP_TIMES    DEFAULT_SUBFORM                E      Á@  \Z   ÀF@@   À      @ ÀÀ @ E     \ Z    E     \@         nx_find_custom    cur_subform    nx_is_valid    Close    nx_destroy                                                                                   form           cur_subform                       
   F @ @  À   @      À @         ParentForm    nx_is_valid    Close     
                                       btn     	      form    	              Ò    	L   F @ W@À     F@ À  À   @        Æ@A  ÆÁ ÁÁ     B É@À	ÂFÁÂ A Ä ÆÂ I@	 ÀD @ ÉÂ	AÀFÁÂ A Ä Æ IKC\A EÁ  Â   \ Á  À A      D AA À  A      I@EÁ  \ Z  À A Á Â A        Checked    ParentForm    nx_is_valid 
   nx_number    DataSource    groupbox_main    groupbox_all       ð?   Visible  	   lbl_name    Text 
   util_text 
   DeleteAll    util_get_form    Add    nx_find_custom    cur_subform 	   nx_value    helper_form    nx_execute 5   form_stage_main\form_helper\form_main_helper_manager    next_helper_form     L   ¡   ¡   ¡   ¢   ¥   ¦   ¦   ¦   ¦   ¦   §   ª   ª   ª   ¬   ­   ¯   ²   ²   ´   µ   ¶   ¶   ¶   ¶   ¶   ¶   ¶   ¸   ¸   ¸   ¸   ¸   º   »   ¼   ¼   ¼   ¼   ¼   ¼   ¾   ¾   À   À   À   À   À   À   Á   Á   Á   Á   Á   Â   Å   Å   Å   Ç   Ç   Ç   Ç   Ç   Ç   È   Ê   Î   Î   Î   Ï   Ï   Ð   Ð   Ð   Ð   Ò         rbtn     K      form    K   
   form_type    K      gbox_default_main    K      gbox_subform    K      cur_subform 1   B      helper_form E   K         DEFAULT_SUBFORM    COMMON_TEXTID    SUBFORM_COUNT    OUTLAND_FORM     Õ   ñ    	4   F @ @  À   @        À  Á  @      ÀÀ Å  Æ@ÁÜ D  @À AÁ  EA   \ Z  KBÅA  BÜ Â \A   IÀ @  AC    AÁ  ÁA A         ParentForm    nx_is_valid    nx_find_custom    refresh_time    os    time 	   nx_value    SystemCenterInfo    ShowSystemCenterInfo 
   util_text        @       @   common_form_confirm       @   nx_execute    custom_sender    custom_outland_war       @    4   ×   Ø   Ø   Ø   Ø   Ø   Ù   Ý   Ý   Ý   Ý   Ý   Ý   Þ   à   á   á   á   ã   ã   ã   ã   å   å   å   æ   æ   æ   æ   æ   ç   ç   ç   ç   ç   ç   ç   ê   ì   î   î   î   î   î   î   î   ï   ï   ï   ï   ï   ñ         btn     3      form    3   	   old_time    3   	   new_time    3      SystemCenterInfo    &         MAX_FREQUENCE    COMMON_TEXTID     ô       	9      Á@   B   Å    Ü Á@AA À Å Â Ü   FÁ@KÂÅ   Ü   \A FAB B ÆBÁÁBL@FC AC ÆACÁÁBL@FCIÄKAD\A E Á À  \ @Å   @               util_get_form    form_common\form_confirm 
   util_text    mltbox_info    AddHtmlText    nx_widestr    nx_int       ð¿   SetHtmlItemSelectable    Left    Width        @   Top    Height    relogin_btn    Visible  
   ShowModal    nx_wait_event     ×A   confirm_return    ok     9   ö   ö   ö   ö   ö   ÷   ÷   ÷   ù   ù   ù   ù   ù   ù   ù   ù   ù   ú   ú   ú   ú   ú   ú   ú   ý   ý   ý   ý   ý   ý   ý   þ   þ   þ   þ   þ   þ   þ   ÿ   ÿ                                 
  
          form     8      text     8      dialog    8      info    8      index    8      res /   8                       D    E@     \ Z   @ K@ \@ AÀ  H  E  \@      	   nx_value    nx_is_valid    Close       @
   open_form                                            outland_main             FORM_OUTLAND_MAIN    DEFAULT_SUBFORM                               ð?                       DEFAULT_SUBFORM I                                                                     !   "   #   $   %   '   (   *   *   ,   .   0   H   4   Q   Q   Q   K   V   S                     X               Ò   Ò   Ò   Ò   Ò      ñ   ñ   ñ   Õ     ô                         FORM_OUTLAND_MAIN    H      OUTLAND_FORM    H      SUBFORM_COUNT    H      COMMON_TEXTID    H      SIGNUP_TIMES     H      MAX_FREQUENCE !   H      DEFAULT_SUBFORM "   H       