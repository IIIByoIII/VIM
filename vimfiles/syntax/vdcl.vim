" Vim syntax file
" Language:    Dialog Control Language
" Maintainer:  ing Kiss Robert
" Last Change: May 03, 2013
" Description: Dialog Control Languag Syntax

"--------------
filetype plugin on 
"colorscheme xoria256
syntax sync fromstart
set guioptions+=b
set nowrap

set foldmethod=marker
set iskeyword=33-39,42-57,60-126
"--------------
syn region errors       start=.\S. end=.\s.he=e-1,me=e-1 end=.\n.
syn region customfun	start=.^\S. end=.\s.he=e-1,me=e-1 end=.).he=e-1,me=e-1 end=.\n.

"--------------
syn case match

" Attributes (ProgeCAD)
" action alignment allow_accept aspect_ratio big_increment children_alignment children_fixed_height children_fixed_width color edit_limit edit_width fixed_height fixed_width fixed_width_font height initial_focus is_bold is_cancel is_default is_enabled is_tab_stop key label layout list lower_only max_value min_value mnemonic multiple_select password_char pointsize read_only small_increment tabs tab_truncate typeface upper_only value width 

" Tiles (ProgeCAD)
" boxed_column boxed_radio_column boxed_radio_row boxed_row button column concatenation edit_box errtile image image_button list_box multi_edit_box name ok_cancel ok_cancel_help ok_cancel_help_errtile ok_cancel_help_info ok_only paragraph popup_list radio_button radio_column radio_row row slider spacer spacer_0 spacer_1 text text_part toggle

" DLG Functions (ProgeCAD)
" dlg_action_tile dlg_add_list dlg_client_data_tile dlg_dimensions_tile dlg_done_dialog dlg_done_positioned_dialog dlg_end_image dlg_end_list dlg_fill_image dlg_get_attr dlg_get_attr_string dlg_get_tile dlg_load_dialog dlg_mode_tile dlg_new_dialog dlg_new_positioned_dialog dlg_set_tile dlg_slide_image dlg_start_dialog dlg_start_image dlg_start_list dlg_term_dialog dlg_unload_dialog dlg_vector_image

" Tiles (AutoCAD)
syn keyword tiles contained     boxed_column boxed_radio_column boxed_radio_row boxed_row button column concatenation dialog edit_box errtile image image_button list_box ok_only ok_cancel ok_cancel_help ok_cancel_help_errtile ok_cancel_help_info paragraph popup_list radio_button radio_column radio_row row slider text text_part toggle spacer spacer_0 spacer_1

" Attributes (AutoCAD)
syn keyword attributes          action alignment allow_accept aspect_ratio big_increment children_alignment children_fixed_height children_fixed_width color edit_limit edit_width fixed_height fixed_width fixed_width_font height initial_focus is_bold is_cancel is_default is_enabled is_tab_stop label layout list max_value min_value mnemonic multiple_select password_char small_increment tabs tab_truncate value width
syn keyword keyattribute        key

" Other keywords (AutoCAD)
syn keyword values              centered left right top bottom true false
"--------------
syn region strings	start=.". skip=.\\". end=.". contained contains=quotes,newline
syn region comments	start=.//. end=.$. contains=commentsprite 
syn region commentsprite start=.-|. end=.$. end=.|-. contained

syn match colon         .:\s\S\+. contains=tiles
syn match colon         .:\S\+. contains=tiles
syn match scolon        .;.
syn match quotes        .\\". contained
syn match newline       .\\n. contained

syn match paren         .[{}].
"syn match paren1        .}. contained
"syn match paren2        .{. contained

syn match operators     /=[^;]\+;/me=e-1,he=e-1 contains=inumbers,rnumbers,strings,values
syn match inumbers      /-\=\d\+[; ]/me=e-1,he=e-1 contained
"syn match inumbers      /(-\=\d\+[; ]/me=e-1,he=e-1 contains=paren2
syn match rnumbers      /-\=\d\+\.\d\+[; ]/me=e-1,he=e-1 contained
"syn match rnumbers      /(-\=\d\+\.\d\+[; ]/me=e-1,he=e-1 contains=paren2

"--------------
" COLORS
hi Normal               guibg=#181818

hi tiles		guifg=#33bbff
hi attributes           guifg=#77aa66
hi keyattribute         guifg=#ff7722
hi operators		guifg=#1177ff gui=bold

hi colon                guifg=#bbff66 gui=bold 
hi scolon               guifg=#ff44aa gui=bold
hi quotes		guifg=#ffccbb
hi link newline quotes
hi strings		guifg=#aa8877
hi paren                guifg=#aa7711
hi link paren1 paren
hi link paren2 paren
hi comments		guifg=#505050
hi rnumbers             guifg=#55ffdd 
hi inumbers             guifg=#00dd33 
hi customfun            guifg=#cc99ff 
hi values               guifg=#ffaa77

hi errors               guifg=#bbbbbb guibg=#aa2222

let b:current_syntax = "vdcl"
