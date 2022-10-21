local spline_matrices = {
	[0] = {
		0.903592,
		-0.392918,
		0.170697,
		0,
		0.107804,
		-0.177078,
		-0.978275,
		0,
		0.414609,
		0.902363,
		-0.117648,
		0,
		0.760896,
		-0.087956,
		-1.325175,
		1
	},
	{
		0.935541,
		-0.341241,
		0.091198,
		0,
		0.024642,
		-0.194508,
		-0.980591,
		0,
		0.352357,
		0.919631,
		-0.173561,
		0,
		0.743859,
		-0.090863,
		-1.326836,
		1
	},
	[0.0166666666667] = {
		0.894073,
		-0.436743,
		0.099442,
		0,
		0.061198,
		-0.10082,
		-0.993021,
		0,
		0.44372,
		0.893919,
		-0.063413,
		0,
		0.760351,
		-0.070169,
		-1.317735,
		1
	},
	[0.0333333333333] = {
		0.879388,
		-0.475596,
		0.022032,
		0,
		0.016382,
		-0.016024,
		-0.999737,
		0,
		0.475824,
		0.879518,
		-0.0063,
		0,
		0.772288,
		-0.042898,
		-1.294858,
		1
	},
	[0.05] = {
		0.859091,
		-0.508081,
		-0.06178,
		0,
		-0.026238,
		0.076828,
		-0.996699,
		0,
		0.51115,
		0.857876,
		0.052671,
		0,
		0.795227,
		-0.006892,
		-1.257945,
		1
	},
	[0.0666666666667] = {
		0.83273,
		-0.53248,
		-0.151743,
		0,
		-0.065953,
		0.176715,
		-0.98205,
		0,
		0.549737,
		0.82779,
		0.112037,
		0,
		0.827717,
		0.037016,
		-1.208386,
		1
	},
	[0.0833333333333] = {
		0.799953,
		-0.546889,
		-0.246959,
		0,
		-0.101781,
		0.281929,
		-0.954021,
		0,
		0.591368,
		0.788307,
		0.169867,
		0,
		0.868335,
		0.087884,
		-1.14761,
		1
	},
	[0.116666666667] = {
		0.714969,
		-0.538565,
		-0.445832,
		0,
		-0.157014,
		0.497699,
		-0.853019,
		0,
		0.681297,
		0.679884,
		0.271278,
		0,
		0.968386,
		0.206125,
		-0.998642,
		1
	},
	[0.133333333333] = {
		0.663618,
		-0.513423,
		-0.544066,
		0,
		-0.174091,
		0.601329,
		-0.779805,
		0,
		0.727532,
		0.61221,
		0.309671,
		0,
		1.02503,
		0.271071,
		-0.914006,
		1
	},
	[0.15] = {
		0.60767,
		-0.474127,
		-0.637135,
		0,
		-0.183043,
		0.697036,
		-0.693279,
		0,
		0.772808,
		0.537908,
		0.336782,
		0,
		1.08417,
		0.338236,
		-0.825338,
		1
	},
	[0.166666666667] = {
		0.548599,
		-0.421974,
		-0.721788,
		0,
		-0.183698,
		0.781365,
		-0.596425,
		0,
		0.815656,
		0.459789,
		0.351141,
		0,
		1.144286,
		0.406454,
		-0.734959,
		1
	},
	[0.183333333333] = {
		0.488095,
		-0.359412,
		-0.795353,
		0,
		-0.176564,
		0.851773,
		-0.493262,
		0,
		0.854745,
		0.38119,
		0.352287,
		0,
		1.203776,
		0.474724,
		-0.64535,
		1
	},
	[0.1] = {
		0.760628,
		-0.549432,
		-0.345788,
		0,
		-0.132546,
		0.389992,
		-0.911229,
		0,
		0.635512,
		0.738939,
		0.223814,
		0,
		0.915686,
		0.144646,
		-1.077137,
		1
	},
	[0.216666666667] = {
		0.369279,
		-0.216956,
		-0.903639,
		0,
		-0.144198,
		0.947213,
		-0.286346,
		0,
		0.918063,
		0.236045,
		0.318502,
		0,
		1.314143,
		0.608496,
		-0.47859,
		1
	},
	[0.233333333333] = {
		0.313479,
		-0.144787,
		-0.938492,
		0,
		-0.12276,
		0.973835,
		-0.191245,
		0,
		0.941627,
		0.175161,
		0.287503,
		0,
		1.361583,
		0.673052,
		-0.406346,
		1
	},
	[0.25] = {
		0.261039,
		-0.07683,
		-0.962266,
		0,
		-0.10069,
		0.989223,
		-0.106297,
		0,
		0.960063,
		0.124638,
		0.25049,
		0,
		1.401599,
		0.735673,
		-0.344554,
		1
	},
	[0.266666666667] = {
		0.212131,
		-0.016074,
		-0.977109,
		0,
		-0.080109,
		0.996214,
		-0.03378,
		0,
		0.973952,
		0.085441,
		0.210041,
		0,
		1.432549,
		0.796152,
		-0.295271,
		1
	},
	[0.283333333333] = {
		0.166596,
		0.0351,
		-0.9854,
		0,
		-0.062976,
		0.997705,
		0.024891,
		0,
		0.984012,
		0.05791,
		0.168424,
		0,
		1.452745,
		0.854231,
		-0.260409,
		1
	},
	[0.2] = {
		0.427838,
		-0.289791,
		-0.85614,
		0,
		-0.162822,
		0.907003,
		-0.388375,
		0,
		0.889069,
		0.30556,
		0.340866,
		0,
		1.260967,
		0.54226,
		-0.559057,
		1
	},
	[0.316666666667] = {
		0.077491,
		0.094564,
		-0.992498,
		0,
		-0.037122,
		0.995075,
		0.091911,
		0,
		0.996302,
		0.029721,
		0.08062,
		0,
		1.428938,
		0.975789,
		-0.236259,
		1
	},
	[0.333333333333] = {
		0.024088,
		0.093302,
		-0.995346,
		0,
		-0.021031,
		0.995462,
		0.092804,
		0,
		0.999489,
		0.018698,
		0.025941,
		0,
		1.34356,
		1.061002,
		-0.237899,
		1
	},
	[0.35] = {
		-0.030173,
		0.079399,
		-0.996386,
		0,
		-0.014614,
		0.996698,
		0.079866,
		0,
		0.999438,
		0.016971,
		-0.028913,
		0,
		1.220019,
		1.155714,
		-0.244163,
		1
	},
	[0.366666666667] = {
		-0.078933,
		0.059618,
		-0.995096,
		0,
		-0.028836,
		0.997656,
		0.062059,
		0,
		0.996463,
		0.033593,
		-0.077029,
		0,
		1.074692,
		1.250753,
		-0.252375,
		1
	},
	[0.383333333333] = {
		-0.115314,
		0.039923,
		-0.992527,
		0,
		-0.074109,
		0.996062,
		0.048675,
		0,
		0.990561,
		0.079169,
		-0.111901,
		0,
		0.923779,
		1.336574,
		-0.259833,
		1
	},
	[0.3] = {
		0.124078,
		0.074832,
		-0.989447,
		0,
		-0.051064,
		0.996313,
		0.068948,
		0,
		0.990958,
		0.04197,
		0.127441,
		0,
		1.460361,
		0.909494,
		-0.241783,
		1
	},
	[0.416666666667] = {
		-0.121318,
		0.025718,
		-0.99228,
		0,
		-0.313026,
		0.947664,
		0.062833,
		0,
		0.941964,
		0.318233,
		-0.106919,
		0,
		0.64527,
		1.443146,
		-0.264979,
		1
	},
	[0.433333333333] = {
		-0.08795,
		0.036588,
		-0.995453,
		0,
		-0.51592,
		0.853174,
		0.076941,
		0,
		0.85211,
		0.520341,
		-0.05616,
		0,
		0.496121,
		1.458701,
		-0.266504,
		1
	},
	[0.45] = {
		-0.046889,
		0.058669,
		-0.997176,
		0,
		-0.715338,
		0.694794,
		0.074515,
		0,
		0.697204,
		0.716812,
		0.00939,
		0,
		0.343156,
		1.450592,
		-0.271005,
		1
	},
	[0.466666666667] = {
		-0.010253,
		0.083739,
		-0.996435,
		0,
		-0.866166,
		0.497178,
		0.050694,
		0,
		0.499651,
		0.863598,
		0.067434,
		0,
		0.19347,
		1.426125,
		-0.279152,
		1
	},
	[0.483333333333] = {
		0.01748,
		0.098362,
		-0.994997,
		0,
		-0.953579,
		0.300862,
		0.01299,
		0,
		0.300634,
		0.948582,
		0.099055,
		0,
		0.04952,
		1.396509,
		-0.289309,
		1
	},
	[0.4] = {
		-0.132197,
		0.02699,
		-0.990856,
		0,
		-0.160946,
		0.985779,
		0.048325,
		0,
		0.97807,
		0.165863,
		-0.125973,
		0,
		0.78312,
		1.402686,
		-0.263954,
		1
	},
	[0.516666666667] = {
		0.101373,
		0.094276,
		-0.990371,
		0,
		-0.708729,
		-0.691773,
		-0.138396,
		0,
		-0.698159,
		0.715935,
		-0.003311,
		0,
		-0.689491,
		0.576571,
		-0.326792,
		1
	},
	[0.533333333333] = {
		0.145526,
		0.095877,
		-0.984698,
		0,
		-0.448768,
		-0.880615,
		-0.152065,
		0,
		-0.88172,
		0.46403,
		-0.085126,
		0,
		-0.713347,
		0.242,
		-0.344315,
		1
	},
	[0.55] = {
		0.18946,
		0.101864,
		-0.97659,
		0,
		-0.234699,
		-0.961075,
		-0.145778,
		0,
		-0.953426,
		0.256824,
		-0.158178,
		0,
		-0.582425,
		-0.086547,
		-0.370819,
		1
	},
	[0.566666666667] = {
		0.226355,
		0.113318,
		-0.967431,
		0,
		-0.072504,
		-0.988494,
		-0.132749,
		0,
		-0.971343,
		0.100191,
		-0.215535,
		0,
		-0.431255,
		-0.378621,
		-0.395443,
		1
	},
	[0.583333333333] = {
		0.249159,
		0.127407,
		-0.960045,
		0,
		0.05391,
		-0.991596,
		-0.117603,
		0,
		-0.966961,
		-0.022454,
		-0.253934,
		0,
		-0.389586,
		-0.598971,
		-0.4056,
		1
	},
	[0.5] = {
		0.056895,
		0.094639,
		-0.993885,
		0,
		-0.962025,
		-0.260999,
		-0.079923,
		0,
		-0.266967,
		0.960689,
		0.076195,
		0,
		-0.329608,
		1.04775,
		-0.310652,
		1
	},
	[0.616666666667] = {
		0.233315,
		0.135892,
		-0.962859,
		0,
		0.0864,
		-0.989168,
		-0.118669,
		0,
		-0.968555,
		-0.055504,
		-0.242529,
		0,
		-0.52969,
		-0.599031,
		-0.391861,
		1
	},
	[0.633333333333] = {
		0.207403,
		0.130847,
		-0.969465,
		0,
		0.030915,
		-0.991396,
		-0.127193,
		0,
		-0.977767,
		-0.003591,
		-0.209664,
		0,
		-0.59024,
		-0.522914,
		-0.396353,
		1
	},
	[0.65] = {
		0.183961,
		0.126032,
		-0.97482,
		0,
		-0.009755,
		-0.991463,
		-0.130025,
		0,
		-0.982885,
		0.033429,
		-0.181162,
		0,
		-0.629743,
		-0.45734,
		-0.403345,
		1
	},
	[0.666666666667] = {
		0.174006,
		0.126055,
		-0.976643,
		0,
		0.003361,
		-0.991843,
		-0.127418,
		0,
		-0.984739,
		0.018889,
		-0.173011,
		0,
		-0.638791,
		-0.430938,
		-0.406467,
		1
	},
	[0.683333333333] = {
		0.16722,
		0.125917,
		-0.977846,
		0,
		0.041583,
		-0.991829,
		-0.120606,
		0,
		-0.985042,
		-0.020493,
		-0.17109,
		0,
		-0.631936,
		-0.432954,
		-0.404934,
		1
	},
	[0.6] = {
		0.250808,
		0.136102,
		-0.958421,
		0,
		0.111802,
		-0.987514,
		-0.110976,
		0,
		-0.961559,
		-0.07932,
		-0.262893,
		0,
		-0.458661,
		-0.657721,
		-0.397423,
		1
	},
	[0.716666666667] = {
		0.142669,
		0.115836,
		-0.982969,
		0,
		0.052764,
		-0.992606,
		-0.109313,
		0,
		-0.988363,
		-0.036269,
		-0.147726,
		0,
		-0.629568,
		-0.435009,
		-0.4016,
		1
	},
	[0.733333333333] = {
		0.144733,
		0.117157,
		-0.98251,
		0,
		0.035977,
		-0.992932,
		-0.1131,
		0,
		-0.988816,
		-0.018979,
		-0.147925,
		0,
		-0.632351,
		-0.435266,
		-0.402044,
		1
	},
	[0.75] = {
		0.17016,
		0.129529,
		-0.976866,
		0,
		0.010503,
		-0.991505,
		-0.129641,
		0,
		-0.985361,
		0.0118,
		-0.170075,
		0,
		-0.636704,
		-0.434872,
		-0.40555,
		1
	},
	[0.766666666667] = {
		0.22014,
		0.151658,
		-0.963607,
		0,
		-0.023193,
		-0.986747,
		-0.160598,
		0,
		-0.975193,
		0.057703,
		-0.213705,
		0,
		-0.625373,
		-0.431547,
		-0.422083,
		1
	},
	[0.783333333333] = {
		0.287209,
		0.177018,
		-0.941369,
		0,
		-0.066055,
		-0.976775,
		-0.203829,
		0,
		-0.955588,
		0.120724,
		-0.268846,
		0,
		-0.584488,
		-0.423124,
		-0.458832,
		1
	},
	[0.7] = {
		0.153438,
		0.120609,
		-0.98077,
		0,
		0.056265,
		-0.99198,
		-0.113185,
		0,
		-0.986555,
		-0.037816,
		-0.158994,
		0,
		-0.629154,
		-0.434242,
		-0.402933,
		1
	},
	[0.816666666667] = {
		0.463332,
		0.220581,
		-0.858293,
		0,
		-0.164235,
		-0.930375,
		-0.327764,
		0,
		-0.870833,
		0.292825,
		-0.394846,
		0,
		-0.429981,
		-0.390599,
		-0.581884,
		1
	},
	[0.833333333333] = {
		0.564118,
		0.229277,
		-0.793223,
		0,
		-0.209859,
		-0.889315,
		-0.406298,
		0,
		-0.79858,
		0.395665,
		-0.453563,
		0,
		-0.323932,
		-0.366671,
		-0.66206,
		1
	},
	[0.85] = {
		0.665411,
		0.223555,
		-0.712216,
		0,
		-0.246148,
		-0.835029,
		-0.492075,
		0,
		-0.704727,
		0.502743,
		-0.500609,
		0,
		-0.203701,
		-0.33825,
		-0.750103,
		1
	},
	[0.866666666667] = {
		0.760288,
		0.200913,
		-0.617735,
		0,
		-0.268642,
		-0.768584,
		-0.580611,
		0,
		-0.591434,
		0.607381,
		-0.530371,
		0,
		-0.073286,
		-0.306289,
		-0.8423,
		1
	},
	[0.883333333333] = {
		0.842432,
		0.161043,
		-0.514172,
		0,
		-0.274588,
		-0.692743,
		-0.666865,
		0,
		-0.463583,
		0.702974,
		-0.539368,
		0,
		0.062928,
		-0.272111,
		-0.934889,
		1
	},
	[0.8] = {
		0.369382,
		0.201559,
		-0.907155,
		0,
		-0.114565,
		-0.95887,
		-0.259699,
		0,
		-0.922188,
		0.199856,
		-0.331098,
		0,
		-0.518076,
		-0.409484,
		-0.513074,
		1
	},
	[0.916666666667] = {
		0.952613,
		0.038833,
		-0.301695,
		0,
		-0.23657,
		-0.528889,
		-0.815053,
		0,
		-0.191214,
		0.847802,
		-0.49464,
		0,
		0.333032,
		-0.203329,
		-1.107061,
		1
	},
	[0.933333333333] = {
		0.978587,
		-0.035758,
		-0.202706,
		0,
		-0.196949,
		-0.448906,
		-0.871605,
		0,
		-0.059829,
		0.892863,
		-0.446335,
		0,
		0.456258,
		-0.171772,
		-1.180332,
		1
	},
	[0.95] = {
		0.987045,
		-0.113868,
		-0.113028,
		0,
		-0.148005,
		-0.374275,
		-0.91543,
		0,
		0.061934,
		0.9203,
		-0.38628,
		0,
		0.564289,
		-0.143838,
		-1.241382,
		1
	},
	[0.966666666667] = {
		0.980763,
		-0.192193,
		-0.034133,
		0,
		-0.093063,
		-0.306671,
		-0.947255,
		0,
		0.171589,
		0.932209,
		-0.318658,
		0,
		0.651708,
		-0.120535,
		-1.287733,
		1
	},
	[0.983333333333] = {
		0.962709,
		-0.268427,
		0.033743,
		0,
		-0.034861,
		-0.246769,
		-0.968447,
		0,
		0.268284,
		0.931156,
		-0.246925,
		0,
		0.713259,
		-0.102663,
		-1.317005,
		1
	},
	[0.9] = {
		0.907272,
		0.105843,
		-0.407008,
		0,
		-0.263408,
		-0.611428,
		-0.746172,
		0,
		-0.327833,
		0.78419,
		-0.526851,
		0,
		0.200107,
		-0.237263,
		-1.024251,
		1
	}
}

return spline_matrices