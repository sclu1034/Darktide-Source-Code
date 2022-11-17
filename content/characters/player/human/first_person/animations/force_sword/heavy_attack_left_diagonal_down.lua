local spline_matrices = {
	[0] = {
		0.937111,
		-0.222463,
		0.268948,
		0,
		0.340697,
		0.415642,
		-0.843308,
		0,
		0.075819,
		0.881903,
		0.465295,
		0,
		0.431492,
		-0.511265,
		0.057663,
		1
	},
	[0.0166666666667] = {
		0.886243,
		-0.363495,
		0.287133,
		0,
		0.460563,
		0.625144,
		-0.630141,
		0,
		0.049554,
		0.6907,
		0.721441,
		0,
		0.41305,
		-0.450366,
		0.103838,
		1
	},
	[0.0333333333333] = {
		0.833932,
		-0.509347,
		0.212424,
		0,
		0.550329,
		0.796256,
		-0.251225,
		0,
		-0.041183,
		0.326408,
		0.944331,
		0,
		0.39255,
		-0.324732,
		0.162246,
		1
	},
	[0.05] = {
		0.820797,
		-0.569793,
		0.040342,
		0,
		0.540337,
		0.79739,
		0.26871,
		0,
		-0.185277,
		-0.198758,
		0.962376,
		0,
		0.365274,
		-0.17087,
		0.217353,
		1
	},
	[0.0666666666667] = {
		0.871327,
		-0.475088,
		-0.122805,
		0,
		0.40613,
		0.557745,
		0.723863,
		0,
		-0.275405,
		-0.680596,
		0.678926,
		0,
		0.335412,
		-0.009556,
		0.249941,
		1
	},
	[0.0833333333333] = {
		0.941134,
		-0.293545,
		-0.167625,
		0,
		0.241121,
		0.23542,
		0.941509,
		0,
		-0.236913,
		-0.926504,
		0.292341,
		0,
		0.311068,
		0.148846,
		0.262085,
		1
	},
	[0.116666666667] = {
		0.995296,
		-0.057441,
		-0.078011,
		0,
		0.076885,
		-0.021552,
		0.996807,
		0,
		-0.058939,
		-0.998116,
		-0.017034,
		0,
		0.269087,
		0.347079,
		0.281336,
		1
	},
	[0.133333333333] = {
		0.998794,
		-0.010731,
		-0.047908,
		0,
		0.048298,
		0.039604,
		0.998047,
		0,
		-0.008813,
		-0.999158,
		0.040075,
		0,
		0.244602,
		0.368684,
		0.29302,
		1
	},
	[0.15] = {
		0.996813,
		0.071771,
		-0.034818,
		0,
		0.025584,
		0.125783,
		0.991728,
		0,
		0.075557,
		-0.989458,
		0.123546,
		0,
		0.221278,
		0.382618,
		0.302975,
		1
	},
	[0.166666666667] = {
		0.960603,
		0.266554,
		-0.078683,
		0,
		-0.002136,
		0.290183,
		0.956969,
		0,
		0.277916,
		-0.919099,
		0.27932,
		0,
		0.202397,
		0.372405,
		0.308929,
		1
	},
	[0.183333333333] = {
		0.93192,
		0.331656,
		-0.146731,
		0,
		-0.096021,
		0.615796,
		0.782033,
		0,
		0.349723,
		-0.714702,
		0.605719,
		0,
		0.155555,
		0.453914,
		0.247445,
		1
	},
	[0.1] = {
		0.982465,
		-0.137229,
		-0.126216,
		0,
		0.130281,
		0.021016,
		0.991254,
		0,
		-0.133376,
		-0.990316,
		0.038526,
		0,
		0.291155,
		0.279482,
		0.270136,
		1
	},
	[0.216666666667] = {
		0.95266,
		0.181948,
		-0.243587,
		0,
		-0.265234,
		0.888994,
		-0.373283,
		0,
		0.14863,
		0.420219,
		0.895168,
		0,
		0.033526,
		0.661708,
		-0.030032,
		1
	},
	[0.233333333333] = {
		0.98309,
		0.086172,
		-0.161581,
		0,
		-0.181161,
		0.586466,
		-0.789454,
		0,
		0.026733,
		0.805377,
		0.59216,
		0,
		0.002331,
		0.698482,
		-0.174521,
		1
	},
	[0.25] = {
		0.991435,
		0.006728,
		-0.130429,
		0,
		-0.129396,
		0.186018,
		-0.973989,
		0,
		0.01771,
		0.982523,
		0.185295,
		0,
		-0.016071,
		0.656813,
		-0.313458,
		1
	},
	[0.266666666667] = {
		0.999396,
		0.022183,
		-0.026748,
		0,
		-0.019425,
		-0.281605,
		-0.959334,
		0,
		-0.028813,
		0.959274,
		-0.281004,
		0,
		-0.023582,
		0.539877,
		-0.476271,
		1
	},
	[0.283333333333] = {
		0.981226,
		0.192414,
		0.013112,
		0,
		0.137137,
		-0.648303,
		-0.74893,
		0,
		-0.135604,
		0.736668,
		-0.662519,
		0,
		-0.008975,
		0.400571,
		-0.603186,
		1
	},
	[0.2] = {
		0.934923,
		0.281369,
		-0.21622,
		0,
		-0.218209,
		0.936362,
		0.274975,
		0,
		0.27983,
		-0.209899,
		0.936823,
		0,
		0.093432,
		0.569965,
		0.126276,
		1
	},
	[0.316666666667] = {
		0.844226,
		0.535962,
		-0.005238,
		0,
		0.379725,
		-0.604968,
		-0.699873,
		0,
		-0.378275,
		0.588862,
		-0.714248,
		0,
		0.073808,
		0.185059,
		-0.712491,
		1
	},
	[0.333333333333] = {
		0.748731,
		0.66252,
		0.021646,
		0,
		0.433149,
		-0.464272,
		-0.77255,
		0,
		-0.50178,
		0.587808,
		-0.634585,
		0,
		0.109669,
		0.131272,
		-0.720853,
		1
	},
	[0.35] = {
		0.697267,
		0.715459,
		0.044007,
		0,
		0.459906,
		-0.399431,
		-0.793058,
		0,
		-0.549823,
		0.573212,
		-0.607554,
		0,
		0.11558,
		0.123313,
		-0.721023,
		1
	},
	[0.366666666667] = {
		0.650158,
		0.756896,
		0.066362,
		0,
		0.478744,
		-0.340271,
		-0.809333,
		0,
		-0.59,
		0.557964,
		-0.583589,
		0,
		0.120955,
		0.115556,
		-0.719163,
		1
	},
	[0.383333333333] = {
		0.608535,
		0.788639,
		0.087942,
		0,
		0.491368,
		-0.287474,
		-0.822141,
		0,
		-0.623091,
		0.543513,
		-0.56245,
		0,
		0.125863,
		0.107928,
		-0.715334,
		1
	},
	[0.3] = {
		0.938853,
		0.344311,
		0.002445,
		0,
		0.268521,
		-0.727709,
		-0.631139,
		0,
		-0.215529,
		0.593203,
		-0.775666,
		0,
		0.01874,
		0.288706,
		-0.67912,
		1
	},
	[0.416666666667] = {
		0.543416,
		0.829802,
		0.126992,
		0,
		0.50376,
		-0.201339,
		-0.840053,
		0,
		-0.671509,
		0.520472,
		-0.527432,
		0,
		0.134473,
		0.092989,
		-0.70236,
		1
	},
	[0.433333333333] = {
		0.519981,
		0.84195,
		0.144016,
		0,
		0.505726,
		-0.167578,
		-0.846261,
		0,
		-0.688375,
		0.512873,
		-0.512934,
		0,
		0.138263,
		0.085684,
		-0.693512,
		1
	},
	[0.45] = {
		0.502362,
		0.849861,
		0.159276,
		0,
		0.50593,
		-0.139531,
		-0.851214,
		0,
		-0.70119,
		0.5082,
		-0.500065,
		0,
		0.141757,
		0.078511,
		-0.683285,
		1
	},
	[0.466666666667] = {
		0.490211,
		0.854303,
		0.172799,
		0,
		0.504919,
		-0.116742,
		-0.855236,
		0,
		-0.710457,
		0.506496,
		-0.488582,
		0,
		0.144984,
		0.071498,
		-0.671831,
		1
	},
	[0.483333333333] = {
		0.48313,
		0.855854,
		0.184658,
		0,
		0.503084,
		-0.098745,
		-0.858578,
		0,
		-0.716583,
		0.507704,
		-0.478273,
		0,
		0.147969,
		0.064676,
		-0.659298,
		1
	},
	[0.4] = {
		0.572906,
		0.812441,
		0.10825,
		0,
		0.499296,
		-0.241207,
		-0.83218,
		0,
		-0.649986,
		0.53081,
		-0.543837,
		0,
		0.130353,
		0.100407,
		-0.709683,
		1
	},
	[0.516666666667] = {
		0.48246,
		0.851876,
		0.203814,
		0,
		0.497919,
		-0.075295,
		-0.863949,
		0,
		-0.720631,
		0.518303,
		-0.460492,
		0,
		0.153285,
		0.051735,
		-0.631586,
		1
	},
	[0.533333333333] = {
		0.503762,
		0.839013,
		0.205623,
		0,
		0.500808,
		-0.08971,
		-0.860897,
		0,
		-0.703857,
		0.536665,
		-0.465377,
		0,
		0.156383,
		0.047222,
		-0.626675,
		1
	},
	[0.55] = {
		0.527961,
		0.823904,
		0.206009,
		0,
		0.503783,
		-0.108546,
		-0.856983,
		0,
		-0.68371,
		0.556238,
		-0.472377,
		0,
		0.159759,
		0.042828,
		-0.623069,
		1
	},
	[0.566666666667] = {
		0.554735,
		0.806331,
		0.205184,
		0,
		0.50637,
		-0.131506,
		-0.85223,
		0,
		-0.660196,
		0.57666,
		-0.481253,
		0,
		0.163399,
		0.0386,
		-0.620692,
		1
	},
	[0.583333333333] = {
		0.58373,
		0.786069,
		0.203358,
		0,
		0.508069,
		-0.158258,
		-0.846652,
		0,
		-0.633344,
		0.597536,
		-0.491757,
		0,
		0.167291,
		0.034587,
		-0.619469,
		1
	},
	[0.5] = {
		0.480691,
		0.854943,
		0.194958,
		0,
		0.500693,
		-0.085076,
		-0.861434,
		0,
		-0.719891,
		0.511697,
		-0.46896,
		0,
		0.15073,
		0.058078,
		-0.645834,
		1
	},
	[0.616666666667] = {
		0.646795,
		0.736639,
		0.197535,
		0,
		0.506778,
		-0.221562,
		-0.833118,
		0,
		-0.569941,
		0.638963,
		-0.516618,
		0,
		0.175801,
		0.027378,
		-0.620181,
		1
	},
	[0.633333333333] = {
		0.679982,
		0.707118,
		0.19393,
		0,
		0.50282,
		-0.257198,
		-0.82524,
		0,
		-0.533663,
		0.658661,
		-0.530443,
		0,
		0.180414,
		0.024261,
		-0.621961,
		1
	},
	[0.65] = {
		0.713633,
		0.674232,
		0.190105,
		0,
		0.496076,
		-0.29479,
		-0.816705,
		0,
		-0.494608,
		0.677134,
		-0.544842,
		0,
		0.185267,
		0.021516,
		-0.624587,
		1
	},
	[0.666666666667] = {
		0.747237,
		0.637933,
		0.186218,
		0,
		0.486193,
		-0.33375,
		-0.807606,
		0,
		-0.453049,
		0.694012,
		-0.559549,
		0,
		0.190364,
		0.019167,
		-0.627978,
		1
	},
	[0.683333333333] = {
		0.780276,
		0.598244,
		0.182412,
		0,
		0.4729,
		-0.373455,
		-0.798058,
		0,
		-0.409311,
		0.708968,
		-0.574307,
		0,
		0.195709,
		0.017234,
		-0.632052,
		1
	},
	[0.6] = {
		0.614558,
		0.762903,
		0.200742,
		0,
		0.508371,
		-0.18842,
		-0.840272,
		0,
		-0.603222,
		0.618447,
		-0.503633,
		0,
		0.171427,
		0.030832,
		-0.619324,
		1
	},
	[0.716666666667] = {
		0.842597,
		0.509146,
		0.175499,
		0,
		0.435509,
		-0.452497,
		-0.778189,
		0,
		-0.316799,
		0.732131,
		-0.603011,
		0,
		0.207162,
		0.014657,
		-0.641908,
		1
	},
	[0.733333333333] = {
		0.870906,
		0.460157,
		0.172565,
		0,
		0.411396,
		-0.490534,
		-0.768199,
		0,
		-0.268843,
		0.740021,
		-0.616516,
		0,
		0.213271,
		0.014014,
		-0.647512,
		1
	},
	[0.75] = {
		0.896729,
		0.408603,
		0.170059,
		0,
		0.383848,
		-0.526753,
		-0.758414,
		0,
		-0.220311,
		0.745369,
		-0.629196,
		0,
		0.219629,
		0.013789,
		-0.653447,
		1
	},
	[0.766666666667] = {
		0.9197,
		0.354856,
		0.168016,
		0,
		0.353133,
		-0.56059,
		-0.749023,
		0,
		-0.171607,
		0.748208,
		-0.640886,
		0,
		0.226222,
		0.013967,
		-0.659617,
		1
	},
	[0.783333333333] = {
		0.939516,
		0.299335,
		0.166456,
		0,
		0.319616,
		-0.591549,
		-0.740213,
		0,
		-0.123105,
		0.748644,
		-0.651442,
		0,
		0.233029,
		0.014526,
		-0.665928,
		1
	},
	[0.7] = {
		0.81223,
		0.555257,
		0.178807,
		0,
		0.456027,
		-0.413256,
		-0.7882,
		0,
		-0.363761,
		0.72174,
		-0.588871,
		0,
		0.201308,
		0.01573,
		-0.636724,
		1
	},
	[0.816666666667] = {
		0.968861,
		0.184788,
		0.16481,
		0,
		0.246022,
		-0.64325,
		-0.725054,
		0,
		-0.027967,
		0.743023,
		-0.668682,
		0,
		0.247158,
		0.016689,
		-0.678583,
		1
	},
	[0.833333333333] = {
		0.97817,
		0.12669,
		0.164723,
		0,
		0.20701,
		-0.663433,
		-0.719029,
		0,
		0.018189,
		0.737432,
		-0.675176,
		0,
		0.254394,
		0.018239,
		-0.684731,
		1
	},
	[0.8] = {
		0.955953,
		0.242491,
		0.165387,
		0,
		0.283742,
		-0.619211,
		-0.732167,
		0,
		-0.075134,
		0.746844,
		-0.660741,
		0,
		0.240021,
		0.015442,
		-0.672283,
		1
	}
}

return spline_matrices
