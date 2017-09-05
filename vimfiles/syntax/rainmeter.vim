" Vim syntax file
" Language:    Rainmeter
" Maintainer:  Robert Kiss
" Last Change: MAR 03 2015

" Description: Advanced syntax for Rainmeter scripting

filetype plugin on 
colorscheme xoria256
set iskeyword=33,37,38,42-58,60,62,63-90,94,95,97-122,124,126
syn case ignore
syn sync fromstart
syn sync maxlines=150

"--------------
" Error:
syn region err          start=/\S/ end=/\s/he=e-1,me=e-1 end=/\n/
"--------------
" Keywords:
" {{{
syn keyword functions       !02i! !i! $UserInput$ 802.11a 802.11b 802.11g 802.11n ??? Abs Acos AES All and Asin Atan Backtrack Busy Ceil ChangeVolume Clamp ClosePlayer ContextMenu Cos Counter Cross d Debug DSSS E EmptyBin EmptyBinSilent EncodeURL EscapeRegExp ExecuteBatch Exp FastForward FHSSS Fill Fit Floor FollowPath Frac Hand Help Idle IndexDown IndexUp IR-Band Ln Log Max Metadata Min Next NextTrack NONE Notice Open OpenBin OpenPlayer PageDown PageUp Pause Pen PI Play PlayLoop PlayPause PlayStop Plugins Power prev Previous PreviousFolder PreviousTrack PrevTrack Properties Quit Rad Rainmeter Random Resume Rewind Round SendMessage SetOutputIndex SetPosition SetRating SetRepeat SetShuffle SetVolume Sgn Shared Sin Skins SoundVolumeDown SoundVolumeUp Sqrt Stop Stretch Tan Text Tile TKIP ToggleiTunes ToggleMute ToggleNext TogglePlayer TogglePrevious TrayMeasure Trunc Update V Variables VolumeDown VolumeMute VolumeUp WEP WEP104 WEP40 WPA-Enterprise WPA-NONE WPA-Personal WPA2-Enterprise WPA2-Personal WPA_GROUP
syn match   functions       .\sVersion.
" {{{ General
syn keyword general_a       AccurateText Active AddDaysToHours AlphaValue AlwaysOnTop AnchorX AnchorY Angle AntiAlias AutoScale AutoSelectScreen AverageSize 
syn keyword general_b       Background BackgroundMargins BackgroundMode BandIdx Bands BarBorder BarColor BarImage BarOrientation BevelType BitmapAlign BitmapDigits BitmapExtend BitmapFrames BitmapImage BitmapSeparation BitmapTransitionFrames BitmapZeroFrame Blur BothColor BothImage BothImageCrop BothImageFlip BothImageImageAlpha BothImagePath BothImageRotate BothImageTint ButtonCommand ButtonImage 
syn keyword general_c       Channel ClickThrough ClipString ClipStringH ClipStringW CodePage ConfigEditor ContextAction ContextAction10 ContextAction11 ContextAction12 ContextAction13 ContextAction14 ContextAction15 ContextAction2 ContextAction3 ContextAction4 ContextAction5 ContextAction6 ContextAction7 ContextAction8 ContextAction9 ContextTitle ContextTitle10 ContextTitle11 ContextTitle12 ContextTitle13 ContextTitle14 ContextTitle15 ContextTitle2 ContextTitle3 ContextTitle4 ContextTitle5 ContextTitle6 ContextTitle7 ContextTitle8 ContextTitle9 ControlAngle ControlLength ControlStart CoreTempIndex CoreTempType Count CPUExclude CPUInclude Cumulative 
syn keyword general_d       DateType DaylightSavingTime Debug Debug2FileDownload DecodeCharacterReference DefaultArtwork DefaultUpdateDivider DefaultValue DesktopWorkArea DesktopWorkAreaType DestAddress Disabled DisableDragging DisableLeadingZero DisableVersionCheck DiskQuota DownloadFile Draggable DragMargins Drive DynamicVariables DynamicWindowSize 
syn keyword general_e       ErrorString Extensions 
syn keyword general_f       FadeDuration FFTAttack FFTDecay FFTIdx FFTOverlap FFTSize FileFilter FinishAction Flip FocusDismiss Folder FontColor FontEffectColor FontFace FontSize ForceReload Format Formula FreqMax FreqMin 
syn keyword general_g       GradientAngle GraphOrientation GraphStart Greyscale Group 
syn keyword general_h       H Hidden HideExtensions HideOnMouseOver HighBound HorizontalLineColor HorizontalLines 
syn keyword general_i       IconPath IconSize ID IfAboveAction IfAboveValue IfBelowAction IfBelowValue IfConditionMode IfEqualAction IfEqualValue IfMatchMode IgnoreCount IgnoreRemovable ImageAlpha ImageCrop ImageFlip ImageName ImagePath ImageRotate ImageTint IncludeHiddenFiles IncludeSubFolders IncludeSystemFiles Index InfoType Interface InvertMeasure 
syn keyword general_k       KeepOnScreen 
syn keyword general_l       Label LeftMouseDoubleClickAction LeftMouseDownAction LeftMouseUpAction LengthShift LineCount LineLength LineStart LineWidth LoadOrder Logging LowBound 
syn keyword general_m       MaskImageFlip MaskImageName MaskImagePath MaskImageRotate MaxValue Measure MeasureName Meter MeterStyle MiddleMouseDoubleClickAction MiddleMouseDownAction MiddleMouseUpAction MinValue MouseActionCursorName MouseLeaveAction MouseOverAction MouseScrollDownAction MouseScrollLeftAction MouseScrollRightAction MouseScrollUpAction 
syn keyword general_n       NumOfDecimals 
syn keyword general_o       OffsetX OffsetY OnChangeAction OnCloseAction OnDismissAction OnFocusAction OnRefreshAction OnUnfocusAction OnUpdateAction OnWakeAction 
syn keyword general_p       Padding Parent Password Path PathName Paused PeakAttack PeakDecay PeakGain Percentual PerfMonCounter PerfMonDifference PerfMonInstance PerfMonObject PlayerName PlayerPath PlayerType Plugin Port Postfix PowerState Prefix PreserveAspectRatio PrimaryColor PrimaryImage PrimaryImageAlpha PrimaryImageCrop PrimaryImageFlip PrimaryImagePath PrimaryImageRotate PrimaryImageTint ProcessName Processor ProxyServer 
syn keyword general_r       Recursive RecycleType RegExp RegExpFilter RegExpSubstitute RegHKey RegKey RegValue ResCountType RightMouseDoubleClickAction RightMouseDownAction RightMouseUpAction RMSAttack RMSDecay RMSGain RotationAngle 
syn keyword general_s       SavePosition ScaleMargins ScriptFile SecondaryColor SecondaryImage SecondaryImageAlpha SecondaryImageCrop SecondaryImageFlip SecondaryImagePath SecondaryImageRotate SecondaryImageTint Sensitivity Separator ShowDotDot ShowFile ShowFolder ShowHidden ShowSystem SkinPath SnapEdges Solid SolidColor SolidColor2 SortAscending SortDateType SortType SpeedFanNumber SpeedFanScale SpeedFanType StartAngle StartHidden StartShift StringAlign StringCase StringEffect StringIndex StringIndex2 StringStyle Subfolders Substitute SysInfoData SysInfoType 
syn keyword general_t       Text Tile Timeout TimeoutValue TimeStamp TimeZone ToolTipHidden ToolTipIcon ToolTipText ToolTipTitle ToolTipType ToolTipWidth TopMost TopProcess Total TrackChangeAction TransformationMatrix TransitionUpdate TrayBitmap TrayColor1 TrayColor2 TrayExecuteDM TrayExecuteDR TrayExecuteM TrayExecuteR TrayIcon TrayMeter Type 
syn keyword general_u       UniqueRandom Update UpdateDivider UpdateRandom UpdateRate URL UseD2D UseExifOrientation 
syn keyword general_v       ValueRemainder VDDesktop VDDesktopCount VDHeight VDManager VDMeasureType VDOnActivate VDOnChange VDOnDeactivate VDOutputFile VDRefreshOnUpdate VDWidth 
syn keyword general_w       W WiFiInfoType WiFiIntfID WiFiListLimit WiFiListStyle WildcardSearch WindowClass WindowMessage WindowName WindowX WindowY 
syn keyword general_x       X X1MouseDoubleClickAction X1MouseDownAction X1MouseUpAction X2MouseDoubleClickAction X2MouseDownAction X2MouseUpAction 
syn keyword general_y       Y
" }}}
" -------------------
" {{{ Types
syn keyword types_a         Accessed ACLine ADAPTER_DESCRIPTION AdvancedCPU AIMP Album Artist AudioLevel AUTH Avg 
syn keyword types_b         Band BandFreq Bar Bitmap BL Bold BoldItalic Border Both BR BusMultiplier BusSpeed Button 
syn keyword types_c         C CAD Calc Center CenterBottom CenterCenter CenterTop COMPUTER_NAME CoreTemp Cover CPU CpuName CpuSpeed Created CurrentDesktop 
syn keyword types_d         Date DesktopCount DesktopName DesktopWallpaper DeviceID DeviceList DeviceName DeviceStatus Dexpot DNS_SERVER DOMAIN_NAME Duration 
syn keyword types_e         Encryption Error ExtraLarge 
syn keyword types_f         F Fan FFT FFTFreq File FileCount FileDate FileName FilePath FileSize FileType FileView FL FolderCount FolderInfo FolderPath FolderSize FR FreeDiskSpace 
syn keyword types_g         GATEWAY_ADDRESS GDI GetCurrentTrackAlbum GetCurrentTrackArtist GetCurrentTrackArtwork GetCurrentTrackBitrate GetCurrentTrackBPM GetCurrentTrackComment GetCurrentTrackComposer GetCurrentTrackEQ GetCurrentTrackGenre GetCurrentTrackKindAsString GetCurrentTrackName GetCurrentTrackRating GetCurrentTrackSampleRate GetCurrentTrackSize GetCurrentTrackTime GetCurrentTrackTrackCount GetCurrentTrackTrackNumber GetCurrentTrackYear GetPlayerPosition GetPlayerPositionPercent GetSoundVolume 
syn keyword types_h         Handle Histogram HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG HKEY_CURRENT_USER HKEY_DYN_DATA HKEY_LOCAL_MACHINE HKEY_PERFORMANCE_DATA Horizontal HOST_NAME Hz 
syn keyword types_i         Icon IDLE_TIME Image Info Input InputText INTERNET_CONNECTIVITY IP_ADDRESS Italic iTunes iTunesPlugin 
syn keyword types_k         K 
syn keyword types_l         L LAN_CONNECTIVITY Large Left LeftBottom LeftCenter LeftTop LFE Lifetime Line List Load Lower 
syn keyword types_m         MaxTemperature MediaKey MediaMonkey Medium Memory MHz Modified 
syn keyword types_n         NetIn NetOut NetTotal NET_MASK None Normal NowPlaying Number NUM_MONITORS 
syn keyword types_o         OS_BITS OS_VERSION Output 
syn keyword types_p         Peak Percent PerfMon PHY PhysicalMemory PingPlugin Position PowerPlugin Process Progress Proper 
syn keyword types_q         Quality Question QuotePlugin 
syn keyword types_r         R Rating RecycleManager Registry Repeat ResMon Right RightBottom RightCenter RightTop RMS Rotator Roundline 
syn keyword types_s         Screenshot SCREEN_HEIGHT SCREEN_SIZE SCREEN_WIDTH Script Shadow Shield Shuffle Size SL Small SpeedFanPlugin Spotify SR SSID State Status Status2 String Sub Sum SwapMemory SwitchDesktop SysInfo 
syn keyword types_t         Temperature Time Title TjMax 
syn keyword types_u         Upper Uptime USER USER_NAME 
syn keyword types_v         VDMActive Vertical Vid VirtualDesktops VIRTUAL_SCREEN_HEIGHT VIRTUAL_SCREEN_LEFT VIRTUAL_SCREEN_TOP VIRTUAL_SCREEN_WIDTH VirtuaWin Voltage Volume 
syn keyword types_w         Warning WebParser WiFiStatus Win7AudioPlugin Winamp Window WindowMessagePlugin WLM WMP WORK_AREA WORK_AREA_HEIGHT WORK_AREA_LEFT WORK_AREA_TOP WORK_AREA_WIDTH 
syn keyword types_y         Year
" }}}
" -----------------
syn keyword effects         BlurRegion BothImageColorMatrix ColorMatrix Command IfCondition IfFalseAction IfMatch IfMatchAction IfNotMatchAction IfTrueAction Include LineColor PrimaryColorMatrix Scale SecondaryColorMatrix
syn keyword bangs           !About !ActivateConfig !AddBlur !ClickThrough !CommandMeasure !DeactivateConfig !DeactivateConfigGroup !DisableMeasure !DisableMeasureGroup !Draggable !DraggableGroup !EnableMeasure !EnableMeasureGroup !Hide !HideBlur !HideFade !HideFadeGroup !HideGroup !HideMeter !HideMeterGroup !KeepOnScreen !KeepOnScreenGroup !LoadLayout !Log !Manage !Move !MoveMeter !PauseMeasure !PauseMeasureGroup !Quit !Redraw !RedrawGroup !Refresh !RefreshApp !RefreshGroup !RemoveBlur !ResetStats !SetClip !SetOption !SetOptionGroup !SetTransparency !SetTransparencyGroup !SetVariable !SetVariableGroup !SetWallpaper !Show !ShowBlur !ShowFade !ShowFadeGroup !ShowGroup !ShowMeter !ShowMeterGroup !SkinCustomMenu !SkinMenu !SnapEdges !SnapEdgesGroup !Toggle !ToggleBlur !ToggleConfig !ToggleFade !ToggleFadeGroup !ToggleGroup !ToggleMeasure !ToggleMeasureGroup !ToggleMeter !ToggleMeterGroup !TogglePauseMeasure !TogglePauseMeasureGroup !TrayMenu !UnpauseMeasure !UnpauseMeasureGroup !Update !UpdateMeasure !UpdateMeasureGroup !UpdateMeter !UpdateMeterGroup !Updategroup !WriteKeyValue !ZPos !ZPosGroup
"optional in Rainmeter v3.2
syn keyword bangs           !Execute 
syn match   bangs           .!Rainmeter\w\+.
" -------------------------
syn keyword built_in_vars1  $MouseX$ $MouseX:%$ $MouseY$ $MouseY:%$
syn keyword built_in_vars2  @ ADDONSPATH CRLF CURRENTCONFIG CURRENTCONFIGHEIGHT CURRENTCONFIGWIDTH CURRENTCONFIGX CURRENTCONFIGY CURRENTFILE CURRENTPATH CURRENTSECTION PLUGINSPATH PROGRAMDRIVE PROGRAMPATH PSCREENAREAHEIGHT PSCREENAREAWIDTH PSCREENAREAX PSCREENAREAY PWORKAREAHEIGHT PWORKAREAWIDTH PWORKAREAX PWORKAREAY ROOTCONFIG ROOTCONFIGPATH SCREENAREAHEIGHT SCREENAREAWIDTH SCREENAREAX SCREENAREAY SETTINGSPATH SKINSPATH VSCREENAREAHEIGHT VSCREENAREAWIDTH VSCREENAREAX VSCREENAREAY WORKAREAHEIGHT WORKAREAWIDTH WORKAREAX WORKAREAY contained
" }}}
"--------------
" Other: 
" {{{
syn match   variable        /\w\+/
syn match   equals          /=/
syn keyword operators       * / ** + - % & \| ^ ~ < <= <> = > >= contained
syn region  built_vars      start=.#. end=.#. contains=built_in_vars2
syn region  environ_vars    start=.%. end=.%. end=.\n.
syn match   paren0          .\[.
syn match   paren0          .\].
syn region  paren1          start=.^\[. end=.\].
syn region  paren2          start=.(. end=.). contains=operators,inumber,rnumber
syn region  comments        start=.;. end=.\n.
syn region  strings         start=.". end=.".
syn region  path            start=.\\. end=.\\\s.me=e-1,he=e-1 end=.\.\w\+\s.me=e-1,he=e-1 end=.\n.
syn region  links           start=.http:. end=.\s.me=e-1,he=e-1 end=.\n.
syn match   inumber         /\d\+/
syn match   inumber         /-\d\+/
syn match   rnumber         /\d\+\./
syn match   rnumber         /-\d\+\./
syn match   rnumber         /\d\+\.\d\+/
syn match   rnumber         /-\d\+\.\d\+/
syn match   percentage      /\d%/
syn match   percentage      /\d\d%/
syn match   percentage      /100%/
syn match   color_nr        /\x\x\x\x\x\x/
syn match   color_nr        /\x\x\x\x\x\x\x\x/
syn match   color_nr        /\d\+,\d\+,\d\+/
syn match   color_nr        /\d\+,\d\+,\d\+,\d\+/
syn match   refinement      /-\a\+/

syn match   general_m       .MeasureName\d\+.
syn match   general_m       .%\d\+.
syn match   effects         .Command\d\+.
syn match   effects         .ColorMatrix\d.
syn match   effects         .PrimaryColorMatrix\d.
syn match   effects         .SecondaryColorMatrix\d.
syn match   effects         .BothImageColorMatrix\d.
syn match   effects         .LineColor\d\+.
syn match   effects         .Scale\d\+.
syn match   effects         .IfCondition\d\+.
syn match   effects         .IfTrueAction\d\+.
syn match   effects         .IfFalseAction\d\+.
syn match   effects         .IfMatch\d\+.
syn match   effects         .IfMatchAction\d\+.
syn match   effects         .IfNotMatchAction\d\+.

syn region  metadata        start=.Name=. end=.\n. contains=equals
syn region  metadata        start=.Config=. end=.\n. contains=equals
syn region  metadata        start=.Author=. end=.\n. contains=equals
syn region  metadata        start=.Version=. end=.\n. contains=equals
syn region  metadata        start=.License=. end=.\n. contains=equals
syn region  metadata        start=.Information=. end=.\n. contains=equals
" }}}
"--------------
" Colors:
" {{{
hi link err                 Error

hi variable                 guifg=#66cc55
hi equals                   guifg=#cc8844
hi operators                guifg=#cccccc gui=bold gui=underline
hi built_vars               guifg=#99cc99
hi environ_vars             guifg=#4455ee
hi paren0                   guifg=#ffaa00 gui=bold
hi paren1                   guifg=#111111 guibg=#eeeeaa gui=bold
hi paren2                   guifg=#9999ff gui=bold
hi comments                 guifg=#666666
hi strings                  guifg=#ddbb88
hi path                     guifg=#dd5555
hi links                    guifg=#99bbdd
hi inumber                  guifg=#00aa99
hi rnumber                  guifg=#88ccff
hi percentage               guifg=#ee4433
hi color_nr                 guifg=#ffdd00 guisp=#999999 gui=undercurl
hi refinement               guifg=#4466ff
hi metadata                 guifg=#55ffcc

hi general_a                guifg=#3399dd gui=bold
hi types_a                  guifg=#ddcc22 gui=bold
hi functions                guifg=#ff3333 gui=bold
hi effects                  guifg=#ff8888 gui=bold
hi bangs                    guifg=#ff8844 gui=bold
hi built_in_vars1           guifg=#ff8800 gui=bold
hi built_in_vars2           guifg=#ff8800 gui=bold
" ----------
" {{{ Links
hi link general_b general_a
hi link general_c general_a
hi link general_d general_a
hi link general_e general_a
hi link general_f general_a
hi link general_g general_a
hi link general_h general_a
hi link general_i general_a
hi link general_k general_a
hi link general_l general_a
hi link general_m general_a
hi link general_n general_a
hi link general_o general_a
hi link general_p general_a
hi link general_r general_a
hi link general_s general_a
hi link general_t general_a
hi link general_u general_a
hi link general_v general_a
hi link general_w general_a
hi link general_x general_a
hi link general_y general_a
hi link types_b types_a
hi link types_c types_a
hi link types_d types_a
hi link types_e types_a
hi link types_f types_a
hi link types_g types_a
hi link types_h types_a
hi link types_i types_a
hi link types_k types_a
hi link types_l types_a
hi link types_m types_a
hi link types_n types_a
hi link types_o types_a
hi link types_p types_a
hi link types_q types_a
hi link types_r types_a
hi link types_s types_a
hi link types_t types_a
hi link types_u types_a
hi link types_v types_a
hi link types_w types_a
hi link types_y types_a
" }}}
" }}}
"--------------
let b:current_syntax = "rainmeter"
