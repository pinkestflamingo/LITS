local Instructions = [=[
> [Instructions->000, 112, 0048424127] GETGLOBAL: {  0 ,   1 ,   0 } / R[0] = Environment["pairs"]
> [Instructions->001, 032, 0017365807]  NEWTABLE: {  1 ,   0 ,   0 } / R[1] = {}
> [Instructions->002, 170, 0002015416]   CLOSURE: {  2 ,   0 ,   0 } / R[2] = Prototypes[0] (24660330), 0 upvalue(s)
> [Instructions->003, 149, 0018107220]  NEWTABLE: {  3 ,   0 ,  34 } / R[3] = {}
> [Instructions->004, 149, 0003432070]  NEWTABLE: {  4 ,   0 ,   0 } / R[4] = {}
> [Instructions->005, 149, 0058539281]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->006, 149, 0027198213]       ADD: {  4 ,   4 ,   3 } / R[4] = R[4] + R[4]
> [Instructions->007, 149, 0059076209]  SETTABLE: {  3 ,   2 ,   4 } / R[3][59237815] = R[4]
> [Instructions->008, 149, 0051388261]  NEWTABLE: {  4 ,   0 ,   0 } / R[4] = {}
> [Instructions->009, 170, 0022206450]      MOVE: {  5 ,   1 ,   0 } / R[5] = R[1]
> [Instructions->010, 140, 0022920232]      CALL: {  5 ,   1 ,   0 } / R[5] to STACK_TOP = R[5]()
> [Instructions->011, 080, 0009277974]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->012, 092, 0023331276]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->013, 205, 0031970651]       ADD: {  4 ,   4 ,   5 } / R[4] = R[4] + R[4]
> [Instructions->014, 205, 0042809555]  SETTABLE: {  3 ,   4 ,   4 } / R[3][313842756] = R[4]
> [Instructions->015, 205, 0044431939]  SETTABLE: {  3 ,   6 ,   7 } / R[3][617074971] = 16777216
> [Instructions->016, 205, 0056215996]  SETTABLE: {  3 ,   8 ,   9 } / R[3]["NxCLpMr"] = "w"
> [Instructions->017, 205, 0036075853]     LOADK: {  4 ,  11 ,   0 } / R[4] = "I'm not ignoring you, my DMs are full. Can't DM me? Shoot me a email: mem@mem.rip (Business enquiries only)"
> [Instructions->018, 205, 0065551622]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->019, 205, 0023718648]       SUB: {  4 ,  12 ,   4 } / R[4] = R[4] - 963520323
> [Instructions->020, 205, 0041761587]  SETTABLE: {  3 ,  10 ,   4 } / R[3][491698282] = R[4]
> [Instructions->021, 205, 0010160070]  NEWTABLE: {  4 ,   2 ,   0 } / R[4] = {}
> [Instructions->022, 205, 0034311361]     LOADK: {  5 ,  14 ,   0 } / R[5] = 415
> [Instructions->023, 179, 0043427893]      MOVE: {  6 ,  15 ,   0 } / R[6] = R[15]
> [Instructions->024, 166, 0045881906]   SETLIST: {  4 ,   6 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 6)
> [Instructions->025, 092, 0041141447]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->026, 042, 0007728132]       ADD: {  4 ,   4 ,  16 } / R[4] = R[4] + R[4]
> [Instructions->027, 042, 0051082746]  SETTABLE: {  3 ,  13 ,   4 } / R[3][832047402] = R[4]
> [Instructions->028, 042, 0057027257]     LOADK: {  4 ,  17 ,   0 } / R[4] = "who the fuck looked at synapse xen and said 'yeah this is good enough for release'"
> [Instructions->029, 042, 0008451152]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->030, 042, 0042475215]       SUB: {  4 ,  18 ,   4 } / R[4] = R[4] - 111369523
> [Instructions->031, 042, 0063543367]  SETTABLE: {  3 ,   4 ,  19 } / R[3][R[4]] = "h"
> [Instructions->032, 042, 0002961608]  NEWTABLE: {  4 ,   2 ,   0 } / R[4] = {}
> [Instructions->033, 042, 0003463777]     LOADK: {  5 ,  20 ,   0 } / R[5] = 71
> [Instructions->034, 042, 0008710434]     LOADK: {  6 ,  21 ,   0 } / R[6] = 551
> [Instructions->035, 042, 0049566492]   SETLIST: {  4 ,   6 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 6)
> [Instructions->036, 092, 0035975263]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->037, 244, 0010730234]       ADD: {  4 ,   4 ,  22 } / R[4] = R[4] + R[4]
> [Instructions->038, 244, 0009506557]  SETTABLE: {  3 ,   4 ,  23 } / R[3][R[4]] = "y"
> [Instructions->039, 244, 0013691513]     LOADK: {  4 ,  24 ,   0 } / R[4] = "LuraphDeobfuscator.zip (oh god DMCA incoming everyone hide)"
> [Instructions->040, 244, 0012791166]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->041, 244, 0058972699]       SUB: {  4 ,  25 ,   4 } / R[4] = R[4] - 125321153
> [Instructions->042, 244, 0062084192]  SETTABLE: {  3 ,   4 ,  26 } / R[3][R[4]] = 36
> [Instructions->043, 244, 0013017694]  SETTABLE: {  3 ,  27 ,  28 } / R[3][96062495] = 31770
> [Instructions->044, 244, 0048213029]  SETTABLE: {  3 ,  29 ,  30 } / R[3]["LxSsLZLD9"] = 52
> [Instructions->045, 244, 0036535236]  SETTABLE: {  3 ,  31 ,  32 } / R[3]["moEkbEG0d"] = 173781888
> [Instructions->046, 244, 0047480140]  NEWTABLE: {  4 ,   1 ,   0 } / R[4] = {}
> [Instructions->047, 179, 0039763660]      MOVE: {  5 ,  34 ,   0 } / R[5] = R[34]
> [Instructions->048, 170, 0062140500]   CLOSURE: {  6 ,   2 ,   0 } / R[6] = Prototypes[2] (43705333), 0 upvalue(s)
> [Instructions->049, 140, 0062868927]      CALL: {  6 ,   1 ,   0 } / R[6] to STACK_TOP = R[6]()
> [Instructions->050, 080, 0038044609]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->051, 092, 0064781835]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->052, 325, 0006837934]       ADD: {  4 ,   4 ,  35 } / R[4] = R[4] + R[4]
> [Instructions->053, 325, 0035686842]  SETTABLE: {  3 ,  33 ,   4 } / R[3][826498047] = R[4]
> [Instructions->054, 325, 0054867262]  NEWTABLE: {  4 ,   3 ,   0 } / R[4] = {}
> [Instructions->055, 325, 0039213386]     LOADK: {  5 ,  36 ,   0 } / R[5] = 76
> [Instructions->056, 325, 0030676975]     LOADK: {  6 ,  37 ,   0 } / R[6] = 606
> [Instructions->057, 325, 0008844605]     LOADK: {  7 ,  38 ,   0 } / R[7] = 291
> [Instructions->058, 170, 0055580483]      MOVE: {  8 ,   3 ,   0 } / R[8] = R[3]
> [Instructions->059, 140, 0025265681]      CALL: {  8 ,   1 ,   0 } / R[8] to STACK_TOP = R[8]()
> [Instructions->060, 080, 0012479416]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->061, 092, 0023286856]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->062, 180, 0007761360]       ADD: {  4 ,   4 ,  39 } / R[4] = R[4] + R[4]
> [Instructions->063, 180, 0002082912]     LOADK: {  5 ,  40 ,   0 } / R[5] = "If you see this, congrats you're gay"
> [Instructions->064, 180, 0061445641]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->065, 180, 0000551643]       SUB: {  5 ,  41 ,   5 } / R[5] = R[5] - 49
> [Instructions->066, 180, 0032210149]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->067, 180, 0039117879]  NEWTABLE: {  4 ,   0 ,   0 } / R[4] = {}
> [Instructions->068, 170, 0045734626]      MOVE: {  5 ,   4 ,   0 } / R[5] = R[4]
> [Instructions->069, 140, 0027983094]      CALL: {  5 ,   1 ,   0 } / R[5] to STACK_TOP = R[5]()
> [Instructions->070, 080, 0017074306]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->071, 092, 0044473750]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->072, 220, 0011894339]       ADD: {  4 ,   4 ,  42 } / R[4] = R[4] + R[4]
> [Instructions->073, 220, 0039964313]  SETTABLE: {  3 ,   4 ,  43 } / R[3][R[4]] = "u"
> [Instructions->074, 220, 0037278887]  SETTABLE: {  3 ,  44 ,  45 } / R[3][520818534] = 866
> [Instructions->075, 220, 0050116733]  SETTABLE: {  3 ,  32 ,  46 } / R[3][173781888] = "#"
> [Instructions->076, 220, 0000312364]  NEWTABLE: {  4 ,   0 ,   0 } / R[4] = {}
> [Instructions->077, 170, 0036021188]      MOVE: {  5 ,   5 ,   0 } / R[5] = R[5]
> [Instructions->078, 218, 0035759444]     LOADK: {  6 ,  48 ,   0 } / R[6] = 879
> [Instructions->079, 218, 0027326701]     LOADK: {  7 ,  49 ,   0 } / R[7] = 537
> [Instructions->080, 218, 0061993118]     LOADK: {  8 ,  50 ,   0 } / R[8] = 656
> [Instructions->081, 218, 0030490743]     LOADK: {  9 ,  51 ,   0 } / R[9] = 395
> [Instructions->082, 218, 0041565833]      CALL: {  5 ,   9 ,   0 } / R[5] to STACK_TOP = R[5](R[6] to R[13])
> [Instructions->083, 218, 0037692132]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->084, 092, 0006899607]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->085, 344, 0002189490]       SUB: {  4 ,   4 ,  52 } / R[4] = R[4] - R[4]
> [Instructions->086, 344, 0052421702]  SETTABLE: {  3 ,  47 ,   4 } / R[3][280813679] = R[4]
> [Instructions->087, 344, 0048560739]  SETTABLE: {  3 ,  53 ,  42 } / R[3][959554725] = 650989290
> [Instructions->088, 344, 0024710424]     LOADK: {  4 ,  55 ,   0 } / R[4] = "IIiIIiillIiiIIIiiii :troll:"
> [Instructions->089, 344, 0045408373]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->090, 344, 0051501707]       SUB: {  4 ,  56 ,   4 } / R[4] = R[4] - 2074
> [Instructions->091, 344, 0016925546]  SETTABLE: {  3 ,  54 ,   4 } / R[3][861700736] = R[4]
> [Instructions->092, 344, 0030508321]  SETTABLE: {  3 ,  57 ,  58 } / R[3]["Bs5gz"] = 7
> [Instructions->093, 344, 0051145664]  SETTABLE: {  3 ,  59 ,  60 } / R[3][621875034] = 21
> [Instructions->094, 344, 0024208728]  SETTABLE: {  3 ,  61 ,  62 } / R[3][154431058] = 90
> [Instructions->095, 116, 0040419833]      MOVE: {  3 ,  63 ,  64 } / R[3] = R[63]
> [Instructions->096, 348, 0017101746]     LOADK: {  4 ,  65 ,   0 } / R[4] = "Wally likes cock"
> [Instructions->097, 348, 0059428499]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->098, 348, 0042059949]       SUB: {  4 ,  66 ,   4 } / R[4] = R[4] - 844128558
> [Instructions->099, 348, 0038550032]  SETTABLE: {  3 ,   4 ,  67 } / R[3][R[4]] = 386
> [Instructions->100, 348, 0004693195]     LOADK: {  4 ,  65 ,   0 } / R[4] = "Wally likes cock"
> [Instructions->101, 348, 0007654638]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->102, 348, 0011028618]       SUB: {  4 ,  68 ,   4 } / R[4] = R[4] - 996568245
> [Instructions->103, 348, 0037908399]  NEWTABLE: {  5 ,   0 ,   0 } / R[5] = {}
> [Instructions->104, 170, 0057656428]      MOVE: {  6 ,   6 ,   0 } / R[6] = R[6]
> [Instructions->105, 140, 0015805137]      CALL: {  6 ,   1 ,   0 } / R[6] to STACK_TOP = R[6]()
> [Instructions->106, 080, 0023865583]   SETLIST: {  5 ,   0 ,   1 } / R[5][0 + i] = R[5 + i] (1 <= i <= STACK_TOP)
> [Instructions->107, 092, 0054732502]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->108, 199, 0032878229]       SUB: {  5 ,   5 ,  52 } / R[5] = R[5] - R[5]
> [Instructions->109, 199, 0000568381]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->110, 199, 0041332189]  SETTABLE: {  3 ,  69 ,  70 } / R[3]["muXBqFO"] = "g"
> [Instructions->111, 199, 0044573573]  NEWTABLE: {  4 ,   3 ,   0 } / R[4] = {}
> [Instructions->112, 199, 0066297670]     LOADK: {  5 ,  71 ,   0 } / R[5] = 598
> [Instructions->113, 199, 0027661616]     LOADK: {  6 ,  72 ,   0 } / R[6] = 242
> [Instructions->114, 199, 0043195218]     LOADK: {  7 ,  73 ,   0 } / R[7] = 688
> [Instructions->115, 170, 0053291452]      MOVE: {  8 ,   7 ,   0 } / R[8] = R[7]
> [Instructions->116, 140, 0052812415]      CALL: {  8 ,   1 ,   0 } / R[8] to STACK_TOP = R[8]()
> [Instructions->117, 080, 0060172715]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->118, 092, 0045004111]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->119, 251, 0032505211]       ADD: {  4 ,   4 ,  74 } / R[4] = R[4] + R[4]
> [Instructions->120, 251, 0065709120]  SETTABLE: {  3 ,   4 ,  75 } / R[3][R[4]] = 193697787
> [Instructions->121, 251, 0042446254]  SETTABLE: {  3 ,  76 ,  77 } / R[3][899595205] = "d"
> [Instructions->122, 251, 0047759316]     LOADK: {  4 ,  40 ,   0 } / R[4] = "If you see this, congrats you're gay"
> [Instructions->123, 251, 0057696962]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->124, 251, 0037896329]       SUB: {  4 ,  78 ,   4 } / R[4] = R[4] - 550602592
> [Instructions->125, 251, 0051078457]     LOADK: {  5 ,  55 ,   0 } / R[5] = "IIiIIiillIiiIIIiiii :troll:"
> [Instructions->126, 251, 0054689505]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->127, 251, 0009444753]       SUB: {  5 ,  26 ,   5 } / R[5] = R[5] - 36
> [Instructions->128, 251, 0047117146]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->129, 116, 0043258956]      MOVE: {  3 ,  79 ,  80 } / R[3] = R[79]
> [Instructions->130, 063, 0020919926]  SETTABLE: {  3 ,  81 ,  82 } / R[3]["L4u0Pl"] = 4712
> [Instructions->131, 063, 0059961832]     LOADK: {  4 ,  83 ,   0 } / R[4] = "When the exploiter is sus"
> [Instructions->132, 063, 0064290995]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->133, 063, 0007765735]       SUB: {  4 ,  84 ,   4 } / R[4] = R[4] - 441428184
> [Instructions->134, 063, 0004467347]  SETTABLE: {  3 ,   4 ,  85 } / R[3][R[4]] = "f"
> [Instructions->135, 063, 0018785223]     LOADK: {  4 ,  86 ,   0 } / R[4] = "uh oh everyone watch out pain exist coming in with the backspace method one dot two dot man dot"
> [Instructions->136, 063, 0037399700]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->137, 063, 0048851210]       SUB: {  4 ,  87 ,   4 } / R[4] = R[4] - 695880587
> [Instructions->138, 063, 0048799544]  SETTABLE: {  3 ,   4 ,  88 } / R[3][R[4]] = 866434480
> [Instructions->139, 063, 0020641582]  SETTABLE: {  3 ,  89 ,  90 } / R[3][168183134] = 267368779
> [Instructions->140, 032, 0042482429]      MOVE: {  4 ,   3 ,   0 } / R[4] = R[3]
> [Instructions->141, 179, 0000366261]     LOADK: {  5 ,  91 ,   0 } / R[5] = 723
> [Instructions->142, 179, 0065394789]     LOADK: {  6 ,  92 ,   0 } / R[6] = 592
> [Instructions->143, 179, 0005353502]     LOADK: {  7 ,  62 ,   0 } / R[7] = 90
> [Instructions->144, 166, 0031977455]   SETLIST: {  4 ,   7 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 7)
> [Instructions->145, 092, 0046517224]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->146, 105, 0051845658]       ADD: {  4 ,   4 ,  93 } / R[4] = R[4] + R[4]
> [Instructions->147, 032, 0003052181]  NEWTABLE: {  5 ,   1 ,   0 } / R[5] = {}
> [Instructions->148, 179, 0052825960]     LOADK: {  6 ,  94 ,   0 } / R[6] = 35
> [Instructions->149, 170, 0000445603]   CLOSURE: {  7 ,   8 ,   0 } / R[7] = Prototypes[8] (41527383), 0 upvalue(s)
> [Instructions->150, 140, 0016736916]      CALL: {  7 ,   1 ,   0 } / R[7] to STACK_TOP = R[7]()
> [Instructions->151, 080, 0061922665]   SETLIST: {  5 ,   0 ,   1 } / R[5][0 + i] = R[5 + i] (1 <= i <= STACK_TOP)
> [Instructions->152, 092, 0059202790]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->153, 304, 0053266204]       ADD: {  5 ,   5 ,  95 } / R[5] = R[5] + R[5]
> [Instructions->154, 304, 0039052315]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->155, 304, 0010001906]  SETTABLE: {  3 ,  96 ,  97 } / R[3][302891438] = "k"
> [Instructions->156, 304, 0015220913]     LOADK: {  4 ,  99 ,   0 } / R[4] = "concat was here"
> [Instructions->157, 304, 0041007721]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->158, 304, 0001956650]       SUB: {  4 , 100 ,   4 } / R[4] = R[4] - 1747
> [Instructions->159, 304, 0059741443]  SETTABLE: {  3 ,  98 ,   4 } / R[3][216619861] = R[4]
> [Instructions->160, 304, 0011287556]     LOADK: {  4 , 101 ,   0 } / R[4] = "guys someone play Among Us with memcorrupt he is so lonely :("
> [Instructions->161, 304, 0044811838]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->162, 304, 0061934529]       SUB: {  4 , 102 ,   4 } / R[4] = R[4] - 960536273
> [Instructions->163, 327, 0065668764]      MOVE: {  3 ,   4 , 103 } / R[3] = R[4]
> [Instructions->164, 203, 0020452063]     LOADK: {  4 ,  86 ,   0 } / R[4] = "uh oh everyone watch out pain exist coming in with the backspace method one dot two dot man dot"
> [Instructions->165, 203, 0006303387]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->166, 203, 0012794336]       SUB: {  4 , 104 ,   4 } / R[4] = R[4] - 986841566
> [Instructions->167, 203, 0060700349]  SETTABLE: {  3 ,   4 , 105 } / R[3][R[4]] = "e"
> [Instructions->168, 203, 0064129346]  NEWTABLE: {  4 ,   3 ,   0 } / R[4] = {}
> [Instructions->169, 203, 0053884800]     LOADK: {  5 , 106 ,   0 } / R[5] = 823
> [Instructions->170, 203, 0040642951]     LOADK: {  6 , 107 ,   0 } / R[6] = 844
> [Instructions->171, 203, 0004483430]     LOADK: {  7 , 108 ,   0 } / R[7] = 92
> [Instructions->172, 170, 0027550510]      MOVE: {  8 ,   9 ,   0 } / R[8] = R[9]
> [Instructions->173, 140, 0049751278]      CALL: {  8 ,   1 ,   0 } / R[8] to STACK_TOP = R[8]()
> [Instructions->174, 080, 0002465462]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->175, 092, 0001499799]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->176, 119, 0012084385]       ADD: {  4 ,   4 , 109 } / R[4] = R[4] + R[4]
> [Instructions->177, 119, 0009321187]  SETTABLE: {  3 ,   4 , 110 } / R[3][R[4]] = "x"
> [Instructions->178, 119, 0046882157]  NEWTABLE: {  4 ,   3 ,   0 } / R[4] = {}
> [Instructions->179, 119, 0049407568]     LOADK: {  5 , 112 ,   0 } / R[5] = 968
> [Instructions->180, 119, 0016470428]     LOADK: {  6 , 113 ,   0 } / R[6] = 622
> [Instructions->181, 119, 0050904416]     LOADK: {  7 ,  92 ,   0 } / R[7] = 592
> [Instructions->182, 119, 0026945964]   SETLIST: {  4 ,   7 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 7)
> [Instructions->183, 092, 0055818385]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->184, 284, 0020704799]       ADD: {  4 ,   4 , 114 } / R[4] = R[4] + R[4]
> [Instructions->185, 284, 0009826405]  SETTABLE: {  3 , 111 ,   4 } / R[3][567739082] = R[4]
> [Instructions->186, 284, 0053790579]  NEWTABLE: {  4 ,   2 ,   0 } / R[4] = {}
> [Instructions->187, 284, 0056401242]     LOADK: {  5 , 115 ,   0 } / R[5] = 777
> [Instructions->188, 284, 0002817578]     LOADK: {  6 , 116 ,   0 } / R[6] = 267
> [Instructions->189, 170, 0059185138]      MOVE: {  7 ,  10 ,   0 } / R[7] = R[10]
> [Instructions->190, 179, 0043645634]     LOADK: {  8 ,  72 ,   0 } / R[8] = 242
> [Instructions->191, 179, 0030333099]     LOADK: {  9 , 117 ,   0 } / R[9] = 311
> [Instructions->192, 146, 0022758845]      CALL: {  7 ,   9 ,   0 } / R[7] to STACK_TOP = R[7](R[8] to R[15])
> [Instructions->193, 080, 0055539719]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->194, 092, 0003049369]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->195, 158, 0051293828]       ADD: {  4 ,   4 , 118 } / R[4] = R[4] + R[4]
> [Instructions->196, 158, 0037849304]  SETTABLE: {  3 ,   4 , 119 } / R[3][R[4]] = "c"
> [Instructions->197, 158, 0025449636]  SETTABLE: {  3 , 120 , 121 } / R[3][453655279] = 83
> [Instructions->198, 158, 0045625848]     LOADK: {  4 , 123 ,   0 } / R[4] = "The Voxel is sus"
> [Instructions->199, 158, 0035807973]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->200, 158, 0053775227]       SUB: {  4 , 124 ,   4 } / R[4] = R[4] - 5016
> [Instructions->201, 158, 0048034249]  SETTABLE: {  3 , 122 ,   4 } / R[3]["QqFI7fm"] = R[4]
> [Instructions->202, 158, 0006208991]     LOADK: {  4 , 125 ,   0 } / R[4] = "you dumped constants by printing the deserializer??? ladies and gentlemen stand clear we have a genius in the building."
> [Instructions->203, 158, 0028457422]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->204, 158, 0007147942]       SUB: {  4 , 126 ,   4 } / R[4] = R[4] - 845620147
> [Instructions->205, 032, 0003314550]      MOVE: {  5 ,   4 ,   0 } / R[5] = R[4]
> [Instructions->206, 179, 0061599567]     LOADK: {  6 , 127 ,   0 } / R[6] = 364
> [Instructions->207, 179, 0017332032]     LOADK: {  7 , 128 ,   0 } / R[7] = 806
> [Instructions->208, 179, 0050716505]     LOADK: {  8 , 129 ,   0 } / R[8] = 197
> [Instructions->209, 179, 0058752427]     LOADK: {  9 , 130 ,   0 } / R[9] = 650
> [Instructions->210, 170, 0009144902]   CLOSURE: { 10 ,  11 ,   0 } / R[10] = Prototypes[11] (17915705), 0 upvalue(s)
> [Instructions->211, 140, 0033274004]      CALL: { 10 ,   1 ,   0 } / R[10] to STACK_TOP = R[10]()
> [Instructions->212, 080, 0014939240]   SETLIST: {  5 ,   0 ,   1 } / R[5][0 + i] = R[5 + i] (1 <= i <= STACK_TOP)
> [Instructions->213, 092, 0021713605]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->214, 108, 0022754746]       ADD: {  5 ,   5 , 131 } / R[5] = R[5] + R[5]
> [Instructions->215, 108, 0053305687]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->216, 108, 0060570541]  SETTABLE: {  3 , 132 , 133 } / R[3][780261966] = 0
> [Instructions->217, 108, 0060493004]  NEWTABLE: {  4 ,   2 ,   0 } / R[4] = {}
> [Instructions->218, 108, 0018235075]     LOADK: {  5 ,  62 ,   0 } / R[5] = 90
> [Instructions->219, 108, 0006004130]     LOADK: {  6 , 135 ,   0 } / R[6] = 585
> [Instructions->220, 108, 0051025786]   SETLIST: {  4 ,   6 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 6)
> [Instructions->221, 092, 0025984091]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->222, 341, 0001359444]       ADD: {  4 ,   4 , 136 } / R[4] = R[4] + R[4]
> [Instructions->223, 341, 0002699637]  SETTABLE: {  3 , 134 ,   4 } / R[3]["QmYagF"] = R[4]
> [Instructions->224, 341, 0062016463]  SETTABLE: {  3 , 137 , 138 } / R[3][640691181] = "b"
> [Instructions->225, 341, 0043214194]  NEWTABLE: {  4 ,   4 ,   0 } / R[4] = {}
> [Instructions->226, 341, 0063633517]     LOADK: {  5 , 140 ,   0 } / R[5] = 438
> [Instructions->227, 341, 0052093136]     LOADK: {  6 , 141 ,   0 } / R[6] = 694
> [Instructions->228, 341, 0003710124]     LOADK: {  7 , 142 ,   0 } / R[7] = 970
> [Instructions->229, 341, 0008752145]     LOADK: {  8 , 143 ,   0 } / R[8] = 213
> [Instructions->230, 341, 0005189902]   SETLIST: {  4 ,   8 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 8)
> [Instructions->231, 092, 0009924531]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->232, 018, 0040160785]       ADD: {  4 ,   4 , 144 } / R[4] = R[4] + R[4]
> [Instructions->233, 018, 0010138680]  SETTABLE: {  3 , 139 ,   4 } / R[3][112935944] = R[4]
> [Instructions->234, 018, 0022654007]  SETTABLE: {  3 ,   5 , 145 } / R[3][549817682] = "2"
> [Instructions->235, 018, 0065511967]     LOADK: {  4 , 147 ,   0 } / R[4] = "Bunu yazan tosun... - federal"
> [Instructions->236, 018, 0002106367]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->237, 018, 0007119335]       SUB: {  4 , 148 ,   4 } / R[4] = R[4] - 32
> [Instructions->238, 018, 0054832616]  SETTABLE: {  3 , 146 ,   4 } / R[3]["z6GZm"] = R[4]
> [Instructions->239, 018, 0020331538]  NEWTABLE: {  4 ,   4 ,   0 } / R[4] = {}
> [Instructions->240, 018, 0007725684]     LOADK: {  5 , 150 ,   0 } / R[5] = 834
> [Instructions->241, 018, 0049748254]     LOADK: {  6 , 151 ,   0 } / R[6] = 300
> [Instructions->242, 179, 0000817697]      MOVE: {  7 , 152 ,   0 } / R[7] = R[152]
> [Instructions->243, 179, 0042992013]     LOADK: {  8 , 153 ,   0 } / R[8] = 898
> [Instructions->244, 166, 0009653617]   SETLIST: {  4 ,   8 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 8)
> [Instructions->245, 092, 0026729949]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->246, 198, 0005199074]       ADD: {  4 ,   4 , 154 } / R[4] = R[4] + R[4]
> [Instructions->247, 198, 0014923408]  SETTABLE: {  3 , 149 ,   4 } / R[3]["a5qrSjNbTX"] = R[4]
> [Instructions->248, 198, 0013084918]     LOADK: {  4 ,  65 ,   0 } / R[4] = "Wally likes cock"
> [Instructions->249, 198, 0017740836]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->250, 198, 0005079595]       SUB: {  4 , 156 ,   4 } / R[4] = R[4] - 111369457
> [Instructions->251, 198, 0016916251]  SETTABLE: {  3 , 155 ,   4 } / R[3]["eVyzbPdc"] = R[4]
> [Instructions->252, 198, 0025442563]  SETTABLE: {  3 , 157 , 158 } / R[3]["z6TAW6D7W"] = "i"
> [Instructions->253, 198, 0041770995]  SETTABLE: {  3 , 159 , 160 } / R[3][534567794] = 346
> [Instructions->254, 198, 0015287804]     LOADK: {  4 , 161 ,   0 } / R[4] = "psu == femboy hangout"
> [Instructions->255, 198, 0010354478]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->256, 276, 0006046104]      MOVE: {  4 , 162 ,   4 } / R[4] = R[162]
> [Instructions->257, 118, 0006792522]  SETTABLE: {  3 ,   4 , 163 } / R[3][R[4]] = "n"
> [Instructions->258, 118, 0010937429]  SETTABLE: {  3 , 164 , 137 } / R[3][128035218] = 640691181
> [Instructions->259, 118, 0055319241]  SETTABLE: {  3 , 165 , 166 } / R[3]["PD1hT3o"] = "o"
> [Instructions->260, 118, 0017106613]  SETTABLE: {  3 , 103 , 167 } / R[3][72188820] = "r"
> [Instructions->261, 118, 0062081065]  SETTABLE: {  3 , 168 , 169 } / R[3]["I652R"] = "l"
> [Instructions->262, 118, 0011313462]     LOADK: {  4 , 147 ,   0 } / R[4] = "Bunu yazan tosun... - federal"
> [Instructions->263, 118, 0058930668]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->264, 118, 0039177306]       SUB: {  4 , 170 ,   4 } / R[4] = R[4] - 7916682
> [Instructions->265, 118, 0011013264]  SETTABLE: {  3 ,   4 , 171 } / R[3][R[4]] = 31
> [Instructions->266, 118, 0029540511]     LOADK: {  4 , 172 ,   0 } / R[4] = "why does psu.dev attract so many ddosing retards wtf"
> [Instructions->267, 092, 0060560535]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->268, 234, 0055039623]       SUB: {  4 , 173 ,   4 } / R[4] = R[4] - 978020578
> [Instructions->269, 234, 0066041472]     LOADK: {  5 , 174 ,   0 } / R[5] = "please suck my cock :pleading:"
> [Instructions->270, 234, 0022251153]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->271, 234, 0047282890]       SUB: {  5 , 175 ,   5 } / R[5] = R[5] - 62
> [Instructions->272, 234, 0066480444]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->273, 234, 0060164599]     LOADK: {  4 , 177 ,   0 } / R[4] = "still waiting for luci to fix the API :|"
> [Instructions->274, 234, 0040580874]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->275, 234, 0037760133]       SUB: {  4 , 178 ,   4 } / R[4] = R[4] - 288
> [Instructions->276, 234, 0043960441]  SETTABLE: {  3 , 176 ,   4 } / R[3]["ro8n3"] = R[4]
> [Instructions->277, 234, 0000576246]  NEWTABLE: {  4 ,   4 ,   0 } / R[4] = {}
> [Instructions->278, 179, 0045618699]      MOVE: {  5 , 179 ,   0 } / R[5] = R[179]
> [Instructions->279, 179, 0031911368]     LOADK: {  6 , 180 ,   0 } / R[6] = 377
> [Instructions->280, 179, 0010500158]     LOADK: {  7 , 181 ,   0 } / R[7] = 237
> [Instructions->281, 179, 0018333053]     LOADK: {  8 , 182 ,   0 } / R[8] = 388
> [Instructions->282, 166, 0059402132]   SETLIST: {  4 ,   8 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 8)
> [Instructions->283, 092, 0027689619]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->284, 165, 0058457227]       ADD: {  4 ,   4 , 183 } / R[4] = R[4] + R[4]
> [Instructions->285, 165, 0049587596]  SETTABLE: {  3 ,   4 , 184 } / R[3][R[4]] = "m"
> [Instructions->286, 165, 0047476645]  NEWTABLE: {  4 ,   1 ,   0 } / R[4] = {}
> [Instructions->287, 165, 0037859046]     LOADK: {  5 , 185 ,   0 } / R[5] = 466
> [Instructions->288, 165, 0030759264]   SETLIST: {  4 ,   5 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= 5)
> [Instructions->289, 092, 0053692195]      MOVE: {  4 ,   4 ,   0 } / R[4] = R[4]
> [Instructions->290, 078, 0002781758]       ADD: {  4 ,   4 , 186 } / R[4] = R[4] + R[4]
> [Instructions->291, 078, 0039663297]     LOADK: {  5 , 174 ,   0 } / R[5] = "please suck my cock :pleading:"
> [Instructions->292, 078, 0007443133]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->293, 078, 0029976130]       SUB: {  5 , 187 ,   5 } / R[5] = R[5] - 256601150
> [Instructions->294, 078, 0029537119]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->295, 078, 0058711588]  NEWTABLE: {  4 ,   1 ,   0 } / R[4] = {}
> [Instructions->296, 078, 0053996706]     LOADK: {  5 , 189 ,   0 } / R[5] = 179
> [Instructions->297, 170, 0034522857]      MOVE: {  6 ,  12 ,   0 } / R[6] = R[12]
> [Instructions->298, 140, 0024475400]      CALL: {  6 ,   1 ,   0 } / R[6] to STACK_TOP = R[6]()
> [Instructions->299, 080, 0051538192]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->300, 092, 0036809488]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->301, 174, 0062729496]       SUB: {  4 ,   4 ,  52 } / R[4] = R[4] - R[4]
> [Instructions->302, 174, 0029163833]  SETTABLE: {  3 , 188 ,   4 } / R[3][114994609] = R[4]
> [Instructions->303, 174, 0056597379]     LOADK: {  4 , 147 ,   0 } / R[4] = "Bunu yazan tosun... - federal"
> [Instructions->304, 174, 0042603013]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->305, 174, 0066084047]       SUB: {  4 , 190 ,   4 } / R[4] = R[4] - 604765512
> [Instructions->306, 174, 0045454834]  NEWTABLE: {  5 ,   0 ,   0 } / R[5] = {}
> [Instructions->307, 174, 0009714046]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->308, 174, 0059663746]       ADD: {  5 ,   5 , 191 } / R[5] = R[5] + R[5]
> [Instructions->309, 174, 0036051470]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->310, 174, 0052263219]  SETTABLE: {  3 , 192 , 193 } / R[3][236417088] = 848863748
> [Instructions->311, 116, 0029296385]      MOVE: {  3 , 194 , 195 } / R[3] = R[194]
> [Instructions->312, 032, 0061729159]  NEWTABLE: {  4 ,   0 ,   0 } / R[4] = {}
> [Instructions->313, 170, 0020850901]   CLOSURE: {  5 ,  13 ,   0 } / R[5] = Prototypes[13] (22343420), 0 upvalue(s)
> [Instructions->314, 179, 0030459916]     LOADK: {  6 , 153 ,   0 } / R[6] = 898
> [Instructions->315, 334, 0024764948]      CALL: {  5 ,   6 ,   0 } / R[5] to STACK_TOP = R[5](R[6] to R[10])
> [Instructions->316, 080, 0008015140]   SETLIST: {  4 ,   0 ,   1 } / R[4][0 + i] = R[4 + i] (1 <= i <= STACK_TOP)
> [Instructions->317, 092, 0006175565]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->318, 044, 0010240159]       ADD: {  4 ,   4 , 197 } / R[4] = R[4] + R[4]
> [Instructions->319, 044, 0010851113]  SETTABLE: {  3 , 196 ,   4 } / R[3][879610168] = R[4]
> [Instructions->320, 044, 0008276731]  SETTABLE: {  3 , 198 , 199 } / R[3][579054334] = "s"
> [Instructions->321, 044, 0014524966]     LOADK: {  4 , 172 ,   0 } / R[4] = "why does psu.dev attract so many ddosing retards wtf"
> [Instructions->322, 044, 0064369850]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->323, 044, 0050741446]       SUB: {  4 , 201 ,   4 } / R[4] = R[4] - 579054386
> [Instructions->324, 044, 0005236314]  SETTABLE: {  3 , 200 ,   4 } / R[3]["nIttM"] = R[4]
> [Instructions->325, 044, 0035219335]     LOADK: {  4 , 147 ,   0 } / R[4] = "Bunu yazan tosun... - federal"
> [Instructions->326, 044, 0001402973]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->327, 044, 0026423019]       SUB: {  4 , 202 ,   4 } / R[4] = R[4] - 493309033
> [Instructions->328, 179, 0039248705]      MOVE: {  5 , 174 ,   0 } / R[5] = R[174]
> [Instructions->329, 087, 0049926000]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->330, 087, 0030580616]       SUB: {  5 , 203 ,   5 } / R[5] = R[5] - 405
> [Instructions->331, 087, 0023437720]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->332, 087, 0022873521]     LOADK: {  4 , 204 ,   0 } / R[4] = "oh Mr. Pools, thats a little close please dont touch me there... please Mr. Pools I am only eight years old please stop..."
> [Instructions->333, 087, 0050929122]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->334, 087, 0040410683]       SUB: {  4 , 205 ,   4 } / R[4] = R[4] - 827534730
> [Instructions->335, 087, 0012115149]  NEWTABLE: {  5 ,   1 ,   0 } / R[5] = {}
> [Instructions->336, 087, 0026087848]     LOADK: {  6 , 206 ,   0 } / R[6] = 910
> [Instructions->337, 170, 0057906907]      MOVE: {  7 ,  14 ,   0 } / R[7] = R[14]
> [Instructions->338, 140, 0018098294]      CALL: {  7 ,   1 ,   0 } / R[7] to STACK_TOP = R[7]()
> [Instructions->339, 080, 0065676426]   SETLIST: {  5 ,   0 ,   1 } / R[5][0 + i] = R[5 + i] (1 <= i <= STACK_TOP)
> [Instructions->340, 092, 0024628007]       LEN: {  5 ,   5 ,   0 } / R[5] = #R[5]
> [Instructions->341, 294, 0000491100]       ADD: {  5 ,   5 ,  58 } / R[5] = R[5] + R[5]
> [Instructions->342, 294, 0066323001]  SETTABLE: {  3 ,   4 ,   5 } / R[3][R[4]] = R[5]
> [Instructions->343, 294, 0041467087]     LOADK: {  4 , 208 ,   0 } / R[4] = "woooow u hooked an opcode, congratulations~ now suck my cock"
> [Instructions->344, 294, 0050984494]       LEN: {  4 ,   4 ,   0 } / R[4] = #R[4]
> [Instructions->345, 294, 0003479653]       SUB: {  4 , 209 ,   4 } / R[4] = R[4] - 986841531
> [Instructions->346, 294, 0017362820]  SETTABLE: {  3 , 207 ,   4 } / R[3]["u9vCJZy0Qz"] = R[4]
> [Instructions->347, 294, 0000387484]  SETTABLE: {  3 , 210 , 211 } / R[3]["nGPpUTOjmC"] = "t"
> [Instructions->348, 294, 0009852605]  SETTABLE: {  3 ,  75 , 212 } / R[3][193697787] = "a"
> [Instructions->349, 294, 0000960758]  SETTABLE: {  3 , 213 , 214 } / R[3][677892865] = 441428159
> [Instructions->350, 294, 0053851223]    VARARG: {  4 ,   0 ,   0 } / R[4] to STACK_TOP = ...
> [Instructions->351, 219, 0022343409]      MOVE: {  2 ,   0 ,   0 } / R[2] = R[0]
> [Instructions->352, 080, 0030453972]   SETLIST: {  1 ,   0 ,   1 } / R[1][0 + i] = R[1 + i] (1 <= i <= STACK_TOP)
> [Instructions->353, 187, 0021525519]      CALL: {  0 ,   2 ,   2 } / R[0] = R[0](R[1])
> [Instructions->354, 204, 0054465714]       JMP: {  0 , 356 ,   0 } / goto PC 357 (21696718)
> [Instructions->355, 191, 0013551731]    RETURN: {  4 ,   2 ,   0 } / return R[4]
> [Instructions->356, 239, 0021696718]  TFORLOOP: {  0 , 355 ,   2 } / 
> [Instructions->357, 204, 0003718576]       JMP: {  0 , 355 ,   0 } / goto PC 356 (13551731)
> [Instructions->358, 012, 0013358229]    RETURN: {  0 ,   1 ,   0 } / return 
]=];

function LdToDec(full)
    return string.gsub(full, "R%[(%d+)]", function(Digit)
        return string.format("v%s", string.match(Digit, "%d+"))
    end)
end
function string_split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
function case(value, table, default)
    if rawget(table, value) then
        return rawget(table, value)()
    end
    return default()
end
function MatchToArray(gmatch)
    local mReturn = {}
    for match in gmatch do
        table.insert(mReturn, match)
    end 
    return mReturn
end
StripInformation = function(Line)
    local Instruction = string.gsub(string.match(Line, "](.+): {") or "", " ", "");
    if Instruction ~= nil then
        
        return {
            Instruction   = Instruction,
            VariableNames = MatchToArray(string.gmatch(Line, "R%[%d+]")),
            MemoryAt      = string.sub(tostring(string.match(Line, ", %d+]")), 3, -2),
            InstrInfo     = string.match(Line, " / (.+)")
        }
    end
    return;
end

local closures = {}
local LoadedVars = {}
local script = string.format("local R = {};\n(function()")
for Index, Line in pairs(string_split(Instructions, "\n")) do
    local Info         = StripInformation(Line);
    case(Info.Instruction, {
        LOADK = function()
            script = string.format("%s\n\t%s", script, string.format("%s;", Info.InstrInfo))
            LoadedVars[Info.VariableNames[1]] = string.match(Info.InstrInfo, " = (.+)")
        end,
        GETGLOBAL = function()
            script = string.format("%s\n\t%s", script, string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G"))
        end,
        SETTABLE = function()
            script = string.format("%s\n\t%s", script, string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G"))
        end,
        CLOSURE = function()
            local closure_id = string.sub(string.match(Info.InstrInfo, " %(%d+%),"), 3, -3)
            closures[closure_id] = Info.VariableNames[1]
            script = string.format("%s\n\t%s", script, string.format("function closure_%s()\n\n\tend", closure_id))
        end,
        SETGLOBAL = function()
            script = string.format("%s\n\t%s", script, string.gsub(string.format("%s;", Info.InstrInfo), "Environment", "_G"))
            LoadedVars[Info.VariableNames[1]] = string.match(string.gsub(Info.InstrInfo, "Environment", "_G"), " = (.+)")
        end,
        RETURN = function()
            script = string.format("%s\n\t%s", script, "return;")
        end,
        CALL = function()
            local org_call = string.gsub(Info.InstrInfo, " to STACK_TOP", "")
            org_call = string.gsub(org_call, "R%[%d]", function(Digit)
                return LoadedVars[Digit] or Digit
            end)
            script = string.format("%s\n\t%s", script, org_call)
        end,
        NEWTABLE = function()
            script = string.format("%s\n\t%s", script, string.format("%s = {};", Info.VariableNames[1])) 
        end,
        MOVE = function()
            script = string.format("%s\n\t%s", script, string.format("%s = %s;", Info.VariableNames[1] or "R[nil]", Info.VariableNames[2] or "R[nil]")) 
        end,
        SETLIST = function()
            local MIdx = Index
            local EIdx = MIdx - 1
            local SIdx = nil
            for I = 1, MIdx do
            local RIdx = MIdx - (I - 1)
            local Inst = StripInformation(string_split(Instructions, "\n")[RIdx]).Instruction
            if Inst ~= "SETLIST" and Inst ~= "LOADK" then
                SIdx = I - 2
            end
            end 
            local CIdx  = 0
            local TName = "0"
            for I = SIdx, EIdx do
                CIdx = CIdx + 1
                local Inst = StripInformation(string_split(Instructions, "\n")[I])
                local insert_value  = string.match(Inst.InstrInfo, "= (.+)")
                local LK_name       = Inst.VariableNames[1]
                
                if CIdx == 1 then
                    local Table = StripInformation(string_split(Instructions, "\n")[I - 1])
                    TName = tostring(Table.VariableNames[1])
                end 
                script = string.format("%s\n\t%s", script, string.format("table.insert(%s, %s)", TName, LK_name))
            end
        end,
        SELF = function()
            script = string.format("%s\n\t%s", script, string.format("%s = %s.%s", Info.VariableNames[1], Info.VariableNames[2], string.match(Info.InstrInfo, "\"(.+)\"")))
        end,
        GETTABLE = function()
            script = string.format("%s\n\t%s", script, Info.InstrInfo)
        end
    }, function()
        if string.len(Info.Instruction) > 5 then
            script = string.format("%s\n\t%s", script, string.format("-- Failed to parse LUA_%s", Info.Instruction))
        end
    end)
end
script = string.format("%s\nend)()", script)
script = LdToDec(script)

print(script)
