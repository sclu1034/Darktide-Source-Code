local forbidden_words = {
	phrases = {
		[5] = {
			"k k k"
		},
		[7] = {
			"suck my",
			"tea bag",
			"xbl pet"
		},
		[8] = {
			"god damn",
			"jack off",
			"klu klux",
			"red tube"
		},
		[9] = {
			"bin laden",
			"coon hunt",
			"coon kill",
			"deez nuts",
			"koon hunt",
			"koon kill",
			"sofa king"
		},
		[10] = {
			"cotton pic",
			"cotton pik",
			"dio bestia"
		},
		[11] = {
			"ching chong",
			"durka durka",
			"white power"
		},
		[12] = {
			"jungle bunny",
			"ku klux klan",
			"moon cricket",
			"porch monkey"
		},
		[13] = {
			"klu klux klan",
			"porca madonna",
			"succhia cazzi"
		},
		[14] = {
			"chingada madre",
			"testa di cazzo"
		},
		[15] = {
			"madonna puttana"
		},
		[17] = {
			"figlio di puttana"
		}
	},
	words = {
		[2] = {
			"低能",
			"屠殺",
			"強姦",
			"援交",
			"精薄",
			"輪姦"
		},
		[3] = {
			"8=d",
			"ass",
			"cum",
			"fag",
			"fck",
			"fgt",
			"fku",
			"gyp",
			"jap",
			"kkk",
			"nig",
			"smd",
			"std",
			"vag",
			"wog",
			"wop",
			"ちんぽ",
			"つんぼ",
			"まんこ",
			"れいぷ",
			"オメコ",
			"チンポ",
			"ツンボ",
			"ニガー",
			"ニグロ",
			"マンコ",
			"レイプ",
			"支那人",
			"精薄者"
		},
		[4] = {
			"1488",
			"aids",
			"anal",
			"anus",
			"arse",
			"b1tc",
			"bamf",
			"blad",
			"btch",
			"bung",
			"c0ck",
			"cl1t",
			"cli7",
			"clit",
			"cock",
			"coon",
			"csam",
			"culo",
			"cun7",
			"cunt",
			"cvn7",
			"cvnt",
			"cyka",
			"d1kc",
			"d4go",
			"dago",
			"dikc",
			"dong",
			"dyke",
			"f0ck",
			"f0kc",
			"fckn",
			"fcuk",
			"fick",
			"fock",
			"fokc",
			"fucc",
			"fuck",
			"fuct",
			"fupa",
			"fvck",
			"fxck",
			"g00k",
			"g0ok",
			"go0k",
			"gook",
			"h0m0",
			"h0mo",
			"hom0",
			"homo",
			"hor3",
			"hure",
			"jizz",
			"joto",
			"k1k3",
			"kik3",
			"kike",
			"kun7",
			"meth",
			"milf",
			"mong",
			"n4z1",
			"naz1",
			"nazi",
			"nazl",
			"nggr",
			"ni6g",
			"orgy",
			"paki",
			"pedo",
			"porn",
			"pube",
			"puta",
			"pute",
			"puto",
			"r4p3",
			"raip",
			"rape",
			"sh17",
			"sh1t",
			"shat",
			"shi7",
			"shit",
			"shl7",
			"shlt",
			"slut",
			"stds",
			"tard",
			"thot",
			"tits",
			"tw47",
			"tw4t",
			"twat",
			"wank",
			"сука",
			"あおかん",
			"いんばい",
			"おなにー",
			"きけいじ",
			"きちがい",
			"きんたま",
			"くろんぼ",
			"しなじん",
			"たちんぼ",
			"ちょん公",
			"アオカン",
			"インバイ",
			"オナニー",
			"キケイジ",
			"キチガイ",
			"キンタマ",
			"クロンボ",
			"シナジン",
			"タチンボ",
			"トルコ嬢"
		},
		[5] = {
			"ahole",
			"anuss",
			"aokan",
			"arsch",
			"arsed",
			"arses",
			"b00bz",
			"baise",
			"biach",
			"bitch",
			"bladt",
			"blyad",
			"bon3r",
			"boner",
			"boobs",
			"cacca",
			"cazzo",
			"ch1nk",
			"chink",
			"choad",
			"chode",
			"dildo",
			"dongs",
			"downy",
			"f3lch",
			"fanny",
			"fcuuk",
			"felch",
			"fotze",
			"fuuck",
			"g000k",
			"gooch",
			"goook",
			"h1tl3",
			"h1tle",
			"hitlr",
			"honky",
			"hymen",
			"injun",
			"joder",
			"kurva",
			"kurwa",
			"kxkxk",
			"l3sb0",
			"lezbo",
			"manko",
			"merda",
			"merde",
			"minge",
			"n1664",
			"n166a",
			"n1g3r",
			"n3gro",
			"n4g3r",
			"nag3r",
			"natzi",
			"ni666",
			"ni66a",
			"ni66g",
			"ni6g6",
			"ni6gg",
			"nig66",
			"nig6g",
			"nigar",
			"nigg3",
			"nigg6",
			"nigga",
			"niggr",
			"niggy",
			"niqqa",
			"nonce",
			"nugga",
			"omeko",
			"p3n15",
			"p3n1s",
			"p3ni5",
			"p3nis",
			"p3nl5",
			"p3nls",
			"pen15",
			"pen1s",
			"peni5",
			"penis",
			"penl5",
			"penls",
			"penus",
			"perra",
			"phuck",
			"pikey",
			"pizda",
			"polla",
			"porra",
			"pr1ck",
			"prick",
			"pu55y",
			"pub1c",
			"pubic",
			"punal",
			"puss1",
			"puss3",
			"puss5",
			"pusse",
			"pussi",
			"pussy",
			"puzzy",
			"pvssy",
			"queef",
			"raape",
			"raped",
			"reipu",
			"secks",
			"semen",
			"skank",
			"sodom",
			"taint",
			"teino",
			"tinpo",
			"tunbo",
			"wh0r3",
			"wh0re",
			"whor3",
			"whore",
			"Блядь",
			"いぬごろし",
			"かわらもの",
			"ちょんこう",
			"ちょんころ",
			"とるこぶろ",
			"にんぴにん",
			"イヌゴロシ",
			"カワラモノ",
			"チョンコウ",
			"チョンコロ",
			"トルコ風呂"
		},
		[6] = {
			"anuses",
			"asshat",
			"beaner",
			"beetch",
			"biotch",
			"blowme",
			"blyadt",
			"cabron",
			"cadela",
			"cagada",
			"ceemen",
			"chinga",
			"chinpo",
			"chonga",
			"chonko",
			"cocain",
			"coitus",
			"condom",
			"cooter",
			"culear",
			"culero",
			"darkie",
			"douche",
			"downie",
			"encule",
			"etambo",
			"etanbo",
			"faggot",
			"fatass",
			"fetish",
			"foutre",
			"fucker",
			"fuuuck",
			"herpes",
			"hitl3r",
			"hitler",
			"hooker",
			"inc3st",
			"incest",
			"j1g4b0",
			"j1g4bo",
			"j1gab0",
			"j1gabo",
			"jig4b0",
			"jig4bo",
			"jigabo",
			"lezzie",
			"mierda",
			"molest",
			"n1663r",
			"n166er",
			"n1gg3r",
			"n4gg3r",
			"nagg3r",
			"ni66er",
			"niggaz",
			"nigger",
			"nigguh",
			"niggur",
			"niglet",
			"nignog",
			"niqqer",
			"nutted",
			"pedoph",
			"penile",
			"phagot",
			"pinche",
			"pu555y",
			"pun4ni",
			"pun4nl",
			"punan1",
			"punani",
			"punanl",
			"pusss1",
			"pussse",
			"pusssi",
			"pusssl",
			"pusssy",
			"putain",
			"r3c7um",
			"r4p15t",
			"r4p1st",
			"r4pi5t",
			"r4pist",
			"raibyo",
			"rap15t",
			"rap1st",
			"rapage",
			"rapi5t",
			"raping",
			"rapist",
			"rectum",
			"reggin",
			"retard",
			"rimjob",
			"salaud",
			"salope",
			"scrote",
			"shitty",
			"suckmy",
			"tampon",
			"teabag",
			"teebag",
			"tosatu",
			"tranny",
			"tyonga",
			"tyonko",
			"v461n4",
			"v461na",
			"v46in4",
			"v46ina",
			"v4g1n4",
			"v4g1na",
			"v4gin4",
			"v4gina",
			"va61n4",
			"va61na",
			"va6in4",
			"va6ina",
			"vag1n4",
			"vag1na",
			"vagin4",
			"vagina",
			"wanker",
			"x8lp3t",
			"xblpet",
			"かわらこじき",
			"ころしてやる",
			"とるこじょう",
			"はんとうじん",
			"カワラコジキ",
			"コロシテヤル"
		},
		[7] = {
			"a55hole",
			"ainujin",
			"ainuzin",
			"asshole",
			"bastard",
			"beeatch",
			"beeotch",
			"bellend",
			"beyitch",
			"beyotch",
			"blowjob",
			"bukakke",
			"caralho",
			"cocaine",
			"coituss",
			"cojelon",
			"cojones",
			"deeznut",
			"dumbass",
			"facking",
			"fanculo",
			"fucking",
			"fuuuuck",
			"fxuxcxk",
			"gestapo",
			"hairpie",
			"jackass",
			"jerkoff",
			"jigaboo",
			"kikeiji",
			"kikeizi",
			"kitigai",
			"kluklux",
			"kurombo",
			"maricon",
			"mulatto",
			"nigglet",
			"nipples",
			"nutsack",
			"panties",
			"pendejo",
			"phaggot",
			"preteen",
			"pussies",
			"puttana",
			"puttane",
			"raghead",
			"rizzape",
			"rompari",
			"scheiße",
			"schlong",
			"shemale",
			"sinazin",
			"tapatte",
			"tapette",
			"teensex",
			"tosatsu",
			"w3tb4ck",
			"w3tback",
			"wetb4ck",
			"wetback",
			"xl3lpet"
		},
		[8] = {
			"abortion",
			"anushead",
			"anuslick",
			"arsehole",
			"bakachon",
			"bakatyon",
			"ballsack",
			"beeyotch",
			"binladen",
			"bitching",
			"bullshit",
			"butthead",
			"butthole",
			"buttplug",
			"castrate",
			"chankoro",
			"chingado",
			"chingate",
			"chonkoro",
			"clitoris",
			"coglione",
			"coglioni",
			"coonhunt",
			"coonkill",
			"deeznuts",
			"dickhead",
			"etahinin",
			"fickdich",
			"foreskin",
			"fuuuuuck",
			"gollywog",
			"inculato",
			"jiggaboo",
			"kichigai",
			"knobhead",
			"koonhunt",
			"koonkill",
			"manshaft",
			"mitukuti",
			"molester",
			"molestor",
			"n1german",
			"negerman",
			"nggerman",
			"nigerman",
			"nimpinin",
			"ninpinin",
			"santorum",
			"schlampe",
			"shinajin",
			"shirakko",
			"sofaking",
			"tarlouse",
			"tieokure",
			"torukojo",
			"tyankoro",
			"tyonkoro",
			"tyurenbo"
		},
		[9] = {
			"akimekura",
			"arschloch",
			"arseholed",
			"arseholes",
			"auschwitz",
			"beeeyotch",
			"chieokure",
			"chlamydia",
			"chourimbo",
			"chourinbo",
			"chourippo",
			"chuurembo",
			"chuurenbo",
			"cottonpic",
			"cottonpik",
			"crackhead",
			"ejaculate",
			"fuuuuuuck",
			"golliwogg",
			"hantoujin",
			"hantouzin",
			"holocaust",
			"hurensohn",
			"inugorosi",
			"kilurself",
			"koumoujin",
			"koumouzin",
			"masterbat",
			"miststück",
			"n1ggerman",
			"n4ggerman",
			"naggerman",
			"niggerman",
			"nyggerman",
			"pedophile",
			"ricchione",
			"sinheimin",
			"testicles",
			"torukozyo",
			"towelhead",
			"tyourinbo",
			"tyourippo",
			"usigorosi",
			"vaccagare",
			"vatefaire"
		},
		[10] = {
			"arseholing",
			"arselicker",
			"bestiality",
			"butagorosi",
			"chikusatsu",
			"circlejerk",
			"cocksucker",
			"enjokousai",
			"fuuuuuuuck",
			"hakuroubyo",
			"inugoroshi",
			"manberries",
			"masterbate",
			"masturbait",
			"masturbare",
			"masturbate",
			"mitsukuchi",
			"nhiggerman",
			"puttaniere",
			"sangokujin",
			"sangokuzin",
			"schwuchtel",
			"seishinijo",
			"seisinizyo",
			"shinheimin",
			"spanishick",
			"spanishook",
			"spanishunk",
			"torukoburo",
			"vaffanculo",
			"whitepower",
			"xblrewards",
			"yabunirami",
			"zipperhead"
		},
		[11] = {
			"beefwhistle",
			"cameljockey",
			"enzyokousai",
			"fujinoyamai",
			"fuuuuuuuuck",
			"fuuuuuuuuuu",
			"hakujakusha",
			"huzinoyamai",
			"intercourse",
			"junglebunny",
			"m07th3rfukr",
			"m0th3rfvk3r",
			"m0th3rfvker",
			"moth3rfucer",
			"moth3rfvk3r",
			"moth3rfvker",
			"semusiotoko",
			"ushigoroshi",
			"vvhitepower"
		},
		[12] = {
			"fukashokumin",
			"fuuuuuuuuuck",
			"hakuzyakusya",
			"hukasyokumin",
			"masturbacion",
			"motherfucker",
			"semushiotoko"
		},
		[13] = {
			"goldenshowers",
			"koroshiteyaru",
			"masturbazione",
			"tokushugakkyu",
			"tokusyugakkyu"
		},
		[15] = {
			"seishinhakujaku",
			"seisinhakuzyaku",
			"syokubutuningen"
		},
		[16] = {
			"shokubutsuningen"
		}
	}
}

return forbidden_words
