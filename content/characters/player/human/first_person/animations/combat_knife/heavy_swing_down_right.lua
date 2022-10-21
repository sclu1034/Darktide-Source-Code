local spline_matrices = {
	[0] = {
		-0.875708,
		0.380097,
		-0.297761,
		0,
		-0.345112,
		-0.06143,
		0.936549,
		0,
		0.337688,
		0.922904,
		0.184971,
		0,
		-0.279449,
		0.098293,
		-0.028007,
		1
	},
	{
		-0.544276,
		0.475758,
		-0.690954,
		0,
		0.728569,
		0.676375,
		-0.108186,
		0,
		0.415873,
		-0.562291,
		-0.714757,
		0,
		0.402289,
		0.203539,
		-0.302221,
		1
	},
	[0.0333333333333] = {
		-0.904167,
		0.26029,
		-0.338718,
		0,
		-0.379328,
		-0.124578,
		0.916837,
		0,
		0.196447,
		0.95746,
		0.211375,
		0,
		-0.278285,
		0.079708,
		-0.026497,
		1
	},
	[0.0666666666667] = {
		-0.910342,
		0.123757,
		-0.39492,
		0,
		-0.41227,
		-0.1877,
		0.891517,
		0,
		0.036205,
		0.974399,
		0.221892,
		0,
		-0.276828,
		0.049322,
		-0.016355,
		1
	},
	[0.133333333333] = {
		-0.777313,
		-0.117537,
		-0.618038,
		0,
		-0.604178,
		-0.134376,
		0.785437,
		0,
		-0.175367,
		0.983935,
		0.033439,
		0,
		-0.27288,
		-0.00545,
		0.019346,
		1
	},
	[0.166666666667] = {
		-0.716935,
		-0.217775,
		-0.662252,
		0,
		-0.662051,
		-0.084895,
		0.744635,
		0,
		-0.218385,
		0.9723,
		-0.083314,
		0,
		-0.265832,
		-0.017326,
		0.042982,
		1
	},
	[0.1] = {
		-0.85339,
		-0.003331,
		-0.521262,
		0,
		-0.513291,
		-0.168946,
		0.841421,
		0,
		-0.090868,
		0.98562,
		0.142467,
		0,
		-0.276322,
		0.019435,
		-0.00108,
		1
	},
	[0.233333333333] = {
		-0.736534,
		-0.416016,
		-0.533337,
		0,
		-0.607555,
		0.060313,
		0.791984,
		0,
		-0.297311,
		0.907355,
		-0.297175,
		0,
		-0.245309,
		-0.013051,
		0.112213,
		1
	},
	[0.266666666667] = {
		-0.784587,
		-0.454726,
		-0.421483,
		0,
		-0.522768,
		0.119657,
		0.844035,
		0,
		-0.333371,
		0.882557,
		-0.331597,
		0,
		-0.24123,
		0.004106,
		0.149899,
		1
	},
	[0.2] = {
		-0.70663,
		-0.322434,
		-0.629849,
		0,
		-0.661084,
		-0.016519,
		0.75013,
		0,
		-0.252272,
		0.946448,
		-0.201483,
		0,
		-0.255337,
		-0.018649,
		0.07395,
		1
	},
	[0.333333333333] = {
		-0.912094,
		-0.333831,
		-0.237993,
		0,
		-0.221753,
		-0.086546,
		0.971254,
		0,
		-0.344832,
		0.938652,
		0.00491,
		0,
		-0.251066,
		0.164071,
		0.221523,
		1
	},
	[0.366666666667] = {
		-0.955409,
		0.161269,
		-0.247359,
		0,
		-0.267444,
		-0.117498,
		0.956383,
		0,
		0.12517,
		0.979891,
		0.155389,
		0,
		-0.181411,
		0.325578,
		0.231108,
		1
	},
	[0.3] = {
		-0.828342,
		-0.45146,
		-0.331714,
		0,
		-0.395695,
		0.05233,
		0.91689,
		0,
		-0.396581,
		0.890756,
		-0.221987,
		0,
		-0.245433,
		0.063655,
		0.189835,
		1
	},
	[0.433333333333] = {
		-0.844868,
		-0.07648,
		-0.52948,
		0,
		-0.12402,
		0.990766,
		0.054783,
		0,
		0.520401,
		0.11195,
		-0.846552,
		0,
		0.116225,
		0.632333,
		-0.225167,
		1
	},
	[0.466666666667] = {
		-0.877748,
		0.215555,
		-0.427895,
		0,
		0.297971,
		0.944951,
		-0.135206,
		0,
		0.375195,
		-0.246177,
		-0.893658,
		0,
		0.192282,
		0.505952,
		-0.530968,
		1
	},
	[0.4] = {
		-0.890666,
		0.135751,
		-0.433919,
		0,
		-0.376543,
		0.314641,
		0.87133,
		0,
		0.254812,
		0.939453,
		-0.229124,
		0,
		-0.097133,
		0.620201,
		0.091026,
		1
	},
	[0.533333333333] = {
		-0.851518,
		0.259194,
		-0.45578,
		0,
		0.393024,
		0.890908,
		-0.227631,
		0,
		0.347057,
		-0.372964,
		-0.860493,
		0,
		0.28537,
		0.361506,
		-0.595844,
		1
	},
	[0.566666666667] = {
		-0.85042,
		0.20941,
		-0.482632,
		0,
		0.350006,
		0.910099,
		-0.221843,
		0,
		0.392787,
		-0.357584,
		-0.847261,
		0,
		0.305409,
		0.285792,
		-0.59117,
		1
	},
	[0.5] = {
		-0.856621,
		0.281341,
		-0.432489,
		0,
		0.398616,
		0.893089,
		-0.208561,
		0,
		0.327574,
		-0.351055,
		-0.877186,
		0,
		0.243985,
		0.434893,
		-0.569088,
		1
	},
	[0.633333333333] = {
		-0.820874,
		0.209983,
		-0.531105,
		0,
		0.376725,
		0.898027,
		-0.227213,
		0,
		0.429236,
		-0.386594,
		-0.816273,
		0,
		0.349279,
		0.243728,
		-0.569591,
		1
	},
	[0.666666666667] = {
		-0.798366,
		0.233741,
		-0.554956,
		0,
		0.418241,
		0.87827,
		-0.231769,
		0,
		0.433227,
		-0.417141,
		-0.798941,
		0,
		0.365106,
		0.232331,
		-0.546967,
		1
	},
	[0.6] = {
		-0.840142,
		0.190997,
		-0.507623,
		0,
		0.340486,
		0.914264,
		-0.219524,
		0,
		0.422173,
		-0.35727,
		-0.833144,
		0,
		0.330207,
		0.256553,
		-0.587491,
		1
	},
	[0.733333333333] = {
		-0.744995,
		0.28966,
		-0.6009,
		0,
		0.508976,
		0.829105,
		-0.231362,
		0,
		0.431193,
		-0.478207,
		-0.765109,
		0,
		0.388393,
		0.213968,
		-0.491062,
		1
	},
	[0.766666666667] = {
		-0.715173,
		0.319498,
		-0.621651,
		0,
		0.554487,
		0.800827,
		-0.226319,
		0,
		0.425527,
		-0.506554,
		-0.749887,
		0,
		0.396232,
		0.20725,
		-0.459775,
		1
	},
	[0.7] = {
		-0.77292,
		0.260731,
		-0.578458,
		0,
		0.462972,
		0.855156,
		-0.233162,
		0,
		0.43388,
		-0.448026,
		-0.781678,
		0,
		0.378067,
		0.222379,
		-0.520479,
		1
	},
	[0.833333333333] = {
		-0.6523,
		0.379171,
		-0.656304,
		0,
		0.638426,
		0.741578,
		-0.206095,
		0,
		0.408555,
		-0.553437,
		-0.725803,
		0,
		0.40508,
		0.199532,
		-0.396553,
		1
	},
	[0.866666666667] = {
		-0.620119,
		0.408454,
		-0.66979,
		0,
		0.675138,
		0.712681,
		-0.19046,
		0,
		0.399552,
		-0.570308,
		-0.71771,
		0,
		0.406699,
		0.198602,
		-0.367373,
		1
	},
	[0.8] = {
		-0.684115,
		0.349453,
		-0.640211,
		0,
		0.597967,
		0.771317,
		-0.217958,
		0,
		0.417639,
		-0.531933,
		-0.736631,
		0,
		0.401704,
		0.202418,
		-0.427832,
		1
	},
	[0.933333333333] = {
		-0.566466,
		0.45348,
		-0.688093,
		0,
		0.716105,
		0.684073,
		-0.138696,
		0,
		0.407811,
		-0.571314,
		-0.712244,
		0,
		0.404251,
		0.201551,
		-0.320998,
		1
	},
	[0.966666666667] = {
		-0.551318,
		0.466982,
		-0.691359,
		0,
		0.723194,
		0.680673,
		-0.11694,
		0,
		0.41598,
		-0.564457,
		-0.712985,
		0,
		0.402579,
		0.202959,
		-0.307286,
		1
	},
	[0.9] = {
		-0.588147,
		0.436779,
		-0.680667,
		0,
		0.707282,
		0.685944,
		-0.17098,
		0,
		0.392219,
		-0.581984,
		-0.712361,
		0,
		0.406839,
		0.199636,
		-0.341908,
		1
	}
}

return spline_matrices