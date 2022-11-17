local spline_matrices = {
	[0] = {
		0.717177,
		-0.690593,
		-0.093481,
		0,
		-0.238326,
		-0.116995,
		-0.964113,
		0,
		0.654873,
		0.713718,
		-0.248492,
		0,
		0.661095,
		-0.486394,
		-1.310112,
		1
	},
	{
		0.985964,
		0.035745,
		-0.163087,
		0,
		-0.163843,
		0.019336,
		-0.986297,
		0,
		-0.032102,
		0.999174,
		0.024921,
		0,
		0.629714,
		-0.105866,
		-1.492706,
		1
	},
	[0.0166666666667] = {
		0.65204,
		-0.755652,
		-0.061923,
		0,
		-0.194362,
		-0.08765,
		-0.977006,
		0,
		0.732849,
		0.649082,
		-0.204021,
		0,
		0.697593,
		-0.482963,
		-1.295258,
		1
	},
	[0.0333333333333] = {
		0.575471,
		-0.817753,
		-0.010649,
		0,
		-0.133317,
		-0.080955,
		-0.987762,
		0,
		0.806883,
		0.569848,
		-0.155608,
		0,
		0.782718,
		-0.48452,
		-1.250846,
		1
	},
	[0.05] = {
		0.494317,
		-0.868102,
		0.045267,
		0,
		-0.058449,
		-0.085148,
		-0.994652,
		0,
		0.867315,
		0.489028,
		-0.092829,
		0,
		0.89715,
		-0.487984,
		-1.183069,
		1
	},
	[0.0666666666667] = {
		0.420739,
		-0.90311,
		0.085859,
		0,
		0.027423,
		-0.081939,
		-0.99626,
		0,
		0.906767,
		0.42152,
		-0.009709,
		0,
		1.021899,
		-0.489021,
		-1.098439,
		1
	},
	[0.0833333333333] = {
		0.368502,
		-0.925108,
		0.091547,
		0,
		0.123067,
		-0.049064,
		-0.991185,
		0,
		0.921445,
		0.37652,
		0.09577,
		0,
		1.138431,
		-0.482734,
		-1.00353,
		1
	},
	[0.116666666667] = {
		0.372694,
		-0.92647,
		-0.052462,
		0,
		0.338665,
		0.188436,
		-0.921845,
		0,
		0.863948,
		0.325799,
		0.383992,
		0,
		1.272368,
		-0.43023,
		-0.800853,
		1
	},
	[0.133333333333] = {
		0.439332,
		-0.87525,
		-0.202301,
		0,
		0.450902,
		0.409627,
		-0.793028,
		0,
		0.776965,
		0.257185,
		0.574614,
		0,
		1.285036,
		-0.373682,
		-0.675067,
		1
	},
	[0.15] = {
		0.542391,
		-0.761964,
		-0.353869,
		0,
		0.54436,
		0.639573,
		-0.542788,
		0,
		0.63991,
		0.101771,
		0.761681,
		0,
		1.289836,
		-0.302763,
		-0.504752,
		1
	},
	[0.166666666667] = {
		0.67,
		-0.590788,
		-0.449522,
		0,
		0.581401,
		0.794108,
		-0.177102,
		0,
		0.461599,
		-0.142694,
		0.875537,
		0,
		1.278631,
		-0.23861,
		-0.2953,
		1
	},
	[0.183333333333] = {
		0.801469,
		-0.394992,
		-0.44903,
		0,
		0.533054,
		0.812219,
		0.236969,
		0,
		0.27111,
		-0.42928,
		0.861521,
		0,
		1.245018,
		-0.19828,
		-0.06477,
		1
	},
	[0.1] = {
		0.349263,
		-0.935794,
		0.048015,
		0,
		0.227953,
		0.035153,
		-0.973037,
		0,
		0.908874,
		0.350792,
		0.225595,
		0,
		1.228308,
		-0.464477,
		-0.90365,
		1
	},
	[0.216666666667] = {
		0.97374,
		-0.116238,
		-0.195753,
		0,
		0.227631,
		0.482721,
		0.845674,
		0,
		-0.003806,
		-0.868026,
		0.496505,
		0,
		1.121323,
		-0.19408,
		0.355817,
		1
	},
	[0.233333333333] = {
		0.996423,
		-0.074894,
		-0.039144,
		0,
		0.057299,
		0.258288,
		0.964367,
		0,
		-0.062114,
		-0.96316,
		0.261656,
		0,
		1.052137,
		-0.207807,
		0.512401,
		1
	},
	[0.25] = {
		0.991126,
		-0.079296,
		0.106687,
		0,
		-0.105085,
		0.024122,
		0.994171,
		0,
		-0.081407,
		-0.996559,
		0.015575,
		0,
		0.983506,
		-0.224576,
		0.646432,
		1
	},
	[0.266666666667] = {
		0.963158,
		-0.12016,
		0.240598,
		0,
		-0.262824,
		-0.230922,
		0.936802,
		0,
		-0.057007,
		-0.965524,
		-0.253996,
		0,
		0.914727,
		-0.24405,
		0.765391,
		1
	},
	[0.283333333333] = {
		0.921325,
		-0.186214,
		0.341298,
		0,
		-0.388621,
		-0.467168,
		0.794184,
		0,
		0.011555,
		-0.864337,
		-0.50278,
		0,
		0.852899,
		-0.256122,
		0.860368,
		1
	},
	[0.2] = {
		0.909542,
		-0.224101,
		-0.350017,
		0,
		0.401598,
		0.690746,
		0.601323,
		0,
		0.107016,
		-0.687495,
		0.718261,
		0,
		1.189453,
		-0.186323,
		0.160224,
		1
	},
	[0.316666666667] = {
		0.855712,
		-0.291737,
		0.427372,
		0,
		-0.477649,
		-0.762995,
		0.435535,
		0,
		0.199021,
		-0.576826,
		-0.792251,
		0,
		0.7697,
		-0.224833,
		0.98497,
		1
	},
	[0.333333333333] = {
		0.850728,
		-0.28483,
		0.441739,
		0,
		-0.453206,
		-0.823174,
		0.342037,
		0,
		0.266206,
		-0.491179,
		-0.829384,
		0,
		0.747342,
		-0.179047,
		1.026034,
		1
	},
	[0.35] = {
		0.857961,
		-0.230513,
		0.459093,
		0,
		-0.411813,
		-0.842864,
		0.346397,
		0,
		0.307104,
		-0.486256,
		-0.818073,
		0,
		0.717993,
		-0.103855,
		1.064142,
		1
	},
	[0.366666666667] = {
		0.867198,
		-0.140627,
		0.477693,
		0,
		-0.369277,
		-0.825175,
		0.427459,
		0,
		0.334068,
		-0.547092,
		-0.767521,
		0,
		0.667284,
		0.005439,
		1.105287,
		1
	},
	[0.383333333333] = {
		0.876338,
		-0.024813,
		0.481057,
		0,
		-0.330485,
		-0.757526,
		0.562968,
		0,
		0.350445,
		-0.652333,
		-0.672049,
		0,
		0.59902,
		0.140258,
		1.142644,
		1
	},
	[0.3] = {
		0.880977,
		-0.252526,
		0.400137,
		0,
		-0.461042,
		-0.64829,
		0.605938,
		0,
		0.10639,
		-0.718298,
		-0.687554,
		0,
		0.804018,
		-0.251059,
		0.9315,
		1
	},
	[0.416666666667] = {
		0.895353,
		0.219505,
		0.387505,
		0,
		-0.270994,
		-0.421955,
		0.865168,
		0,
		0.353418,
		-0.879643,
		-0.318314,
		0,
		0.427881,
		0.457573,
		1.187366,
		1
	},
	[0.433333333333] = {
		0.906843,
		0.307737,
		0.287983,
		0,
		-0.248563,
		-0.161313,
		0.955089,
		0,
		0.340372,
		-0.937697,
		-0.069794,
		0,
		0.333381,
		0.615319,
		1.175177,
		1
	},
	[0.45] = {
		0.948058,
		0.28503,
		0.141225,
		0,
		-0.207182,
		0.216405,
		0.954067,
		0,
		0.241376,
		-0.93377,
		0.264217,
		0,
		0.267056,
		0.812967,
		1.076635,
		1
	},
	[0.466666666667] = {
		0.989076,
		0.143478,
		0.033795,
		0,
		-0.118303,
		0.63589,
		0.762659,
		0,
		0.087935,
		-0.758326,
		0.645917,
		0,
		0.253472,
		1.033493,
		0.857982,
		1
	},
	[0.483333333333] = {
		0.994293,
		0.096344,
		-0.045813,
		0,
		-0.070564,
		0.916014,
		0.394892,
		0,
		0.080011,
		-0.389406,
		0.917585,
		0,
		0.207465,
		1.225962,
		0.549663,
		1
	},
	[0.4] = {
		0.885404,
		0.101969,
		0.4535,
		0,
		-0.297733,
		-0.624815,
		0.721776,
		0,
		0.356953,
		-0.774085,
		-0.522854,
		0,
		0.517948,
		0.29408,
		1.172678,
		1
	},
	[0.516666666667] = {
		0.950671,
		0.182238,
		-0.251026,
		0,
		-0.297526,
		0.764645,
		-0.571661,
		0,
		0.087767,
		0.618149,
		0.781146,
		0,
		0.067909,
		1.516704,
		-0.255509,
		1
	},
	[0.533333333333] = {
		0.869238,
		0.225971,
		-0.43973,
		0,
		-0.49427,
		0.417056,
		-0.762733,
		0,
		0.011036,
		0.880342,
		0.474212,
		0,
		0.031958,
		1.499241,
		-0.594377,
		1
	},
	[0.55] = {
		0.909724,
		0.08815,
		-0.405748,
		0,
		-0.40945,
		0.028208,
		-0.911897,
		0,
		-0.068939,
		0.995708,
		0.061754,
		0,
		-0.106593,
		1.195668,
		-0.981521,
		1
	},
	[0.566666666667] = {
		0.750094,
		-0.058369,
		-0.658751,
		0,
		-0.652016,
		-0.231868,
		-0.721881,
		0,
		-0.110608,
		0.970994,
		-0.21198,
		0,
		-0.286673,
		0.754274,
		-1.326928,
		1
	},
	[0.583333333333] = {
		0.781385,
		-0.186437,
		-0.595549,
		0,
		-0.363464,
		-0.911721,
		-0.191464,
		0,
		-0.507279,
		0.366068,
		-0.780168,
		0,
		-0.296086,
		0.278039,
		-1.523432,
		1
	},
	[0.5] = {
		0.977928,
		0.134009,
		-0.160304,
		0,
		-0.153098,
		0.981695,
		-0.113299,
		0,
		0.142187,
		0.13534,
		0.980544,
		0,
		0.129644,
		1.403516,
		0.153082,
		1
	},
	[0.616666666667] = {
		0.971767,
		0.215087,
		-0.096985,
		0,
		0.23592,
		-0.880252,
		0.411701,
		0,
		0.00318,
		-0.422959,
		-0.906143,
		0,
		-0.165476,
		0.024412,
		-1.461663,
		1
	},
	[0.633333333333] = {
		0.966376,
		0.240159,
		-0.091877,
		0,
		0.256578,
		-0.924098,
		0.283215,
		0,
		-0.016887,
		-0.297266,
		-0.954645,
		0,
		-0.104004,
		-0.093939,
		-1.514616,
		1
	},
	[0.65] = {
		0.964549,
		0.22528,
		-0.137459,
		0,
		0.226245,
		-0.974031,
		-0.008766,
		0,
		-0.135864,
		-0.022644,
		-0.990469,
		0,
		-0.027287,
		-0.210068,
		-1.598962,
		1
	},
	[0.666666666667] = {
		0.954164,
		0.210465,
		-0.212783,
		0,
		0.118682,
		-0.918761,
		-0.376554,
		0,
		-0.274748,
		0.334041,
		-0.901626,
		0,
		0.04692,
		-0.286051,
		-1.689391,
		1
	},
	[0.683333333333] = {
		0.938314,
		0.209912,
		-0.274778,
		0,
		-0.025976,
		-0.749618,
		-0.661361,
		0,
		-0.344806,
		0.627702,
		-0.697924,
		0,
		0.11254,
		-0.307536,
		-1.748862,
		1
	},
	[0.6] = {
		0.977809,
		0.104774,
		-0.181419,
		0,
		0.162388,
		-0.926172,
		0.340347,
		0,
		-0.132366,
		-0.362254,
		-0.922633,
		0,
		-0.204589,
		0.116665,
		-1.456565,
		1
	},
	[0.716666666667] = {
		0.954654,
		0.140996,
		-0.262215,
		0,
		-0.157395,
		-0.508584,
		-0.846504,
		0,
		-0.252712,
		0.84939,
		-0.463329,
		0,
		0.232678,
		-0.277242,
		-1.765507,
		1
	},
	[0.733333333333] = {
		0.971646,
		0.043432,
		-0.232419,
		0,
		-0.190545,
		-0.438161,
		-0.878469,
		0,
		-0.139991,
		0.897847,
		-0.417461,
		0,
		0.295428,
		-0.264921,
		-1.748178,
		1
	},
	[0.75] = {
		0.976498,
		-0.084272,
		-0.198366,
		0,
		-0.215524,
		-0.380119,
		-0.899477,
		0,
		0.000398,
		0.92109,
		-0.389349,
		0,
		0.358689,
		-0.255743,
		-1.721839,
		1
	},
	[0.766666666667] = {
		0.960568,
		-0.227023,
		-0.160528,
		0,
		-0.231159,
		-0.331209,
		-0.914804,
		0,
		0.154514,
		0.915839,
		-0.370627,
		0,
		0.419734,
		-0.247719,
		-1.690177,
		1
	},
	[0.783333333333] = {
		0.922438,
		-0.366675,
		-0.121064,
		0,
		-0.236746,
		-0.289352,
		-0.927484,
		0,
		0.305055,
		0.884209,
		-0.353718,
		0,
		0.475795,
		-0.239363,
		-1.657427,
		1
	},
	[0.7] = {
		0.937528,
		0.19699,
		-0.286767,
		0,
		-0.117782,
		-0.595877,
		-0.794391,
		0,
		-0.327365,
		0.778541,
		-0.53545,
		0,
		0.172807,
		-0.295083,
		-1.769608,
		1
	},
	[0.816666666667] = {
		0.821449,
		-0.567178,
		-0.059419,
		0,
		-0.219118,
		-0.21771,
		-0.951099,
		0,
		0.526506,
		0.794299,
		-0.303117,
		0,
		0.563327,
		-0.245664,
		-1.6024,
		1
	},
	[0.833333333333] = {
		0.793344,
		-0.606771,
		-0.049329,
		0,
		-0.198376,
		-0.181063,
		-0.963257,
		0,
		0.575545,
		0.77398,
		-0.264014,
		0,
		0.592451,
		-0.260986,
		-1.589879,
		1
	},
	[0.85] = {
		0.790976,
		-0.609661,
		-0.051665,
		0,
		-0.17524,
		-0.144832,
		-0.973814,
		0,
		0.586214,
		0.779318,
		-0.221396,
		0,
		0.611462,
		-0.266448,
		-1.561904,
		1
	},
	[0.866666666667] = {
		0.805872,
		-0.589174,
		-0.058692,
		0,
		-0.154741,
		-0.113894,
		-0.981368,
		0,
		0.571512,
		0.799939,
		-0.182953,
		0,
		0.625898,
		-0.260536,
		-1.536843,
		1
	},
	[0.883333333333] = {
		0.833524,
		-0.548162,
		-0.068959,
		0,
		-0.138759,
		-0.08689,
		-0.986507,
		0,
		0.534774,
		0.831846,
		-0.148487,
		0,
		0.636225,
		-0.246683,
		-1.518642,
		1
	},
	[0.8] = {
		0.870578,
		-0.484598,
		-0.085197,
		0,
		-0.232447,
		-0.252456,
		-0.939273,
		0,
		0.433661,
		0.837515,
		-0.332426,
		0,
		0.52406,
		-0.237159,
		-1.626752,
		1
	},
	[0.916666666667] = {
		0.905117,
		-0.414177,
		-0.096021,
		0,
		-0.124186,
		-0.041551,
		-0.991389,
		0,
		0.406621,
		0.909247,
		-0.089044,
		0,
		0.645353,
		-0.203016,
		-1.498204,
		1
	},
	[0.933333333333] = {
		0.938302,
		-0.327387,
		-0.111388,
		0,
		-0.125813,
		-0.023147,
		-0.991784,
		0,
		0.322119,
		0.944607,
		-0.062908,
		0,
		0.644966,
		-0.177581,
		-1.493843,
		1
	},
	[0.95] = {
		0.964103,
		-0.233264,
		-0.126861,
		0,
		-0.132353,
		-0.00798,
		-0.99117,
		0,
		0.230193,
		0.972381,
		-0.038567,
		0,
		0.642171,
		-0.15286,
		-1.492079,
		1
	},
	[0.966666666667] = {
		0.98037,
		-0.1374,
		-0.141406,
		0,
		-0.142233,
		0.003827,
		-0.989826,
		0,
		0.136543,
		0.990508,
		-0.015791,
		0,
		0.637917,
		-0.131194,
		-1.491931,
		1
	},
	[0.983333333333] = {
		0.987029,
		-0.045785,
		-0.153876,
		0,
		-0.153453,
		0.01262,
		-0.988075,
		0,
		0.047181,
		0.998872,
		0.005431,
		0,
		0.633344,
		-0.114831,
		-1.492451,
		1
	},
	[0.9] = {
		0.868482,
		-0.488953,
		-0.081633,
		0,
		-0.128421,
		-0.062864,
		-0.989725,
		0,
		0.478798,
		0.870042,
		-0.117388,
		0,
		0.642608,
		-0.226809,
		-1.506137,
		1
	}
}

return spline_matrices
