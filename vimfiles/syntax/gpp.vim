" Vim syntax file
" Language:    GPP language.
" Maintainer:  eng. Kiss Robert
" Last Change: Nov 18, 2014
" Description: Used for SolidCAM postprocessors.

" --------------
filetype plugin on 
"colorscheme xoria256
syntax sync fromstart
set guioptions+=b
set nowrap

set foldmethod=marker
"set iskeyword=33-38,42-126
set iskeyword=48-57,65-90,95,97-122
" --------------
"syn match err           .\S.

syn region expression   start=.(. end=.). contains=variables,strings,inumbers,rnumbers,operators,attribute,boolean

" Variables:
syn match variables     .\a\w\{0,26}\W.he=e-1,me=e-1
syn match variables     .\a\w\{0,26}\n.
" sc_vars = SolidCAM Variables; st_vars = Variables defined at the start of file; 
syntax case ignore
syn keyword sc_vars     gcode mcode rotated mirrored prev_command current_command next_command first_user_proc nb nl pre_processor program_number line_labels comp_left comp_right comp_off tool_type colent
syn keyword st_vars     remove_blanks gcode_space gcode_f mcode_f numeric_def_f integer_def_f xpos_f ypos_f zpos_f apos_f feed_f end_block_text blknum_letter blknum_exist blknum_gen blknum_f blknum_delta blknum blknum_max skipline num_user_procs PI inch_system
" int_vars1: Arc; Call Proc(-Turning Jobs); Change Ref Points 
syn keyword int_vars1   xpos ypos zpos xcenter ycenter xcenter_rel ycenter_rel radius start_angle end_angle arc_direction arc_plane arc_size zstart next_direction label proc_count parm1 parm2 parm3 message start_line end_line job_type job_machine_type mac_number rot_axis_type tool_side drill_type d_drill_type xhome yhome zhome absolute ref_point_init
" int_vars2: Change Tool; Compensation; Delay
syn keyword int_vars2   tool_number tool_diameter tool_length corner_radius tool_direction first_tool last_tool next_tool_number next_tool_machine_type xnext ynext znext spin tool_id_number next_tool_id_number xtool ytool ztool tool_name group_tool_name holder_name group_holder_name tool_description holder_description total_tool_length cutting_tool_length work_material tool_material d_offset h_offset hlength number_of_jobs_used_tool side offset_number tool_offset offset_radius delay_period
" int_vars3: Drill; End Loop; End Proc; Feed Spin; Init Cpos; Line On; Machine Plane; Mirror; Rotary Info
syn keyword int_vars3   drill_lower_z drill_upper_z drill_clearance_z drill_depth down_step num_down_steps feed first_drill loop_level loop_count end_of_job feed_unit spin_unit spin_direction prev_cpos best_cpos before machine_plane mirror_type radial_diameter center_pos rot_axis_coord 
" int_vars4: Home_data
syn keyword int_vars4   clearance_plane home_number work_upper_plane rotate_angle_x rotate_angle_x_dir x_angle_const_z y_angle_const_z dev_angle_z x_angle_const_z_dir y_angle_const_z_dir dev_angle_z_dir x_angle_const_y z_angle_const_y dev_angle_y x_angle_const_y_dir z_angle_const_y_dir dev_angle_y_dir y_angle_const_x z_angle_const_x dev_angle_x y_angle_const_x_dir z_angle_const_x_dir dev_angle_x_dir angle_4x_around_x angle_4x_around_y angle_4x_around_x_dir angle_4x_around_y_dir shift_x shift_y shift_z part_home_number
" int_vars5: Rotate; Start Of File; Start of Job
syn keyword int_vars5   rotate_cancel angle g_file_name full_g_file_name part_name job_name prev_job_mac_type depth safety compensation max_spin msg finish_feed feed_rate spin_rate finish_spin job_clearance_plane job_upper_plane z_feed cutting_diameter wall_offset clear_offset clear_type depth_type profile_app_type floor_offset island_offset pocket_app_type msc_rough msc_semi_finish msc_finish surface_offset semi_finish_surface_offset semi_finish_floor_offset msc_rough_down_step msc_semi_finish_down_step msc_finish_down_step job_lower_plane use_cycle
"syntax case match
syn keyword var_val     cw ccw xy yz zx
" Operators:
syn match assign        .=.
syn match operators     .\(+\|-\|*\|/\|==\|<=\|<\|>=\|>\|\%d60\%d62\).
syn match operators     .\(\sand\s\|\sor\s\|\snot\s\|\seq\s\|\sne\s\|\sle\s\|\slt\s\|\sge\s\|\sgt\s\)\c.ms=s+1,hs=s+1,me=e-1,he=e-1
" --------------
" Other:
syn match boolean       .\(True\|False\)\c.
syn match inumbers      /\d\+\W/me=e-1,he=e-1
syn match inumbers      /\d\+\n/
syn match inumbers      /\W-\d\+\W/me=e-1,he=e-1
syn match inumbers      /\W-\d\+\n/
" --------------
syn match rnumbers      /\d\+\.\W/me=e-1,he=e-1
syn match rnumbers      /\d\+\.\d\+\W/me=e-1,he=e-1
syn match rnumbers      /\d\+\.\n/
syn match rnumbers      /\d\+\.\d\+\n/
syn match rnumbers      /\W-\d\+\.\W/me=e-1,he=e-1
syn match rnumbers      /\W-\d\+\.\d\+\W/me=e-1,he=e-1
syn match rnumbers      /\W-\d\+\.\n/
syn match rnumbers      /\W-\d\+\.\d\+\n/
" --------------
syn region strings	start=.'. end=.'.
syn match comma 	/,/
" --------------
" Comments:
syn region comments	start=.;. end=.$. contains=commentsprite 
syn region comments2	start=.;;. end=.$. contains=commentsprite 
syn region comments3	start=.;;;. end=.$. contains=commentsprite 
" --------------
" Internal GPPL Functions:
syn keyword intfuncs    abs acos asin atan cos exp frac int log log10 sign sin sqrt square tan todeg torad space even odd ang atan2 dist mod pow round round2val dup left right substr instr lower rev strlen tonum trim upper tostr contained
syn region intfunc0     start=.\(abs\|acos\|asin\|atan\|cos\|exp\|frac\|int\)(. end=.)\{1}. contains=inumbers,rnumbers,variables,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc1     start=.\(log\|log10\|sign\|sin\|sqrt\|square\|tan\|todeg\)(. end=.)\{1}. contains=inumbers,rnumbers,variables,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc1     start=.\(torad\|space\|even\|odd\)(. end=.)\{1}. contains=inumbers,rnumbers,variables,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc3     start=.\(ang\|atan2\|dist\|mod\|pow\|round\|round2val\)(. end=.)\{1}. contains=inumbers,rnumbers,comma,variables,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn keyword intfunc4    date time
syn region intfunc5     start=.\(dup\|left\|right\|substr\)(. end=.)\{1}. contains=strings,inumbers,comma,variables,intfunc4,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc6     start=.\(instr\)(. end=.)\{1}. contains=strings,comma,variables,intfunc4,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc7     start=.\(lower\|rev\|strlen\|tonum\|trim\|upper\)(. end=.)\{1}. contains=strings,variables,intfunc4,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc8     start=.tostr(. end=.)\{1}. contains=inumbers,rnumbers,variables,nr_format,comma,intfuncs,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5
syn region intfunc9     start=.trace\s". end=."\{1}.
syn cluster allintfunctions contains=intfunc0,intfunc1,intfunc2,intfunc3,intfunc4,intfunc5,intfunc6,intfunc7,intfunc8,intfunc9
" --------------
" GPPL Statements:
syn keyword vardef      global local contained 
syn keyword vartype     integer numeric logical string contained 
syn match global        .global\s\(integer\|numeric\|logical\|string\)\{1}. contains=vardef,vartype
syn match local         .local\s\(integer\|numeric\|logical\|string\)\{1}. contains=vardef,vartype
syn keyword attributes  change active contained
syn region attribute    start=.\(change\|active\)(. end=.)\{1}. contains=sc_vars,st_vars,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5,variables,attributes,var_val
syn match procedure     .@\a\w\{0,26}.
syn keyword proc_endp   endp
syn keyword proc_call   call

"syn region nr_format    start=.:'. end=.'. contained
"syn region nr_format    start=.:\w. end=.\W.me=e-1,he=e-1 contained
syn match nr_format     .:. contained   
syn region modal        start=.\[. end=.\]. contains=var_val,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5,sc_vars,st_vars,strings,variables,comma,intfunc0,intfunc1,intfunc2,intfunc3,intfunc4,intfunc5,intfunc6,intfunc7,intfunc8,intfunc9
syn region codegen      start=.{. end=.}. contains=var_val,int_vars1,int_vars2,int_vars3,int_vars4,int_vars5,sc_vars,st_vars,strings,comma,variables,expression,modal,nr_format,intfunc0,intfunc1,intfunc2,intfunc3,intfunc4,intfunc5,intfunc6,intfunc7,intfunc8,intfunc9
syn keyword conditional if then else endif while endw

" --------------
" Colors:
hi Normal               guibg=#181818

hi assign   	        guifg=#66ee66
hi operators   	        guifg=#cc5555 gui=bold
hi boolean              guifg=#ee9922
hi variables            guifg=#ffaa77
hi comma		guifg=#ff6622
hi sc_vars              guifg=#aabb00
hi st_vars              guifg=#aaff77
hi int_vars1            guifg=#aaffaa
hi link int_vars2       int_vars1
hi link int_vars3       int_vars1
hi link int_vars4       int_vars1
hi link int_vars5       int_vars1
hi var_val              guifg=#7777ff

hi link intfuncs        attributes
hi link intfunc0        attribute
hi link intfunc1        attribute
hi link intfunc2        attribute
hi link intfunc3        attribute
hi link intfunc4        attribute
hi link intfunc5        attribute
hi link intfunc6        attribute
hi link intfunc7        attribute
hi link intfunc8        attribute
hi link intfunc9        attributes

hi vartype              guifg=#33bbff
hi vardef               guifg=#0088ff
hi procedure            guifg=#cc99ff
hi link proc_endp       procedure
hi link proc_call       vardef
hi attribute            guifg=#1188bb
hi attributes           guifg=#55ccff
hi link conditional     vardef

hi nr_format            guifg=#ff3300
hi expression           guifg=#ee99ff gui=bold
hi modal                guifg=#ff2200 gui=bold
hi codegen              guifg=#eedd00 gui=bold


hi comments		guifg=#505050
hi comments2		guifg=#bbbbbb
hi comments3		guifg=#202020 guibg=#bbbbbb gui=bold

hi strings		guifg=#886655
hi inumbers             guifg=#00dd33 
hi rnumbers             guifg=#55ffdd 

hi err                  guibg=DarkRed guifg=White   
" --------------
let b:current_syntax = "gpp"
" The End:
"syn match variables     .\a[a-zA-Z0-9\_]\{0,26}\s.he=e-1,me=e-1
"syn match variables     .\a[a-zA-Z0-9\_]\{0,26},.he=e-1,me=e-1
"syn match variables     .\a[a-zA-Z0-9\_]\{0,26}).he=e-1,me=e-1
"syn match variables     .\a[a-zA-Z0-9\_]\{0,26}\n.
"syn match variables     .\a\w\{0,26}\s.he=e-1,me=e-1
"syn match variables     .\a\w\{0,26},.he=e-1,me=e-1

"syn match inumbers      /-\d\+[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1
"syn match inumbers      /[ =]-\=\d\+[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1

"syn match attribute     .\(change\|active\)(\a\w\+). contains=variables,attributes

"syn match rnumbers      /-\d\+\.[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1
"syn match rnumbers      /-\d\+\.\d\+[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1
"syn match rnumbers      /[ =]-\=\d\+\.[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1
"syn match rnumbers      /[ =]-\=\d\+\.\d\+[ \n]/ms=s+1,hs=s+1,me=e-1,he=e-1
