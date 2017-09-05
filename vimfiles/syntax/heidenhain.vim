" Vim syntax file
" Language:   Heidenhain 
" Maintainer:  ing. Robert Kiss
" Last Change: Fri Apr 20 2011
" Version:     1.0.0.0

" Description: Heidenhain

"if version < 600
"    syntax clear
"elseif exists("b:current_syntax")
"    finish
"endif

"--------------
"ERROR
syn region herr	start=.\S. end=/\s/he=e-1,me=e-1 end=.\n.
"syn case ignore

"--------------
filetype plugin on 
"colorscheme pablo
let s:notcall = '\%(\CALL\s\+\)\@<!'
let b:match_words = s:notcall.'\<LBL\s[1-9]\>:\<LBL 0\>'

"--------------
"Line Number
call cursor(1,1) 
silent s/^\(\d\+\)\s\+//ge 9999
"g/^/exec "s/^/".strpart(line(".")."    ", 0, 4)

"--------------
"syn region program start="BEGIN\sPGM" end="END\sPGM" contains=hX, hY, hZ, hRR, hRL, hR0, hL, hC, hCycleQ, hCycle, hS, hFM, hF, hM, hPA, hPR, hDR, hComment, herr, htool, blkf, hclbl, hrep, hStop

"syn region hlbl start="LBL\s[1-99]" end="LBL 0"  contains= hX , hY , hZ , hRR , hRL , hR0 , hL , hC , hCycleQ , hS , hFM , hF , hM , hPA , hPR , hDR , hComment , herr

"syn match  lbl_lbl0  "LBL\s\d\+\n\+.\{-}LBL\s0"  contains=hlbl
"syn match  hlbl     "LBL\s[1-99]"	    contained nextgroup=hlblfill
"syn region hlblfill  start="."  matchgroup=hlbl0  end="LBL 0"  contained

"--------------
"syn region hA	start=.\sA. start=.\sIA. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hB	start=.\sB. start=.\sIB. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hC	start=.\sC. start=.\sIC. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.

"KEYWORDS 
syn keyword hRR	RR
syn keyword hRL	RL
syn keyword hR0	R0
syn keyword hL	L , LP
syn keyword hCR	CR , CC , CP
syn keyword hStop	STOP
syn keyword hsystem	SYNC , PLC , ERROR=
syn keyword happr	APPR , DEP , LN , LT , CT , FL , FLT , FC , FCT , CLSD+ , CLSD-
syn keyword hfunc	SQ , SQRT , SIN , COS , TAN , ASIN , ACOS , ATAN , PI , LN , LOG , EXP , NEG , INT , ABS , FRAC
syn keyword hcond	IF , EQU , NE , GT , LT , GOTO 
syn keyword hFM	FMAX , F MAX , F AUTO

"--------------
"MATCHES & REGIONS
"--------------
syn match hQ	.Q\d\+.
syn match hQ	.QR\d\+.
syn match hQ	.QL\d\+.
syn match hsign	.[*)(+-].
syn match hsign .\%d94. " ^
syn match hsign .\%d61. " =
syn match hsign .\%d47. " /
syn match hnr	.\d\+.
syn match hnr	.\d\+[.,]\d\+.
"syn match hsign	.[/*+-=]\s\d\+.
"syn match hsign .\%d94\s\d\+.
"syn match hsign	.[/*+-=]\d\+.
"syn match hsign .\%d94\d\+.

syn region hComment	start=.;. end=.\%d126.he=e-1 end=.$.
syn region hComment	start=.^*. end=.$.
"syn match hComment	'^\d\+\s\+\%d42.\+'

syn match hX	.\sX.hs=s+1,ms=s+1
syn match hX	.^X\d\+.
syn match hX	.\sX\d\+.hs=s+1,ms=s+1
syn match hX	.^X\d\+[.,]\d\+.
syn match hX	.\sX\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hX	.^X[+-].
syn match hX	.\sX[+-].hs=s+1,ms=s+1
syn match hX	.^X[+-]\d\+.
syn match hX	.\sX[+-]\d\+.hs=s+1,ms=s+1
syn match hX	.^X[+-]\d\+[.,]\d\+.
syn match hX	.\sX[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hX	.\sIX.hs=s+1,ms=s+1
syn match hX	.^IX\d\+.
syn match hX	.\sIX\d\+.hs=s+1,ms=s+1
syn match hX	.^IX\d\+[.,]\d\+.
syn match hX	.\sIX\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hX	.^IX[+-].
syn match hX	.\sIX[+-].hs=s+1,ms=s+1
syn match hX	.^IX[+-]\d\+.
syn match hX	.\sIX[+-]\d\+.hs=s+1,ms=s+1
syn match hX	.^IX[+-]\d\+[.,]\d\+.
syn match hX	.\sIX[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hY	.\sY.hs=s+1,ms=s+1
syn match hY	.^Y\d\+.
syn match hY	.\sY\d\+.hs=s+1,ms=s+1
syn match hY	.^Y\d\+[.,]\d\+.
syn match hY	.\sY\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hY	.^Y[+-].
syn match hY	.\sY[+-].hs=s+1,ms=s+1
syn match hY	.^Y[+-]\d\+.
syn match hY	.\sY[+-]\d\+.hs=s+1,ms=s+1
syn match hY	.^Y[+-]\d\+[.,]\d\+.
syn match hY	.\sY[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hY	.\sIY.hs=s+1,ms=s+1
syn match hY	.^IY\d\+.
syn match hY	.\sIY\d\+.hs=s+1,ms=s+1
syn match hY	.^IY\d\+[.,]\d\+.
syn match hY	.\sIY\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hY	.^IY[+-].
syn match hY	.\sIY[+-].hs=s+1,ms=s+1
syn match hY	.^IY[+-]\d\+.
syn match hY	.\sIY[+-]\d\+.hs=s+1,ms=s+1
syn match hY	.^IY[+-]\d\+[.,]\d\+.
syn match hY	.\sIY[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hZ	.\sZ.hs=s+1,ms=s+1
syn match hZ	.^Z\d\+.
syn match hZ	.\sZ\d\+.hs=s+1,ms=s+1
syn match hZ	.^Z\d\+[.,]\d\+.
syn match hZ	.\sZ\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hZ	.^Z[+-].
syn match hZ	.\sZ[+-].hs=s+1,ms=s+1
syn match hZ	.^Z[+-]\d\+.
syn match hZ	.\sZ[+-]\d\+.hs=s+1,ms=s+1
syn match hZ	.^Z[+-]\d\+[.,]\d\+.
syn match hZ	.\sZ[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hZ	.\sIZ.hs=s+1,ms=s+1
syn match hZ	.^IZ\d\+.
syn match hZ	.\sIZ\d\+.hs=s+1,ms=s+1
syn match hZ	.^IZ\d\+[.,]\d\+.
syn match hZ	.\sIZ\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hZ	.^IZ[+-].
syn match hZ	.\sIZ[+-].hs=s+1,ms=s+1
syn match hZ	.^IZ[+-]\d\+.
syn match hZ	.\sIZ[+-]\d\+.hs=s+1,ms=s+1
syn match hZ	.^IZ[+-]\d\+[.,]\d\+.
syn match hZ	.\sIZ[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hA	.\sA.hs=s+1,ms=s+1
syn match hA	.^A\d\+.
syn match hA	.\sA\d\+.hs=s+1,ms=s+1
syn match hA	.^A\d\+[.,]\d\+.
syn match hA	.\sA\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hA	.^A[+-].
syn match hA	.\sA[+-].hs=s+1,ms=s+1
syn match hA	.^A[+-]\d\+.
syn match hA	.\sA[+-]\d\+.hs=s+1,ms=s+1
syn match hA	.^A[+-]\d\+[.,]\d\+.
syn match hA	.\sA[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hA	.\sIA.hs=s+1,ms=s+1
syn match hA	.^IA\d\+.
syn match hA	.\sIA\d\+.hs=s+1,ms=s+1
syn match hA	.^IA\d\+[.,]\d\+.
syn match hA	.\sIA\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hA	.^IA[+-].
syn match hA	.\sIA[+-].hs=s+1,ms=s+1
syn match hA	.^IA[+-]\d\+.
syn match hA	.\sIA[+-]\d\+.hs=s+1,ms=s+1
syn match hA	.^IA[+-]\d\+[.,]\d\+.
syn match hA	.\sIA[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hB	.\sB.hs=s+1,ms=s+1
syn match hB	.^B\d\+.
syn match hB	.\sB\d\+.hs=s+1,ms=s+1
syn match hB	.^B\d\+[.,]\d\+.
syn match hB	.\sB\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hB	.^B[+-].
syn match hB	.\sB[+-].hs=s+1,ms=s+1
syn match hB	.^B[+-]\d\+.
syn match hB	.\sB[+-]\d\+.hs=s+1,ms=s+1
syn match hB	.^B[+-]\d\+[.,]\d\+.
syn match hB	.\sB[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hB	.\sIB.hs=s+1,ms=s+1
syn match hB	.^IB\d\+.
syn match hB	.\sIB\d\+.hs=s+1,ms=s+1
syn match hB	.^IB\d\+[.,]\d\+.
syn match hB	.\sIB\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hB	.^IB[+-].
syn match hB	.\sIB[+-].hs=s+1,ms=s+1
syn match hB	.^IB[+-]\d\+.
syn match hB	.\sIB[+-]\d\+.hs=s+1,ms=s+1
syn match hB	.^IB[+-]\d\+[.,]\d\+.
syn match hB	.\sIB[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hC	.\sC.hs=s+1,ms=s+1
syn match hC	.\sC\d\+.hs=s+1,ms=s+1
syn match hC	.\sC\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hC	.\sC[+-].hs=s+1,ms=s+1
syn match hC	.\sC[+-]\d\+.hs=s+1,ms=s+1
syn match hC	.\sC[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hC	.\sIC.hs=s+1,ms=s+1
syn match hC	.\sIC\d\+.hs=s+1,ms=s+1
syn match hC	.\sIC\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hC	.\sIC[+-].hs=s+1,ms=s+1
syn match hC	.\sIC[+-]\d\+.hs=s+1,ms=s+1
syn match hC	.\sIC[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hCIR	.^C.
"syn region hCIR	start=.C. end=.\a.he=e-1,me=e-1 end=.\n.he=e-10,me=e-10 end=.\s.he=e-10,me=e-10

syn match hU	.\sU.hs=s+1,ms=s+1
syn match hU	.^U\d\+.
syn match hU	.\sU\d\+.hs=s+1,ms=s+1
syn match hU	.^U\d\+[.,]\d\+.
syn match hU	.\sU\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hU	.^U[+-].
syn match hU	.\sU[+-].hs=s+1,ms=s+1
syn match hU	.^U[+-]\d\+.
syn match hU	.\sU[+-]\d\+.hs=s+1,ms=s+1
syn match hU	.^U[+-]\d\+[.,]\d\+.
syn match hU	.\sU[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hU	.\sIU.hs=s+1,ms=s+1
syn match hU	.^IU\d\+.
syn match hU	.\sIU\d\+.hs=s+1,ms=s+1
syn match hU	.^IU\d\+[.,]\d\+.
syn match hU	.\sIU\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hU	.^IU[+-].
syn match hU	.\sIU[+-].hs=s+1,ms=s+1
syn match hU	.^IU[+-]\d\+.
syn match hU	.\sIU[+-]\d\+.hs=s+1,ms=s+1
syn match hU	.^IU[+-]\d\+[.,]\d\+.
syn match hU	.\sIU[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hV	.\sV.hs=s+1,ms=s+1
syn match hV	.^V\d\+.
syn match hV	.\sV\d\+.hs=s+1,ms=s+1
syn match hV	.^V\d\+[.,]\d\+.
syn match hV	.\sV\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hV	.^V[+-].
syn match hV	.\sV[+-].hs=s+1,ms=s+1
syn match hV	.^V[+-]\d\+.
syn match hV	.\sV[+-]\d\+.hs=s+1,ms=s+1
syn match hV	.^V[+-]\d\+[.,]\d\+.
syn match hV	.\sV[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hV	.\sIV.hs=s+1,ms=s+1
syn match hV	.^IV\d\+.
syn match hV	.\sIV\d\+.hs=s+1,ms=s+1
syn match hV	.^IV\d\+[.,]\d\+.
syn match hV	.\sIV\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hV	.^IV[+-].
syn match hV	.\sIV[+-].hs=s+1,ms=s+1
syn match hV	.^IV[+-]\d\+.
syn match hV	.\sIV[+-]\d\+.hs=s+1,ms=s+1
syn match hV	.^IV[+-]\d\+[.,]\d\+.
syn match hV	.\sIV[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hW	.\sW.hs=s+1,ms=s+1
syn match hW	.^W\d\+.
syn match hW	.\sW\d\+.hs=s+1,ms=s+1
syn match hW	.^W\d\+[.,]\d\+.
syn match hW	.\sW\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hW	.^W[+-].
syn match hW	.\sW[+-].hs=s+1,ms=s+1
syn match hW	.^W[+-]\d\+.
syn match hW	.\sW[+-]\d\+.hs=s+1,ms=s+1
syn match hW	.^W[+-]\d\+[.,]\d\+.
syn match hW	.\sW[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hW	.\sIW.hs=s+1,ms=s+1
syn match hW	.^IW\d\+.
syn match hW	.\sIW\d\+.hs=s+1,ms=s+1
syn match hW	.^IW\d\+[.,]\d\+.
syn match hW	.\sIW\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hW	.^IW[+-].
syn match hW	.\sIW[+-].hs=s+1,ms=s+1
syn match hW	.^IW[+-]\d\+.
syn match hW	.\sIW[+-]\d\+.hs=s+1,ms=s+1
syn match hW	.^IW[+-]\d\+[.,]\d\+.
syn match hW	.\sIW[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hchf	.CHF\s\d\+.
syn match hrnd	.RND\sR.
syn match hrnd	.RND\sR\d\+.
syn match hrnd	.RND\sR\d\+[.,]\d\+.

syn match hfsel	.FSELECT\s\d\+.
syn match ht00l .TOOL\sCALL.
syn match htool .TOOL\sCALL\s\d\+\s[XYZ].he=e-2,me=e-2
syn match htdef .TOOL\sDEF\s\d\+.
syn match hblkf	+BLK\sFORM\s0.[12]+
syn match hclbl	.CALL\sLBL\s\d\+.
syn match hclbl	.CALL\sLBL\s\%d34\S\+\%d34.
syn match hlbl	.LBL\s\d\+.
syn match hlbl	.LBL\s\%d34\S\+\%d34.
syn match hlbl0	.LBL\s0.

syn match herr	.[XYZABCUVW][+-]\s.he=e-1,me=e-1

syn match hR	.\sR\d\+.hs=s+1,ms=s+1
syn match hR	.\sR\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hR	.\sR[+-].hs=s+1,ms=s+1
syn match hR	.\sR[+-]\d\+.hs=s+1,ms=s+1
syn match hR	.\sR[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hS	.S\d\+.

syn match hF	.F\d\+.
syn match hF	.FQ\d\+.
syn match hF	.FQR\d\+.
syn match hF	.FQL\d\+.

syn match hM	.M\d\+.

syn match hfunc .FN\s\d\+:.
syn match hfunc	.FN\d\+:.

syn match hPA	.\sPA.hs=s+1,ms=s+1
syn match hPA	.\sPA\d\+.hs=s+1,ms=s+1
syn match hPA	.\sPA\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sPA[+-]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sPA[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sIPA.hs=s+1,ms=s+1
syn match hPA	.\sIPA\d\+.hs=s+1,ms=s+1
syn match hPA	.\sIPA\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sIPA[+-]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sIPA[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hPR	.\sPR.hs=s+1,ms=s+1
syn match hPR	.\sPR\d\+.hs=s+1,ms=s+1
syn match hPR	.\sPR\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPR	.\sPR[+-]\d\+.hs=s+1,ms=s+1
syn match hPR	.\sPR[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPA	.\sIPR.hs=s+1,ms=s+1
syn match hPR	.\sIPR\d\+.hs=s+1,ms=s+1
syn match hPR	.\sIPR\d\+[.,]\d\+.hs=s+1,ms=s+1
syn match hPR	.\sIPR[+-]\d\+.hs=s+1,ms=s+1
syn match hPR	.\sIPR[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hDR	.\sDR[+-].hs=s+1,ms=s+1
syn match hDR	.\sDR[+-]\d\+.hs=s+1,ms=s+1
syn match hDR	.\sDR[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hDL	.\sDL[+-]\d\+.hs=s+1,ms=s+1
syn match hDL	.\sDL[+-]\d\+[.,]\d\+.hs=s+1,ms=s+1

syn match hCC	.CC[AXYZ]\d\+.
syn match hCC	.CC[AXYZ]\d\+[.,]\d\+.
syn match hCC	.CC[AXYZ][+-]\d\+.
syn match hCC	.CC[AXYZ][+-]\d\+[.,]\d\+.

"syn region hR	start=.R. start=.R[+-]. skip=.[,.]. end=.\d\+\s.he=e-1,me=e-1 end=.\a.he=e-1,me=e-1 end=.\s.he=e-1,me=e-1 end=.\d\+\n.
"syn region hCC	start=.CCA[+-]\d\+. start=.CCA\d\+. start=.CCX[+-]\d\+. start=.CCX\d\+. start=.CCY[+-]\d\+. start=.CCY\d\+. start=.CCZ[+-]\d\+. start=.CCZ\d\+. skip=.[.,]. end=.\a.he=e-1,me=e-1 end=.\s.he=e-1,me=e-1 end=.\n.
syn region hpgm		start=.BEGIN PGM. start=.END PGM. end=.\sMM.
syn region hCycleQ 	start=.\s\s\sQ. end=";"he=e-1,me=e-1 end=.$.
syn region hCycle 	start=.CYCL DEF. end=.\%d126.he=e-1 end=.$. 
" %d126 = ~ "
syn region hTouchP 	start=.TCH PROBE. end=.\%d126.he=e-1 end=.$.
syn region hrep		start=.RE. end=.\a.he=e-1,me=e-1 end="P\d\+" end="P\s\d\+/\d\+"
syn region htab		start=.SYSREAD. start=.TABREAD. start=.TABWRITE. start=.TABOPEN. end=.$. end=";"he=e-1,me=e-1

syn match hsystem	.WAIT\sFOR.
syn match hsystem	.SYSWRITE\sID.
syn match hsystem	.NR\d\+.
syn match hsystem	.IDX\d\+.
syn match hsystem	.I\d\+.

"syn region hS	start=.S\d. end=.\a.he=e-1,me=e-1 end=.\d\+. end=.\s.he=e-1,me=e-1 end=.\n.
"syn region hF	start=.F. skip=.Q. end=.\a.he=e-1,me=e-1 end=.\d\+. end=.\s.he=e-1,me=e-1 end=.\n.
"syn region hFM	start=.FMAX. start=.F MAX. end=.\S.he=e-1,me=e-1  end=.\s.he=e-1,me=e-1 end=.\n.
"syn region hM	start=.M\d. end=.\a.he=e-1,me=e-1 end=.\d\+. end=.\s.he=e-1,me=e-1 end=.\n.

"syn region hPA	start=.PA. start=.IPA. skip=.[,.]. end=.\a.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hPR	start=.PR. skip=.[,.]. end=.\a.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.\n.
"syn region hDR	start=.DR[+-]. skip=.[,.]. end=.\d\+\s.he=e-1,me=e-1 end=.\a.he=e-1,me=e-1 end=.\s.he=e-1,me=e-1 end=.\d\+\n. end=.\n.
"syn region hDL	start=.DL[+-]. skip=.[,.]. end=.\d\+\s.he=e-1,me=e-1 end=.\a.he=e-1,me=e-1 end=.\s.he=e-1,me=e-1 end=.\d\+\n. end=.\n.

"syn region hX	start=.\sX. start=.\sIX. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hY	start=.\sY. start=.\sIY. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hZ	start=.\sZ. start=.\sIZ. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.


"syn region hU	start=.\sU. start=.\sIU. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hV	start=.\sV. start=.\sIV. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.
"syn region hW	start=.\sW. start=.\sIW. skip=.[,.]. end=.\a.he=e-2,me=e-2 end=.Q.he=e-1,me=e-1 end=.\d\+\s.he=e-1,me=e-1 end=.[+-]\d\+\s.he=e-1,me=e-1 end=.[+-]\s.he=e-2,me=e-2 end=.\n.

"--------------
"COLORS
hi hComment	ctermfg=grey 	guifg=#995500 	cterm=none
hi hQ		ctermfg=Yellow 	guifg=#0088ff 	cterm=none
hi hsign	ctermfg=Yellow 	guifg=#ffccbb 	cterm=none
hi hnr		ctermfg=Yellow 	guifg=#996655 	cterm=none
hi hfunc	ctermfg=Yellow 	guifg=#cc8899 	cterm=none
hi hcond	ctermfg=Yellow 	guifg=#22ccff 	cterm=none

hi htab		ctermfg=Yellow 	guifg=#aa8822 	cterm=none
hi hsystem	ctermfg=Yellow 	guifg=#ccaa22 	cterm=none
hi hCycleQ 	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi hCycle 	ctermfg=Yellow	guifg=#dd88ff 	cterm=none
hi hTouchP	ctermfg=Yellow	guifg=#44aa44 	cterm=none
hi hblkf 	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi hpgm 	ctermfg=Yellow 	guifg=#9966ff 	cterm=none
hi ht00l	ctermfg=magenta guifg=#ff1155 	guibg=#bbbb22	cterm=none
hi htool 	ctermfg=magenta guifg=#ff55dd 	cterm=none
hi htdef	ctermfg=magenta guifg=#ff55dd 	cterm=none
hi hrep		ctermfg=magenta guifg=#ff5533 	cterm=none
hi hclbl	ctermfg=magenta guifg=#ff5533 	cterm=none
hi hlbl		ctermfg=magenta guifg=#bbbbbb	guibg=#444444	cterm=none
hi hlbl0	ctermfg=magenta guifg=#444444	guibg=#bbbbbb	cterm=none
hi hL		ctermfg=magenta guifg=#888888 	cterm=none
hi hchf 	ctermfg=magenta guifg=#555599 	cterm=none
hi hrnd		ctermfg=magenta guifg=#555599 	cterm=none
hi happr	ctermfg=magenta guifg=#558855 	cterm=none
hi hfsel	ctermfg=magenta guifg=#558855 	cterm=none

hi hCR		ctermfg=magenta guifg=#cccccc 	cterm=none
hi hCIR		ctermfg=magenta guifg=#cccccc 	cterm=none
hi hS		ctermfg=magenta guifg=#ff5500 	cterm=none
hi hF		ctermfg=blue	guifg=#0066cc 	cterm=none
hi hFM		ctermfg=blue	guifg=#0066cc 	cterm=none
hi hX   	ctermfg=cyan 	guifg=#88ccff 	cterm=none
hi hY   	ctermfg=green 	guifg=#88ff33 	cterm=none
hi hZ  		ctermfg=red 	guifg=#ffaa00 	cterm=none

hi hA   	ctermfg=cyan 	guifg=#88cc88 	cterm=none
hi hB   	ctermfg=green 	guifg=#88aa00 	cterm=none
hi hC  		ctermfg=red 	guifg=#aa8833 	cterm=none
hi hU   	ctermfg=cyan 	guifg=#559955 	cterm=none
hi hV   	ctermfg=green 	guifg=#557700	cterm=none
hi hW  		ctermfg=red 	guifg=#aa8833 	cterm=none

hi hRR 		ctermfg=brown 	guifg=#bbbbbb 	cterm=none
hi hRL		ctermfg=brown 	guifg=#777777 	cterm=none
hi hR0		ctermfg=brown 	guifg=#ffaaff 	cterm=none
hi hR		ctermfg=brown 	guifg=#ffaaff 	cterm=none
hi hM		ctermfg=brown 	guifg=#337700 	cterm=none
hi hStop	ctermfg=brown 	guifg=#337700 	cterm=none
hi hPA		ctermfg=brown 	guifg=#eedd55 	cterm=none
hi hPR		ctermfg=brown 	guifg=#22dd66 	cterm=none
hi hDR		ctermfg=brown 	guifg=#ff5533 	cterm=none
hi hDL		ctermfg=brown 	guifg=#ff5533 	cterm=none
hi hCC		ctermfg=brown 	guifg=#335533 	cterm=none
"hi hRN  	ctermfg=blue 	guifg=#99ccff 	cterm=none
hi herr term=standout ctermbg=Red ctermfg=White guibg=Red guifg=White
"hi num term=standout ctermbg=Red ctermfg=White guibg=Red guifg=White
"hi program	ctermfg=brown 	guifg=#22dd66 	cterm=none

let b:current_syntax = "h"
" vim:sw=4
