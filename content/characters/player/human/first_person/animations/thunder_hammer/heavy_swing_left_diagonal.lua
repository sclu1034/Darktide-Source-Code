local spline_matrices = {
	[0] = {
		0.004461,
		0.469764,
		-0.882781,
		0,
		0.777392,
		0.553651,
		0.298549,
		0,
		0.629,
		-0.687599,
		-0.362721,
		0,
		0.197208,
		0.42206,
		-0.091914,
		1
	},
	{
		0.943699,
		-0.119341,
		-0.30853,
		0,
		-0.320429,
		-0.561539,
		-0.762889,
		0,
		-0.082207,
		0.818799,
		-0.568164,
		0,
		0.039463,
		-0.557794,
		-0.419488,
		1
	},
	[0.0166666666667] = {
		0.012829,
		0.458544,
		-0.888579,
		0,
		0.78592,
		0.544782,
		0.292478,
		0,
		0.618196,
		-0.702104,
		-0.35339,
		0,
		0.203841,
		0.428922,
		-0.091908,
		1
	},
	[0.0333333333333] = {
		0.026101,
		0.437162,
		-0.899004,
		0,
		0.790189,
		0.54182,
		0.286414,
		0,
		0.612307,
		-0.717858,
		-0.331299,
		0,
		0.208511,
		0.437416,
		-0.090595,
		1
	},
	[0.05] = {
		0.042932,
		0.407701,
		-0.912106,
		0,
		0.790853,
		0.543999,
		0.280387,
		0,
		0.610498,
		-0.733379,
		-0.299077,
		0,
		0.21138,
		0.447344,
		-0.088756,
		1
	},
	[0.0666666666667] = {
		0.06209,
		0.372345,
		-0.926015,
		0,
		0.788476,
		0.550544,
		0.274238,
		0,
		0.611923,
		-0.747169,
		-0.259401,
		0,
		0.2126,
		0.458492,
		-0.087165,
		1
	},
	[0.0833333333333] = {
		0.082363,
		0.333415,
		-0.939175,
		0,
		0.783545,
		0.560679,
		0.26776,
		0,
		0.615852,
		-0.75794,
		-0.215067,
		0,
		0.212272,
		0.470719,
		-0.086544,
		1
	},
	[0.116666666667] = {
		0.122596,
		0.251298,
		-0.960114,
		0,
		0.767276,
		0.589606,
		0.252294,
		0,
		0.62949,
		-0.767603,
		-0.120531,
		0,
		0.207308,
		0.498043,
		-0.088476,
		1
	},
	[0.133333333333] = {
		0.143909,
		0.205305,
		-0.96806,
		0,
		0.755787,
		0.608681,
		0.241441,
		0,
		0.638809,
		-0.766392,
		-0.067573,
		0,
		0.203296,
		0.512172,
		-0.088088,
		1
	},
	[0.15] = {
		0.166906,
		0.156357,
		-0.973496,
		0,
		0.742171,
		0.630076,
		0.228444,
		0,
		0.649095,
		-0.760629,
		-0.01088,
		0,
		0.198503,
		0.526053,
		-0.087758,
		1
	},
	[0.166666666667] = {
		0.191995,
		0.105493,
		-0.97571,
		0,
		0.726586,
		0.653036,
		0.213579,
		0,
		0.659705,
		-0.749943,
		0.04873,
		0,
		0.193067,
		0.539388,
		-0.088828,
		1
	},
	[0.183333333333] = {
		0.219486,
		0.053801,
		-0.974131,
		0,
		0.709194,
		0.67688,
		0.197176,
		0,
		0.669978,
		-0.734125,
		0.11041,
		0,
		0.187134,
		0.551942,
		-0.092629,
		1
	},
	[0.1] = {
		0.102504,
		0.293358,
		-0.950492,
		0,
		0.776481,
		0.573645,
		0.260787,
		0,
		0.621748,
		-0.76477,
		-0.168985,
		0,
		0.210421,
		0.484011,
		-0.087557,
		1
	},
	[0.216666666667] = {
		0.301501,
		-0.043653,
		-0.952466,
		0,
		0.652098,
		0.738229,
		0.172586,
		0,
		0.695604,
		-0.673136,
		0.251043,
		0,
		0.164037,
		0.575237,
		-0.111162,
		1
	},
	[0.233333333333] = {
		0.357331,
		-0.084738,
		-0.930126,
		0,
		0.608964,
		0.77622,
		0.163232,
		0,
		0.708151,
		-0.624741,
		0.32897,
		0,
		0.146909,
		0.585045,
		-0.128158,
		1
	},
	[0.25] = {
		0.419617,
		-0.120351,
		-0.899687,
		0,
		0.571281,
		0.80526,
		0.158728,
		0,
		0.705379,
		-0.580579,
		0.406655,
		0,
		0.130969,
		0.594948,
		-0.143468,
		1
	},
	[0.266666666667] = {
		0.486284,
		-0.152111,
		-0.860459,
		0,
		0.539236,
		0.827099,
		0.158532,
		0,
		0.68757,
		-0.541082,
		0.484228,
		0,
		0.114215,
		0.605761,
		-0.153669,
		1
	},
	[0.283333333333] = {
		0.551844,
		-0.179306,
		-0.814443,
		0,
		0.497177,
		0.854815,
		0.14868,
		0,
		0.669539,
		-0.486971,
		0.560871,
		0,
		0.092456,
		0.614794,
		-0.166947,
		1
	},
	[0.2] = {
		0.249672,
		0.002389,
		-0.968328,
		0,
		0.690139,
		0.701017,
		0.179674,
		0,
		0.679243,
		-0.713141,
		0.173376,
		0,
		0.180863,
		0.563551,
		-0.10048,
		1
	},
	[0.316666666667] = {
		0.669694,
		-0.198253,
		-0.715686,
		0,
		0.312852,
		0.949335,
		0.02977,
		0,
		0.673524,
		-0.24384,
		0.697788,
		0,
		0.023091,
		0.609347,
		-0.232289,
		1
	},
	[0.333333333333] = {
		0.725097,
		-0.171157,
		-0.667038,
		0,
		0.114772,
		0.985109,
		-0.128011,
		0,
		0.679015,
		0.016263,
		0.733944,
		0,
		-0.018109,
		0.575892,
		-0.300197,
		1
	},
	[0.35] = {
		0.762871,
		-0.10933,
		-0.637239,
		0,
		-0.145651,
		0.931204,
		-0.334132,
		0,
		0.629931,
		0.347714,
		0.694465,
		0,
		-0.062925,
		0.521743,
		-0.364261,
		1
	},
	[0.366666666667] = {
		0.753358,
		-0.034836,
		-0.656687,
		0,
		-0.410328,
		0.75545,
		-0.510809,
		0,
		0.513889,
		0.654279,
		0.55483,
		0,
		-0.135748,
		0.467451,
		-0.380719,
		1
	},
	[0.383333333333] = {
		0.645457,
		0.003018,
		-0.763791,
		0,
		-0.69273,
		0.423533,
		-0.583733,
		0,
		0.321729,
		0.905876,
		0.275463,
		0,
		-0.192755,
		0.367235,
		-0.309516,
		1
	},
	[0.3] = {
		0.6135,
		-0.197441,
		-0.764615,
		0,
		0.428666,
		0.896435,
		0.112467,
		0,
		0.663222,
		-0.396763,
		0.634599,
		0,
		0.062413,
		0.618159,
		-0.191179,
		1
	},
	[0.416666666667] = {
		0.568132,
		-0.006064,
		-0.822915,
		0,
		-0.801485,
		-0.230911,
		-0.551636,
		0,
		-0.186675,
		0.972956,
		-0.136048,
		0,
		-0.210489,
		0.267723,
		-0.256789,
		1
	},
	[0.433333333333] = {
		0.597523,
		0.041311,
		-0.800787,
		0,
		-0.713291,
		-0.428837,
		-0.55436,
		0,
		-0.366308,
		0.902437,
		-0.226773,
		0,
		-0.222951,
		0.219547,
		-0.302487,
		1
	},
	[0.45] = {
		0.47204,
		0.042241,
		-0.880565,
		0,
		-0.719589,
		-0.558571,
		-0.412541,
		0,
		-0.509285,
		0.82838,
		-0.233272,
		0,
		-0.212726,
		0.103592,
		-0.359471,
		1
	},
	[0.466666666667] = {
		0.392352,
		0.08925,
		-0.915475,
		0,
		-0.676146,
		-0.646787,
		-0.352836,
		0,
		-0.623608,
		0.757431,
		-0.193422,
		0,
		-0.186388,
		-0.046749,
		-0.424997,
		1
	},
	[0.483333333333] = {
		0.330995,
		0.153737,
		-0.931025,
		0,
		-0.614005,
		-0.714116,
		-0.336209,
		0,
		-0.716548,
		0.682937,
		-0.141974,
		0,
		-0.1692,
		-0.198507,
		-0.495785,
		1
	},
	[0.4] = {
		0.530842,
		-0.023785,
		-0.847137,
		0,
		-0.846293,
		0.037804,
		-0.531375,
		0,
		0.044663,
		0.999002,
		-6.1e-05,
		0,
		-0.191284,
		0.28878,
		-0.23741,
		1
	},
	[0.516666666667] = {
		0.276516,
		0.208566,
		-0.938104,
		0,
		-0.541324,
		-0.772764,
		-0.331368,
		0,
		-0.794045,
		0.599447,
		-0.10078,
		0,
		-0.102114,
		-0.362604,
		-0.56,
		1
	},
	[0.533333333333] = {
		0.26239,
		0.220175,
		-0.939508,
		0,
		-0.514665,
		-0.791648,
		-0.329262,
		0,
		-0.816255,
		0.569926,
		-0.094405,
		0,
		-0.057539,
		-0.405542,
		-0.565272,
		1
	},
	[0.55] = {
		0.253324,
		0.228753,
		-0.939946,
		0,
		-0.491592,
		-0.806392,
		-0.328739,
		0,
		-0.833165,
		0.545348,
		-0.091825,
		0,
		-0.019264,
		-0.438912,
		-0.566734,
		1
	},
	[0.566666666667] = {
		0.249427,
		0.23507,
		-0.93943,
		0,
		-0.472089,
		-0.817494,
		-0.329902,
		0,
		-0.845528,
		0.525781,
		-0.09293,
		0,
		0.012956,
		-0.465797,
		-0.565943,
		1
	},
	[0.583333333333] = {
		0.250712,
		0.239805,
		-0.93789,
		0,
		-0.456025,
		-0.825347,
		-0.332932,
		0,
		-0.853923,
		0.511171,
		-0.097567,
		0,
		0.039889,
		-0.488496,
		-0.563764,
		1
	},
	[0.5] = {
		0.294654,
		0.19431,
		-0.93564,
		0,
		-0.568298,
		-0.751521,
		-0.335043,
		0,
		-0.768255,
		0.630444,
		-0.111012,
		0,
		-0.146056,
		-0.304849,
		-0.544518,
		1
	},
	[0.616666666667] = {
		0.268634,
		0.246803,
		-0.931087,
		0,
		-0.433182,
		-0.832404,
		-0.345626,
		0,
		-0.860342,
		0.496177,
		-0.116702,
		0,
		0.08114,
		-0.527411,
		-0.557065,
		1
	},
	[0.633333333333] = {
		0.284754,
		0.249296,
		-0.925617,
		0,
		-0.425882,
		-0.832165,
		-0.355143,
		0,
		-0.858801,
		0.495332,
		-0.130792,
		0,
		0.096717,
		-0.545511,
		-0.553067,
		1
	},
	[0.65] = {
		0.304937,
		0.250429,
		-0.918857,
		0,
		-0.421133,
		-0.829899,
		-0.365944,
		0,
		-0.854202,
		0.498551,
		-0.147603,
		0,
		0.109516,
		-0.563373,
		-0.548831,
		1
	},
	[0.666666666667] = {
		0.328904,
		0.250127,
		-0.910636,
		0,
		-0.418595,
		-0.825767,
		-0.378004,
		0,
		-0.846522,
		0.505515,
		-0.166896,
		0,
		0.119938,
		-0.581265,
		-0.544434,
		1
	},
	[0.683333333333] = {
		0.356348,
		0.248277,
		-0.900763,
		0,
		-0.417911,
		-0.819892,
		-0.391315,
		0,
		-0.835683,
		0.515883,
		-0.188409,
		0,
		0.128287,
		-0.599257,
		-0.539925,
		1
	},
	[0.6] = {
		0.257139,
		0.243549,
		-0.935181,
		0,
		-0.443166,
		-0.830247,
		-0.338075,
		0,
		-0.858769,
		0.501372,
		-0.105557,
		0,
		0.062372,
		-0.508645,
		-0.560698,
		1
	},
	[0.716666666667] = {
		0.42028,
		0.239386,
		-0.875248,
		0,
		-0.420579,
		-0.803312,
		-0.421666,
		0,
		-0.804039,
		0.545329,
		-0.236936,
		0,
		0.139543,
		-0.635267,
		-0.530856,
		1
	},
	[0.733333333333] = {
		0.455973,
		0.232055,
		-0.859208,
		0,
		-0.423143,
		-0.79279,
		-0.438674,
		0,
		-0.782968,
		0.563591,
		-0.263299,
		0,
		0.142672,
		-0.652829,
		-0.526459,
		1
	},
	[0.75] = {
		0.49355,
		0.222622,
		-0.840742,
		0,
		-0.425992,
		-0.780907,
		-0.456853,
		0,
		-0.758247,
		0.58363,
		-0.290582,
		0,
		0.144208,
		-0.669549,
		-0.522245,
		1
	},
	[0.766666666667] = {
		0.532509,
		0.210984,
		-0.819707,
		0,
		-0.428732,
		-0.767778,
		-0.476136,
		0,
		-0.729811,
		0.604981,
		-0.318393,
		0,
		0.144168,
		-0.684854,
		-0.518268,
		1
	},
	[0.783333333333] = {
		0.572308,
		0.197077,
		-0.796005,
		0,
		-0.430979,
		-0.753537,
		-0.496426,
		0,
		-0.697654,
		0.62717,
		-0.346319,
		0,
		0.142561,
		-0.698094,
		-0.514571,
		1
	},
	[0.7] = {
		0.386932,
		0.244746,
		-0.889035,
		0,
		-0.418702,
		-0.812377,
		-0.405873,
		0,
		-0.821567,
		0.529286,
		-0.211859,
		0,
		0.134776,
		-0.617311,
		-0.535371,
		1
	},
	[0.816666666667] = {
		0.652151,
		0.162444,
		-0.74048,
		0,
		-0.432596,
		-0.722382,
		-0.539467,
		0,
		-0.622543,
		0.672142,
		-0.40083,
		0,
		0.134731,
		-0.715894,
		-0.508209,
		1
	},
	[0.833333333333] = {
		0.69104,
		0.141864,
		-0.708758,
		0,
		-0.431359,
		-0.705862,
		-0.561861,
		0,
		-0.579993,
		0.693998,
		-0.426585,
		0,
		0.128628,
		-0.719501,
		-0.505658,
		1
	},
	[0.85] = {
		0.728498,
		0.119313,
		-0.674578,
		0,
		-0.42844,
		-0.689013,
		-0.584552,
		0,
		-0.534537,
		0.714861,
		-0.450826,
		0,
		0.121214,
		-0.719244,
		-0.503612,
		1
	},
	[0.866666666667] = {
		0.764015,
		0.095025,
		-0.638162,
		0,
		-0.423672,
		-0.672078,
		-0.6073,
		0,
		-0.486603,
		0.734358,
		-0.473219,
		0,
		0.112694,
		-0.714967,
		-0.501934,
		1
	},
	[0.883333333333] = {
		0.797147,
		0.069291,
		-0.599796,
		0,
		-0.416957,
		-0.655311,
		-0.629853,
		0,
		-0.436696,
		0.752175,
		-0.493488,
		0,
		0.106046,
		-0.697716,
		-0.487971,
		1
	},
	[0.8] = {
		0.612382,
		0.180883,
		-0.769591,
		0,
		-0.432376,
		-0.738344,
		-0.51759,
		0,
		-0.661846,
		0.649715,
		-0.373939,
		0,
		0.139402,
		-0.708626,
		-0.5112,
		1
	},
	[0.916666666667] = {
		0.854881,
		0.014899,
		-0.518611,
		0,
		-0.397633,
		-0.62327,
		-0.673367,
		0,
		-0.333266,
		0.781865,
		-0.526897,
		0,
		0.089775,
		-0.6592,
		-0.462678,
		1
	},
	[0.933333333333] = {
		0.879036,
		-0.012973,
		-0.476578,
		0,
		-0.385158,
		-0.60846,
		-0.693852,
		0,
		-0.280978,
		0.793479,
		-0.539855,
		0,
		0.080487,
		-0.638683,
		-0.451635,
		1
	},
	[0.95] = {
		0.899923,
		-0.040741,
		-0.434141,
		0,
		-0.370989,
		-0.59473,
		-0.713206,
		0,
		-0.22914,
		0.802893,
		-0.550326,
		0,
		0.070661,
		-0.617849,
		-0.441768,
		1
	},
	[0.966666666667] = {
		0.917571,
		-0.06799,
		-0.391714,
		0,
		-0.355319,
		-0.582248,
		-0.731256,
		0,
		-0.178357,
		0.810163,
		-0.558413,
		0,
		0.060457,
		-0.597122,
		-0.433115,
		1
	},
	[0.983333333333] = {
		0.932102,
		-0.094317,
		-0.349699,
		0,
		-0.33837,
		-0.571151,
		-0.747859,
		0,
		-0.129195,
		0.815409,
		-0.564285,
		0,
		0.050023,
		-0.576949,
		-0.425689,
		1
	},
	[0.9] = {
		0.827527,
		0.042456,
		-0.559819,
		0,
		-0.408266,
		-0.638961,
		-0.651957,
		0,
		-0.385382,
		0.768067,
		-0.511424,
		0,
		0.098352,
		-0.679002,
		-0.474826,
		1
	},
	[1.01666666667] = {
		0.952628,
		-0.142725,
		-0.26857,
		0,
		-0.301771,
		-0.553526,
		-0.776236,
		0,
		-0.037872,
		0.820511,
		-0.570375,
		0,
		0.028874,
		-0.540156,
		-0.41446,
		1
	},
	[1.03333333333] = {
		0.95923,
		-0.164156,
		-0.230066,
		0,
		-0.282605,
		-0.547205,
		-0.787846,
		0,
		0.003436,
		0.820743,
		-0.571287,
		0,
		0.01837,
		-0.524546,
		-0.410538,
		1
	},
	[1.05] = {
		0.963874,
		-0.183332,
		-0.193228,
		0,
		-0.263123,
		-0.542604,
		-0.797714,
		0,
		0.0414,
		0.819738,
		-0.571241,
		0,
		0.008048,
		-0.511457,
		-0.407682,
		1
	},
	[1.06666666667] = {
		0.96694,
		-0.199977,
		-0.158226,
		0,
		-0.243491,
		-0.53973,
		-0.805856,
		0,
		0.075754,
		0.817741,
		-0.57058,
		0,
		-0.002006,
		-0.501381,
		-0.405849,
		1
	},
	[1.08333333333] = {
		0.968813,
		-0.213837,
		-0.125199,
		0,
		-0.223847,
		-0.538574,
		-0.812299,
		0,
		0.106271,
		0.814992,
		-0.569645,
		0,
		-0.011716,
		-0.494805,
		-0.404996,
		1
	},
	[1.1] = {
		0.969865,
		-0.224671,
		-0.094261,
		0,
		-0.204299,
		-0.539115,
		-0.817078,
		0,
		0.132757,
		0.811713,
		-0.568769,
		0,
		-0.021004,
		-0.492212,
		-0.405082,
		1
	}
}

return spline_matrices