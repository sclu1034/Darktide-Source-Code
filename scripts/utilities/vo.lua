LJ @scripts/utilities/vo.lua¥   
:  9  B'   9   BK  trigger_dialogue_eventheal_startget_event_data_payloaddialogue_extension  event_data event_name  ¯  c6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadrapid_loosing_healthdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	 Å 
7µ'6  9  ' B  X-  8  X6  9  ' B  B XX X 6  9 ' B  X6 9 9'	 B 6  9 ' B 9
' ' 	 B 9
' ' )	 BK  Àreviveelast_reviveeuser_memorystore_in_memorygameplay	timeManagersreviveremove_netdialogue_systemextensiondialogue_context_systemhas_extensionScriptUnit							






Interactions unit  8target_unit  8interaction_template_name  8vo_event 

dialogue_extension timeset dialogue_extension  È 	 z9	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_event	itemget_event_data_payloadthrowing_itemdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  projectile_template  dialogue_extension event_name event_data 	  *D9 96 9 ' B' -    B  X9 9 9  X+ X	+ 	  X		 X
+	 X
+	  	 X

 9
	B
' =

 9 
 BK  trigger_dialogue_eventout_of_ammofail_reasonget_event_data_payloadcurrent_ammunition_clipmax_ammunition_clipcurrent_ammunition_reservereload_faileddialogue_systemhas_extensionScriptUnitplayer_unit_player 					






_can_player_trigger_vo inventory_slot_component  +visual_loadout_extension  +shooter (dialogue_extension #event_name "ammo_reserve clip_capacity current_clip_amount full_clip is_out_of_ammo event_data   +X
6  9  ' B' 6 9 9' B -    B  X 9B 9  +	  9
	+ B 9
' ' 	 B 9
' ' )	 BK  ammo_hoggerlast_ammo_hoggeruser_memorystore_in_memory_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadgameplay	timeManagersammo_hogdialogue_systemhas_extensionScriptUnit
_can_player_trigger_vo unit  ,dialogue_extension &event_name %timeset event_data 	  +d
6  9  ' B' 6 9 9' B -    B  X 9B 9  +	  9
	+ B 9
' ' 	 B 9
' ' )	 BK  health_hoggerlast_health_hoggeruser_memorystore_in_memory_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadgameplay	timeManagershealth_hogdialogue_systemhas_extensionScriptUnit
_can_player_trigger_vo unit  ,dialogue_extension &event_name %timeset event_data 	 ÷  ,Úp6  9  ' B6  9  ' B
  X  XK   9' B-  9  X X' -   B  X 9B 9		 
 +  9
+ BK  À_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadhead_shot"ranged_special_kill_thresholdnumber_of_headshotsincrease_timed_counterdialogue_context_systemdialogue_systemhas_extensionScriptUnit		



DialogueSettings _can_player_trigger_vo killer_unit  -distance  -dialogue_extension 'dialogue_context_extension "ranged_special_kill_threshold event_name event_data 	 Ã  .Ñ6  9  ' B6  9 ' B-  99
  X
  X  XK    X-   B  X 9B 9B= 9B==	 9
	 
 BK  Àtrigger_dialogue_eventtrigger_idinteractee_classvo_class_nameinteractor_classget_event_data_payloadinteraction_voconceptsdialogue_systemhas_extensionScriptUnit								


VOQueryConstants _can_player_trigger_vo interactor_unit  /interactee_unit  /interaction_vo_event  /interactor_ext )interactee_ext $query_concept !event_data  Á 
	 ²6  9  ' B' -    B  X-   B X- 989 9B= 9 	 BK   Àtrigger_dialogue_eventkiller_nameget_event_data_payloadvo_class_name	namekillstreakdialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo _get_breed DialogueBreedSettings killer_unit   dialogue_extension event_name breed 	killer_source_name 	event_data  ¢  %Ð¢	6  9  ' B' -    B  X- 9 X' X' 6  9  ' B6  9  '	 B- 9
 	 
 + BK  ÀÀtrigger_voicevisual_loadout_systemfx_systemextensionhurt_heavy_vcehurt_light_vce&player_vce_light_damage_thresholdexpressiondialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo DialogueSettings PlayerVoiceGrunts unit  &damage  &dialogue_extension  event_name sound_event_alias fx_extension visual_loadout_extension  Ü 	 ­   X-  9  X6 9  ' B6 9  ' B- 9'   + BK  ÀÀland_heavy_vcetrigger_voicevisual_loadout_systemfx_systemextensionScriptUnit heavy_land_on_air_thresholdDialogueSettings PlayerVoiceGrunts unit  time_in_falling  fx_extension visual_loadout_extension  É 
  y·	6  9  ' B  XK  ' 9 9B= 9 	 BK  trigger_dialogue_eventenemy_tagget_event_data_payload	namepouncing_enemydialogue_systemhas_extensionScriptUnit	target_unit  pouncing_breed  dialogue_extension event_name 
pouncing_breed_name  
event_data  Ç 	 xÂ6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadwarningdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo target_unit  trigger_id  dialogue_extension event_name event_data 	 É   (Ì6  9  ' B  X 9' BK  "number_of_player_suppressionsincrease_timed_counterdialogue_context_systemhas_extensionScriptUnitunit  context_extension  Õ   8Ó6  9  ' B  X 9' BK  number_of_npc_vo_triggersincrease_timed_counterdialogue_context_systemhas_extensionScriptUnitunit  vo_event_data  context_extension  À   (Ú6  9  ' B  X 9' BK  number_of_armor_hitsincrease_timed_counterdialogue_context_systemhas_extensionScriptUnitunit  context_extension  ©  cá6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadledge_hangingdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension vo_concept event_data 	  Gßê   XD  XB6  9  ' B  X;6  9 ' B  X46  9  ' B 9B 9B=6  9 ' B 9B='	 6
 9 9' B -   	 B  X 9	 
 B 9'	 '
  B 9'	 '
 ) BK  has_friendly_firedlast_shot_frienduser_memorystore_in_memorytrigger_dialogue_eventgameplay	timeManagersfriendly_fireattacked_classvo_class_nameattacking_classget_event_data_payloaddialogue_systemextensiondialogue_context_systemhas_extensionScriptUnit
_can_player_trigger_vo attacking_unit  Hattacked_unit  Hdialogue_ext_attacking_unit /event_data ,dialogue_ext_attacked_unit 	#event_name timeset  Ù  W»ÿ"   XT6  9  ' B6 99 9  B  XF
  XD6  9  ' B  X	6  9  ' B 9	'
 B-   B- 989  X+'   X99  X' X9X6  9 '	 B  X	6  9 '	 B 9B9' - 	 
 B  X			 9B=
 9	  B	K   Àtrigger_dialogue_eventkilled_typeget_event_data_payloadenemy_killplayer_profileget_contextmonster	tagsUNKNOWN!vo_triggers_enemy_kill_query	namenumber_of_killsincrease_timed_counterextensiondialogue_context_system
ownerplayer_unit_spawn
stateManagersdialogue_systemhas_extensionScriptUnit				"_get_breed DialogueBreedSettings _can_player_trigger_vo killer_unit  Xkilled_unit  Xkiller_dialogue_extension Oplayer_unit_spawn_manager Lplayer Hcontext_extension breed_data 1killed_unit_name *event_name event_data 	 » 	 ¤£-  B  X6  9 ' B' -   B  X 9B== 9	 
 +  ' + BK  	imperium#trigger_faction_dialogue_queryvo_eventenemy_tagget_event_data_payloadplayer_enemy_attackdialogue_systemhas_extensionScriptUnit								_get_random_player _can_player_trigger_vo unit  breed_name  vo_event  random_player dialogue_extension concept event_data 	
 Í  Ë±-    B  X6  9 ' B' - 	 
 B  X	
	 9B==
 9	  B	K  trigger_dialogue_eventvo_eventenemy_tagget_event_data_payloadplayer_enemy_attackdialogue_systemhas_extensionScriptUnit					_get_closest_player_except _can_player_trigger_vo unit  breed_name  vo_event  position  filtered_player_unit  best_player dialogue_extension concept event_data 	 Ø 	 ¿
-  B  X6  9 ' B  -   B  X 9B 9  BK  	trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnit
_get_random_player _can_player_trigger_vo vo_concept  random_player dialogue_extension concept event_data 	 ´  cË6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadenemy_near_death_monsterdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	 Ê 	 qÕ	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventstory_typeget_event_data_payloadcombat_story_talkdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  breed_name  dialogue_extension event_name event_data 	 ®  cà6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadguidance_wrong_waydialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	    ê
-   B 6  9  ' B' 
   X-   B  X
 9B' = 9  BK  	trigger_dialogue_eventexpression_reliefexpression_typeget_event_data_payloadexpressiondialogue_systemhas_extensionScriptUnit
_get_random_player _can_player_trigger_vo random_player dialogue_extension event_name event_data  ÿ   ö	-   B 6  9  ' B' 
   X-   B  X 9B 9  BK  	trigger_dialogue_eventget_event_data_payload5seen_enemy_group_far_range_shooting_behind_coverdialogue_systemhas_extensionScriptUnit	_get_random_player _can_player_trigger_vo random_player dialogue_extension event_name event_data  Ý  .ê6  9  ' B  X 9B6 9  ) B-     B6  9 ' B'   X-   B  X 9B 9	B= 9
	 
 BK  trigger_dialogue_eventvo_class_namedied_classget_event_data_payloadplayer_deathlocal_position	Unitstop_currently_playing_vodialogue_systemhas_extensionScriptUnit					
_get_closest_player_except _can_player_trigger_vo dead_player_unit  /dead_player_dialogue_ext )player_position 
closest_player closest_player_dialogue_ext event_name event_data 	 Å 	 m	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventability_nameget_event_data_payloadcombat_abilitydialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  vo_tag  dialogue_extension event_name event_data 	 ý 	
 w6  9  ' B' -    B  X 9B X' =X' = 9	  BK  trigger_dialogue_eventvectorambushhorde_typeambush_hordeget_event_data_payloadheard_hordedialogue_systemhas_extensionScriptUnit		_can_player_trigger_vo unit  horde_type  dialogue_extension vo_concept event_data 	 £ 	 ­'  -     B  X  9 B  9 B  9 B====  9 	 
 BK  trigger_dialogue_eventobserver_vo_profileobserver_vo_classdistancelook_at_tagget_voice_profilevo_class_nameget_event_data_payloadlook_at	




_can_player_trigger_vo dialogue_extension  tag  distance  event_name event_data 	observer_vo_class observer_vo_profile 	    »  9  B  9 B  9 B====	  9 
  +   + BK  #trigger_faction_dialogue_queryobserver_vo_profileobserver_vo_classdistancelook_at_tagget_voice_profilevo_class_nameget_event_data_payloaddialogue_extension  faction_event  faction_name  tag  distance  event_data observer_vo_class observer_vo_profile  ø 	 Ì6  9  ' B' -    B  X 9B=== 9	 
 BK  trigger_dialogue_eventdistanceenemy_unitenemy_tagget_event_data_payloadseen_enemydialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo unit  enemy_tag  enemy_unit  distance  dialogue_extension event_name event_data 	 ù 	 Ù6  9  ' B' -    B  X 9B=== 9	 
 BK  trigger_dialogue_eventdistanceenemy_unitenemy_tagget_event_data_payloadheard_enemydialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo unit  enemy_tag  enemy_unit  distance  dialogue_extension event_name event_data 	 Ë 	 qæ	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadgeneric_mission_vodialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  trigger_id  dialogue_extension event_name event_data 	 Ì 	 qñ	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventstory_nameget_event_data_payloadenvironmental_storydialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  story_name  dialogue_extension event_name event_data 	 à 
 zü	6  9  ' B' -    B  X
 9B== 9 	 BK  trigger_dialogue_eventvo_eventenemy_tagget_event_data_payloadplayer_enemy_alertdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  breed_name  vo_event  dialogue_extension concept event_data 	 Ï 	 s6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventenemy_tagget_event_data_payloadpounced_by_special_attackdialogue_systemextensionScriptUnit_can_player_trigger_vo unit  breed_name  dialogue_extension concept_name event_data 	 í   46  9  ' B  X	6  9  ' B 9' BK  number_of_knocked_downsincrease_timed_counterextensiondialogue_context_systemhas_extensionScriptUnitdowned_unit  context_extension   	 q6  9  ' B' -    B  X 9B 9B= 9  +  9	+
 BK  _faction_breed_name#trigger_faction_dialogue_queryvo_class_nameplayer_classget_event_data_payload knocked_down_multiple_timesdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo downed_unit  dialogue_extension vo_concept query_data 	   X¥   X6  9  ' B6  9  ' B-  9'   + BK  Àcatapulted_vcetrigger_voicevisual_loadout_systemfx_systemextensionScriptUnitPlayerVoiceGrunts unit  fx_extension visual_loadout_extension    X­   X6  9  ' B6  9  ' B-  9'   + BK  Àcatapulted_land_vcetrigger_voicevisual_loadout_systemfx_systemextensionScriptUnitPlayerVoiceGrunts unit  fx_extension visual_loadout_extension  ñ 
 ¸	-    B- 9 896 9  ' B  X  X	 9B  9 	 BK   Àtrigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitassault_vo_event	name	_get_breed DialogueBreedSettings unit  breed assault_vo_event_name dialogue_ext event_data event_name  ö   BÄ6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventtake_positionget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name   	  PÎ6  9  ' B  X
 9B' = 9  BK  trigger_dialogue_eventenemy_tagalerted_idleget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  breed_name  dialogue_ext event_data event_name  © 	 ©Þ+    X-    B X- B   X- 9  9 BK  	À	nameplayer_enemy_alert_event						_get_random_non_threatening_player_unit _get_random_player Vo enemy_unit  enemy_breed  vo_event  optional_non_threatening_player  player_unit  ô   Bë6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventranged_idleget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  ó   Bô6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventtake_coverget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  ô   Bý6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventcall_backupget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  û 	  U6  9  ' B  X	 9B  9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  spawn_event_name  dialogue_ext event_data event_name  ñ   B6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventskulkingget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  é   G6  9  ' B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  event_name  dialogue_extension event_data  Ï 
  m 6  9  ' B  X'  9B=  X= 9 	 BK  trigger_dialogue_eventenemy_tagtrigger_idget_event_data_payloadgeneric_enemy_vo_eventdialogue_systemhas_extensionScriptUnit




unit  trigger_id  breed_name_or_nil  dialogue_extension event_name event_data 	 ¡ 	  V´6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventattack_nameget_event_data_payloadenemy_special_attackdialogue_systemhas_extensionScriptUnitunit  event_type  dialogue_extension event_name 	event_data  Û   ?À6  9  ' B 9B 9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemextension_inputScriptUnitunit  concept  dialogue_input 	event_table    	  aÆ6  9  ' B'  9B= 9  BK  trigger_dialogue_eventstarter_lineget_event_data_payloadmission_briefdialogue_systemextension_inputScriptUnitunit  mission_brief_starter_line  dialogue_input event_name 
event_table   	  VÎ6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadmission_infodialogue_systemhas_extensionScriptUnitunit  trigger_id  dialogue_extension event_name 	event_data  Ó  6÷Ù6  99 9B  X 6  99+    X-  B X  X	 9B 9	 B X 	 X 9 B 6
 9 ' B  X
' 	 9B=
 9	  B	K  
trigger_dialogue_eventtrigger_idget_event_data_payloadmission_infodialogue_systemhas_extensionScriptUnitselected_voicevoice_over_unitcurrent_voice_profilemission_defaultrule_basedvoice_over_spawnis_servergame_session
stateManagers				

_get_random_vox_unit voice_selection  7selected_voice  7trigger_id  7is_server 0voice_over_spawn_manager +misison_giver_unit *voice_profile dialogue_extension event_name 	event_data  Ú   1þõ6  99 9B  X 6  99+    X	 9B	 9
 B X  X 9	 B 6	 9
 '	 B  X' 
 9	B	=	=	 9
 	 B
K  trigger_dialogue_eventlook_at_tagdistanceget_event_data_payloadlook_atdialogue_systemhas_extensionScriptUnit!mission_giver_selected_voicevoice_over_unitcurrent_voice_profile"mission_giver_mission_defaultvoice_over_spawnis_servergame_session
stateManagers			





dialogue_target_filter  2look_at_tag  2mission_giver_selected_voice  2distance  2is_server +voice_over_spawn_manager &misison_giver_unit %voice_profile dialogue_extension event_name 
event_data  Ù  -    B  X6  9 ' B  9B=  X 9	 
 BK  trigger_dialogue_eventtrigger_idget_event_data_payloaddialogue_systemhas_extensionScriptUnit					_get_mission_giver_unit voice_profile  concept  trigger_id  unit dialogue_extension event_name event_data  ¡ 	  V¢   X6  9  ' B'  9B=  X 9  BK  trigger_dialogue_eventcategoryget_event_data_payloadconfessional_vodialogue_systemhas_extensionScriptUnitunit  category  dialogue_extension event_name event_data  Î   =¯#6  99 9B  X 6 9  ' B6 9 '	 B  X(  X&	 9B'	  9
	B
=

=
6  B 9B6  B XK    X=
 X 9	 
  BX 9	 
 BK  trigger_dialogue_event$trigger_targeted_dialogue_eventinteractor_onlycooldown_time_get_interaction_level_reqget_context_get_player_levelinteractor_voice_profilevo_eventget_event_data_payloadnpc_interacting_voget_voice_profiledialogue_systemhas_extensionScriptUnitis_servergame_session
stateManagers				


#unit  >interactor_unit  >vo_event  >cooldown_time  >play_in  >is_server 7dialogue_ext_npc 0dialogue_ext_interactor +interactor_voice_profile #event_name "event_data player_level npc_context level_req   	  RÔ	6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventvo_eventget_event_data_payloadnpc_vodialogue_systemhas_extensionScriptUnit	unit  vo_event  dialogue_ext_npc event_name 	event_data  ® 	  Vß6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payload'mission_giver_conversation_starterdialogue_systemhas_extensionScriptUnitunit  trigger_id  dialogue_extension event_name 	event_data  ¿ 	 qé	-  B  X6  9 ' B'  9B=  9  BK  
trigger_dialogue_eventtrigger_idget_event_data_payloadnpc_story_talkdialogue_systemhas_extensionScriptUnit	_get_random_vox_unit trigger_id  vox_unit dialogue_extension 
event_name 	event_data  Í  4ö-  9 - 8 X+ X+   X(  X&6 99' 	 9
 B6	 9		
	 9		  B	6
	 9


	  B
6	 9	 
 '  B6	 9	  
 B6	 9	  
 BK  ÀÀtrigger_resource_eventvoice_fx_presetset_source_parametermake_auto_sourceWwiseWorldwwise_world
worldvoice_over_unitvoice_previewvoice_over_spawn
stateManagersvoice_fx_rtpc_none,character_appearence_stop_voice_preview	



UISoundEvents VoiceFxPresetSettings world  5voice_fx_preset  5sound_event  5stop_sound_event 2voice_fx_preset_rtpc 0has_voice_fx_preset +voice_over_spawn_manager #voice_profile "unit wwise_world source  ¹ 
 +¬6  9  ' B  X# 9B -  99 X=X-  99 X- 89=	  X=	X-  99
 X= 9 	 BK  À Àtrigger_dialogue_eventitem_tagon_demand_vo_tag_itemenemy_tagdynamic_smart_tagon_demand_vo_tag_enemytrigger_idon_demand_com_wheelconceptsget_event_data_payloaddialogue_systemhas_extensionScriptUnit					


VOQueryConstants DialogueBreedSettings unit  ,concept  ,trigger_id  ,dialogue_extension &event_data  event_name smart_tag   	  V¢
6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadstart_banterdialogue_systemhas_extensionScriptUnit
unit  trigger_id  dialogue_extension event_name 	event_data  ²  
P®-    B- 9   ' 9BK  À	namereinforcementsenemy_generic_vo_event_get_breed Vo dialogue_extension_unit  dialogue_extension  breed  ®   &É´9  +  6 	 BH9 X9XFRù  X6 9	 '
 B  X	
 9	    B	L X6 9	'	
 '
  BK  :Play Local VO event, no VO unit found for profile %s DialogueSystemwarningLogplay_local_vo_eventsdialogue_systemhas_extensionScriptUnit
_unit_vo_profile_name
pairs_unit_extension_data

dialogue_system  'vo_rules  'voice_profile  'wwise_route_key  'on_play_callback  'seed  'unit_extensions %vo_unit $  _ unit_ext  dialogue_extension 
 Õ   QÊ6  9  ' B  X 9  +	  
 BK  play_local_vo_eventdialogue_systemhas_extensionScriptUnitunit  rule_name  wwise_route_key  seed  dialogue_extension 
 ñ   #Ø9  +  6  BH	9
 X9
XF	R	ù  X6 9 ' B  X 9	 
 D X6 9	'
 ' 	 BK  :Play Local VO event, no VO unit found for profile %s DialogueSystemwarningLogevaluate_rulesdialogue_systemhas_extensionScriptUnit
_unit_vo_profile_name
pairs_unit_extension_data

dialogue_system  $rules  $voice_profile  $seed  $unit_extensions "vo_unit !  _ unit_ext  dialogue_extension  q   ì-  =  -  = K  Àshort_story_ticker_enabledstory_ticker_enabledDialogueSettings params     ?ñ-    B- 9 8=K   Àdynamic_smart_tag	name_get_breed DialogueBreedSettings unit  	tag  	breed  Ø    \ö6   9  9  6  99 9B  X  9 B6  99 9B6 9	  '
 &BK  _selectedtrigger_event
Levelmission_levelmissioncurrent_voice_profileis_servergame_sessionvoice_over_spawn
stateManagersvoice_over_spawn_manager is_server voice_profile level   	  V	6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventvo_line_idget_event_data_payloadcutscene_vo_linedialogue_systemhas_extensionScriptUnit	unit  vo_line_id  dialogue_extension event_name 	event_data  Á  e6  9  ' B' -    B  X
 9B' = 9  BK  trigger_dialogue_eventdebug_votrigger_idget_event_data_payloadwarningdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	    &6  9  ' B  X 9D X+  L K  
breedunit_data_systemhas_extensionScriptUnitunit  unit_data_ext 	     .£6   9  9    9  B    XK  6  99 9' B 9B 9 B6  99	 9
B ) )ÿÿM8
	99
8  X6 9 	 BOôL remove
tableplayer_unitunits_lookupalive_playersplayer_unit_spawnget_side_from_name!get_default_player_side_nameside_systemsystemextensionis_servergame_session
stateManagers


is_server (side_system 
side_name side player_unit_spawn_manager alive_players   i player 
 Ñ   h¸
-   B    X  )   X6  9)  B8 9L K  player_unitrandom	math
_get_alive_players alive_players num_alive_players random_index random_player  á 6µÅ-  B  X1 )   X-6  9- B)  ) M
89 X	-	 -
 

 
 
<
	Oö-  )   X6 9+  )  )	 M- 8
6 86 9   B X  OòL K  ÀdistanceVector3POSITION_LOOKUP	huge	mathplayer_unit
clear
table					_get_alive_players valid_player_units position  7filtered_player_unit  7alive_players 4num_alive_players 0
  i 	player_unit num_valid_player_units 
closest_distance best_player_unit   i player_unit player_position 	distance  ß 
:æ6  9  ' B6 9-  B- B6 9+   )  ) M8
	9

 9
 B  X X 
 X	 X  X-  -    <
Oé-   )   X	-  6 9	)	 
 B8L XL K  Àrandomthreatplayer_unit	huge	math
clear
tableperception_systemextensionScriptUnit				



valid_player_units _get_alive_players minion_unit  ;perception_extension 5alive_players /least_threat -least_threatening_unit ,num_alive_players +  i player_unit threat num_valid_player_units  Ö   	-   B   6  9)  B8 -  D random	math_get_all_vox_voice_profiles _get_mission_giver_unit vox_voice_profiles 
num_voice_profiles 	random_index voice_profile  Ì   ¬	-   9   4  )   ) M8 -  896	 
 B	H6 9  BFRùOðL  Àinsert
table
pairswwise_voicesvoice_classes_npc					DialogueBreedSettings npc_vo_classes vox_voice_profiles   i vo_class class_settings voice_profiles   _ voice_profile   æ   P	6  996  99 9B  X 9  BL K  voice_over_unitis_servergame_sessionvoice_over_spawn
stateManagersvoice_profile  voice_over_spawn_manager is_server unit     	 ,`¡	   X+ L 9   X9  X+ L X X9  X+ L X X9  X+ L X X9  X+ L X9  X+ L + L is_disabledis_nettedis_pounced_downpounced_by_special_attackis_ledge_hangingledge_hangingis_knocked_downknocked_down_context					


dialogue_extension  -concept_name  -context_data ' Ê   R´	6  99 9  B 9B9L current_levelprofile
ownerplayer_unit_spawn
stateManagersunit  player_unit_spawn_manager 	player profile player_level    F½	9  -  89  X)  L  Àlevel_requirementclass_nameDialogueBreedSettings npc_context  	class_name level_req     
4Ä	6  9'   ' &  BK  ! breed_name = %s, event= %s DialogueSystem	infoLogevent_category  breed_name  vo_event   ý  ² Â± Ç	6   ' B 6  ' B6  ' B6  ' B6  ' B6  ' B4  , 5 3 =	3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =235 =437 =639 =83; =:3= =<3? =>3A =@3C =B3E =D3G =F3I =H3K =J3M =L3O =N3Q =P3S =R3U =T3W =V3Y =X3[ =Z3] =\3_ =^3a =`3c =b3e =d3g =f3i =h3k =j3m =l3o =n3q =p3s =r3u =t3w =v3y =x3{ =z3} =|3 =~3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3¡ = 3£ =¢3¤ 3¥ 3	¦ 4  3§ 3¨ 3
© 3ª 3« 3¬ 3­ 7® 3¯ 7° 3± 2  L  _get_interaction_level_req _get_player_level           play_debug_vo_event cutscene_vo_event mission_giver_check_event set_dynamic_smart_tag set_story_ticker evaluate_rules play_local_vo_event play_local_vo_events reinforcements start_banter_vo_event on_demand_vo_event !play_voice_fx_preset_preview play_npc_story 'mission_giver_conversation_starter play_npc_vo_event "play_npc_interacting_vo_event confessional_vo_event mission_giver_vo_event 'mission_giver_point_of_interest_vo "mission_giver_mission_info_vo mission_giver_mission_info &mission_giver_mission_brief_event mission_giver_event "enemy_vo_special_attack_event enemy_generic_vo_event enemy_vo_event enemy_skulk_event enemy_spawn_vo_event enemy_call_backup_event enemy_take_cover_event enemy_ranged_idle_event $random_player_enemy_alert_event enemy_alerted_idle_event enemy_take_position_event enemy_assault_event !player_catapulted_land_event player_catapulted_event -player_knocked_down_multiple_times_event &knocked_down_multiple_times_event $player_pounced_by_special_event player_enemy_alert_event !environmental_story_vo_event generic_mission_vo_event heard_enemy_event seen_enemy_event faction_look_at_event look_at_event heard_horde play_combat_ability_event player_death_event %enemy_shooting_from_covers_event play_expression_relief_vo $player_guidance_wrong_way_event  monster_combat_conversation "monster_health_critical_event player_vo_event_by_concept 0closest_player_except_vo_enemy_attack_event !player_vo_enemy_attack_event enemy_kill_event friendly_fire_event player_ledge_hanging_event armor_hit_event timer_based_vo_event player_suppressed_event warning_event pouncing_alert_event player_land_event player_damage_event killstreak_event  player_interaction_vo_event head_shot_event health_hog_event ammo_hog_event out_of_ammo_event throwing_item_event interaction_start_event health_critical_eventhealth_station   1scripts/settings/dialogue/vo_query_constants7scripts/settings/dialogue/voice_fx_preset_settings(scripts/settings/ui/ui_sound_events*scripts/utilities/player_voice_grunts0scripts/settings/dialogue/dialogue_settings6scripts/settings/dialogue/dialogue_breed_settingsrequire                   
    %  7 ' B 9 V D b X n d  p      « ¢ µ ­ À · Ê Â Ñ Ì Ø Ó ß Ú è á ý ê !ÿ /#=1I?SK^Uh`tjv«¹­Ê»×ÌäÙïæúñü!+%3-A8KD\Ni^rk{t}² ¼´ÄÀÌÆÖÎñÙõ-"R/]Tg_riv ¬¢±®Ç´ÏÊêØïìôñþö
!6BDd~²»»ÂÂÆÇÇDialogueBreedSettings ¿DialogueSettings ¼PlayerVoiceGrunts ¹UISoundEvents ¶VoiceFxPresetSettings ³VOQueryConstants °Vo ¯_get_breed ®_get_alive_players  ®_get_random_player  ®_get_random_vox_unit  ®_get_all_vox_voice_profiles  ®_get_closest_player_except  ®_get_random_non_threatening_player_unit  ®_can_player_trigger_vo  ®_get_mission_giver_unit  ®_log_vo_event  ®Interactions «valid_player_units   