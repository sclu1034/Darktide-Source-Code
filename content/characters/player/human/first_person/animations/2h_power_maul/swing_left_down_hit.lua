local spline_matrices = {
	[0] = {
		0.973162,
		0.009995,
		-0.229904,
		0,
		-0.194506,
		0.569618,
		-0.798563,
		0,
		0.122976,
		0.821849,
		0.556274,
		0,
		-0.025581,
		0.46527,
		-0.337266,
		1
	},
	{
		0.926662,
		-0.1111,
		-0.359101,
		0,
		0.021051,
		0.969163,
		-0.245522,
		0,
		0.375305,
		0.219956,
		0.900425,
		0,
		0.087933,
		0.412192,
		-0.445095,
		1
	},
	[0.0166666666667] = {
		0.987492,
		0.031263,
		-0.154539,
		0,
		-0.156845,
		0.294938,
		-0.942556,
		0,
		0.016113,
		0.955005,
		0.296152,
		0,
		-0.024628,
		0.358955,
		-0.465485,
		1
	},
	[0.0333333333333] = {
		0.987129,
		0.054819,
		-0.150235,
		0,
		-0.159227,
		0.249327,
		-0.955239,
		0,
		-0.014908,
		0.966866,
		0.254847,
		0,
		-1.2e-05,
		0.364343,
		-0.437551,
		1
	},
	[0.05] = {
		0.981523,
		0.064883,
		-0.180006,
		0,
		-0.190655,
		0.25191,
		-0.948785,
		0,
		-0.016215,
		0.965573,
		0.259626,
		0,
		-0.005883,
		0.357254,
		-0.444788,
		1
	},
	[0.0666666666667] = {
		0.972875,
		0.067386,
		-0.221299,
		0,
		-0.231329,
		0.279258,
		-0.931935,
		0,
		-0.001,
		0.957849,
		0.287271,
		0,
		-0.012654,
		0.347738,
		-0.462965,
		1
	},
	[0.0833333333333] = {
		0.966227,
		0.061869,
		-0.250153,
		0,
		-0.257353,
		0.281378,
		-0.924444,
		0,
		0.013193,
		0.9576,
		0.287797,
		0,
		-0.01813,
		0.334323,
		-0.47885,
		1
	},
	[0.116666666667] = {
		0.964328,
		0.033148,
		-0.262625,
		0,
		-0.262436,
		0.249448,
		-0.93215,
		0,
		0.034612,
		0.967821,
		0.249249,
		0,
		-0.023671,
		0.318697,
		-0.484204,
		1
	},
	[0.133333333333] = {
		0.964501,
		0.022475,
		-0.263122,
		0,
		-0.259159,
		0.272018,
		-0.926738,
		0,
		0.050745,
		0.96203,
		0.268186,
		0,
		-0.02661,
		0.331485,
		-0.471443,
		1
	},
	[0.15] = {
		0.964252,
		0.016836,
		-0.264452,
		0,
		-0.255983,
		0.317137,
		-0.91318,
		0,
		0.068493,
		0.94823,
		0.31011,
		0,
		-0.029796,
		0.353473,
		-0.451561,
		1
	},
	[0.166666666667] = {
		0.963385,
		0.01412,
		-0.267751,
		0,
		-0.254044,
		0.36741,
		-0.894691,
		0,
		0.085741,
		0.929952,
		0.357544,
		0,
		-0.032529,
		0.373898,
		-0.432749,
		1
	},
	[0.183333333333] = {
		0.961418,
		0.012161,
		-0.274823,
		0,
		-0.255862,
		0.406488,
		-0.877099,
		0,
		0.101046,
		0.913575,
		0.393916,
		0,
		-0.034892,
		0.383771,
		-0.424764,
		1
	},
	[0.1] = {
		0.964464,
		0.048438,
		-0.259738,
		0,
		-0.263318,
		0.257189,
		-0.929794,
		0,
		0.021764,
		0.965147,
		0.260804,
		0,
		-0.021116,
		0.321428,
		-0.485865,
		1
	},
	[0.216666666667] = {
		0.956331,
		0.015892,
		-0.291855,
		0,
		-0.263705,
		0.477566,
		-0.838087,
		0,
		0.126061,
		0.878452,
		0.460902,
		0,
		-0.035577,
		0.388309,
		-0.432096,
		1
	},
	[0.233333333333] = {
		0.953023,
		0.023122,
		-0.302013,
		0,
		-0.269394,
		0.520521,
		-0.810237,
		0,
		0.13847,
		0.853536,
		0.502298,
		0,
		-0.035138,
		0.391286,
		-0.438918,
		1
	},
	[0.25] = {
		0.94943,
		0.032891,
		-0.31225,
		0,
		-0.275289,
		0.565453,
		-0.777483,
		0,
		0.15099,
		0.824125,
		0.545913,
		0,
		-0.0343,
		0.394814,
		-0.447013,
		1
	},
	[0.266666666667] = {
		0.94574,
		0.044282,
		-0.321893,
		0,
		-0.280716,
		0.610246,
		-0.74081,
		0,
		0.163629,
		0.790974,
		0.589564,
		0,
		-0.03313,
		0.398852,
		-0.455755,
		1
	},
	[0.283333333333] = {
		0.942147,
		0.056268,
		-0.330445,
		0,
		-0.285085,
		0.653036,
		-0.70162,
		0,
		0.176313,
		0.755234,
		0.631296,
		0,
		-0.031667,
		0.403268,
		-0.464542,
		1
	},
	[0.2] = {
		0.959183,
		0.012001,
		-0.282531,
		0,
		-0.258942,
		0.438812,
		-0.860461,
		0,
		0.113651,
		0.898499,
		0.424009,
		0,
		-0.035529,
		0.38584,
		-0.427174,
		1
	},
	[0.316666666667] = {
		0.936112,
		0.0776,
		-0.343036,
		0,
		-0.288641,
		0.726797,
		-0.62326,
		0,
		0.200952,
		0.682455,
		0.702761,
		0,
		-0.028035,
		0.412117,
		-0.480311,
		1
	},
	[0.333333333333] = {
		0.934074,
		0.084589,
		-0.346916,
		0,
		-0.287005,
		0.755873,
		-0.588459,
		0,
		0.212448,
		0.649231,
		0.730318,
		0,
		-0.026,
		0.415571,
		-0.486867,
		1
	},
	[0.35] = {
		0.932925,
		0.087563,
		-0.349261,
		0,
		-0.282643,
		0.779026,
		-0.559671,
		0,
		0.223077,
		0.620847,
		0.751522,
		0,
		-0.023886,
		0.417857,
		-0.492274,
		1
	},
	[0.366666666667] = {
		0.932592,
		0.086955,
		-0.350301,
		0,
		-0.275598,
		0.79826,
		-0.535562,
		0,
		0.233062,
		0.596003,
		0.768416,
		0,
		-0.021551,
		0.419489,
		-0.497077,
		1
	},
	[0.383333333333] = {
		0.932817,
		0.084195,
		-0.350377,
		0,
		-0.26639,
		0.815911,
		-0.513153,
		0,
		0.242672,
		0.572014,
		0.783524,
		0,
		-0.018863,
		0.421221,
		-0.501899,
		1
	},
	[0.3] = {
		0.938868,
		0.067764,
		-0.337542,
		0,
		-0.287874,
		0.692265,
		-0.661739,
		0,
		0.188826,
		0.718455,
		0.669453,
		0,
		-0.02995,
		0.407844,
		-0.472825,
		1
	},
	[0.416666666667] = {
		0.934398,
		0.073538,
		-0.348558,
		0,
		-0.243039,
		0.84697,
		-0.472835,
		0,
		0.260447,
		0.526529,
		0.80928,
		0,
		-0.012688,
		0.424918,
		-0.511337,
		1
	},
	[0.433333333333] = {
		0.935486,
		0.066186,
		-0.347109,
		0,
		-0.229686,
		0.860377,
		-0.454967,
		0,
		0.268532,
		0.505342,
		0.820073,
		0,
		-0.009347,
		0.426652,
		-0.515987,
		1
	},
	[0.45] = {
		0.936609,
		0.057846,
		-0.345569,
		0,
		-0.215747,
		0.872339,
		-0.438723,
		0,
		0.276075,
		0.485467,
		0.82952,
		0,
		-0.005947,
		0.428109,
		-0.52065,
		1
	},
	[0.466666666667] = {
		0.937676,
		0.048809,
		-0.344066,
		0,
		-0.201608,
		0.882843,
		-0.424197,
		0,
		0.283051,
		0.467126,
		0.837661,
		0,
		-0.002534,
		0.429137,
		-0.525366,
		1
	},
	[0.483333333333] = {
		0.938637,
		0.03938,
		-0.342652,
		0,
		-0.187632,
		0.891895,
		-0.411483,
		0,
		0.289405,
		0.450525,
		0.844554,
		0,
		0.000848,
		0.42958,
		-0.530173,
		1
	},
	[0.4] = {
		0.933464,
		0.079625,
		-0.349722,
		0,
		-0.255407,
		0.832134,
		-0.49226,
		0,
		0.25182,
		0.548829,
		0.797104,
		0,
		-0.015885,
		0.423053,
		-0.506661,
		1
	},
	[0.516666666667] = {
		0.940015,
		0.020606,
		-0.340509,
		0,
		-0.161786,
		0.905705,
		-0.39182,
		0,
		0.300327,
		0.423407,
		0.854711,
		0,
		0.007185,
		0.428073,
		-0.540194,
		1
	},
	[0.533333333333] = {
		0.940359,
		0.011915,
		-0.339975,
		0,
		-0.150743,
		0.910506,
		-0.385039,
		0,
		0.304962,
		0.413324,
		0.857999,
		0,
		0.009972,
		0.425795,
		-0.545472,
		1
	},
	[0.55] = {
		0.94045,
		0.00413,
		-0.339907,
		0,
		-0.141499,
		0.913935,
		-0.380395,
		0,
		0.309082,
		0.405839,
		0.860095,
		0,
		0.012391,
		0.422276,
		-0.550965,
		1
	},
	[0.566666666667] = {
		0.940351,
		-0.00363,
		-0.340186,
		0,
		-0.133843,
		0.915361,
		-0.379738,
		0,
		0.312772,
		0.402618,
		0.860275,
		0,
		0.014436,
		0.416869,
		-0.55549,
		1
	},
	[0.583333333333] = {
		0.940133,
		-0.012392,
		-0.340581,
		0,
		-0.127231,
		0.914326,
		-0.384474,
		0,
		0.316167,
		0.404789,
		0.858012,
		0,
		0.01618,
		0.409165,
		-0.558042,
		1
	},
	[0.5] = {
		0.939431,
		0.029871,
		-0.341434,
		0,
		-0.174221,
		0.899509,
		-0.400662,
		0,
		0.295154,
		0.43588,
		0.850231,
		0,
		0.004115,
		0.429279,
		-0.535104,
		1
	},
	[0.616666666667] = {
		0.939405,
		-0.032468,
		-0.341268,
		0,
		-0.116751,
		0.905691,
		-0.407546,
		0,
		0.322315,
		0.422694,
		0.84702,
		0,
		0.018932,
		0.387685,
		-0.558269,
		1
	},
	[0.633333333333] = {
		0.938938,
		-0.043506,
		-0.341325,
		0,
		-0.112703,
		0.898368,
		-0.424538,
		0,
		0.325105,
		0.437083,
		0.838609,
		0,
		0.020009,
		0.374357,
		-0.556418,
		1
	},
	[0.65] = {
		0.93843,
		-0.054894,
		-0.34108,
		0,
		-0.1093,
		0.889402,
		-0.443866,
		0,
		0.327723,
		0.453818,
		0.828642,
		0,
		0.020949,
		0.359861,
		-0.553406,
		1
	},
	[0.666666666667] = {
		0.937901,
		-0.066331,
		-0.340502,
		0,
		-0.106419,
		0.879209,
		-0.464399,
		0,
		0.330177,
		0.471796,
		0.817552,
		0,
		0.021805,
		0.344733,
		-0.549295,
		1
	},
	[0.683333333333] = {
		0.93737,
		-0.077637,
		-0.339574,
		0,
		-0.103932,
		0.868108,
		-0.485373,
		0,
		0.33247,
		0.490267,
		0.805669,
		0,
		0.02263,
		0.329299,
		-0.544315,
		1
	},
	[0.6] = {
		0.93981,
		-0.022046,
		-0.340985,
		0,
		-0.121567,
		0.911052,
		-0.393962,
		0,
		0.31934,
		0.411703,
		0.853535,
		0,
		0.017666,
		0.399365,
		-0.558887,
		1
	},
	[0.716666666667] = {
		0.936366,
		-0.099159,
		-0.336729,
		0,
		-0.099615,
		0.844772,
		-0.525773,
		0,
		0.336594,
		0.52586,
		0.781138,
		0,
		0.024223,
		0.299004,
		-0.532335,
		1
	},
	[0.733333333333] = {
		0.935926,
		-0.109022,
		-0.334898,
		0,
		-0.097525,
		0.833479,
		-0.543876,
		0,
		0.338425,
		0.541689,
		0.769442,
		0,
		0.025053,
		0.284835,
		-0.525799,
		1
	},
	[0.75] = {
		0.93392,
		-0.118976,
		-0.337101,
		0,
		-0.095427,
		0.8258,
		-0.555831,
		0,
		0.344509,
		0.551271,
		0.759878,
		0,
		0.02499,
		0.273551,
		-0.518812,
		1
	},
	[0.766666666667] = {
		0.932002,
		-0.128098,
		-0.339062,
		0,
		-0.092884,
		0.819817,
		-0.565042,
		0,
		0.35035,
		0.558114,
		0.752173,
		0,
		0.025321,
		0.264747,
		-0.511544,
		1
	},
	[0.783333333333] = {
		0.930178,
		-0.136203,
		-0.340907,
		0,
		-0.08975,
		0.816076,
		-0.570934,
		0,
		0.355969,
		0.561666,
		0.746872,
		0,
		0.026102,
		0.25868,
		-0.50438,
		1
	},
	[0.7] = {
		0.936853,
		-0.088637,
		-0.338304,
		0,
		-0.101709,
		0.85648,
		-0.50606,
		0,
		0.334607,
		0.508512,
		0.793381,
		0,
		0.023432,
		0.313933,
		-0.538606,
		1
	},
	[0.816666666667] = {
		0.926868,
		-0.14854,
		-0.34475,
		0,
		-0.081158,
		0.81737,
		-0.570368,
		0,
		0.36651,
		0.556635,
		0.745538,
		0,
		0.029239,
		0.255717,
		-0.491808,
		1
	},
	[0.833333333333] = {
		0.925417,
		-0.152333,
		-0.346984,
		0,
		-0.075419,
		0.823291,
		-0.562587,
		0,
		0.371369,
		0.546797,
		0.750399,
		0,
		0.03171,
		0.259268,
		-0.487045,
		1
	},
	[0.85] = {
		0.924215,
		-0.15438,
		-0.349276,
		0,
		-0.068594,
		0.83265,
		-0.549536,
		0,
		0.375661,
		0.531847,
		0.758958,
		0,
		0.034964,
		0.266087,
		-0.482946,
		1
	},
	[0.866666666667] = {
		0.92335,
		-0.154796,
		-0.351372,
		0,
		-0.060762,
		0.844688,
		-0.531798,
		0,
		0.379121,
		0.512386,
		0.770538,
		0,
		0.039078,
		0.275674,
		-0.478809,
		1
	},
	[0.883333333333] = {
		0.922813,
		-0.153665,
		-0.353275,
		0,
		-0.052044,
		0.858876,
		-0.509533,
		0,
		0.381717,
		0.488589,
		0.784584,
		0,
		0.043987,
		0.287736,
		-0.474518,
		1
	},
	[0.8] = {
		0.928461,
		-0.143089,
		-0.342762,
		0,
		-0.085887,
		0.815101,
		-0.572918,
		0,
		0.361364,
		0.56137,
		0.744499,
		0,
		0.02739,
		0.255594,
		-0.497688,
		1
	},
	[0.916666666667] = {
		0.922669,
		-0.147123,
		-0.356422,
		0,
		-0.032504,
		0.891383,
		-0.452084,
		0,
		0.384221,
		0.428709,
		0.817669,
		0,
		0.05592,
		0.318087,
		-0.464989,
		1
	},
	[0.933333333333] = {
		0.923021,
		-0.141918,
		-0.357619,
		0,
		-0.022001,
		0.908496,
		-0.417314,
		0,
		0.38412,
		0.393058,
		0.835439,
		0,
		0.062781,
		0.335756,
		-0.459527,
		1
	},
	[0.95] = {
		0.923625,
		-0.135577,
		-0.35852,
		0,
		-0.01123,
		0.925381,
		-0.378873,
		0,
		0.383134,
		0.353962,
		0.853182,
		0,
		0.069691,
		0.354284,
		-0.454384,
		1
	},
	[0.966666666667] = {
		0.924454,
		-0.128231,
		-0.359085,
		0,
		-0.000357,
		0.941461,
		-0.337121,
		0,
		0.381294,
		0.311781,
		0.870292,
		0,
		0.07619,
		0.373196,
		-0.450355,
		1
	},
	[0.983333333333] = {
		0.925478,
		-0.120022,
		-0.359284,
		0,
		0.010456,
		0.956209,
		-0.292497,
		0,
		0.378657,
		0.266943,
		0.886206,
		0,
		0.082272,
		0.392499,
		-0.447304,
		1
	},
	[0.9] = {
		0.922592,
		-0.151074,
		-0.354965,
		0,
		-0.042571,
		0.874642,
		-0.482897,
		0,
		0.383421,
		0.460628,
		0.800506,
		0,
		0.049626,
		0.301975,
		-0.46995,
		1
	},
	[1.01666666667] = {
		0.927968,
		-0.101645,
		-0.35853,
		0,
		0.031282,
		0.979934,
		-0.19685,
		0,
		0.371344,
		0.171455,
		0.912527,
		0,
		0.093168,
		0.432223,
		-0.443617,
		1
	},
	[1.03333333333] = {
		0.929352,
		-0.091827,
		-0.357593,
		0,
		0.041023,
		0.988261,
		-0.147164,
		0,
		0.366908,
		0.122097,
		0.92221,
		0,
		0.097973,
		0.452529,
		-0.442744,
		1
	},
	[1.05] = {
		0.930769,
		-0.081808,
		-0.356339,
		0,
		0.050175,
		0.994005,
		-0.097144,
		0,
		0.362149,
		0.072539,
		0.929293,
		0,
		0.102341,
		0.473021,
		-0.442347,
		1
	},
	[1.06666666667] = {
		0.93217,
		-0.071742,
		-0.354841,
		0,
		0.058648,
		0.997146,
		-0.047537,
		0,
		0.357239,
		0.023502,
		0.933717,
		0,
		0.106258,
		0.493575,
		-0.442297,
		1
	},
	[1.08333333333] = {
		0.933506,
		-0.061779,
		-0.353199,
		0,
		0.066391,
		0.997793,
		0.000946,
		0,
		0.352361,
		-0.024332,
		0.935548,
		0,
		0.109708,
		0.514026,
		-0.44248,
		1
	},
	[1.11666666667] = {
		0.935786,
		-0.042687,
		-0.349976,
		0,
		0.079616,
		0.992588,
		0.091816,
		0,
		0.343463,
		-0.113784,
		0.932248,
		0,
		0.115105,
		0.553772,
		-0.443159,
		1
	},
	[1.13333333333] = {
		0.936643,
		-0.03379,
		-0.348652,
		0,
		0.085108,
		0.987463,
		0.13294,
		0,
		0.339789,
		-0.15419,
		0.927776,
		0,
		0.116981,
		0.572563,
		-0.443509,
		1
	},
	[1.15] = {
		0.937235,
		-0.025459,
		-0.347768,
		0,
		0.089909,
		0.981252,
		0.170471,
		0,
		0.336908,
		-0.191038,
		0.921953,
		0,
		0.118267,
		0.590244,
		-0.44381,
		1
	},
	[1.16666666667] = {
		0.937512,
		-0.01778,
		-0.347499,
		0,
		0.09407,
		0.974455,
		0.203932,
		0,
		0.334996,
		-0.223878,
		0.915236,
		0,
		0.118921,
		0.606498,
		-0.444042,
		1
	},
	[1.18333333333] = {
		0.937424,
		-0.010836,
		-0.348021,
		0,
		0.097649,
		0.967586,
		0.232899,
		0,
		0.334216,
		-0.252309,
		0.908097,
		0,
		0.118903,
		0.620993,
		-0.444205,
		1
	},
	[1.1] = {
		0.934729,
		-0.052053,
		-0.351529,
		0,
		0.07338,
		0.996167,
		0.047612,
		0,
		0.347703,
		-0.070299,
		0.934966,
		0,
		0.112666,
		0.534171,
		-0.442795,
		1
	},
	[1.21666666667] = {
		0.93596,
		0.000524,
		-0.352105,
		0,
		0.103259,
		0.955623,
		0.275904,
		0,
		0.336624,
		-0.294593,
		0.894371,
		0,
		0.116668,
		0.643319,
		-0.444377,
		1
	},
	[1.23333333333] = {
		0.93446,
		0.004743,
		-0.356036,
		0,
		0.10536,
		0.951451,
		0.289207,
		0,
		0.340122,
		-0.307765,
		0.888593,
		0,
		0.114382,
		0.650457,
		-0.444419,
		1
	},
	[1.25] = {
		0.932339,
		0.00752,
		-0.361508,
		0,
		0.107225,
		0.949064,
		0.296279,
		0,
		0.345323,
		-0.314995,
		0.884042,
		0,
		0.111152,
		0.654415,
		-0.444785,
		1
	},
	[1.26666666667] = {
		0.92958,
		0.008656,
		-0.368518,
		0,
		0.109003,
		0.948561,
		0.297237,
		0,
		0.352135,
		-0.316476,
		0.88082,
		0,
		0.106986,
		0.655137,
		-0.445644,
		1
	},
	[1.28333333333] = {
		0.926223,
		0.008355,
		-0.376884,
		0,
		0.110578,
		0.949755,
		0.292811,
		0,
		0.360394,
		-0.312884,
		0.878761,
		0,
		0.102107,
		0.652778,
		-0.446698,
		1
	},
	[1.2] = {
		0.93692,
		-0.004709,
		-0.349511,
		0,
		0.1007,
		0.961153,
		0.256992,
		0,
		0.334723,
		-0.275977,
		0.900998,
		0,
		0.118169,
		0.633386,
		-0.444311,
		1
	},
	[1.31666666667] = {
		0.917847,
		0.004057,
		-0.396913,
		0,
		0.112639,
		0.956179,
		0.270248,
		0,
		0.380616,
		-0.292755,
		0.877169,
		0,
		0.089455,
		0.641123,
		-0.451743,
		1
	},
	[1.33333333333] = {
		0.91303,
		0.000119,
		-0.407891,
		0,
		0.112949,
		0.960822,
		0.253107,
		0,
		0.391941,
		-0.277165,
		0.877247,
		0,
		0.081906,
		0.632849,
		-0.45552,
		1
	},
	[1.35] = {
		0.907868,
		-0.004744,
		-0.419228,
		0,
		0.112598,
		0.965958,
		0.232908,
		0,
		0.403852,
		-0.258654,
		0.877497,
		0,
		0.073797,
		0.623319,
		-0.459699,
		1
	},
	[1.36666666667] = {
		0.902397,
		-0.010254,
		-0.430784,
		0,
		0.11146,
		0.971248,
		0.210365,
		0,
		0.416241,
		-0.237848,
		0.877594,
		0,
		0.065281,
		0.612798,
		-0.46405,
		1
	},
	[1.38333333333] = {
		0.896668,
		-0.016114,
		-0.442411,
		0,
		0.109421,
		0.976398,
		0.186208,
		0,
		0.428969,
		-0.215376,
		0.877268,
		0,
		0.056511,
		0.60156,
		-0.468349,
		1
	},
	[1.3] = {
		0.922278,
		0.006819,
		-0.386468,
		0,
		0.111821,
		0.952384,
		0.283655,
		0,
		0.37,
		-0.304824,
		0.8776,
		0,
		0.096301,
		0.647882,
		-0.448605,
		1
	},
	[1.41666666667] = {
		0.88464,
		-0.027567,
		-0.465459,
		0,
		0.10233,
		0.985392,
		0.136127,
		0,
		0.454907,
		-0.168054,
		0.874538,
		0,
		0.038851,
		0.578072,
		-0.475993,
		1
	},
	[1.43333333333] = {
		0.878481,
		-0.032457,
		-0.476674,
		0,
		0.09718,
		0.988972,
		0.111758,
		0,
		0.46779,
		-0.1445,
		0.871947,
		0,
		0.030271,
		0.566419,
		-0.478979,
		1
	},
	[1.45] = {
		0.87228,
		-0.036282,
		-0.487659,
		0,
		0.09097,
		0.991876,
		0.088923,
		0,
		0.480471,
		-0.121928,
		0.868494,
		0,
		0.022083,
		0.555228,
		-0.481209,
		1
	},
	[1.46666666667] = {
		0.866102,
		-0.038653,
		-0.49837,
		0,
		0.08373,
		0.994138,
		0.068407,
		0,
		0.492804,
		-0.100976,
		0.864262,
		0,
		0.01444,
		0.544809,
		-0.482556,
		1
	},
	[1.48333333333] = {
		0.859969,
		-0.039162,
		-0.508842,
		0,
		0.075549,
		0.995835,
		0.051039,
		0,
		0.504723,
		-0.082334,
		0.859346,
		0,
		0.007509,
		0.535465,
		-0.482916,
		1
	},
	[1.4] = {
		0.890729,
		-0.022,
		-0.454003,
		0,
		0.106399,
		0.981169,
		0.161204,
		0,
		0.441907,
		-0.191894,
		0.876296,
		0,
		0.047648,
		0.589887,
		-0.472393,
		1
	},
	[1.51666666667] = {
		0.847905,
		-0.032897,
		-0.529127,
		0,
		0.056743,
		0.997971,
		0.028883,
		0,
		0.527103,
		-0.054515,
		0.848051,
		0,
		-0.003604,
		0.521219,
		-0.48031,
		1
	},
	[1.53333333333] = {
		0.840411,
		-0.020641,
		-0.541557,
		0,
		0.042324,
		0.998722,
		0.027614,
		0,
		0.540295,
		-0.046127,
		0.840211,
		0,
		-0.008057,
		0.51686,
		-0.476745,
		1
	},
	[1.55] = {
		0.830727,
		2.7e-05,
		-0.55668,
		0,
		0.022493,
		0.999182,
		0.033615,
		0,
		0.556225,
		-0.040446,
		0.830047,
		0,
		-0.012108,
		0.514095,
		-0.471834,
		1
	},
	[1.56666666667] = {
		0.820586,
		0.022665,
		-0.571074,
		0,
		0.002334,
		0.999072,
		0.043006,
		0,
		0.571519,
		-0.036623,
		0.819771,
		0,
		-0.015344,
		0.512433,
		-0.466778,
		1
	},
	[1.58333333333] = {
		0.81238,
		0.040816,
		-0.581698,
		0,
		-0.013244,
		0.998582,
		0.05157,
		0,
		0.582978,
		-0.03419,
		0.811768,
		0,
		-0.017459,
		0.511529,
		-0.462824,
		1
	},
	[1.5] = {
		0.853908,
		-0.037388,
		-0.519079,
		0,
		0.066522,
		0.997076,
		0.037613,
		0,
		0.516155,
		-0.066649,
		0.853898,
		0,
		0.001442,
		0.527499,
		-0.482194,
		1
	},
	[1.6] = {
		0.808971,
		0.048047,
		-0.585881,
		0,
		-0.019539,
		0.998301,
		0.054891,
		0,
		0.587523,
		-0.032958,
		0.808536,
		0,
		-0.018222,
		0.511152,
		-0.461248,
		1
	}
}

return spline_matrices
