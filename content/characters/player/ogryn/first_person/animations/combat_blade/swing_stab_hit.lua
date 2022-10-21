local spline_matrices = {
	[0] = {
		0.297613,
		-0.598715,
		0.743618,
		0,
		-0.462206,
		0.591178,
		0.660965,
		0,
		-0.83534,
		-0.540416,
		-0.100787,
		0,
		-0.179612,
		1.359087,
		-0.10228,
		1
	},
	[0.0166666666667] = {
		0.12467,
		-0.755191,
		0.64354,
		0,
		-0.262744,
		0.600317,
		0.755371,
		0,
		-0.956777,
		-0.263259,
		-0.123581,
		0,
		0.108712,
		1.505554,
		-0.026335,
		1
	},
	[0.0333333333333] = {
		0.100393,
		-0.777582,
		0.620715,
		0,
		-0.193309,
		0.596734,
		0.778807,
		0,
		-0.975988,
		-0.198177,
		-0.090406,
		0,
		0.108195,
		1.519359,
		-0.020004,
		1
	},
	[0.05] = {
		0.152284,
		-0.762709,
		0.628558,
		0,
		-0.178799,
		0.604221,
		0.776497,
		0,
		-0.972029,
		-0.230634,
		-0.044358,
		0,
		0.094193,
		1.520212,
		-0.025343,
		1
	},
	[0.0666666666667] = {
		0.190611,
		-0.748272,
		0.635419,
		0,
		-0.173828,
		0.61133,
		0.772049,
		0,
		-0.966153,
		-0.257614,
		-0.013544,
		0,
		0.093387,
		1.518142,
		-0.028333,
		1
	},
	[0.0833333333333] = {
		0.187314,
		-0.748973,
		0.635572,
		0,
		-0.16435,
		0.614009,
		0.771999,
		0,
		-0.968454,
		-0.249063,
		-0.008082,
		0,
		0.108124,
		1.517763,
		-0.027552,
		1
	},
	[0.116666666667] = {
		0.157932,
		-0.749463,
		0.642933,
		0,
		-0.172554,
		0.620139,
		0.765279,
		0,
		-0.972256,
		-0.231803,
		-0.031383,
		0,
		0.142202,
		1.515851,
		-0.032406,
		1
	},
	[0.133333333333] = {
		0.137308,
		-0.748912,
		0.648288,
		0,
		-0.184008,
		0.623809,
		0.759607,
		0,
		-0.973287,
		-0.22359,
		-0.052152,
		0,
		0.158838,
		1.514464,
		-0.036884,
		1
	},
	[0.15] = {
		0.116477,
		-0.747747,
		0.653687,
		0,
		-0.196243,
		0.627865,
		0.753176,
		0,
		-0.973613,
		-0.21601,
		-0.073608,
		0,
		0.173363,
		1.512948,
		-0.042019,
		1
	},
	[0.166666666667] = {
		0.098328,
		-0.746,
		0.658647,
		0,
		-0.206232,
		0.63221,
		0.746846,
		0,
		-0.97355,
		-0.20927,
		-0.091685,
		0,
		0.184371,
		1.511429,
		-0.047335,
		1
	},
	[0.183333333333] = {
		0.085774,
		-0.743759,
		0.662922,
		0,
		-0.211003,
		0.63672,
		0.741664,
		0,
		-0.973715,
		-0.203494,
		-0.102322,
		0,
		0.19044,
		1.510035,
		-0.052408,
		1
	},
	[0.1] = {
		0.17552,
		-0.749441,
		0.638381,
		0,
		-0.164964,
		0.61689,
		0.769567,
		0,
		-0.970556,
		-0.240385,
		-0.015354,
		0,
		0.124843,
		1.516983,
		-0.029107,
		1
	},
	[0.216666666667] = {
		0.070045,
		-0.742414,
		0.666269,
		0,
		-0.208554,
		0.642251,
		0.737577,
		0,
		-0.975499,
		-0.190617,
		-0.109847,
		0,
		0.193979,
		1.507206,
		-0.059625,
		1
	},
	[0.233333333333] = {
		0.064268,
		-0.744033,
		0.665044,
		0,
		-0.203709,
		0.642608,
		0.738618,
		0,
		-0.97692,
		-0.182945,
		-0.110267,
		0,
		0.193922,
		1.505721,
		-0.061003,
		1
	},
	[0.25] = {
		0.059841,
		-0.74636,
		0.662847,
		0,
		-0.196943,
		0.642156,
		0.740843,
		0,
		-0.978587,
		-0.174876,
		-0.108563,
		0,
		0.193087,
		1.504218,
		-0.061459,
		1
	},
	[0.266666666667] = {
		0.056427,
		-0.748499,
		0.660731,
		0,
		-0.189007,
		0.641811,
		0.743206,
		0,
		-0.980353,
		-0.166819,
		-0.105256,
		0,
		0.191785,
		1.502696,
		-0.061965,
		1
	},
	[0.283333333333] = {
		0.054329,
		-0.749994,
		0.659209,
		0,
		-0.18021,
		0.641979,
		0.745243,
		0,
		-0.982127,
		-0.159285,
		-0.100279,
		0,
		0.190012,
		1.501233,
		-0.062643,
		1
	},
	[0.2] = {
		0.07737,
		-0.742239,
		0.665654,
		0,
		-0.21098,
		0.640347,
		0.738542,
		0,
		-0.974424,
		-0.197581,
		-0.107054,
		0,
		0.192864,
		1.50867,
		-0.056669,
		1
	},
	[0.316666666667] = {
		0.055388,
		-0.749271,
		0.659943,
		0,
		-0.161263,
		0.645567,
		0.746484,
		0,
		-0.985356,
		-0.147771,
		-0.085073,
		0,
		0.185036,
		1.498807,
		-0.064994,
		1
	},
	[0.333333333333] = {
		0.059236,
		-0.746138,
		0.66315,
		0,
		-0.151744,
		0.649866,
		0.744747,
		0,
		-0.986643,
		-0.144746,
		-0.074727,
		0,
		0.181816,
		1.49801,
		-0.066908,
		1
	},
	[0.35] = {
		0.065781,
		-0.740499,
		0.668831,
		0,
		-0.142649,
		0.656419,
		0.740787,
		0,
		-0.987585,
		-0.144138,
		-0.062451,
		0,
		0.17809,
		1.497597,
		-0.069472,
		1
	},
	[0.366666666667] = {
		0.075393,
		-0.731784,
		0.677353,
		0,
		-0.134361,
		0.665637,
		0.734081,
		0,
		-0.98806,
		-0.146354,
		-0.048139,
		0,
		0.173841,
		1.497637,
		-0.072804,
		1
	},
	[0.383333333333] = {
		0.085546,
		-0.718612,
		0.690129,
		0,
		-0.127327,
		0.679104,
		0.722915,
		0,
		-0.988165,
		-0.149715,
		-0.033405,
		0,
		0.167297,
		1.499174,
		-0.079894,
		1
	},
	[0.3] = {
		0.05387,
		-0.750401,
		0.658784,
		0,
		-0.170859,
		0.643085,
		0.746491,
		0,
		-0.983822,
		-0.152773,
		-0.09357,
		0,
		0.187765,
		1.499909,
		-0.063613,
		1
	},
	[0.416666666667] = {
		0.110349,
		-0.679129,
		0.725677,
		0,
		-0.115508,
		0.716426,
		0.688035,
		0,
		-0.987158,
		-0.159745,
		0.000612,
		0,
		0.146744,
		1.506495,
		-0.108482,
		1
	},
	[0.433333333333] = {
		0.132699,
		-0.654684,
		0.744164,
		0,
		-0.109771,
		0.736478,
		0.667496,
		0,
		-0.985059,
		-0.170264,
		0.025865,
		0,
		0.135393,
		1.510214,
		-0.126314,
		1
	},
	[0.45] = {
		0.16699,
		-0.627968,
		0.760112,
		0,
		-0.103835,
		0.755449,
		0.646928,
		0,
		-0.980476,
		-0.186957,
		0.060947,
		0,
		0.124855,
		1.512656,
		-0.14413,
		1
	},
	[0.466666666667] = {
		0.217048,
		-0.599186,
		0.770628,
		0,
		-0.097287,
		0.772239,
		0.627839,
		0,
		-0.971301,
		-0.211243,
		0.10932,
		0,
		0.116881,
		1.512811,
		-0.160012,
		1
	},
	[0.483333333333] = {
		0.287605,
		-0.567707,
		0.771357,
		0,
		-0.092357,
		0.785193,
		0.612326,
		0,
		-0.953286,
		-0.247348,
		0.173394,
		0,
		0.11348,
		1.509363,
		-0.171083,
		1
	},
	[0.4] = {
		0.095955,
		-0.700721,
		0.706953,
		0,
		-0.121254,
		0.696712,
		0.707029,
		0,
		-0.987973,
		-0.153564,
		-0.018112,
		0,
		0.157745,
		1.502483,
		-0.092411,
		1
	},
	[0.516666666667] = {
		0.475846,
		-0.486885,
		0.732471,
		0,
		-0.091699,
		0.800798,
		0.591874,
		0,
		-0.874736,
		-0.348807,
		0.336409,
		0,
		0.122538,
		1.489398,
		-0.17832,
		1
	},
	[0.533333333333] = {
		0.578216,
		-0.433646,
		0.691099,
		0,
		-0.093649,
		0.806182,
		0.58421,
		0,
		-0.810491,
		-0.402521,
		0.425537,
		0,
		0.134872,
		1.472793,
		-0.177551,
		1
	},
	[0.55] = {
		0.675767,
		-0.371792,
		0.636482,
		0,
		-0.095944,
		0.811766,
		0.576047,
		0,
		-0.730845,
		-0.45034,
		0.512894,
		0,
		0.152156,
		1.451914,
		-0.176199,
		1
	},
	[0.566666666667] = {
		0.762208,
		-0.303415,
		0.571821,
		0,
		-0.098251,
		0.818892,
		0.565476,
		0,
		-0.639833,
		-0.487192,
		0.594355,
		0,
		0.173876,
		1.427003,
		-0.176217,
		1
	},
	[0.583333333333] = {
		0.833495,
		-0.231818,
		0.501544,
		0,
		-0.100719,
		0.828773,
		0.550446,
		0,
		-0.54327,
		-0.509309,
		0.667429,
		0,
		0.199169,
		1.398329,
		-0.179637,
		1
	},
	[0.5] = {
		0.376325,
		-0.531126,
		0.759134,
		0,
		-0.090893,
		0.79425,
		0.600754,
		0,
		-0.922019,
		-0.295079,
		0.25062,
		0,
		0.115384,
		1.501589,
		-0.176702,
		1
	},
	[0.616666666667] = {
		0.926844,
		-0.093721,
		0.363561,
		0,
		-0.108357,
		0.860364,
		0.498029,
		0,
		-0.35947,
		-0.50099,
		0.787268,
		0,
		0.255378,
		1.330437,
		-0.204694,
		1
	},
	[0.633333333333] = {
		0.951881,
		-0.03321,
		0.304664,
		0,
		-0.114936,
		0.882868,
		0.455339,
		0,
		-0.2841,
		-0.468445,
		0.836568,
		0,
		0.28293,
		1.29135,
		-0.230177,
		1
	},
	[0.65] = {
		0.966094,
		0.019301,
		0.257469,
		0,
		-0.123917,
		0.909506,
		0.39679,
		0,
		-0.226511,
		-0.415241,
		0.88106,
		0,
		0.307682,
		1.248695,
		-0.267095,
		1
	},
	[0.666666666667] = {
		0.973116,
		0.066318,
		0.220563,
		0,
		-0.135496,
		0.939236,
		0.315399,
		0,
		-0.186244,
		-0.336805,
		0.922971,
		0,
		0.331832,
		1.195788,
		-0.325865,
		1
	},
	[0.683333333333] = {
		0.975825,
		0.11055,
		0.188532,
		0,
		-0.149736,
		0.966542,
		0.208269,
		0,
		-0.1592,
		-0.231464,
		0.959729,
		0,
		0.357996,
		1.127972,
		-0.411793,
		1
	},
	[0.6] = {
		0.888128,
		-0.160766,
		0.430562,
		0,
		-0.103855,
		0.842392,
		0.528762,
		0,
		-0.447709,
		-0.514324,
		0.731456,
		0,
		0.226845,
		1.366102,
		-0.188493,
		1
	},
	[0.716666666667] = {
		0.973254,
		0.189364,
		0.130067,
		0,
		-0.181383,
		0.980861,
		-0.070796,
		0,
		-0.140983,
		0.04531,
		0.988975,
		0,
		0.41268,
		0.958221,
		-0.642821,
		1
	},
	[0.733333333333] = {
		0.969669,
		0.222889,
		0.100317,
		0,
		-0.195315,
		0.953333,
		-0.230233,
		0,
		-0.146952,
		0.203657,
		0.967951,
		0,
		0.439717,
		0.861709,
		-0.775902,
		1
	},
	[0.75] = {
		0.965395,
		0.251511,
		0.068951,
		0,
		-0.205837,
		0.897199,
		-0.390724,
		0,
		-0.160134,
		0.36301,
		0.917922,
		0,
		0.465682,
		0.76156,
		-0.912045,
		1
	},
	[0.766666666667] = {
		0.960923,
		0.2745,
		0.035725,
		0,
		-0.212126,
		0.813124,
		-0.542062,
		0,
		-0.177845,
		0.513302,
		0.839578,
		0,
		0.489909,
		0.661508,
		-1.0445,
		1
	},
	[0.783333333333] = {
		0.955976,
		0.293443,
		0.000325,
		0,
		-0.21604,
		0.704561,
		-0.675959,
		0,
		-0.198585,
		0.646131,
		0.736939,
		0,
		0.51011,
		0.566042,
		-1.167201,
		1
	},
	[0.7] = {
		0.975552,
		0.151706,
		0.159007,
		0,
		-0.165581,
		0.983114,
		0.077906,
		0,
		-0.144503,
		-0.10233,
		0.984199,
		0,
		0.385211,
		1.047907,
		-0.51938,
		1
	},
	[0.816666666667] = {
		0.949081,
		0.306483,
		-0.072895,
		0,
		-0.21158,
		0.448679,
		-0.868286,
		0,
		-0.233409,
		0.839497,
		0.490679,
		0,
		0.544001,
		0.4069,
		-1.355117,
		1
	},
	[0.833333333333] = {
		0.946169,
		0.30399,
		-0.111149,
		0,
		-0.209892,
		0.314841,
		-0.925646,
		0,
		-0.246393,
		0.899147,
		0.361698,
		0,
		0.553331,
		0.353369,
		-1.409975,
		1
	},
	[0.85] = {
		0.943312,
		0.29563,
		-0.15088,
		0,
		-0.211445,
		0.184865,
		-0.959748,
		0,
		-0.255837,
		0.937245,
		0.236895,
		0,
		0.556304,
		0.323557,
		-1.431803,
		1
	},
	[0.8] = {
		0.952312,
		0.303026,
		-0.035737,
		0,
		-0.214321,
		0.580937,
		-0.785225,
		0,
		-0.217183,
		0.755438,
		0.618178,
		0,
		0.529286,
		0.47942,
		-1.272374,
		1
	}
}

return spline_matrices