local spline_matrices = {
	[0] = {
		0.083764,
		-0.988947,
		0.122339,
		0,
		0.966139,
		0.050531,
		-0.253028,
		0,
		0.244049,
		0.139391,
		0.959693,
		0,
		0.340367,
		0.823128,
		-0.159794,
		1
	},
	{
		-0.822569,
		0.433024,
		-0.368607,
		0,
		-0.279602,
		-0.872405,
		-0.400915,
		0,
		-0.49518,
		-0.226717,
		0.838687,
		0,
		0.209958,
		1.314277,
		-0.064341,
		1
	},
	[0.0166666666667] = {
		0.090712,
		-0.992645,
		0.080164,
		0,
		0.918559,
		0.0523,
		-0.39181,
		0,
		0.384735,
		0.109177,
		0.916547,
		0,
		0.362359,
		0.821274,
		-0.108864,
		1
	},
	[0.0333333333333] = {
		0.075594,
		-0.997063,
		0.012268,
		0,
		0.896668,
		0.06259,
		-0.438256,
		0,
		0.436201,
		0.044129,
		0.898767,
		0,
		0.389167,
		0.823432,
		-0.068786,
		1
	},
	[0.05] = {
		0.043189,
		-0.998094,
		-0.044091,
		0,
		0.880227,
		0.05889,
		-0.470884,
		0,
		0.472583,
		-0.018473,
		0.881092,
		0,
		0.412536,
		0.828474,
		-0.033858,
		1
	},
	[0.0666666666667] = {
		-0.005883,
		-0.996859,
		-0.07898,
		0,
		0.88221,
		0.032013,
		-0.469767,
		0,
		0.47082,
		-0.072441,
		0.87925,
		0,
		0.428462,
		0.839306,
		-0.017693,
		1
	},
	[0.0833333333333] = {
		-0.146639,
		-0.976772,
		-0.156251,
		0,
		0.917253,
		-0.075132,
		-0.391155,
		0,
		0.370329,
		-0.20068,
		0.906964,
		0,
		0.443615,
		0.857723,
		-0.020948,
		1
	},
	[0.116666666667] = {
		-0.542543,
		-0.818429,
		-0.189266,
		0,
		0.815728,
		-0.4595,
		-0.351353,
		0,
		0.200589,
		-0.345013,
		0.916913,
		0,
		0.480674,
		0.900002,
		-0.053963,
		1
	},
	[0.133333333333] = {
		-0.737852,
		-0.669856,
		-0.08287,
		0,
		0.652555,
		-0.676588,
		-0.341175,
		0,
		0.17247,
		-0.305814,
		0.93634,
		0,
		0.502355,
		0.919148,
		-0.078673,
		1
	},
	[0.15] = {
		-0.853465,
		-0.513232,
		0.0905,
		0,
		0.469418,
		-0.832496,
		-0.294274,
		0,
		0.226372,
		-0.20867,
		0.951427,
		0,
		0.524796,
		0.9346,
		-0.100222,
		1
	},
	[0.166666666667] = {
		-0.882181,
		-0.399021,
		0.250079,
		0,
		0.343,
		-0.908331,
		-0.239344,
		0,
		0.322658,
		-0.125368,
		0.938176,
		0,
		0.545707,
		0.946479,
		-0.110937,
		1
	},
	[0.183333333333] = {
		-0.880839,
		-0.355221,
		0.312956,
		0,
		0.289252,
		-0.927137,
		-0.238225,
		0,
		0.374776,
		-0.119314,
		0.919406,
		0,
		0.562412,
		0.955461,
		-0.103527,
		1
	},
	[0.1] = {
		-0.337337,
		-0.918296,
		-0.207213,
		0,
		0.902058,
		-0.252361,
		-0.35015,
		0,
		0.269249,
		-0.305036,
		0.913487,
		0,
		0.461212,
		0.878829,
		-0.033913,
		1
	},
	[0.216666666667] = {
		-0.885806,
		-0.385934,
		0.257687,
		0,
		0.279419,
		-0.886923,
		-0.367822,
		0,
		0.370503,
		-0.253816,
		0.893479,
		0,
		0.58773,
		0.970224,
		-0.048317,
		1
	},
	[0.233333333333] = {
		-0.883945,
		-0.419034,
		0.20749,
		0,
		0.291974,
		-0.841238,
		-0.45505,
		0,
		0.36523,
		-0.341657,
		0.865955,
		0,
		0.598485,
		0.975461,
		-0.010639,
		1
	},
	[0.25] = {
		-0.879063,
		-0.452083,
		0.151227,
		0,
		0.3067,
		-0.77921,
		-0.546596,
		0,
		0.364944,
		-0.434111,
		0.823628,
		0,
		0.608044,
		0.977741,
		0.031019,
		1
	},
	[0.266666666667] = {
		-0.872505,
		-0.478748,
		0.097654,
		0,
		0.315472,
		-0.704593,
		-0.63563,
		0,
		0.373113,
		-0.523783,
		0.765792,
		0,
		0.616643,
		0.976391,
		0.075032,
		1
	},
	[0.283333333333] = {
		-0.866608,
		-0.49577,
		0.056592,
		0,
		0.30996,
		-0.62372,
		-0.717564,
		0,
		0.391044,
		-0.604305,
		0.69419,
		0,
		0.624539,
		0.971025,
		0.120374,
		1
	},
	[0.2] = {
		-0.884589,
		-0.361444,
		0.294722,
		0,
		0.276396,
		-0.915309,
		-0.292941,
		0,
		0.375644,
		-0.177672,
		0.909574,
		0,
		0.57567,
		0.963106,
		-0.079984,
		1
	},
	[0.316666666667] = {
		-0.864349,
		-0.499537,
		0.057998,
		0,
		0.203776,
		-0.453341,
		-0.867731,
		0,
		0.459757,
		-0.738204,
		0.493638,
		0,
		0.628481,
		0.943847,
		0.243538,
		1
	},
	[0.333333333333] = {
		-0.863622,
		-0.495812,
		0.091261,
		0,
		0.097896,
		-0.342507,
		-0.934401,
		0,
		0.494544,
		-0.798035,
		0.344334,
		0,
		0.601339,
		0.919977,
		0.334656,
		1
	},
	[0.35] = {
		-0.853532,
		-0.493449,
		0.167308,
		0,
		-0.036798,
		-0.263214,
		-0.964035,
		0,
		0.51974,
		-0.828991,
		0.206504,
		0,
		0.547811,
		0.902641,
		0.373829,
		1
	},
	[0.366666666667] = {
		-0.823247,
		-0.523658,
		0.219194,
		0,
		-0.100073,
		-0.246204,
		-0.964038,
		0,
		0.558793,
		-0.815577,
		0.150283,
		0,
		0.433452,
		0.959101,
		0.336905,
		1
	},
	[0.383333333333] = {
		-0.813741,
		-0.518515,
		0.262617,
		0,
		-0.107983,
		-0.309098,
		-0.94488,
		0,
		0.571109,
		-0.797246,
		0.195535,
		0,
		0.288781,
		1.073168,
		0.261999,
		1
	},
	[0.3] = {
		-0.86359,
		-0.502746,
		0.038195,
		0,
		0.281968,
		-0.544369,
		-0.790036,
		0,
		0.41798,
		-0.671497,
		0.61187,
		0,
		0.631956,
		0.961312,
		0.166553,
		1
	},
	[0.416666666667] = {
		-0.947327,
		-0.252737,
		0.196711,
		0,
		0.028706,
		-0.678742,
		-0.733816,
		0,
		0.318979,
		-0.689517,
		0.650245,
		0,
		0.036485,
		1.325847,
		0.028551,
		1
	},
	[0.433333333333] = {
		-0.949114,
		-0.268987,
		0.163796,
		0,
		0.05212,
		-0.647083,
		-0.760636,
		0,
		0.310591,
		-0.713393,
		0.628175,
		0,
		0.038922,
		1.323835,
		0.040759,
		1
	},
	[0.45] = {
		-0.951636,
		-0.271888,
		0.143059,
		0,
		0.058399,
		-0.617236,
		-0.784608,
		0,
		0.301627,
		-0.738306,
		0.603262,
		0,
		0.038563,
		1.320668,
		0.046085,
		1
	},
	[0.466666666667] = {
		-0.953512,
		-0.274087,
		0.125267,
		0,
		0.064996,
		-0.592938,
		-0.802621,
		0,
		0.294263,
		-0.757167,
		0.583188,
		0,
		0.03615,
		1.317507,
		0.043393,
		1
	},
	[0.483333333333] = {
		-0.951818,
		-0.286572,
		0.109171,
		0,
		0.079354,
		-0.574035,
		-0.814976,
		0,
		0.296218,
		-0.767046,
		0.569118,
		0,
		0.034002,
		1.315351,
		0.042265,
		1
	},
	[0.4] = {
		-0.891042,
		-0.365959,
		0.268548,
		0,
		-0.032925,
		-0.537953,
		-0.842332,
		0,
		0.452725,
		-0.759395,
		0.467289,
		0,
		0.127177,
		1.227232,
		0.126838,
		1
	},
	[0.516666666667] = {
		-0.941003,
		-0.331015,
		0.070302,
		0,
		0.120171,
		-0.521085,
		-0.845003,
		0,
		0.316341,
		-0.786702,
		0.530121,
		0,
		0.031219,
		1.312463,
		0.03574,
		1
	},
	[0.533333333333] = {
		-0.936165,
		-0.345349,
		0.065791,
		0,
		0.130605,
		-0.515388,
		-0.846946,
		0,
		0.3264,
		-0.784289,
		0.527593,
		0,
		0.030169,
		1.312638,
		0.033854,
		1
	},
	[0.55] = {
		-0.932413,
		-0.353977,
		0.072847,
		0,
		0.134408,
		-0.526772,
		-0.839313,
		0,
		0.335471,
		-0.772795,
		0.538746,
		0,
		0.028621,
		1.314236,
		0.03246,
		1
	},
	[0.566666666667] = {
		-0.927652,
		-0.364016,
		0.083394,
		0,
		0.137852,
		-0.541321,
		-0.829439,
		0,
		0.347072,
		-0.757934,
		0.552337,
		0,
		0.02664,
		1.316661,
		0.030246,
		1
	},
	[0.583333333333] = {
		-0.922751,
		-0.373335,
		0.095667,
		0,
		0.14017,
		-0.556332,
		-0.819053,
		0,
		0.359003,
		-0.742372,
		0.565686,
		0,
		0.025016,
		1.319451,
		0.028383,
		1
	},
	[0.5] = {
		-0.947181,
		-0.308465,
		0.087732,
		0,
		0.100631,
		-0.545625,
		-0.831966,
		0,
		0.304501,
		-0.779194,
		0.547847,
		0,
		0.032415,
		1.313543,
		0.039113,
		1
	},
	[0.616666666667] = {
		-0.91649,
		-0.382298,
		0.117874,
		0,
		0.137481,
		-0.577671,
		-0.804609,
		0,
		0.375693,
		-0.72121,
		0.581989,
		0,
		0.026134,
		1.324407,
		0.030537,
		1
	},
	[0.633333333333] = {
		-0.917204,
		-0.377895,
		0.126221,
		0,
		0.12848,
		-0.580423,
		-0.804115,
		0,
		0.377132,
		-0.721321,
		0.580919,
		0,
		0.0292,
		1.320605,
		0.037944,
		1
	},
	[0.65] = {
		-0.920354,
		-0.367149,
		0.134718,
		0,
		0.112806,
		-0.579055,
		-0.807447,
		0,
		0.374463,
		-0.72794,
		0.574352,
		0,
		0.032851,
		1.307521,
		0.050412,
		1
	},
	[0.666666666667] = {
		-0.92472,
		-0.352422,
		0.143848,
		0,
		0.092747,
		-0.575118,
		-0.812796,
		0,
		0.369176,
		-0.738267,
		0.564509,
		0,
		0.037311,
		1.288195,
		0.066084,
		1
	},
	[0.683333333333] = {
		-0.929194,
		-0.336011,
		0.153933,
		0,
		0.070653,
		-0.570302,
		-0.818391,
		0,
		0.362777,
		-0.749568,
		0.553661,
		0,
		0.042755,
		1.265686,
		0.08308,
		1
	},
	[0.6] = {
		-0.918682,
		-0.380003,
		0.107796,
		0,
		0.140416,
		-0.56926,
		-0.810078,
		0,
		0.369197,
		-0.729068,
		0.576327,
		0,
		0.024568,
		1.322172,
		0.028073,
		1
	},
	[0.716666666667] = {
		-0.935183,
		-0.306832,
		0.176883,
		0,
		0.029948,
		-0.566157,
		-0.823753,
		0,
		0.352897,
		-0.765062,
		0.538649,
		0,
		0.057053,
		1.223605,
		0.113415,
		1
	},
	[0.733333333333] = {
		-0.935628,
		-0.298053,
		0.189112,
		0,
		0.01621,
		-0.571465,
		-0.820467,
		0,
		0.352614,
		-0.764586,
		0.53951,
		0,
		0.066046,
		1.210386,
		0.122917,
		1
	},
	[0.75] = {
		-0.933792,
		-0.295801,
		0.20133,
		0,
		0.010373,
		-0.584807,
		-0.811106,
		0,
		0.357665,
		-0.755316,
		0.549157,
		0,
		0.076046,
		1.206773,
		0.126099,
		1
	},
	[0.766666666667] = {
		-0.931115,
		-0.2958,
		0.213373,
		0,
		0.014472,
		-0.614524,
		-0.788765,
		0,
		0.364439,
		-0.731343,
		0.576473,
		0,
		0.087514,
		1.209621,
		0.123189,
		1
	},
	[0.783333333333] = {
		-0.9292,
		-0.291,
		0.22783,
		0,
		0.022772,
		-0.66037,
		-0.750595,
		0,
		0.368875,
		-0.692265,
		0.620242,
		0,
		0.100573,
		1.213025,
		0.117105,
		1
	},
	[0.7] = {
		-0.932893,
		-0.320123,
		0.165022,
		0,
		0.048914,
		-0.56657,
		-0.822561,
		0,
		0.356817,
		-0.759289,
		0.544207,
		0,
		0.049308,
		1.243103,
		0.099495,
		1
	},
	[0.816666666667] = {
		-0.927182,
		-0.256851,
		0.272692,
		0,
		0.017895,
		-0.757471,
		-0.652623,
		0,
		0.374183,
		-0.600221,
		0.70691,
		0,
		0.128306,
		1.219599,
		0.103036,
		1
	},
	[0.833333333333] = {
		-0.92607,
		-0.222036,
		0.305115,
		0,
		-0.012523,
		-0.790039,
		-0.612929,
		0,
		0.377145,
		-0.571436,
		0.728851,
		0,
		0.1417,
		1.223306,
		0.098162,
		1
	},
	[0.85] = {
		-0.920159,
		-0.19713,
		0.3383,
		0,
		-0.039899,
		-0.812309,
		-0.581861,
		0,
		0.389506,
		-0.548902,
		0.739588,
		0,
		0.157595,
		1.224751,
		0.089225,
		1
	},
	[0.866666666667] = {
		-0.930974,
		-0.230278,
		0.283302,
		0,
		0.018764,
		-0.805141,
		-0.592787,
		0,
		0.364604,
		-0.546553,
		0.753886,
		0,
		0.160629,
		1.237489,
		0.079807,
		1
	},
	[0.883333333333] = {
		-0.941051,
		-0.301427,
		0.153507,
		0,
		0.155739,
		-0.788933,
		-0.594416,
		0,
		0.30028,
		-0.535469,
		0.78937,
		0,
		0.168107,
		1.24177,
		0.055059,
		1
	},
	[0.8] = {
		-0.927932,
		-0.278781,
		0.247434,
		0,
		0.026556,
		-0.711563,
		-0.70212,
		0,
		0.371803,
		-0.644948,
		0.667686,
		0,
		0.114385,
		1.21638,
		0.109833,
		1
	},
	[0.916666666667] = {
		-0.910247,
		-0.400563,
		-0.104877,
		0,
		0.396911,
		-0.771936,
		-0.496565,
		0,
		0.117947,
		-0.493623,
		0.861641,
		0,
		0.184224,
		1.249457,
		0.001374,
		1
	},
	[0.933333333333] = {
		-0.92128,
		-0.34533,
		-0.178857,
		0,
		0.38883,
		-0.809254,
		-0.440363,
		0,
		0.00733,
		-0.475243,
		0.879824,
		0,
		0.189625,
		1.260541,
		-0.014028,
		1
	},
	[0.95] = {
		-0.948186,
		-0.198039,
		-0.248442,
		0,
		0.286509,
		-0.87094,
		-0.399219,
		0,
		-0.137317,
		-0.449715,
		0.882553,
		0,
		0.194965,
		1.273767,
		-0.026164,
		1
	},
	[0.966666666667] = {
		-0.951456,
		0.01007,
		-0.307621,
		0,
		0.113749,
		-0.917201,
		-0.381843,
		0,
		-0.285995,
		-0.398298,
		0.871531,
		0,
		0.200178,
		1.287931,
		-0.037186,
		1
	},
	[0.983333333333] = {
		-0.907373,
		0.235999,
		-0.347819,
		0,
		-0.090779,
		-0.917999,
		-0.386053,
		0,
		-0.410406,
		-0.318719,
		0.854392,
		0,
		0.2052,
		1.301836,
		-0.049256,
		1
	},
	[0.9] = {
		-0.928909,
		-0.370262,
		0.00578,
		0,
		0.304399,
		-0.772374,
		-0.557477,
		0,
		0.210877,
		-0.516086,
		0.830172,
		0,
		0.176984,
		1.243735,
		0.025422,
		1
	},
	[1.01666666667] = {
		-0.729939,
		0.565963,
		-0.383244,
		0,
		-0.413135,
		-0.812004,
		-0.412272,
		0,
		-0.544526,
		-0.142601,
		0.826533,
		0,
		0.214375,
		1.324065,
		-0.084353,
		1
	},
	[1.03333333333] = {
		-0.668904,
		0.614866,
		-0.417742,
		0,
		-0.468263,
		-0.78499,
		-0.405611,
		0,
		-0.577319,
		-0.075702,
		0.813002,
		0,
		0.218369,
		1.330028,
		-0.111378,
		1
	},
	[1.05] = {
		-0.633172,
		0.610356,
		-0.475982,
		0,
		-0.482963,
		-0.792101,
		-0.373259,
		0,
		-0.604847,
		-0.006456,
		0.796316,
		0,
		0.221912,
		1.333126,
		-0.145596,
		1
	},
	[1.06666666667] = {
		-0.595019,
		0.594852,
		-0.540466,
		0,
		-0.503645,
		-0.800023,
		-0.326046,
		0,
		-0.626334,
		0.078199,
		0.775623,
		0,
		0.225044,
		1.335213,
		-0.18521,
		1
	},
	[1.08333333333] = {
		-0.551021,
		0.56902,
		-0.610403,
		0,
		-0.527239,
		-0.804367,
		-0.273886,
		0,
		-0.646835,
		0.170911,
		0.743232,
		0,
		0.227782,
		1.33646,
		-0.229341,
		1
	},
	[1.11666666667] = {
		-0.431958,
		0.488402,
		-0.758206,
		0,
		-0.565981,
		-0.801331,
		-0.193735,
		0,
		-0.702194,
		0.345445,
		0.622568,
		0,
		0.232136,
		1.337103,
		-0.327642,
		1
	},
	[1.13333333333] = {
		-0.351455,
		0.434689,
		-0.829171,
		0,
		-0.56826,
		-0.802907,
		-0.180055,
		0,
		-0.744016,
		0.407904,
		0.529202,
		0,
		0.233786,
		1.336833,
		-0.380053,
		1
	},
	[1.15] = {
		-0.255055,
		0.373001,
		-0.892086,
		0,
		-0.54623,
		-0.816865,
		-0.185377,
		0,
		-0.797859,
		0.440003,
		0.41209,
		0,
		0.235109,
		1.336389,
		-0.433467,
		1
	},
	[1.16666666667] = {
		-0.129984,
		0.293054,
		-0.947219,
		0,
		-0.497195,
		-0.845798,
		-0.193447,
		0,
		-0.857847,
		0.445808,
		0.255645,
		0,
		0.236274,
		1.335902,
		-0.494171,
		1
	},
	[1.18333333333] = {
		0.031447,
		0.188465,
		-0.981576,
		0,
		-0.438091,
		-0.880103,
		-0.183017,
		0,
		-0.89838,
		0.435775,
		0.054888,
		0,
		0.237437,
		1.335405,
		-0.565829,
		1
	},
	[1.1] = {
		-0.497705,
		0.533373,
		-0.683961,
		0,
		-0.549796,
		-0.803909,
		-0.226836,
		0,
		-0.670831,
		0.263142,
		0.693356,
		0,
		0.23014,
		1.337035,
		-0.277111,
		1
	},
	[1.21666666667] = {
		0.389762,
		-0.060453,
		-0.918929,
		0,
		-0.362484,
		-0.927364,
		-0.092739,
		0,
		-0.846576,
		0.369243,
		-0.383365,
		0,
		0.239735,
		1.334411,
		-0.72272,
		1
	},
	[1.23333333333] = {
		0.537572,
		-0.184283,
		-0.822834,
		0,
		-0.368691,
		-0.928972,
		-0.032819,
		0,
		-0.758342,
		0.321014,
		-0.567333,
		0,
		0.240859,
		1.333926,
		-0.798312,
		1
	},
	[1.25] = {
		0.641919,
		-0.293879,
		-0.708219,
		0,
		-0.400215,
		-0.916255,
		0.017456,
		0,
		-0.654039,
		0.272234,
		-0.705777,
		0,
		0.241958,
		1.333453,
		-0.865575,
		1
	},
	[1.26666666667] = {
		0.702489,
		-0.380504,
		-0.601436,
		0,
		-0.441986,
		-0.895607,
		0.050366,
		0,
		-0.557815,
		0.230444,
		-0.797332,
		0,
		0.243027,
		1.332992,
		-0.919689,
		1
	},
	[1.28333333333] = {
		0.729833,
		-0.437204,
		-0.525544,
		0,
		-0.476938,
		-0.876399,
		0.06675,
		0,
		-0.489769,
		0.201935,
		-0.848144,
		0,
		0.244059,
		1.332543,
		-0.955832,
		1
	},
	[1.2] = {
		0.212938,
		0.067357,
		-0.974741,
		0,
		-0.387765,
		-0.909867,
		-0.147583,
		0,
		-0.896826,
		0.409396,
		-0.167626,
		0,
		0.238593,
		1.334906,
		-0.643618,
		1
	},
	[1.31666666667] = {
		0.736412,
		-0.458572,
		-0.497403,
		0,
		-0.492058,
		-0.86763,
		0.071398,
		0,
		-0.464303,
		0.192173,
		-0.864577,
		0,
		0.245994,
		1.331686,
		-0.969534,
		1
	},
	[1.33333333333] = {
		0.736027,
		-0.459166,
		-0.497424,
		0,
		-0.492785,
		-0.86722,
		0.071358,
		0,
		-0.464141,
		0.192601,
		-0.864568,
		0,
		0.246884,
		1.331275,
		-0.969879,
		1
	},
	[1.35] = {
		0.735666,
		-0.459726,
		-0.497441,
		0,
		-0.493466,
		-0.866836,
		0.071326,
		0,
		-0.46399,
		0.192998,
		-0.864561,
		0,
		0.247717,
		1.330881,
		-0.970215,
		1
	},
	[1.36666666667] = {
		0.735331,
		-0.460247,
		-0.497454,
		0,
		-0.494097,
		-0.866478,
		0.0713,
		0,
		-0.463849,
		0.193361,
		-0.864555,
		0,
		0.248485,
		1.330509,
		-0.970536,
		1
	},
	[1.38333333333] = {
		0.735026,
		-0.460723,
		-0.497465,
		0,
		-0.494672,
		-0.866152,
		0.07128,
		0,
		-0.463721,
		0.193689,
		-0.864551,
		0,
		0.249184,
		1.330163,
		-0.970837,
		1
	},
	[1.3] = {
		0.736817,
		-0.457948,
		-0.497378,
		0,
		-0.49129,
		-0.868061,
		0.071445,
		0,
		-0.464473,
		0.191715,
		-0.864587,
		0,
		0.24505,
		1.332109,
		-0.969185,
		1
	},
	[1.41666666667] = {
		0.734512,
		-0.461527,
		-0.497478,
		0,
		-0.495636,
		-0.865602,
		0.071255,
		0,
		-0.463505,
		0.194231,
		-0.864545,
		0,
		0.250351,
		1.329569,
		-0.971363,
		1
	},
	[1.43333333333] = {
		0.73431,
		-0.461845,
		-0.497482,
		0,
		-0.496015,
		-0.865386,
		0.071248,
		0,
		-0.463419,
		0.19444,
		-0.864543,
		0,
		0.250808,
		1.32933,
		-0.971577,
		1
	},
	[1.45] = {
		0.734148,
		-0.4621,
		-0.497484,
		0,
		-0.496319,
		-0.865212,
		0.071244,
		0,
		-0.463351,
		0.194607,
		-0.864543,
		0,
		0.251173,
		1.329136,
		-0.971752,
		1
	},
	[1.46666666667] = {
		0.734029,
		-0.462288,
		-0.497485,
		0,
		-0.496542,
		-0.865084,
		0.071242,
		0,
		-0.463301,
		0.194728,
		-0.864542,
		0,
		0.25144,
		1.328991,
		-0.971883,
		1
	},
	[1.48333333333] = {
		0.733956,
		-0.462404,
		-0.497486,
		0,
		-0.496679,
		-0.865006,
		0.071241,
		0,
		-0.46327,
		0.194803,
		-0.864542,
		0,
		0.251605,
		1.328901,
		-0.971965,
		1
	},
	[1.4] = {
		0.734752,
		-0.461152,
		-0.497473,
		0,
		-0.495187,
		-0.865859,
		0.071266,
		0,
		-0.463605,
		0.193979,
		-0.864547,
		0,
		0.249808,
		1.329848,
		-0.971115,
		1
	},
	[1.5] = {
		0.73393,
		-0.462444,
		-0.497486,
		0,
		-0.496726,
		-0.864979,
		0.071241,
		0,
		-0.46326,
		0.194828,
		-0.864542,
		0,
		0.251661,
		1.32887,
		-0.971994,
		1
	}
}

return spline_matrices
