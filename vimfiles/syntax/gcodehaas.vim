" Vim syntax file
" Language: G-code
" Maintainer: eng. Robert Kiss
" Description: HAAS equipment

set iskeyword=@,48-57,_,128-167,224-235,#,.,-
" =====
" ERROR
syn region g_err start=.\S. end=.\s.he=e-1,me=e-1 end=.\a.he=e-1,me=e-1 end=.\n.

" =================
" KEYWORDS, MATCHES & REGIONS
syntax case match
" MachineCodes:
" {{{
syn match g_mcodes          .M\s*\(0\|1\|2\|3\|4\|5\|6\|7\|8\|9\).
syn match b_mcodes          .M\s*\d\d.
syn match g_mcodes          .M\s*\(00\|01\|02\|03\|04\|05\|06\|07\|08\|09\|10\|11\|14\|15\|16\|19\|21\|22\|23\|24\|25\|26\|27\|28\|30\|31\|32\|33\|34\|35\|39\|41\|42\|51\|52\|53\|54\|55\|56\|56\|58\|59\|61\|62\|63\|64\|65\|66\|67\|68\|69\|76\|77\|80\|81\|82\|83\|84\|86\|88\|89\|95\|97\|98\|99\).
syn match g_mcodes          .M\s*\(109\|133\|134\|135\|138\|139\|154\|155\).
syn match b_mcodes          .M\s*3\d\d.
" }}}
" G Code Groups:
" {{{
" Short Versions With One Decimal:
syn match g_group0          .G\s*\(4\|9\).
syn match g_group1          .G\s*\(0\|1\|2\|3\).
" Normal Versions With Two Decimals:
" Group0:
syn match g_group0          .G\s*\(04\|09\|10\|12\|13\|28\|29\|31\|35\|36\|37\|47\|52\|53\|60\|65\|70\|71\|72\|92\|167\).
" Group1:
syn match g_group1          .G\s*\(00\|01\|02\|03\|32\).
" Group2:
syn match g_group2          .G\s*\(17\|18\|19\).
" Group3:
syn match g_group3          .G\s*\(90\|91\).
" Group4:
"syn match g_group4
" Group5:
syn match g_group5          .G\s*\(93\|94\|95\).
" Group6:
syn match g_group6          .G\s*\(20\|21\).
" Group7:
syn match g_group7          .G\s*\(40\|41\|42\|141\).
" Group8:
syn match g_group8          .G\s*\(43\|44\|49\|143\).
" Group9:
syn match g_group9          .G\s*\(73\|74\|76\|77\|80\|81\|82\|83\|84\|85\|86\|87\|88\|89\).
" Group10:
syn match g_group10         .G\s*\(98\|99\).
" Group11:
syn match g_group11         .G\s*\(50\|51\).
" Group12:
syn match g_group12         .G\s*\(52\|54\|55\|56\|57\|58\|59\|110\|111\|112\|113\|114\|115\|116\|117\|118\|119\|120\|121\|122\|123\|124\|125\|126\|127\|128\|129\|154\).
" Group13:
syn match g_group13         .G\s*\(61\|64\|96\|97\).
" Group14:
"syn match g_group14
" Group15:
"syn match g_group15
" Group16:
syn match g_group16         .G\s*\(68\|69\).
" Longer Codes With Three Decimals:
" Group0:
syn match g_group0          .G\s*\(100\|101\|102\|103\|107\|136\|150\|187\|200\).
" }}}
" Other_letters:
" {{{
syn match g_A               "A\s*-\=\s*\.\d\+"
syn match g_A               "A\s*-\=\s*\d\+\.\=\d*"
syn match g_Avar            "A\s*-\=\s*#\S\+"
syn match g_Avar            "A\s*-\=\s*#\=\[.\+\]"
syn match g_Avar            "A\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_B               "B\s*-\=\s*\.\d\+"
syn match g_B               "B\s*-\=\s*\d\+\.\=\d*"
syn match g_Bvar            "B\s*-\=\s*#\S\+"
syn match g_Bvar            "B\s*-\=\s*#\=\[.\+\]"
syn match g_Bvar            "B\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_C               "C\s*-\=\s*\.\d\+"
syn match g_C               "C\s*-\=\s*\d\+\.\=\d*"
syn match g_Cvar            "C\s*-\=\s*#\S\+"
syn match g_Cvar            "C\s*-\=\s*#\=\[.\+\]"
syn match g_Cvar            "C\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_D               "D\s*-\=\s*\.\d\+"
syn match g_D               "D\s*-\=\s*\d\+\.\=\d*"
syn match g_Dvar            "D\s*-\=\s*#\S\+"
syn match g_Dvar            "D\s*-\=\s*#\=\[.\+\]"
syn match g_Dvar            "D\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_E               "E\s*-\=\s*\.\d\+"
syn match g_E               "E\s*-\=\s*\d\+\.\=\d*"
syn match g_Evar            "E\s*-\=\s*#\S\+"
syn match g_Evar            "E\s*-\=\s*#\=\[.\+\]"
syn match g_Evar            "E\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_F               "F\s*\.\d\+"
syn match g_F               "F\s*\d\+\.\=\d*"
syn match g_Fvar            "F\s*#\S\+"
syn match g_Fvar            "F\s*#\=\[.\+\]"
syn match g_Fvar            "F\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

"           G variables
syn match g_Gvar            "G\s*#\S\+"
syn match g_Gvar            "G\s*#\=\[.\+\]"
syn match g_Gvar            "G\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_H               "H\s*\d\+"
syn match g_Hinc            "H\s*-\=\s*\.\d\+"
syn match g_Hinc            "H\s*-\=\s*\d\+\.\d*"
syn match g_Hvar            "H\s*-\=\s*#\S\+"
syn match g_Hvar            "H\s*-\=\s*#\=\[.\+\]"
syn match g_Hvar            "H\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_I               "I\s*-\=\s*\.\d\+"
syn match g_I               "I\s*-\=\s*\d\+\.\=\d*"
syn match g_Ivar            "I\s*-\=\s*#\S\+"
syn match g_Ivar            "I\s*-\=\s*#\=\[.\+\]"
syn match g_Ivar            "I\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_J               "J\s*-\=\s*\.\d\+"
syn match g_J               "J\s*-\=\s*\d\+\.\=\d*"
syn match g_Jvar            "J\s*-\=\s*#\S\+"
syn match g_Jvar            "J\s*-\=\s*#\=\[.\+\]"
syn match g_Jvar            "J\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_K               "K\s*-\=\s*\.\d\+"
syn match g_K               "K\s*-\=\s*\d\+\.\=\d*"
syn match g_Kvar            "K\s*-\=\s*#\S\+"
syn match g_Kvar            "K\s*-\=\s*#\=\[.\+\]"
syn match g_Kvar            "K\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_L               "L\s*\d\+"
syn match g_Lvar            "L\s*#\S\+"
syn match g_Lvar            "L\s*#\=\[.\+\]"
syn match g_Lvar            "L\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

"           M variables
syn match g_Mvar            "M\s*#\S\+"
syn match g_Mvar            "M\s*#\=\[.\+\]"
syn match g_Mvar            "M\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_N               "^N\s*\d\{1,5}" contains=g_Nn
syn match g_Nn              "N" contained

syn match g_O               "^O\s*\d\{1,5}"

syn match g_P               "P\s*\.\d\+"
syn match g_P               "P\s*\d\+\.\=\d*"
syn match g_Pvar            "P\s*-\=\s*#\S\+"
syn match g_Pvar            "P\s*-\=\s*#\=\[.\+\]"
syn match g_Pvar            "P\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_Q               "Q\s*-\=\s*\.\d\+"
syn match g_Q               "Q\s*-\=\s*\d\+\.\=\d*"
syn match g_Qvar            "Q\s*-\=\s*#\S\+"
syn match g_Qvar            "Q\s*-\=\s*#\=\[.\+\]"
syn match g_Qvar            "Q\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_R               "R\s*-\=\s*\.\d\+"
syn match g_R               "R\s*-\=\s*\d\+\.\=\d*"
syn match g_Rvar            "R\s*-\=\s*#\S\+"
syn match g_Rvar            "R\s*-\=\s*#\=\[.\+\]"
syn match g_Rvar            "R\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_S               "S\s*\d\+"
syn match g_Sspc            "S\s*\d\+\.\d*"
syn match g_Svar            "S\s*#\S\+"
syn match g_Svar            "S\s*#\=\[.\+\]"
syn match g_Svar            "S\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_T               "T\s*\d\+"
syn match g_Tvar            "T\s*#\S\+"
syn match g_Tvar            "T\s*#\=\[.\+\]"
syn match g_Tvar            "T\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_U               "U\s*-\=\s*\.\d\+"
syn match g_U               "U\s*-\=\s*\d\+\.\=\d*"
syn match g_Uvar            "U\s*-\=\s*#\S\+"
syn match g_Uvar            "U\s*-\=\s*#\=\[.\+\]"
syn match g_Uvar            "U\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_V               "V\s*-\=\s*\.\d\+"
syn match g_V               "V\s*-\=\s*\d\+\.\=\d*"
syn match g_Vvar            "V\s*-\=\s*#\S\+"
syn match g_Vvar            "V\s*-\=\s*#\=\[.\+\]"
syn match g_Vvar            "V\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_W               "W\s*-\=\s*\.\d\+"
syn match g_W               "W\s*-\=\s*\d\+\.\=\d*"
syn match g_Wvar            "W\s*-\=\s*#\S\+"
syn match g_Wvar            "W\s*-\=\s*#\=\[.\+\]"
syn match g_Wvar            "W\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_X               "X\s*-\=\s*\.\d\+"
syn match g_X               "X\s*-\=\s*\d\+\.\=\d*"
syn match g_Xvar            "X\s*-\=\s*#\S\+"
syn match g_Xvar            "X\s*-\=\s*#\=\[.\+\]"
syn match g_Xvar            "X\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_Y               "Y\s*-\=\s*\.\d\+"
syn match g_Y               "Y\s*-\=\s*\d\+\.\=\d*"
syn match g_Yvar            "Y\s*-\=\s*#\S\+"
syn match g_Yvar            "Y\s*-\=\s*#\=\[.\+\]"
syn match g_Yvar            "Y\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="

syn match g_Z               "Z\s*-\=\s*\.\d\+"
syn match g_Z               "Z\s*-\=\s*\d\+\.\=\d*"
syn match g_Zvar            "Z\s*-\=\s*#\S\+"
syn match g_Zvar            "Z\s*-\=\s*#\=\[.\+\]"
syn match g_Zvar            "Z\s*-\=\s*#\=\[.\{-}\]\(\s*[A-Z(]\)\@="
" }}}
" Others:
" {{{
syn region g_hash           start=.#. end=.(.me=e-1,he=e-1 end=.$. contains=g_functions,g_arith_oper,g_hash_variable,g_hash_brackets,g_hash_equal
syn region g_percent        start=.^%. end=.$.
syn region g_blockskip      start=.^/. end=.$.
syn region g_blockskip      start=.^N\d\+\s*/. end=.$.
syn region g_conditional    start=.DPRNT\s\=\[. end=.\]. contains=g_sqbrackets
syn region g_conditional    start=.IF\s\=\[. end=.\]. contains=g_sqbrackets
syn region g_conditional    start=.WH\(ILE\)\=\s\=\[. end=.\]. contains=g_sqbrackets
syn region g_sqbrackets     start=.\[.ms=s+1,hs=s+1 skip="\[.\{-}\]" end=.\].me=e-1,he=e-1 contained transparent contains=g_sqbrackets2,g_functions,g_bool_oper,g_arith_oper,g_logic_oper
syn region g_sqbrackets2    start=.\[. skip="\[.\{-}\]" end=.\]. contained transparent contains=g_sqbrackets2,g_functions,g_bool_oper,g_arith_oper,g_logic_oper
syn match g_conditional_all .DO\s\=[123]. contains=g_conditional_fun
syn match g_conditional_all .END\s\=[123]. contains=g_conditional_fun
syn match g_conditional_all "GOTO\s*#\=\d\+" contains=g_conditional_fun,g_param
syn match g_conditional_fun .DO. contained
syn match g_conditional_fun .END. contained
syn match g_conditional_fun .GOTO. contained
syn match g_conditional_fun .THEN.
syn match g_conditional_fun .POPEN.
syn match g_conditional_fun .PCLOS.
syn match g_functions       .\(SIN\|COS\|TAN\|ASIN\|ACOS\|ATAN\|SQRT\|ABS\|FIX\|ROUND\)\s*\[.me=e-1,he=e-1 contained
syn match g_bool_oper       .\(EQ\|NE\|GT\|LT\|GE\|LE\). contained
syn match g_arith_oper      .\(+\|-\|\*\|/\|MOD\). contained
syn match g_hash_variable   .#\d\+. contained
syn match g_hash_brackets   .\(\[\|\]\). contained
syn match g_hash_equal      "=" contained
syn match g_logic_oper      .\(OR\|XOR\|AND\). contained
syn match g_param           .#\d\+. contained
syn match g_comment         "(.\{-})"
syn match g_comment         "(.\{-})\s*\($\|;\)"
syn match g_subroutine      .;\s*$.
" }}}
syntax case ignore
" ======
" COLORS:
" {{{
"                       SrceryGreen:
hi g_err                guifg=#eeeeee   guibg=#ff5544 gui=bold
hi g_mcodes             guifg=#519f50   gui=none
hi b_mcodes             guifg=#519f50   gui=underline
hi g_Mvar               guifg=#519f50   guibg=#012f00 gui=none
"                       SrceryOrange:
hi g_group0             guifg=#d75f00   gui=none
"                       SrceryRed:
hi g_group1             guifg=#ff9966   gui=bold
"                       SrceryBrightCyan: (-30 -30 -30)
hi g_group2             guifg=#23cdb9   gui=underline
"                       SrceryBrightCyan: (-30 -30 -30)
hi g_group3             guifg=#23cdb9   gui=bold
"                       Custom:
hi g_group5             guifg=#e35682   gui=none
hi g_group6             guifg=#e35682   gui=none
"                       SrceryRed:
hi g_group7             guifg=#ff9966   gui=underline
"                       SrceryBrightMagenta:
hi g_group8             guifg=#e35682   gui=none
hi g_group9             guifg=#e35682   gui=undercurl
hi g_group10            guifg=#e35682   gui=none
hi g_group11            guifg=#e35682   gui=none
hi g_group12            guifg=#e35682   gui=underline
hi g_group13            guifg=#e35682   guibg=#400520 gui=none
hi g_group16            guifg=#e35682   gui=none
"                       SrceryCyan:
hi g_A                  guifg=#0aaeb3   gui=bold,underline
hi g_Avar               guifg=#0aaeb3   guibg=#003344 gui=bold,underline
hi g_I                  guifg=#0a8e93   gui=bold
hi g_Ivar               guifg=#0a8e93   guibg=#002334 gui=bold
hi g_X                  guifg=#0aaeb3   gui=bold
hi g_Xvar               guifg=#0aaeb3   guibg=#003344 gui=bold
hi g_U                  guifg=#0aaeb3   guibg=#114455 gui=bold
hi g_Uvar               guifg=#0aaeb3   guibg=#114455 gui=bold,undercurl
"                       SrceryBrightGreen:
hi g_B                  guifg=#98bc37   gui=bold,underline
hi g_Bvar               guifg=#98bc37   guibg=#004400 gui=bold,underline
hi g_J                  guifg=#88ac27   gui=bold
hi g_Jvar               guifg=#88ac27   guibg=#003400 gui=bold
hi g_Y                  guifg=#98bc37   gui=bold
hi g_Yvar               guifg=#98bc37   guibg=#004400 gui=bold
hi g_V                  guifg=#98bc37   guibg=#115511 gui=bold
hi g_Vvar               guifg=#98bc37   guibg=#115511 gui=bold,undercurl
"                       SrceryBrightRed:
hi g_C                  guifg=#f75341   gui=bold,underline
hi g_Cvar               guifg=#f75341   guibg=#440000 gui=bold,underline
hi g_K                  guifg=#c75341   gui=bold
hi g_Kvar               guifg=#c75341   guibg=#340000 gui=bold,underline
hi g_Z                  guifg=#f75341   gui=bold
hi g_Zvar               guifg=#f75341   guibg=#440000 gui=bold
hi g_W                  guifg=#f75341   guibg=#551111 gui=bold
hi g_Wvar               guifg=#f75341   guibg=#551111 gui=bold,undercurl
"                       SrceryYellow:
hi g_S                  guifg=#fbb829   gui=bold
hi g_Svar               guifg=#fbb829   guibg=#554411 gui=bold
hi g_Sspc               guifg=#fb8829   guibg=#553311 gui=bold
hi g_F                  guifg=#fbb829   gui=bold
hi g_Fvar               guifg=#fbb829   guibg=#554411 gui=bold
"                       SrceryBrightYellow:
hi g_E                  guifg=#fed06e   gui=bold
hi g_Evar               guifg=#fed06e   guibg=#886622 gui=bold
hi g_R                  guifg=#fed06e   gui=bold
hi g_Rvar               guifg=#fed06e   guibg=#886622 gui=bold
"                       SrceryBrightBlue: (-20 -20 0)
hi g_T                  guifg=#6e92f7   gui=bold
hi g_Tvar               guifg=#6e92f7   guibg=#1e3247 gui=none
"                       SrceryBrightBlue:
hi g_D                  guifg=#8eb2f7   gui=none
hi g_Dvar               guifg=#8eb2f7   guibg=#2e3257 gui=none
hi g_H                  guifg=#8eb2f7   gui=none
hi g_Hinc               guifg=#8eb2f7   guibg=#2e3257 gui=none
hi g_Hvar               guifg=#8eb2f7   guibg=#2e3257 gui=none,underline
"                       SrceryBlue:
hi g_L                  guifg=#5573a3   gui=bold
hi g_Lvar               guifg=#5573a3   guibg=#001353 gui=bold
"                       SrceryWhite:
hi g_Gvar               guifg=#e35682   guibg=#430622 gui=none
hi g_N                  guifg=#fce8c3   gui=bold,italic
hi g_Nn                 guifg=#aaaaaa   gui=none
"                       Custom:
hi g_O                  guifg=#ccddee   gui=bold
hi g_P                  guifg=#889988   gui=none
hi g_Pvar               guifg=#889988   guibg=#384938 gui=none
"                       SrceryBrightGreen: (+20 +20 +20)
hi g_Q                  guifg=#b8dc57   gui=none
hi g_Qvar               guifg=#b8dc57   guibg=#587c07 gui=none
"                       Custom:
"hi g_hash               guifg=#88bb88   gui=bold
hi g_hash               guifg=#ff9999   gui=bold
hi g_hash_equal         guifg=#00aadd   gui=bold
hi g_percent            guifg=#bbbbbb   gui=bold
hi g_comment            guifg=#918175   gui=none
hi g_blockskip          guifg=#505050   gui=none
hi g_subroutine         guifg=#ffbbbb   gui=none
hi g_conditional        guifg=#8888bb   guibg=#222222
hi g_conditional_all    guifg=#fce8c3   gui=bold,italic
hi g_param              guifg=#c8fcc3   gui=none,italic,underline
hi g_conditional_fun    guifg=#00aaee   guibg=#003355 gui=bold,italic
hi g_functions          guifg=#ee6644   guibg=#222222 gui=bold
hi g_bool_oper          guifg=#00aaee   guibg=#222222 gui=bold
hi g_arith_oper         guifg=#dddddd   gui=bold
hi g_hash_variable      guifg=#88bb88   gui=bold
hi g_hash_brackets      guifg=#eecc44   gui=bold
hi g_logic_oper         guifg=#00cc88   guibg=#222222 gui=bold
" }}}
let b:current_syntax = "nc"
