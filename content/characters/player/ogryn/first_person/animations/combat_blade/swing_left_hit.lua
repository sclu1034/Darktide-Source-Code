local spline_matrices = {
	[0] = {
		0.887516,
		0.062273,
		-0.456549,
		0,
		-0.448493,
		-0.110505,
		-0.886929,
		0,
		-0.105682,
		0.991923,
		-0.070146,
		0,
		0.665392,
		-0.075736,
		-1.311946,
		1
	},
	{
		0.203636,
		0.36857,
		-0.907022,
		0,
		-0.611486,
		-0.675634,
		-0.41183,
		0,
		-0.764603,
		0.638494,
		0.087792,
		0,
		-0.020065,
		0.195296,
		-0.969106,
		1
	},
	[0.0166666666667] = {
		0.873883,
		0.015115,
		-0.485901,
		0,
		-0.485542,
		-0.022271,
		-0.87393,
		0,
		-0.024031,
		0.999638,
		-0.012123,
		0,
		0.667886,
		-0.056342,
		-1.300685,
		1
	},
	[0.0333333333333] = {
		0.853568,
		-0.034493,
		-0.519839,
		0,
		-0.516477,
		0.074915,
		-0.853018,
		0,
		0.068367,
		0.996593,
		0.04613,
		0,
		0.683368,
		-0.02755,
		-1.274492,
		1
	},
	[0.05] = {
		0.824851,
		-0.085202,
		-0.558893,
		0,
		-0.538723,
		0.181359,
		-0.822731,
		0,
		0.171458,
		0.979719,
		0.103694,
		0,
		0.710791,
		0.009994,
		-1.234822,
		1
	},
	[0.0666666666667] = {
		0.786049,
		-0.134911,
		-0.603263,
		0,
		-0.54897,
		0.296287,
		-0.781566,
		0,
		0.28418,
		0.945523,
		0.158834,
		0,
		0.749194,
		0.055465,
		-1.183149,
		1
	},
	[0.0833333333333] = {
		0.735826,
		-0.180691,
		-0.652619,
		0,
		-0.543443,
		0.417426,
		-0.728303,
		0,
		0.404018,
		0.890565,
		0.208958,
		0,
		0.797647,
		0.107791,
		-1.121025,
		1
	},
	[0.116666666667] = {
		0.600357,
		-0.245547,
		-0.761103,
		0,
		-0.471338,
		0.660201,
		-0.584786,
		0,
		0.646074,
		0.709817,
		0.280621,
		0,
		0.920505,
		0.227336,
		-0.972407,
		1
	},
	[0.133333333333] = {
		0.518438,
		-0.257144,
		-0.815536,
		0,
		-0.401437,
		0.768901,
		-0.497634,
		0,
		0.75503,
		0.585379,
		0.2954,
		0,
		0.992118,
		0.291204,
		-0.889978,
		1
	},
	[0.15] = {
		0.432109,
		-0.251543,
		-0.86603,
		0,
		-0.311009,
		0.859832,
		-0.404922,
		0,
		0.846496,
		0.444314,
		0.293309,
		0,
		1.067942,
		0.355575,
		-0.80523,
		1
	},
	[0.166666666667] = {
		0.346689,
		-0.228765,
		-0.909655,
		0,
		-0.205337,
		0.927769,
		-0.311579,
		0,
		0.915229,
		0.294807,
		0.274674,
		0,
		1.145484,
		0.419152,
		-0.720639,
		1
	},
	[0.183333333333] = {
		0.267582,
		-0.191206,
		-0.944373,
		0,
		-0.091927,
		0.970576,
		-0.222558,
		0,
		0.95914,
		0.146366,
		0.242132,
		0,
		1.221984,
		0.481168,
		-0.638613,
		1
	},
	[0.1] = {
		0.673659,
		-0.21889,
		-0.705883,
		0,
		-0.518461,
		0.540691,
		-0.662458,
		0,
		0.52667,
		0.812244,
		0.250755,
		0,
		0.855155,
		0.165618,
		-1.050142,
		1
	},
	[0.216666666667] = {
		0.144246,
		-0.08968,
		-0.98547,
		0,
		0.125978,
		0.989446,
		-0.071602,
		0,
		0.98149,
		-0.113819,
		0.154022,
		0,
		1.361038,
		0.600072,
		-0.490664,
		1
	},
	[0.233333333333] = {
		0.103697,
		-0.035847,
		-0.993963,
		0,
		0.217463,
		0.975988,
		-0.012512,
		0,
		0.970545,
		-0.214853,
		0.109003,
		0,
		1.418906,
		0.657542,
		-0.428192,
		1
	},
	[0.25] = {
		0.077136,
		0.014247,
		-0.996919,
		0,
		0.291884,
		0.955767,
		0.036243,
		0,
		0.953338,
		-0.293781,
		0.069566,
		0,
		1.466497,
		0.714187,
		-0.375287,
		1
	},
	[0.266666666667] = {
		0.063406,
		0.057623,
		-0.996323,
		0,
		0.347331,
		0.934645,
		0.07616,
		0,
		0.935596,
		-0.350883,
		0.039248,
		0,
		1.502288,
		0.77022,
		-0.33322,
		1
	},
	[0.283333333333] = {
		0.061194,
		0.092387,
		-0.993841,
		0,
		0.382846,
		0.917377,
		0.108852,
		0,
		0.921783,
		-0.387149,
		0.020768,
		0,
		1.524803,
		0.825616,
		-0.303265,
		1
	},
	[0.2] = {
		0.199193,
		-0.143129,
		-0.969451,
		0,
		0.020983,
		0.989672,
		-0.141803,
		0,
		0.979736,
		0.007904,
		0.200139,
		0,
		1.294678,
		0.541408,
		-0.561331,
		1
	},
	[0.316666666667] = {
		0.098213,
		0.122445,
		-0.987604,
		0,
		0.392562,
		0.90716,
		0.15151,
		0,
		0.914467,
		-0.402576,
		0.041028,
		0,
		1.499123,
		0.946478,
		-0.279119,
		1
	},
	[0.333333333333] = {
		0.149875,
		0.106658,
		-0.982935,
		0,
		0.36703,
		0.917123,
		0.15548,
		0,
		0.918056,
		-0.384069,
		0.098308,
		0,
		1.410356,
		1.032562,
		-0.274061,
		1
	},
	[0.35] = {
		0.213965,
		0.084945,
		-0.973141,
		0,
		0.318198,
		0.935816,
		0.151649,
		0,
		0.923563,
		-0.3421,
		0.173202,
		0,
		1.281377,
		1.129816,
		-0.270987,
		1
	},
	[0.366666666667] = {
		0.280792,
		0.072191,
		-0.95705,
		0,
		0.241252,
		0.959842,
		0.143183,
		0,
		0.928953,
		-0.271095,
		0.252099,
		0,
		1.127559,
		1.2297,
		-0.26942,
		1
	},
	[0.383333333333] = {
		0.339761,
		0.083064,
		-0.936837,
		0,
		0.128325,
		0.982683,
		0.133668,
		0,
		0.931716,
		-0.165635,
		0.323218,
		0,
		0.963482,
		1.322916,
		-0.268791,
		1
	},
	[0.3] = {
		0.069479,
		0.117517,
		-0.990637,
		0,
		0.397711,
		0.907444,
		0.135541,
		0,
		0.914876,
		-0.403405,
		0.016311,
		0,
		1.532402,
		0.880059,
		-0.286783,
		1
	},
	[0.416666666667] = {
		0.364214,
		0.242624,
		-0.899156,
		0,
		-0.305249,
		0.943237,
		0.130873,
		0,
		0.87987,
		0.226801,
		0.417601,
		0,
		0.603976,
		1.446067,
		-0.267785,
		1
	},
	[0.433333333333] = {
		0.272482,
		0.386559,
		-0.881094,
		0,
		-0.650711,
		0.748597,
		0.127194,
		0,
		0.708752,
		0.538679,
		0.455517,
		0,
		0.36146,
		1.45133,
		-0.270408,
		1
	},
	[0.45] = {
		0.12819,
		0.481918,
		-0.866789,
		0,
		-0.890136,
		0.441281,
		0.113701,
		0,
		0.437292,
		0.756985,
		0.485541,
		0,
		0.151756,
		1.419141,
		-0.27633,
		1
	},
	[0.466666666667] = {
		0.01951,
		0.513715,
		-0.857739,
		0,
		-0.974681,
		0.200905,
		0.098156,
		0,
		0.222749,
		0.834106,
		0.504628,
		0,
		0.034343,
		1.383547,
		-0.283711,
		1
	},
	[0.483333333333] = {
		-0.026243,
		0.5232,
		-0.851806,
		0,
		-0.991738,
		0.093409,
		0.087928,
		0,
		0.12557,
		0.847075,
		0.516426,
		0,
		-0.005839,
		1.365205,
		-0.290394,
		1
	},
	[0.4] = {
		0.376092,
		0.131332,
		-0.917228,
		0,
		-0.031848,
		0.991152,
		0.128858,
		0,
		0.926035,
		-0.019251,
		0.376946,
		0,
		0.80275,
		1.398743,
		-0.268109,
		1
	},
	[0.516666666667] = {
		-0.0336,
		0.537919,
		-0.842326,
		0,
		-0.993684,
		0.072303,
		0.085811,
		0,
		0.107062,
		0.83989,
		0.532093,
		0,
		-0.021556,
		1.359873,
		-0.301937,
		1
	},
	[0.533333333333] = {
		-0.014235,
		0.547105,
		-0.836943,
		0,
		-0.988963,
		0.115749,
		0.092485,
		0,
		0.147475,
		0.829023,
		0.539419,
		0,
		-0.023378,
		1.365594,
		-0.308353,
		1
	},
	[0.55] = {
		0.008113,
		0.557043,
		-0.830444,
		0,
		-0.980487,
		0.167556,
		0.102813,
		0,
		0.196417,
		0.813405,
		0.547533,
		0,
		-0.037454,
		1.372183,
		-0.316381,
		1
	},
	[0.566666666667] = {
		0.049558,
		0.568555,
		-0.821151,
		0,
		-0.957452,
		0.261077,
		0.122982,
		0,
		0.284306,
		0.780118,
		0.557303,
		0,
		-0.072147,
		1.378458,
		-0.329199,
		1
	},
	[0.583333333333] = {
		0.108191,
		0.573631,
		-0.811937,
		0,
		-0.909517,
		0.386837,
		0.152107,
		0,
		0.401341,
		0.722014,
		0.563579,
		0,
		-0.115209,
		1.383425,
		-0.345519,
		1
	},
	[0.5] = {
		-0.040575,
		0.529939,
		-0.847065,
		0,
		-0.99477,
		0.058107,
		0.084004,
		0,
		0.093738,
		0.846043,
		0.524809,
		0,
		-0.0198,
		1.358569,
		-0.296227,
		1
	},
	[0.616666666667] = {
		0.119737,
		0.571658,
		-0.811708,
		0,
		-0.874048,
		0.448453,
		0.186897,
		0,
		0.470854,
		0.687093,
		0.553353,
		0,
		-0.176392,
		1.382775,
		-0.366963,
		1
	},
	[0.633333333333] = {
		0.097371,
		0.571244,
		-0.814984,
		0,
		-0.890598,
		0.41553,
		0.184852,
		0,
		0.444246,
		0.707824,
		0.549209,
		0,
		-0.19742,
		1.376927,
		-0.372511,
		1
	},
	[0.65] = {
		0.144145,
		0.57199,
		-0.807496,
		0,
		-0.877092,
		0.451682,
		0.16338,
		0,
		0.458182,
		0.684698,
		0.566796,
		0,
		-0.219969,
		1.379878,
		-0.37913,
		1
	},
	[0.666666666667] = {
		0.215599,
		0.569789,
		-0.793005,
		0,
		-0.852854,
		0.505383,
		0.131257,
		0,
		0.47556,
		0.648019,
		0.594907,
		0,
		-0.244259,
		1.37862,
		-0.387055,
		1
	},
	[0.683333333333] = {
		0.254729,
		0.572449,
		-0.779369,
		0,
		-0.856867,
		0.507178,
		0.092466,
		0,
		0.448211,
		0.644261,
		0.619705,
		0,
		-0.291135,
		1.351002,
		-0.405682,
		1
	},
	[0.6] = {
		0.143938,
		0.572021,
		-0.807511,
		0,
		-0.867475,
		0.465609,
		0.1752,
		0,
		0.476203,
		0.675278,
		0.563233,
		0,
		-0.153133,
		1.386057,
		-0.359927,
		1
	},
	[0.716666666667] = {
		0.185113,
		0.615202,
		-0.766328,
		0,
		-0.96162,
		0.274111,
		-0.012234,
		0,
		0.202533,
		0.739182,
		0.642333,
		0,
		-0.485325,
		1.16204,
		-0.480263,
		1
	},
	[0.733333333333] = {
		0.115235,
		0.628154,
		-0.769508,
		0,
		-0.993058,
		0.091235,
		-0.074236,
		0,
		0.023574,
		0.772721,
		0.634307,
		0,
		-0.589723,
		1.023863,
		-0.529363,
		1
	},
	[0.75] = {
		0.051017,
		0.622543,
		-0.780921,
		0,
		-0.987115,
		-0.08731,
		-0.13409,
		0,
		-0.151659,
		0.7777,
		0.610067,
		0,
		-0.666389,
		0.883036,
		-0.582756,
		1
	},
	[0.766666666667] = {
		0.015172,
		0.602503,
		-0.797972,
		0,
		-0.956428,
		-0.223977,
		-0.187297,
		0,
		-0.291574,
		0.766044,
		0.572853,
		0,
		-0.696233,
		0.760898,
		-0.637805,
		1
	},
	[0.783333333333] = {
		0.012452,
		0.571671,
		-0.820389,
		0,
		-0.916375,
		-0.321786,
		-0.238138,
		0,
		-0.400126,
		0.754749,
		0.519858,
		0,
		-0.695634,
		0.647461,
		-0.703046,
		1
	},
	[0.7] = {
		0.237423,
		0.591193,
		-0.770793,
		0,
		-0.905421,
		0.422136,
		0.044885,
		0,
		0.351915,
		0.687235,
		0.635503,
		0,
		-0.376866,
		1.277018,
		-0.438302,
		1
	},
	[0.816666666667] = {
		0.066139,
		0.488736,
		-0.869921,
		0,
		-0.814368,
		-0.477333,
		-0.330089,
		0,
		-0.576568,
		0.730267,
		0.36644,
		0,
		-0.682583,
		0.410319,
		-0.860512,
		1
	},
	[0.833333333333] = {
		0.107845,
		0.447827,
		-0.887592,
		0,
		-0.760644,
		-0.53771,
		-0.363717,
		0,
		-0.640149,
		0.714366,
		0.282648,
		0,
		-0.668802,
		0.310237,
		-0.93099,
		1
	},
	[0.85] = {
		0.147167,
		0.414024,
		-0.898291,
		0,
		-0.711631,
		-0.586436,
		-0.386876,
		0,
		-0.686966,
		0.696187,
		0.208328,
		0,
		-0.649754,
		0.238585,
		-0.98185,
		1
	},
	[0.866666666667] = {
		0.174107,
		0.391804,
		-0.903425,
		0,
		-0.672485,
		-0.622877,
		-0.399735,
		0,
		-0.719341,
		0.677136,
		0.155034,
		0,
		-0.625479,
		0.207622,
		-1.00288,
		1
	},
	[0.883333333333] = {
		0.189446,
		0.378982,
		-0.905805,
		0,
		-0.64365,
		-0.648727,
		-0.40604,
		0,
		-0.741502,
		0.659944,
		0.121033,
		0,
		-0.589037,
		0.201895,
		-1.004263,
		1
	},
	[0.8] = {
		0.031594,
		0.531793,
		-0.846285,
		0,
		-0.867758,
		-0.405568,
		-0.287249,
		0,
		-0.495983,
		0.743445,
		0.448654,
		0,
		-0.691346,
		0.526706,
		-0.780938,
		1
	},
	[0.916666666667] = {
		0.208057,
		0.364591,
		-0.907626,
		0,
		-0.607575,
		-0.679026,
		-0.412039,
		0,
		-0.766528,
		0.637179,
		0.080241,
		0,
		-0.467757,
		0.194804,
		-1.000266,
		1
	},
	[0.933333333333] = {
		0.212048,
		0.36175,
		-0.90784,
		0,
		-0.5992,
		-0.685728,
		-0.413202,
		0,
		-0.772007,
		0.631596,
		0.071353,
		0,
		-0.388941,
		0.193171,
		-0.995782,
		1
	},
	[0.95] = {
		0.213097,
		0.36113,
		-0.907841,
		0,
		-0.596266,
		-0.688014,
		-0.413646,
		0,
		-0.773988,
		0.629461,
		0.068716,
		0,
		-0.301902,
		0.192599,
		-0.990127,
		1
	},
	[0.966666666667] = {
		0.2117,
		0.362311,
		-0.907697,
		0,
		-0.597927,
		-0.686642,
		-0.413529,
		0,
		-0.773089,
		0.63028,
		0.071273,
		0,
		-0.209503,
		0.192897,
		-0.983603,
		1
	},
	[0.983333333333] = {
		0.208372,
		0.364911,
		-0.907426,
		0,
		-0.603301,
		-0.682298,
		-0.412914,
		0,
		-0.769811,
		0.63349,
		0.07798,
		0,
		-0.114605,
		0.193866,
		-0.976501,
		1
	},
	[0.9] = {
		0.200659,
		0.370142,
		-0.907045,
		0,
		-0.62217,
		-0.667036,
		-0.409839,
		0,
		-0.75673,
		0.646574,
		0.096445,
		0,
		-0.535452,
		0.197668,
		-1.003234,
		1
	},
	[1.01666666667] = {
		0.197968,
		0.37299,
		-0.90647,
		0,
		-0.621481,
		-0.667372,
		-0.410336,
		0,
		-0.758003,
		0.644588,
		0.099688,
		0,
		0.071229,
		0.197017,
		-0.961696,
		1
	},
	[1.03333333333] = {
		0.191834,
		0.377867,
		-0.905768,
		0,
		-0.63229,
		-0.658266,
		-0.408528,
		0,
		-0.750606,
		0.651078,
		0.112643,
		0,
		0.156385,
		0.198905,
		-0.954559,
		1
	},
	[1.05] = {
		0.185738,
		0.382812,
		-0.904962,
		0,
		-0.643021,
		-0.649043,
		-0.40653,
		0,
		-0.742984,
		0.657418,
		0.125604,
		0,
		0.23253,
		0.20081,
		-0.947996,
		1
	},
	[1.06666666667] = {
		0.180171,
		0.387415,
		-0.904129,
		0,
		-0.65281,
		-0.640467,
		-0.404526,
		0,
		-0.735784,
		0.663108,
		0.137515,
		0,
		0.296784,
		0.202574,
		-0.942322,
		1
	},
	[1.08333333333] = {
		0.175613,
		0.391247,
		-0.903375,
		0,
		-0.660816,
		-0.633334,
		-0.402754,
		0,
		-0.729714,
		0.667693,
		0.14732,
		0,
		0.34626,
		0.204036,
		-0.93786,
		1
	},
	[1.11666666667] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.13333333333] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.15] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.16666666667] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.18333333333] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.1] = {
		0.172535,
		0.393868,
		-0.902829,
		0,
		-0.666219,
		-0.628458,
		-0.401489,
		0,
		-0.725523,
		0.670753,
		0.153971,
		0,
		0.378066,
		0.205032,
		-0.93494,
		1
	},
	[1.21666666667] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.23333333333] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.25] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.26666666667] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.28333333333] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.2] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.31666666667] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.33333333333] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	},
	[1.3] = {
		0.171404,
		0.394838,
		-0.902621,
		0,
		-0.668204,
		-0.626654,
		-0.40101,
		0,
		-0.723964,
		0.671869,
		0.156421,
		0,
		0.38931,
		0.2054,
		-0.933894,
		1
	}
}

return spline_matrices