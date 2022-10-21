local spline_matrices = {
	[0] = {
		0.869683,
		-0.278639,
		-0.407445,
		0,
		0.345074,
		-0.247024,
		0.905485,
		0,
		-0.352952,
		-0.928084,
		-0.118681,
		0,
		0.235187,
		-0.072382,
		0.090882,
		1
	},
	{
		0.914084,
		0.156637,
		-0.374054,
		0,
		-0.122849,
		-0.772091,
		-0.623525,
		0,
		-0.38647,
		0.615906,
		-0.686513,
		0,
		-0.051496,
		0.22354,
		-0.749025,
		1
	},
	[0.0166666666667] = {
		0.873485,
		-0.275361,
		-0.401498,
		0,
		0.341631,
		-0.240878,
		0.908441,
		0,
		-0.346861,
		-0.930674,
		-0.116332,
		0,
		0.234577,
		-0.066184,
		0.090821,
		1
	},
	[0.0333333333333] = {
		0.883783,
		-0.264845,
		-0.385726,
		0,
		0.332446,
		-0.224674,
		0.91597,
		0,
		-0.329253,
		-0.937752,
		-0.110516,
		0,
		0.232838,
		-0.0487,
		0.090198,
		1
	},
	[0.05] = {
		0.898687,
		-0.247945,
		-0.361779,
		0,
		0.318747,
		-0.197374,
		0.927062,
		0,
		-0.301267,
		-0.948455,
		-0.098346,
		0,
		0.23011,
		-0.021261,
		0.088686,
		1
	},
	[0.0666666666667] = {
		0.916184,
		-0.22553,
		-0.331275,
		0,
		0.301192,
		-0.157803,
		0.940416,
		0,
		-0.264368,
		-0.961371,
		-0.076649,
		0,
		0.22653,
		0.014644,
		0.08598,
		1
	},
	[0.0833333333333] = {
		0.938428,
		-0.200078,
		-0.281641,
		0,
		0.265988,
		-0.101792,
		0.958587,
		0,
		-0.220461,
		-0.974478,
		-0.042306,
		0,
		0.219433,
		0.057518,
		0.081815,
		1
	},
	[0.116666666667] = {
		0.981493,
		-0.130894,
		-0.139779,
		0,
		0.148097,
		0.056081,
		0.987381,
		0,
		-0.121404,
		-0.989809,
		0.074428,
		0,
		0.191573,
		0.158239,
		0.068573,
		1
	},
	[0.133333333333] = {
		0.992299,
		-0.086682,
		-0.088478,
		0,
		0.100946,
		0.151999,
		0.983212,
		0,
		-0.071778,
		-0.984572,
		0.159578,
		0,
		0.174254,
		0.213166,
		0.059465,
		1
	},
	[0.15] = {
		0.970499,
		-0.102892,
		-0.218047,
		0,
		0.237385,
		0.249529,
		0.93882,
		0,
		-0.042188,
		-0.962886,
		0.266593,
		0,
		0.156969,
		0.269253,
		0.048617,
		1
	},
	[0.166666666667] = {
		0.929225,
		-0.159315,
		-0.333406,
		0,
		0.369156,
		0.360553,
		0.856577,
		0,
		-0.016255,
		-0.919032,
		0.393848,
		0,
		0.141436,
		0.32509,
		0.035839,
		1
	},
	[0.183333333333] = {
		0.975243,
		-0.082135,
		-0.205318,
		0,
		0.218096,
		0.510689,
		0.831643,
		0,
		0.036546,
		-0.855833,
		0.515959,
		0,
		0.127184,
		0.37926,
		0.021819,
		1
	},
	[0.1] = {
		0.962612,
		-0.169568,
		-0.211246,
		0,
		0.209351,
		-0.029188,
		0.977405,
		0,
		-0.171903,
		-0.985086,
		0.007403,
		0,
		0.207206,
		0.105872,
		0.076031,
		1
	},
	[0.216666666667] = {
		0.98724,
		0.04695,
		-0.152158,
		0,
		0.046629,
		0.828421,
		0.558161,
		0,
		0.152256,
		-0.558134,
		0.815662,
		0,
		0.11356,
		0.495227,
		-0.030781,
		1
	},
	[0.233333333333] = {
		0.964412,
		0.069497,
		-0.255106,
		0,
		-0.017859,
		0.979756,
		0.199395,
		0,
		0.263799,
		-0.187743,
		0.94613,
		0,
		0.097043,
		0.579231,
		-0.094783,
		1
	},
	[0.25] = {
		0.923813,
		0.089827,
		-0.372157,
		0,
		-0.186465,
		0.954563,
		-0.232465,
		0,
		0.334366,
		0.284148,
		0.898587,
		0,
		0.049062,
		0.663277,
		-0.174108,
		1
	},
	[0.266666666667] = {
		0.879151,
		0.107931,
		-0.464159,
		0,
		-0.396026,
		0.707232,
		-0.58565,
		0,
		0.265059,
		0.698694,
		0.664507,
		0,
		-0.017334,
		0.729745,
		-0.253967,
		1
	},
	[0.283333333333] = {
		0.857606,
		0.121711,
		-0.499698,
		0,
		-0.508892,
		0.341435,
		-0.790222,
		0,
		0.074435,
		0.931992,
		0.354755,
		0,
		-0.078466,
		0.762246,
		-0.321952,
		1
	},
	[0.2] = {
		0.994063,
		0.023752,
		-0.106177,
		0,
		0.0651,
		0.652079,
		0.755351,
		0,
		0.087177,
		-0.757779,
		0.646662,
		0,
		0.1173,
		0.430302,
		0.005513,
		1
	},
	[0.316666666667] = {
		0.93177,
		0.040862,
		-0.360742,
		0,
		-0.34939,
		-0.169064,
		-0.921599,
		0,
		-0.098647,
		0.984758,
		-0.143252,
		0,
		-0.132485,
		0.737527,
		-0.494619,
		1
	},
	[0.333333333333] = {
		0.93458,
		0.039426,
		-0.353561,
		0,
		-0.323751,
		-0.317695,
		-0.89121,
		0,
		-0.147461,
		0.947373,
		-0.284147,
		0,
		-0.155019,
		0.707942,
		-0.595173,
		1
	},
	[0.35] = {
		0.935435,
		0.038675,
		-0.351377,
		0,
		-0.294863,
		-0.462895,
		-0.835933,
		0,
		-0.194981,
		0.885569,
		-0.421605,
		0,
		-0.171209,
		0.672725,
		-0.681069,
		1
	},
	[0.366666666667] = {
		0.935396,
		0.036588,
		-0.351704,
		0,
		-0.255236,
		-0.618508,
		-0.74317,
		0,
		-0.244723,
		0.784926,
		-0.569212,
		0,
		-0.173779,
		0.633328,
		-0.721444,
		1
	},
	[0.383333333333] = {
		0.93501,
		0.036706,
		-0.352715,
		0,
		-0.180535,
		-0.806818,
		-0.56254,
		0,
		-0.305226,
		0.589659,
		-0.747757,
		0,
		-0.166146,
		0.593874,
		-0.726013,
		1
	},
	[0.3] = {
		0.925727,
		0.046102,
		-0.375372,
		0,
		-0.376005,
		0.005599,
		-0.926601,
		0,
		-0.040617,
		0.998921,
		0.022517,
		0,
		-0.110812,
		0.76121,
		-0.40712,
		1
	},
	[0.416666666667] = {
		0.935809,
		0.053261,
		-0.34846,
		0,
		-0.026542,
		-0.975068,
		-0.220315,
		0,
		-0.351506,
		0.215422,
		-0.911064,
		0,
		-0.141255,
		0.520325,
		-0.726243,
		1
	},
	[0.433333333333] = {
		0.93612,
		0.067068,
		-0.345226,
		0,
		-0.020885,
		-0.969312,
		-0.244945,
		0,
		-0.35106,
		0.236508,
		-0.905992,
		0,
		-0.127636,
		0.485278,
		-0.724778,
		1
	},
	[0.45] = {
		0.934923,
		0.082711,
		-0.345076,
		0,
		-0.020616,
		-0.958153,
		-0.285515,
		0,
		-0.354251,
		0.274049,
		-0.894094,
		0,
		-0.116391,
		0.449898,
		-0.723991,
		1
	},
	[0.466666666667] = {
		0.93112,
		0.098896,
		-0.351048,
		0,
		-0.026082,
		-0.942013,
		-0.334562,
		0,
		-0.363778,
		0.320673,
		-0.874548,
		0,
		-0.10934,
		0.413074,
		-0.724773,
		1
	},
	[0.483333333333] = {
		0.925105,
		0.115142,
		-0.361833,
		0,
		-0.037206,
		-0.920843,
		-0.388154,
		0,
		-0.377884,
		0.372545,
		-0.847593,
		0,
		-0.105905,
		0.376428,
		-0.726584,
		1
	},
	[0.4] = {
		0.935082,
		0.042654,
		-0.351856,
		0,
		-0.081283,
		-0.940467,
		-0.330024,
		0,
		-0.344985,
		0.337199,
		-0.875946,
		0,
		-0.155147,
		0.556151,
		-0.727151,
		1
	},
	[0.516666666667] = {
		0.911517,
		0.146856,
		-0.384149,
		0,
		-0.071274,
		-0.863528,
		-0.499239,
		0,
		-0.40504,
		0.482444,
		-0.776653,
		0,
		-0.101122,
		0.313431,
		-0.730378,
		1
	},
	[0.533333333333] = {
		0.906975,
		0.160415,
		-0.389439,
		0,
		-0.08902,
		-0.83073,
		-0.549511,
		0,
		-0.411668,
		0.533061,
		-0.739172,
		0,
		-0.095403,
		0.287248,
		-0.732783,
		1
	},
	[0.55] = {
		0.904268,
		0.171639,
		-0.390948,
		0,
		-0.104498,
		-0.798826,
		-0.592416,
		0,
		-0.413981,
		0.576556,
		-0.704417,
		0,
		-0.088065,
		0.265311,
		-0.735228,
		1
	},
	[0.566666666667] = {
		0.902204,
		0.180297,
		-0.391819,
		0,
		-0.11747,
		-0.771379,
		-0.62544,
		0,
		-0.415005,
		0.610301,
		-0.674761,
		0,
		-0.082142,
		0.248329,
		-0.737197,
		1
	},
	[0.583333333333] = {
		0.901015,
		0.185678,
		-0.392041,
		0,
		-0.126404,
		-0.752158,
		-0.646746,
		0,
		-0.414963,
		0.632283,
		-0.654235,
		0,
		-0.077987,
		0.237063,
		-0.738544,
		1
	},
	[0.5] = {
		0.918097,
		0.131445,
		-0.373926,
		0,
		-0.052955,
		-0.894272,
		-0.444381,
		0,
		-0.392803,
		0.427786,
		-0.814067,
		0,
		-0.103895,
		0.343134,
		-0.728382,
		1
	},
	[0.616666666667] = {
		0.901485,
		0.186162,
		-0.390729,
		0,
		-0.130055,
		-0.744534,
		-0.654793,
		0,
		-0.412809,
		0.641103,
		-0.646975,
		0,
		-0.07505,
		0.231018,
		-0.739338,
		1
	},
	[0.633333333333] = {
		0.902109,
		0.185212,
		-0.389738,
		0,
		-0.130137,
		-0.74437,
		-0.654964,
		0,
		-0.411416,
		0.641568,
		-0.6474,
		0,
		-0.074012,
		0.229873,
		-0.739557,
		1
	},
	[0.65] = {
		0.90279,
		0.184182,
		-0.388648,
		0,
		-0.130119,
		-0.744341,
		-0.655,
		0,
		-0.409926,
		0.641898,
		-0.648019,
		0,
		-0.072862,
		0.228781,
		-0.739809,
		1
	},
	[0.666666666667] = {
		0.903518,
		0.183048,
		-0.387491,
		0,
		-0.130009,
		-0.744501,
		-0.65484,
		0,
		-0.408355,
		0.642037,
		-0.648872,
		0,
		-0.071616,
		0.227667,
		-0.740112,
		1
	},
	[0.683333333333] = {
		0.904283,
		0.181821,
		-0.386282,
		0,
		-0.129817,
		-0.74484,
		-0.654493,
		0,
		-0.406719,
		0.641993,
		-0.649942,
		0,
		-0.070291,
		0.226527,
		-0.74046,
		1
	},
	[0.6] = {
		0.900926,
		0.187047,
		-0.391594,
		0,
		-0.129864,
		-0.744799,
		-0.65453,
		0,
		-0.414086,
		0.640537,
		-0.646719,
		0,
		-0.075959,
		0.232272,
		-0.739141,
		1
	},
	[0.716666666667] = {
		0.905886,
		0.179139,
		-0.38377,
		0,
		-0.129228,
		-0.746014,
		-0.653272,
		0,
		-0.403324,
		0.641384,
		-0.652654,
		0,
		-0.067467,
		0.224144,
		-0.741279,
		1
	},
	[0.733333333333] = {
		0.906707,
		0.177708,
		-0.382496,
		0,
		-0.128849,
		-0.746829,
		-0.652414,
		0,
		-0.401598,
		0.640832,
		-0.654258,
		0,
		-0.066002,
		0.222892,
		-0.741742,
		1
	},
	[0.75] = {
		0.907527,
		0.176233,
		-0.381231,
		0,
		-0.128426,
		-0.747784,
		-0.651402,
		0,
		-0.399877,
		0.640125,
		-0.656002,
		0,
		-0.064524,
		0.221592,
		-0.742236,
		1
	},
	[0.766666666667] = {
		0.908338,
		0.174726,
		-0.37999,
		0,
		-0.12797,
		-0.748869,
		-0.650246,
		0,
		-0.398177,
		0.63927,
		-0.657867,
		0,
		-0.06305,
		0.22024,
		-0.742757,
		1
	},
	[0.783333333333] = {
		0.909132,
		0.173198,
		-0.378789,
		0,
		-0.127489,
		-0.750072,
		-0.648951,
		0,
		-0.396516,
		0.638274,
		-0.659834,
		0,
		-0.061593,
		0.219019,
		-0.743282,
		1
	},
	[0.7] = {
		0.905075,
		0.180514,
		-0.385037,
		0,
		-0.129554,
		-0.745347,
		-0.653968,
		0,
		-0.405036,
		0.641773,
		-0.651209,
		0,
		-0.068902,
		0.225354,
		-0.740851,
		1
	},
	[0.816666666667] = {
		0.910632,
		0.170126,
		-0.376573,
		0,
		-0.126494,
		-0.752798,
		-0.645984,
		0,
		-0.393381,
		0.635887,
		-0.664002,
		0,
		-0.058784,
		0.217477,
		-0.744284,
		1
	},
	[0.833333333333] = {
		0.911321,
		0.168603,
		-0.375589,
		0,
		-0.125998,
		-0.754299,
		-0.644327,
		0,
		-0.391942,
		0.634512,
		-0.666165,
		0,
		-0.057466,
		0.217115,
		-0.744763,
		1
	},
	[0.85] = {
		0.911958,
		0.167104,
		-0.374711,
		0,
		-0.125517,
		-0.755879,
		-0.642566,
		0,
		-0.390611,
		0.633027,
		-0.668356,
		0,
		-0.056229,
		0.216997,
		-0.745229,
		1
	},
	[0.866666666667] = {
		0.912536,
		0.165637,
		-0.373955,
		0,
		-0.12506,
		-0.757529,
		-0.64071,
		0,
		-0.389407,
		0.631438,
		-0.670558,
		0,
		-0.05509,
		0.217103,
		-0.745684,
		1
	},
	[0.883333333333] = {
		0.913046,
		0.164214,
		-0.373338,
		0,
		-0.124637,
		-0.759238,
		-0.638767,
		0,
		-0.388347,
		0.629755,
		-0.672752,
		0,
		-0.054067,
		0.217413,
		-0.746128,
		1
	},
	[0.8] = {
		0.909899,
		0.171661,
		-0.377645,
		0,
		-0.126994,
		-0.751385,
		-0.647528,
		0,
		-0.394912,
		0.637144,
		-0.661885,
		0,
		-0.060165,
		0.218105,
		-0.743791,
		1
	},
	[0.916666666667] = {
		0.913828,
		0.161534,
		-0.372592,
		0,
		-0.12393,
		-0.762793,
		-0.634656,
		0,
		-0.386729,
		0.626141,
		-0.677043,
		0,
		-0.05244,
		0.218562,
		-0.746992,
		1
	},
	[0.933333333333] = {
		0.914085,
		0.160295,
		-0.372497,
		0,
		-0.123666,
		-0.76462,
		-0.632505,
		0,
		-0.386206,
		0.624228,
		-0.679105,
		0,
		-0.051872,
		0.21936,
		-0.747412,
		1
	},
	[0.95] = {
		0.914241,
		0.159136,
		-0.372611,
		0,
		-0.123474,
		-0.766467,
		-0.630303,
		0,
		-0.385898,
		0.622257,
		-0.681087,
		0,
		-0.051492,
		0.22028,
		-0.747824,
		1
	},
	[0.966666666667] = {
		0.91428,
		0.158121,
		-0.372947,
		0,
		-0.123313,
		-0.768333,
		-0.628059,
		0,
		-0.385857,
		0.620212,
		-0.682973,
		0,
		-0.051329,
		0.221298,
		-0.748228,
		1
	},
	[0.983333333333] = {
		0.914216,
		0.157296,
		-0.373452,
		0,
		-0.123114,
		-0.770212,
		-0.625793,
		0,
		-0.386072,
		0.618087,
		-0.684775,
		0,
		-0.051351,
		0.222391,
		-0.748627,
		1
	},
	[0.9] = {
		0.913479,
		0.162843,
		-0.372878,
		0,
		-0.124257,
		-0.760996,
		-0.636746,
		0,
		-0.387448,
		0.627987,
		-0.67492,
		0,
		-0.053178,
		0.217906,
		-0.746564,
		1
	},
	[1.01666666667] = {
		0.913893,
		0.156126,
		-0.374732,
		0,
		-0.122526,
		-0.773957,
		-0.621271,
		0,
		-0.387023,
		0.61369,
		-0.688184,
		0,
		-0.051747,
		0.224726,
		-0.749421,
		1
	},
	[1.03333333333] = {
		0.913655,
		0.155647,
		-0.375511,
		0,
		-0.122153,
		-0.775961,
		-0.61884,
		0,
		-0.387702,
		0.611276,
		-0.689948,
		0,
		-0.052084,
		0.225732,
		-0.749875,
		1
	},
	[1.05] = {
		0.91338,
		0.155099,
		-0.376405,
		0,
		-0.121737,
		-0.778223,
		-0.616075,
		0,
		-0.38848,
		0.608533,
		-0.691933,
		0,
		-0.052492,
		0.226375,
		-0.750436,
		1
	},
	[1.06666666667] = {
		0.91308,
		0.154491,
		-0.377383,
		0,
		-0.121286,
		-0.780682,
		-0.613046,
		0,
		-0.389326,
		0.605531,
		-0.694087,
		0,
		-0.052951,
		0.22669,
		-0.751086,
		1
	},
	[1.08333333333] = {
		0.912764,
		0.153834,
		-0.378414,
		0,
		-0.120809,
		-0.783278,
		-0.60982,
		0,
		-0.390214,
		0.602338,
		-0.696364,
		0,
		-0.053442,
		0.22671,
		-0.751807,
		1
	},
	[1.11666666667] = {
		0.912131,
		0.152408,
		-0.380512,
		0,
		-0.119802,
		-0.788648,
		-0.603061,
		0,
		-0.392001,
		0.595656,
		-0.701091,
		0,
		-0.054442,
		0.226008,
		-0.75339,
		1
	},
	[1.13333333333] = {
		0.911836,
		0.151661,
		-0.381516,
		0,
		-0.119289,
		-0.791308,
		-0.599668,
		0,
		-0.392843,
		0.59231,
		-0.703451,
		0,
		-0.054912,
		0.225355,
		-0.754212,
		1
	},
	[1.15] = {
		0.91157,
		0.150908,
		-0.382449,
		0,
		-0.11878,
		-0.793877,
		-0.596364,
		0,
		-0.393613,
		0.589055,
		-0.70575,
		0,
		-0.055334,
		0.224548,
		-0.755028,
		1
	},
	[1.16666666667] = {
		0.911345,
		0.15016,
		-0.383279,
		0,
		-0.118283,
		-0.796303,
		-0.593221,
		0,
		-0.394284,
		0.585964,
		-0.707945,
		0,
		-0.055688,
		0.223623,
		-0.755818,
		1
	},
	[1.18333333333] = {
		0.911172,
		0.14943,
		-0.383975,
		0,
		-0.117804,
		-0.798532,
		-0.590312,
		0,
		-0.394827,
		0.58311,
		-0.709997,
		0,
		-0.055952,
		0.222615,
		-0.756562,
		1
	},
	[1.1] = {
		0.912444,
		0.153136,
		-0.379467,
		0,
		-0.120311,
		-0.785952,
		-0.606468,
		0,
		-0.391115,
		0.599023,
		-0.698714,
		0,
		-0.053945,
		0.226471,
		-0.752582,
		1
	},
	[1.21666666667] = {
		0.910999,
		0.148082,
		-0.384907,
		0,
		-0.11698,
		-0.802195,
		-0.58549,
		0,
		-0.395471,
		0.578407,
		-0.713476,
		0,
		-0.056184,
		0.220497,
		-0.757827,
		1
	},
	[1.23333333333] = {
		0.910958,
		0.147493,
		-0.385229,
		0,
		-0.116741,
		-0.803528,
		-0.583708,
		0,
		-0.395635,
		0.576705,
		-0.714762,
		0,
		-0.056236,
		0.219459,
		-0.758301,
		1
	},
	[1.25] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.26666666667] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.28333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.2] = {
		0.911062,
		0.148733,
		-0.384505,
		0,
		-0.117353,
		-0.800513,
		-0.587713,
		0,
		-0.395214,
		0.580566,
		-0.711863,
		0,
		-0.056105,
		0.221561,
		-0.757239,
		1
	},
	[1.31666666667] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.33333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.35] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.36666666667] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.38333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.3] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.41666666667] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.43333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.45] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.46666666667] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.48333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.4] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.5] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	}
}

return spline_matrices