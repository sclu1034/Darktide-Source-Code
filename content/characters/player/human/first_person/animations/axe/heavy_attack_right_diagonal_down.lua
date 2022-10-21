local spline_matrices = {
	[0] = {
		0.743932,
		0.058888,
		0.665655,
		0,
		-0.588726,
		0.52905,
		0.611153,
		0,
		-0.316176,
		-0.846545,
		0.428246,
		0,
		-0.266481,
		0.273735,
		0.023463,
		1
	},
	{
		0.783027,
		-0.60596,
		-0.140291,
		0,
		-0.613275,
		-0.714542,
		-0.336636,
		0,
		0.103744,
		0.349632,
		-0.931125,
		0,
		0.07663,
		-0.053968,
		-0.559703,
		1
	},
	[0.0333333333333] = {
		0.698787,
		0.037362,
		0.714353,
		0,
		-0.544253,
		0.67582,
		0.497047,
		0,
		-0.464204,
		-0.736119,
		0.492588,
		0,
		-0.261066,
		0.307276,
		0.013948,
		1
	},
	[0.0666666666667] = {
		0.673605,
		-0.001532,
		0.73909,
		0,
		-0.446056,
		0.796504,
		0.408186,
		0,
		-0.589313,
		-0.604631,
		0.535846,
		0,
		-0.258481,
		0.350221,
		0.013094,
		1
	},
	[0.133333333333] = {
		0.553649,
		-0.11343,
		0.824989,
		0,
		-0.323866,
		0.88336,
		0.338802,
		0,
		-0.767192,
		-0.454763,
		0.452334,
		0,
		-0.197133,
		0.431073,
		0.009416,
		1
	},
	[0.166666666667] = {
		0.421359,
		-0.316721,
		0.849791,
		0,
		-0.010432,
		0.93528,
		0.353756,
		0,
		-0.906834,
		-0.157923,
		0.390784,
		0,
		-0.126305,
		0.473138,
		-0.008836,
		1
	},
	[0.1] = {
		0.716208,
		0.022486,
		0.697525,
		0,
		-0.431019,
		0.800332,
		0.416764,
		0,
		-0.54888,
		-0.599136,
		0.582895,
		0,
		-0.249881,
		0.377553,
		0.0171,
		1
	},
	[0.233333333333] = {
		0.312165,
		-0.001566,
		0.950026,
		0,
		0.949621,
		0.029777,
		-0.311983,
		0,
		-0.0278,
		0.999555,
		0.010783,
		0,
		0.354595,
		0.462809,
		-0.180507,
		1
	},
	[0.266666666667] = {
		0.395223,
		-0.301245,
		0.867785,
		0,
		0.234341,
		-0.880374,
		-0.412343,
		0,
		0.888191,
		0.366325,
		-0.27735,
		0,
		0.448893,
		0.34299,
		-0.183909,
		1
	},
	[0.2] = {
		0.328058,
		-0.077941,
		0.941437,
		0,
		0.856759,
		0.444347,
		-0.261763,
		0,
		-0.397922,
		0.892458,
		0.212548,
		0,
		0.143532,
		0.547736,
		-0.118544,
		1
	},
	[0.333333333333] = {
		0.180814,
		-0.180102,
		0.966887,
		0,
		0.247445,
		-0.943138,
		-0.221952,
		0,
		0.951881,
		0.279383,
		-0.125967,
		0,
		0.608358,
		-0.079498,
		-0.257121,
		1
	},
	[0.366666666667] = {
		0.20718,
		-0.185239,
		0.960606,
		0,
		0.231941,
		-0.944614,
		-0.232179,
		0,
		0.95041,
		0.270907,
		-0.152741,
		0,
		0.601258,
		-0.07876,
		-0.287528,
		1
	},
	[0.3] = {
		0.245506,
		-0.309364,
		0.918706,
		0,
		0.106078,
		-0.933446,
		-0.342675,
		0,
		0.963574,
		0.181584,
		-0.196349,
		0,
		0.602043,
		0.085422,
		-0.227824,
		1
	},
	[0.433333333333] = {
		0.358402,
		-0.226969,
		0.905557,
		0,
		0.125764,
		-0.949416,
		-0.287736,
		0,
		0.925058,
		0.217011,
		-0.311728,
		0,
		0.570536,
		-0.081774,
		-0.35737,
		1
	},
	[0.466666666667] = {
		0.448665,
		-0.259559,
		0.855178,
		0,
		0.052542,
		-0.947579,
		-0.315171,
		0,
		0.892154,
		0.186339,
		-0.411508,
		0,
		0.548574,
		-0.084473,
		-0.39358,
		1
	},
	[0.4] = {
		0.272121,
		-0.201314,
		0.940969,
		0,
		0.188789,
		-0.947697,
		-0.257349,
		0,
		0.943562,
		0.247674,
		-0.219882,
		0,
		0.587976,
		-0.079626,
		-0.321185,
		1
	},
	[0.533333333333] = {
		0.587471,
		-0.325184,
		0.741035,
		0,
		-0.076604,
		-0.933946,
		-0.349108,
		0,
		0.805612,
		0.148324,
		-0.573576,
		0,
		0.487534,
		-0.086412,
		-0.44283,
		1
	},
	[0.566666666667] = {
		0.632064,
		-0.352089,
		0.69031,
		0,
		-0.122517,
		-0.92502,
		-0.359621,
		0,
		0.76517,
		0.142729,
		-0.627809,
		0,
		0.456752,
		-0.085864,
		-0.455356,
		1
	},
	[0.5] = {
		0.528235,
		-0.294401,
		0.796427,
		0,
		-0.01905,
		-0.941841,
		-0.335519,
		0,
		0.848885,
		0.162061,
		-0.503122,
		0,
		0.523867,
		-0.08706,
		-0.426244,
		1
	},
	[0.633333333333] = {
		0.706705,
		-0.406089,
		0.579362,
		0,
		-0.210968,
		-0.902576,
		-0.375299,
		0,
		0.675323,
		0.142999,
		-0.723526,
		0,
		0.390216,
		-0.083755,
		-0.479158,
		1
	},
	[0.666666666667] = {
		0.736711,
		-0.43245,
		0.519849,
		0,
		-0.253475,
		-0.889325,
		-0.380593,
		0,
		0.626903,
		0.148618,
		-0.764791,
		0,
		0.355461,
		-0.082188,
		-0.490363,
		1
	},
	[0.6] = {
		0.671812,
		-0.379182,
		0.636309,
		0,
		-0.167306,
		-0.914518,
		-0.368328,
		0,
		0.72158,
		0.140989,
		-0.677824,
		0,
		0.424153,
		-0.08498,
		-0.467468,
		1
	},
	[0.733333333333] = {
		0.782179,
		-0.482179,
		0.394587,
		0,
		-0.334933,
		-0.859425,
		-0.386275,
		0,
		0.525372,
		0.169976,
		-0.833722,
		0,
		0.285579,
		-0.078035,
		-0.511059,
		1
	},
	[0.766666666667] = {
		0.79779,
		-0.504919,
		0.329527,
		0,
		-0.373843,
		-0.843044,
		-0.386677,
		0,
		0.473046,
		0.185295,
		-0.861332,
		0,
		0.251487,
		-0.075469,
		-0.520414,
		1
	},
	[0.7] = {
		0.76185,
		-0.457922,
		0.45814,
		0,
		-0.294803,
		-0.874898,
		-0.384246,
		0,
		0.57678,
		0.157677,
		-0.801538,
		0,
		0.320409,
		-0.080279,
		-0.501018,
		1
	},
	[0.833333333333] = {
		0.815302,
		-0.544802,
		0.196145,
		0,
		-0.447969,
		-0.808099,
		-0.382493,
		0,
		0.366887,
		0.223981,
		-0.902899,
		0,
		0.187581,
		-0.069471,
		-0.536768,
		1
	},
	[0.866666666667] = {
		0.817243,
		-0.561826,
		0.128315,
		0,
		-0.483459,
		-0.78957,
		-0.377951,
		0,
		0.313656,
		0.246843,
		-0.916891,
		0,
		0.158773,
		-0.066066,
		-0.543616,
		1
	},
	[0.8] = {
		0.808798,
		-0.525861,
		0.263279,
		0,
		-0.411512,
		-0.825895,
		-0.385429,
		0,
		0.420123,
		0.203392,
		-0.88438,
		0,
		0.21865,
		-0.072602,
		-0.52901,
		1
	},
	[0.933333333333] = {
		0.808115,
		-0.588974,
		-0.007717,
		0,
		-0.551107,
		-0.751404,
		-0.362868,
		0,
		0.207921,
		0.297492,
		-0.931809,
		0,
		0.110032,
		-0.059051,
		-0.554159,
		1
	},
	[0.966666666667] = {
		0.797462,
		-0.598723,
		-0.074736,
		0,
		-0.582956,
		-0.732601,
		-0.351366,
		0,
		0.155619,
		0.323769,
		-0.93325,
		0,
		0.091151,
		-0.056093,
		-0.557614,
		1
	},
	[0.9] = {
		0.814779,
		-0.576642,
		0.060166,
		0,
		-0.51789,
		-0.770534,
		-0.371574,
		0,
		0.260625,
		0.271591,
		-0.926452,
		0,
		0.132748,
		-0.062488,
		-0.549454,
		1
	},
	[1.03333333333] = {
		0.764775,
		-0.611083,
		-0.204196,
		0,
		-0.642163,
		-0.69717,
		-0.318718,
		0,
		0.052404,
		0.374874,
		-0.925593,
		0,
		0.066969,
		-0.05269,
		-0.560347,
		1
	},
	[1.06666666667] = {
		0.742577,
		-0.614469,
		-0.266472,
		0,
		-0.669759,
		-0.680231,
		-0.297841,
		0,
		0.001751,
		0.399642,
		-0.91667,
		0,
		0.062668,
		-0.052084,
		-0.559477,
		1
	}
}

return spline_matrices