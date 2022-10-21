local spline_matrices = {
	[0] = {
		-0.071869,
		0.22309,
		-0.972145,
		0,
		-0.893954,
		0.417862,
		0.16198,
		0,
		0.442358,
		0.880694,
		0.169401,
		0,
		-0.118867,
		0.501897,
		-0.175236,
		1
	},
	{
		0.768504,
		0.151886,
		-0.621557,
		0,
		-0.176411,
		0.984063,
		0.022352,
		0,
		0.615046,
		0.092472,
		0.78305,
		0,
		-0.024656,
		0.509481,
		-0.427863,
		1
	},
	[0.0166666666667] = {
		-0.222729,
		0.23304,
		-0.946617,
		0,
		-0.930596,
		0.238509,
		0.277676,
		0,
		0.290486,
		0.942765,
		0.163743,
		0,
		-0.048164,
		0.477944,
		-0.173547,
		1
	},
	[0.0333333333333] = {
		-0.213687,
		0.224495,
		-0.950758,
		0,
		-0.921364,
		0.277162,
		0.272524,
		0,
		0.324694,
		0.934229,
		0.147616,
		0,
		-0.169783,
		0.483278,
		-0.180341,
		1
	},
	[0.05] = {
		-0.238546,
		0.178698,
		-0.954549,
		0,
		-0.945642,
		0.18098,
		0.2702,
		0,
		0.221038,
		0.967116,
		0.125812,
		0,
		-0.169324,
		0.454319,
		-0.189763,
		1
	},
	[0.0666666666667] = {
		-0.248169,
		0.163665,
		-0.954791,
		0,
		-0.954233,
		0.128503,
		0.270051,
		0,
		0.166891,
		0.978111,
		0.124284,
		0,
		-0.146489,
		0.460947,
		-0.201708,
		1
	},
	[0.0833333333333] = {
		-0.261125,
		0.144373,
		-0.954447,
		0,
		-0.958928,
		0.074671,
		0.273646,
		0,
		0.110776,
		0.986702,
		0.118945,
		0,
		-0.11641,
		0.45559,
		-0.203024,
		1
	},
	[0.116666666667] = {
		-0.256647,
		0.15068,
		-0.954687,
		0,
		-0.963759,
		0.034516,
		0.264533,
		0,
		0.072811,
		0.98798,
		0.136361,
		0,
		-0.084499,
		0.447169,
		-0.205181,
		1
	},
	[0.133333333333] = {
		-0.242754,
		0.168892,
		-0.955273,
		0,
		-0.966809,
		0.038777,
		0.252541,
		0,
		0.079695,
		0.984872,
		0.153873,
		0,
		-0.078758,
		0.445782,
		-0.209201,
		1
	},
	[0.15] = {
		-0.224274,
		0.189724,
		-0.95588,
		0,
		-0.969855,
		0.052469,
		0.237967,
		0,
		0.095302,
		0.980435,
		0.172237,
		0,
		-0.075888,
		0.441524,
		-0.215565,
		1
	},
	[0.166666666667] = {
		-0.201286,
		0.212381,
		-0.956231,
		0,
		-0.97233,
		0.074844,
		0.221298,
		0,
		0.118568,
		0.974316,
		0.191439,
		0,
		-0.075961,
		0.431903,
		-0.224882,
		1
	},
	[0.183333333333] = {
		-0.173856,
		0.238347,
		-0.955492,
		0,
		-0.973535,
		0.104553,
		0.203219,
		0,
		0.148336,
		0.965536,
		0.213862,
		0,
		-0.079085,
		0.418498,
		-0.236198,
		1
	},
	[0.1] = {
		-0.265713,
		0.13728,
		-0.954228,
		0,
		-0.961078,
		0.039968,
		0.27337,
		0,
		0.075667,
		0.989726,
		0.121317,
		0,
		-0.093266,
		0.449187,
		-0.202358,
		1
	},
	[0.216666666667] = {
		-0.106339,
		0.296609,
		-0.94906,
		0,
		-0.969181,
		0.18239,
		0.165596,
		0,
		0.222216,
		0.93742,
		0.268073,
		0,
		-0.094906,
		0.385136,
		-0.2651,
		1
	},
	[0.233333333333] = {
		-0.067158,
		0.326743,
		-0.942724,
		0,
		-0.962307,
		0.228362,
		0.147702,
		0,
		0.263543,
		0.91711,
		0.299091,
		0,
		-0.107492,
		0.367722,
		-0.282652,
		1
	},
	[0.25] = {
		-0.025195,
		0.356232,
		-0.934058,
		0,
		-0.951729,
		0.277364,
		0.131453,
		0,
		0.305902,
		0.892282,
		0.332048,
		0,
		-0.122765,
		0.351518,
		-0.302045,
		1
	},
	[0.266666666667] = {
		0.018755,
		0.384266,
		-0.923032,
		0,
		-0.937333,
		0.328022,
		0.117512,
		0,
		0.34793,
		0.862984,
		0.366337,
		0,
		-0.140087,
		0.3377,
		-0.322906,
		1
	},
	[0.283333333333] = {
		0.063772,
		0.410221,
		-0.909754,
		0,
		-0.919285,
		0.378931,
		0.106425,
		0,
		0.388392,
		0.829536,
		0.401275,
		0,
		-0.158574,
		0.327276,
		-0.344667,
		1
	},
	[0.2] = {
		-0.142094,
		0.266772,
		-0.953227,
		0,
		-0.972726,
		0.140734,
		0.184387,
		0,
		0.183341,
		0.953429,
		0.239499,
		0,
		-0.085389,
		0.402491,
		-0.249594,
		1
	},
	[0.316666666667] = {
		0.152999,
		0.454571,
		-0.877472,
		0,
		-0.874281,
		0.476183,
		0.094243,
		0,
		0.460677,
		0.752738,
		0.470279,
		0,
		-0.194569,
		0.319423,
		-0.387673,
		1
	},
	[0.333333333333] = {
		0.195196,
		0.47293,
		-0.859206,
		0,
		-0.848921,
		0.520189,
		0.093467,
		0,
		0.491153,
		0.711154,
		0.50302,
		0,
		-0.209575,
		0.322695,
		-0.406904,
		1
	},
	[0.35] = {
		0.234625,
		0.489146,
		-0.840052,
		0,
		-0.822981,
		0.559874,
		0.096146,
		0,
		0.517353,
		0.668788,
		0.533918,
		0,
		-0.220889,
		0.330757,
		-0.423086,
		1
	},
	[0.366666666667] = {
		0.270512,
		0.50374,
		-0.820408,
		0,
		-0.797553,
		0.594549,
		0.102084,
		0,
		0.539196,
		0.626704,
		0.562592,
		0,
		-0.227305,
		0.343301,
		-0.434995,
		1
	},
	[0.383333333333] = {
		0.302051,
		0.51735,
		-0.800696,
		0,
		-0.773758,
		0.623667,
		0.111078,
		0,
		0.556834,
		0.585994,
		0.588683,
		0,
		-0.229581,
		0.357695,
		-0.443377,
		1
	},
	[0.3] = {
		0.10886,
		0.433704,
		-0.894456,
		0,
		-0.898035,
		0.428735,
		0.09859,
		0,
		0.426243,
		0.79252,
		0.436153,
		0,
		-0.177142,
		0.321018,
		-0.366568,
		1
	},
	[0.416666666667] = {
		0.349206,
		0.546537,
		-0.761152,
		0,
		-0.734547,
		0.664005,
		0.139781,
		0,
		0.581804,
		0.510289,
		0.633332,
		0,
		-0.227049,
		0.384909,
		-0.453915,
		1
	},
	[0.433333333333] = {
		0.364786,
		0.566223,
		-0.739137,
		0,
		-0.718676,
		0.675941,
		0.163124,
		0,
		0.591977,
		0.471695,
		0.653504,
		0,
		-0.224373,
		0.399133,
		-0.456138,
		1
	},
	[0.45] = {
		0.37636,
		0.588675,
		-0.715412,
		0,
		-0.704796,
		0.683122,
		0.19133,
		0,
		0.601345,
		0.432211,
		0.671995,
		0,
		-0.221233,
		0.413822,
		-0.456548,
		1
	},
	[0.466666666667] = {
		0.38493,
		0.612731,
		-0.69021,
		0,
		-0.692545,
		0.686092,
		0.222843,
		0,
		0.61009,
		0.392222,
		0.688441,
		0,
		-0.217693,
		0.428759,
		-0.455353,
		1
	},
	[0.483333333333] = {
		0.391411,
		0.637221,
		-0.663887,
		0,
		-0.681536,
		0.685492,
		0.256142,
		0,
		0.618308,
		0.352207,
		0.702599,
		0,
		-0.213792,
		0.443705,
		-0.452788,
		1
	},
	[0.4] = {
		0.328504,
		0.530725,
		-0.781291,
		0,
		-0.752693,
		0.646801,
		0.122888,
		0,
		0.57056,
		0.547703,
		0.61195,
		0,
		-0.229163,
		0.371351,
		-0.449703,
		1
	},
	[0.516666666667] = {
		0.401496,
		0.682995,
		-0.610179,
		0,
		-0.661731,
		0.676932,
		0.322297,
		0,
		0.633177,
		0.274373,
		0.723744,
		0,
		-0.204953,
		0.472633,
		-0.44464,
		1
	},
	[0.533333333333] = {
		0.406688,
		0.702211,
		-0.584384,
		0,
		-0.652238,
		0.671079,
		0.352476,
		0,
		0.63968,
		0.23781,
		0.730928,
		0,
		-0.200003,
		0.486106,
		-0.439677,
		1
	},
	[0.55] = {
		0.41314,
		0.717717,
		-0.560534,
		0,
		-0.642566,
		0.665911,
		0.379041,
		0,
		0.64531,
		0.203583,
		0.736294,
		0,
		-0.194675,
		0.498584,
		-0.43458,
		1
	},
	[0.566666666667] = {
		0.421757,
		0.728626,
		-0.539652,
		0,
		-0.63236,
		0.662911,
		0.400836,
		0,
		0.649801,
		0.172199,
		0.740342,
		0,
		-0.188945,
		0.509827,
		-0.429719,
		1
	},
	[0.583333333333] = {
		0.433259,
		0.734097,
		-0.522865,
		0,
		-0.621244,
		0.663551,
		0.41684,
		0,
		0.652949,
		0.144227,
		0.743543,
		0,
		-0.182786,
		0.519605,
		-0.425483,
		1
	},
	[0.5] = {
		0.396663,
		0.661002,
		-0.636974,
		0,
		-0.671385,
		0.682117,
		0.289756,
		0,
		0.62602,
		0.312719,
		0.714357,
		0,
		-0.209545,
		0.458415,
		-0.449119,
		1
	},
	[0.616666666667] = {
		0.465722,
		0.727267,
		-0.504167,
		0,
		-0.595206,
		0.679036,
		0.429699,
		0,
		0.654853,
		0.099963,
		0.749116,
		0,
		-0.169051,
		0.534293,
		-0.419831,
		1
	},
	[0.633333333333] = {
		0.483783,
		0.718215,
		-0.500121,
		0,
		-0.581258,
		0.690887,
		0.429901,
		0,
		0.654288,
		0.082721,
		0.751707,
		0,
		-0.161454,
		0.539787,
		-0.417681,
		1
	},
	[0.65] = {
		0.502275,
		0.706302,
		-0.498857,
		0,
		-0.566837,
		0.704603,
		0.426884,
		0,
		0.653005,
		0.068357,
		0.754262,
		0,
		-0.153485,
		0.544225,
		-0.415839,
		1
	},
	[0.666666666667] = {
		0.520998,
		0.691718,
		-0.500086,
		0,
		-0.551882,
		0.719936,
		0.420854,
		0,
		0.651143,
		0.056724,
		0.756832,
		0,
		-0.145245,
		0.547659,
		-0.41431,
		1
	},
	[0.683333333333] = {
		0.539765,
		0.674633,
		-0.503511,
		0,
		-0.536345,
		0.736612,
		0.411992,
		0,
		0.648836,
		0.047677,
		0.759433,
		0,
		-0.136834,
		0.550143,
		-0.413096,
		1
	},
	[0.6] = {
		0.448306,
		0.733239,
		-0.511255,
		0,
		-0.608752,
		0.669257,
		0.426047,
		0,
		0.654556,
		0.120228,
		0.746393,
		0,
		-0.176173,
		0.527692,
		-0.422268,
		1
	},
	[0.716666666667] = {
		0.576722,
		0.633607,
		-0.515688,
		0,
		-0.503437,
		0.772783,
		0.386468,
		0,
		0.643384,
		0.036732,
		0.764662,
		0,
		-0.119884,
		0.552486,
		-0.411586,
		1
	},
	[0.733333333333] = {
		0.594587,
		0.610005,
		-0.523794,
		0,
		-0.486083,
		0.791645,
		0.370163,
		0,
		0.64046,
		0.034513,
		0.767216,
		0,
		-0.11153,
		0.552467,
		-0.411262,
		1
	},
	[0.75] = {
		0.611846,
		0.584597,
		-0.532814,
		0,
		-0.468183,
		0.810601,
		0.351754,
		0,
		0.637534,
		0.034235,
		0.769662,
		0,
		-0.103374,
		0.55174,
		-0.4112,
		1
	},
	[0.766666666667] = {
		0.628368,
		0.557602,
		-0.542432,
		0,
		-0.449812,
		0.82934,
		0.331458,
		0,
		0.634683,
		0.035715,
		0.771947,
		0,
		-0.095498,
		0.550374,
		-0.411378,
		1
	},
	[0.783333333333] = {
		0.644043,
		0.529265,
		-0.552348,
		0,
		-0.431071,
		0.847571,
		0.309518,
		0,
		0.631971,
		0.038758,
		0.774022,
		0,
		-0.087982,
		0.548442,
		-0.411774,
		1
	},
	[0.7] = {
		0.558395,
		0.655208,
		-0.508819,
		0,
		-0.520198,
		0.754331,
		0.400472,
		0,
		0.646211,
		0.041065,
		0.762053,
		0,
		-0.128349,
		0.551733,
		-0.412192,
		1
	},
	[0.816666666667] = {
		0.673217,
		0.468672,
		-0.571948,
		0,
		-0.391664,
		0.88208,
		0.261792,
		0,
		0.627198,
		0.047769,
		0.777393,
		0,
		-0.07349,
		0.543297,
		-0.413124,
		1
	},
	[0.833333333333] = {
		0.686686,
		0.43673,
		-0.581144,
		0,
		-0.370893,
		0.898026,
		0.236615,
		0,
		0.62522,
		0.053062,
		0.778643,
		0,
		-0.066438,
		0.540249,
		-0.414035,
		1
	},
	[0.85] = {
		0.699132,
		0.40436,
		-0.589667,
		0,
		-0.349916,
		0.912707,
		0.211008,
		0,
		0.623517,
		0.058812,
		0.779595,
		0,
		-0.059797,
		0.536952,
		-0.415078,
		1
	},
	[0.866666666667] = {
		0.710526,
		0.37191,
		-0.597357,
		0,
		-0.328892,
		0.926005,
		0.185325,
		0,
		0.62208,
		0.064788,
		0.780269,
		0,
		-0.053617,
		0.533485,
		-0.416236,
		1
	},
	[0.883333333333] = {
		0.720866,
		0.339741,
		-0.604093,
		0,
		-0.307984,
		0.937853,
		0.15993,
		0,
		0.620885,
		0.070763,
		0.780701,
		0,
		-0.047944,
		0.529926,
		-0.417495,
		1
	},
	[0.8] = {
		0.658777,
		0.49986,
		-0.562275,
		0,
		-0.412084,
		0.86503,
		0.286199,
		0,
		0.629444,
		0.043163,
		0.775846,
		0,
		-0.080898,
		0.54602,
		-0.412363,
		1
	},
	[0.916666666667] = {
		0.7385,
		0.277718,
		-0.614402,
		0,
		-0.26719,
		0.957172,
		0.111498,
		0,
		0.619053,
		0.081821,
		0.781075,
		0,
		-0.038291,
		0.52285,
		-0.420274,
		1
	},
	[0.933333333333] = {
		0.745907,
		0.248601,
		-0.617917,
		0,
		-0.247635,
		0.964738,
		0.089206,
		0,
		0.618304,
		0.086478,
		0.781167,
		0,
		-0.034388,
		0.519488,
		-0.421777,
		1
	},
	[0.95] = {
		0.752441,
		0.221226,
		-0.620397,
		0,
		-0.228849,
		0.971035,
		0.068701,
		0,
		0.617625,
		0.090284,
		0.781273,
		0,
		-0.031175,
		0.516345,
		-0.423345,
		1
	},
	[0.966666666667] = {
		0.758323,
		0.195828,
		-0.62177,
		0,
		-0.210758,
		0.976237,
		0.050423,
		0,
		0.616869,
		0.092806,
		0.781575,
		0,
		-0.028512,
		0.513551,
		-0.424919,
		1
	},
	[0.983333333333] = {
		0.763648,
		0.172615,
		-0.622131,
		0,
		-0.193243,
		0.980532,
		0.034855,
		0,
		0.616035,
		0.093605,
		0.782137,
		0,
		-0.026331,
		0.511238,
		-0.426429,
		1
	},
	[0.9] = {
		0.730176,
		0.30822,
		-0.60979,
		0,
		-0.28736,
		0.948233,
		0.135196,
		0,
		0.619893,
		0.076513,
		0.780947,
		0,
		-0.042822,
		0.526355,
		-0.418844,
		1
	},
	[1.01666666667] = {
		0.772987,
		0.133926,
		-0.620124,
		0,
		-0.160362,
		0.986969,
		0.01326,
		0,
		0.61382,
		0.089195,
		0.784391,
		0,
		-0.02351,
		0.508361,
		-0.429203,
		1
	},
	[1.03333333333] = {
		0.777109,
		0.118997,
		-0.618014,
		0,
		-0.145223,
		0.989367,
		0.007894,
		0,
		0.612383,
		0.083616,
		0.786127,
		0,
		-0.022788,
		0.50744,
		-0.43098,
		1
	},
	[1.05] = {
		0.780887,
		0.106868,
		-0.615463,
		0,
		-0.130964,
		0.991369,
		0.005975,
		0,
		0.61079,
		0.075938,
		0.788143,
		0,
		-0.022322,
		0.506329,
		-0.433594,
		1
	},
	[1.06666666667] = {
		0.784417,
		0.097073,
		-0.61259,
		0,
		-0.117453,
		0.993054,
		0.006964,
		0,
		0.609011,
		0.066488,
		0.79037,
		0,
		-0.022038,
		0.505173,
		-0.43684,
		1
	},
	[1.08333333333] = {
		0.787771,
		0.089149,
		-0.609483,
		0,
		-0.104554,
		0.994466,
		0.010322,
		0,
		0.60703,
		0.055593,
		0.792732,
		0,
		-0.021867,
		0.504116,
		-0.440509,
		1
	},
	[1.11666666667] = {
		0.794151,
		0.077087,
		-0.602812,
		0,
		-0.080039,
		0.996549,
		0.021994,
		0,
		0.602427,
		0.030782,
		0.79758,
		0,
		-0.021592,
		0.502864,
		-0.44829,
		1
	},
	[1.13333333333] = {
		0.797236,
		0.072044,
		-0.599353,
		0,
		-0.068142,
		0.997247,
		0.029232,
		0,
		0.599809,
		0.017536,
		0.799951,
		0,
		-0.021355,
		0.502946,
		-0.452002,
		1
	},
	[1.15] = {
		0.80027,
		0.067061,
		-0.595878,
		0,
		-0.056295,
		0.99774,
		0.036684,
		0,
		0.596992,
		0.004188,
		0.802236,
		0,
		-0.020965,
		0.503683,
		-0.455336,
		1
	},
	[1.16666666667] = {
		0.803249,
		0.061697,
		-0.59244,
		0,
		-0.04435,
		0.998055,
		0.043807,
		0,
		0.59399,
		-0.008913,
		0.804423,
		0,
		-0.020357,
		0.505208,
		-0.458108,
		1
	},
	[1.18333333333] = {
		0.806158,
		0.055512,
		-0.589091,
		0,
		-0.032159,
		0.998228,
		0.050058,
		0,
		0.590826,
		-0.02141,
		0.806515,
		0,
		-0.019469,
		0.507654,
		-0.460136,
		1
	},
	[1.1] = {
		0.791003,
		0.082639,
		-0.606205,
		0,
		-0.092129,
		0.995626,
		0.015511,
		0,
		0.604835,
		0.04358,
		0.795157,
		0,
		-0.021741,
		0.5033,
		-0.444393,
		1
	},
	[1.2] = {
		0.80897,
		0.048072,
		-0.585881,
		0,
		-0.019569,
		0.998301,
		0.054891,
		0,
		0.587524,
		-0.03294,
		0.808536,
		0,
		-0.018238,
		0.511151,
		-0.461248,
		1
	}
}

return spline_matrices
