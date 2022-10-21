local spline_matrices = {
	[0] = {
		0.079596,
		0.294364,
		-0.952373,
		0,
		-0.423368,
		0.874936,
		0.235046,
		0,
		0.902454,
		0.384496,
		0.194265,
		0,
		-1.101226,
		0.260776,
		-1.005076,
		1
	},
	{
		0.153509,
		-0.140691,
		-0.97808,
		0,
		-0.939867,
		-0.326402,
		-0.10056,
		0,
		-0.305099,
		0.934702,
		-0.182337,
		0,
		-1.211409,
		0.326616,
		-0.963293,
		1
	},
	[0.0166666666667] = {
		0.231132,
		0.161857,
		-0.959365,
		0,
		-0.327058,
		0.941606,
		0.080065,
		0,
		0.916303,
		0.295262,
		0.270572,
		0,
		-1.127607,
		0.217424,
		-0.955274,
		1
	},
	[0.0333333333333] = {
		0.392079,
		-0.018857,
		-0.919738,
		0,
		-0.197585,
		0.974731,
		-0.104214,
		0,
		0.898462,
		0.222587,
		0.378445,
		0,
		-1.179924,
		0.134021,
		-0.865474,
		1
	},
	[0.05] = {
		0.533483,
		-0.25104,
		-0.807697,
		0,
		-0.013721,
		0.952244,
		-0.305029,
		0,
		0.8457,
		0.17381,
		0.504562,
		0,
		-1.256074,
		0.027019,
		-0.748293,
		1
	},
	[0.0666666666667] = {
		0.605744,
		-0.516095,
		-0.605575,
		0,
		0.229893,
		0.84216,
		-0.487765,
		0,
		0.761724,
		0.156243,
		0.62878,
		0,
		-1.350246,
		-0.086609,
		-0.619829,
		1
	},
	[0.0833333333333] = {
		0.555403,
		-0.763826,
		-0.328782,
		0,
		0.500864,
		0.622875,
		-0.600967,
		0,
		0.663824,
		0.169104,
		0.72852,
		0,
		-1.450122,
		-0.193254,
		-0.497662,
		1
	},
	[0.116666666667] = {
		0.085662,
		-0.977962,
		0.190399,
		0,
		0.848047,
		-0.028736,
		-0.529141,
		0,
		0.522952,
		0.206794,
		0.826896,
		0,
		-1.60331,
		-0.366876,
		-0.314646,
		1
	},
	[0.133333333333] = {
		-0.21142,
		-0.923783,
		0.319261,
		0,
		0.843688,
		-0.337398,
		-0.417557,
		0,
		0.49345,
		0.181076,
		0.850717,
		0,
		-1.640153,
		-0.431849,
		-0.255964,
		1
	},
	[0.15] = {
		-0.469404,
		-0.808359,
		0.355268,
		0,
		0.745486,
		-0.578435,
		-0.331155,
		0,
		0.473192,
		0.109402,
		0.87414,
		0,
		-1.652385,
		-0.473553,
		-0.21927,
		1
	},
	[0.166666666667] = {
		-0.668516,
		-0.667752,
		0.327405,
		0,
		0.595203,
		-0.744345,
		-0.302792,
		0,
		0.445892,
		-0.007549,
		0.895055,
		0,
		-1.643193,
		-0.479212,
		-0.210109,
		1
	},
	[0.183333333333] = {
		-0.829673,
		-0.499564,
		0.249156,
		0,
		0.407981,
		-0.847243,
		-0.340193,
		0,
		0.381044,
		-0.180598,
		0.906747,
		0,
		-1.620028,
		-0.377786,
		-0.216769,
		1
	},
	[0.1] = {
		0.366589,
		-0.929585,
		-0.038519,
		0,
		0.728691,
		0.312613,
		-0.60933,
		0,
		0.578466,
		0.195305,
		0.791981,
		0,
		-1.53883,
		-0.286761,
		-0.394697,
		1
	},
	[0.216666666667] = {
		-0.999659,
		-0.020332,
		0.016372,
		0,
		0.007729,
		-0.829584,
		-0.558328,
		0,
		0.024933,
		-0.558011,
		0.829459,
		0,
		-1.541037,
		0.159421,
		-0.223692,
		1
	},
	[0.233333333333] = {
		-0.962891,
		0.257239,
		-0.081661,
		0,
		-0.132892,
		-0.715248,
		-0.686119,
		0,
		-0.234905,
		-0.649806,
		0.722891,
		0,
		-1.481701,
		0.482897,
		-0.224029,
		1
	},
	[0.25] = {
		-0.842181,
		0.518848,
		-0.146726,
		0,
		-0.215791,
		-0.573707,
		-0.790123,
		0,
		-0.494132,
		-0.633764,
		0.595127,
		0,
		-1.409649,
		0.771928,
		-0.22326,
		1
	},
	[0.266666666667] = {
		-0.650526,
		0.737146,
		-0.182846,
		0,
		-0.26185,
		-0.443676,
		-0.85708,
		0,
		-0.712917,
		-0.509675,
		0.481644,
		0,
		-1.319079,
		0.970503,
		-0.222539,
		1
	},
	[0.283333333333] = {
		-0.349209,
		0.914574,
		-0.203981,
		0,
		-0.314344,
		-0.319409,
		-0.893961,
		0,
		-0.882746,
		-0.248059,
		0.399032,
		0,
		-1.188179,
		1.070779,
		-0.22254,
		1
	},
	[0.2] = {
		-0.950098,
		-0.281184,
		0.135091,
		0,
		0.198688,
		-0.879303,
		-0.432838,
		0,
		0.240493,
		-0.384398,
		0.891292,
		0,
		-1.586849,
		-0.145931,
		-0.221422,
		1
	},
	[0.316666666667] = {
		0.495722,
		0.836363,
		-0.234001,
		0,
		-0.383745,
		-0.030769,
		-0.922926,
		0,
		-0.779102,
		0.547311,
		0.305697,
		0,
		-0.881627,
		1.215569,
		-0.217249,
		1
	},
	[0.333333333333] = {
		0.806149,
		0.534488,
		-0.253862,
		0,
		-0.366714,
		0.114591,
		-0.923249,
		0,
		-0.464376,
		0.837371,
		0.288382,
		0,
		-0.686463,
		1.256502,
		-0.214767,
		1
	},
	[0.35] = {
		0.95222,
		0.128212,
		-0.277199,
		0,
		-0.301929,
		0.258457,
		-0.917627,
		0,
		-0.046007,
		0.957477,
		0.284818,
		0,
		-0.460105,
		1.274169,
		-0.213644,
		1
	},
	[0.366666666667] = {
		0.885952,
		-0.350469,
		-0.303745,
		0,
		-0.16082,
		0.382145,
		-0.910001,
		0,
		0.435002,
		0.855065,
		0.2822,
		0,
		-0.210501,
		1.279636,
		-0.212947,
		1
	},
	[0.383333333333] = {
		0.176971,
		-0.916783,
		-0.358036,
		0,
		0.189239,
		0.388685,
		-0.901727,
		0,
		0.965852,
		0.091825,
		0.242277,
		0,
		0.414478,
		1.075573,
		-0.262527,
		1
	},
	[0.3] = {
		0.072554,
		0.973144,
		-0.218464,
		0,
		-0.363577,
		-0.178163,
		-0.914368,
		0,
		-0.928734,
		0.145769,
		0.340887,
		0,
		-1.044178,
		1.149894,
		-0.220455,
		1
	},
	[0.416666666667] = {
		-0.841322,
		-0.410105,
		-0.352123,
		0,
		0.396724,
		-0.02603,
		-0.917569,
		0,
		0.367133,
		-0.911667,
		0.184598,
		0,
		1.016098,
		0.595027,
		-0.323053,
		1
	},
	[0.433333333333] = {
		-0.897067,
		-0.263024,
		-0.355089,
		0,
		0.394282,
		-0.113587,
		-0.911943,
		0,
		0.199529,
		-0.95808,
		0.2056,
		0,
		1.053533,
		0.371449,
		-0.326366,
		1
	},
	[0.45] = {
		-0.910547,
		-0.193249,
		-0.365459,
		0,
		0.39852,
		-0.175222,
		-0.900266,
		0,
		0.109939,
		-0.965377,
		0.236561,
		0,
		1.084609,
		0.138963,
		-0.328145,
		1
	},
	[0.466666666667] = {
		-0.909229,
		-0.176401,
		-0.377076,
		0,
		0.410066,
		-0.223377,
		-0.884278,
		0,
		0.071757,
		-0.958637,
		0.275437,
		0,
		1.109934,
		-0.087983,
		-0.330756,
		1
	},
	[0.483333333333] = {
		-0.902729,
		-0.195291,
		-0.38333,
		0,
		0.424778,
		-0.263482,
		-0.866107,
		0,
		0.068143,
		-0.94469,
		0.320808,
		0,
		1.128209,
		-0.295966,
		-0.335952,
		1
	},
	[0.4] = {
		-0.662145,
		-0.656275,
		-0.361755,
		0,
		0.389009,
		0.111579,
		-0.914452,
		0,
		0.640496,
		-0.746226,
		0.181416,
		0,
		0.965647,
		0.790315,
		-0.316218,
		1
	},
	[0.516666666667] = {
		-0.888702,
		-0.290444,
		-0.354755,
		0,
		0.439114,
		-0.316655,
		-0.840779,
		0,
		0.131864,
		-0.902979,
		0.40895,
		0,
		1.141385,
		-0.583475,
		-0.35861,
		1
	},
	[0.533333333333] = {
		-0.890377,
		-0.333248,
		-0.310122,
		0,
		0.417883,
		-0.328118,
		-0.847179,
		0,
		0.180564,
		-0.883903,
		0.431407,
		0,
		1.136906,
		-0.626089,
		-0.379587,
		1
	},
	[0.55] = {
		-0.892883,
		-0.384794,
		-0.233865,
		0,
		0.369193,
		-0.328258,
		-0.86945,
		0,
		0.257792,
		-0.862659,
		0.435159,
		0,
		1.112591,
		-0.59551,
		-0.435776,
		1
	},
	[0.566666666667] = {
		-0.872365,
		-0.474071,
		-0.119312,
		0,
		0.296798,
		-0.319687,
		-0.89984,
		0,
		0.388445,
		-0.820401,
		0.419587,
		0,
		1.041951,
		-0.499416,
		-0.547308,
		1
	},
	[0.583333333333] = {
		-0.807076,
		-0.589942,
		0.024411,
		0,
		0.199053,
		-0.310774,
		-0.929407,
		0,
		0.555883,
		-0.745243,
		0.368249,
		0,
		0.939998,
		-0.359879,
		-0.696874,
		1
	},
	[0.5] = {
		-0.894827,
		-0.237806,
		-0.3778,
		0,
		0.437148,
		-0.295265,
		-0.849541,
		0,
		0.090474,
		-0.925347,
		0.368168,
		0,
		1.138579,
		-0.467749,
		-0.344705,
		1
	},
	[0.616666666667] = {
		-0.484437,
		-0.818087,
		0.309927,
		0,
		-0.050457,
		-0.327555,
		-0.943484,
		0,
		0.87337,
		-0.472696,
		0.117401,
		0,
		0.678088,
		-0.013224,
		-1.050027,
		1
	},
	[0.633333333333] = {
		-0.248467,
		-0.884272,
		0.395383,
		0,
		-0.17351,
		-0.360951,
		-0.916302,
		0,
		0.952974,
		-0.296273,
		-0.063745,
		0,
		0.536082,
		0.16498,
		-1.226289,
		1
	},
	[0.65] = {
		-0.008514,
		-0.906113,
		0.422951,
		0,
		-0.275867,
		-0.404423,
		-0.871974,
		0,
		0.961158,
		-0.124102,
		-0.246524,
		0,
		0.396726,
		0.328075,
		-1.385968,
		1
	},
	[0.666666666667] = {
		0.202099,
		-0.893731,
		0.4005,
		0,
		-0.353058,
		-0.447927,
		-0.821408,
		0,
		0.913513,
		0.024606,
		-0.406065,
		0,
		0.265197,
		0.462156,
		-1.517203,
		1
	},
	[0.683333333333] = {
		0.366289,
		-0.864137,
		0.345107,
		0,
		-0.409205,
		-0.482688,
		-0.774315,
		0,
		0.835694,
		0.142403,
		-0.530413,
		0,
		0.145287,
		0.552026,
		-1.606202,
		1
	},
	[0.6] = {
		-0.678329,
		-0.71305,
		0.177286,
		0,
		0.079404,
		-0.311011,
		-0.947084,
		0,
		0.730456,
		-0.628357,
		0.267586,
		0,
		0.815694,
		-0.19288,
		-0.869229,
		1
	},
	[0.716666666667] = {
		0.561163,
		-0.80631,
		0.186978,
		0,
		-0.492898,
		-0.507012,
		-0.7071,
		0,
		0.664942,
		0.304637,
		-0.681945,
		0,
		-0.061548,
		0.569013,
		-1.61935,
		1
	},
	[0.733333333333] = {
		0.619775,
		-0.780144,
		0.085165,
		0,
		-0.536246,
		-0.500231,
		-0.679859,
		0,
		0.572991,
		0.375691,
		-0.72838,
		0,
		-0.175419,
		0.552361,
		-1.583701,
		1
	},
	[0.75] = {
		0.657757,
		-0.752677,
		-0.028862,
		0,
		-0.582992,
		-0.484459,
		-0.652242,
		0,
		0.476945,
		0.445843,
		-0.757461,
		0,
		-0.297534,
		0.531111,
		-1.531769,
		1
	},
	[0.766666666667] = {
		0.675464,
		-0.721658,
		-0.151518,
		0,
		-0.632763,
		-0.461746,
		-0.621612,
		0,
		0.378629,
		0.515752,
		-0.768532,
		0,
		-0.424472,
		0.506902,
		-1.468232,
		1
	},
	[0.783333333333] = {
		0.673156,
		-0.684882,
		-0.278923,
		0,
		-0.684433,
		-0.434189,
		-0.585689,
		0,
		0.280023,
		0.585164,
		-0.761033,
		0,
		-0.552858,
		0.480801,
		-1.396571,
		1
	},
	[0.7] = {
		0.481131,
		-0.833092,
		0.272894,
		0,
		-0.452387,
		-0.502589,
		-0.736716,
		0,
		0.750905,
		0.231003,
		-0.618691,
		0,
		0.040138,
		0.578544,
		-1.632106,
		1
	},
	[0.816666666667] = {
		0.611279,
		-0.58746,
		-0.53031,
		0,
		-0.786189,
		-0.373866,
		-0.492069,
		0,
		0.090806,
		0.717715,
		-0.690391,
		0,
		-0.800158,
		0.427162,
		-1.243011,
		1
	},
	[0.833333333333] = {
		0.55491,
		-0.525497,
		-0.644925,
		0,
		-0.831898,
		-0.346195,
		-0.4337,
		0,
		0.004638,
		0.777176,
		-0.629267,
		0,
		-0.912081,
		0.401797,
		-1.168381,
		1
	},
	[0.85] = {
		0.485226,
		-0.4555,
		-0.746375,
		0,
		-0.871295,
		-0.323619,
		-0.368939,
		0,
		-0.07349,
		0.829331,
		-0.553903,
		0,
		-1.011466,
		0.378815,
		-1.100052,
		1
	},
	[0.866666666667] = {
		0.405964,
		-0.379329,
		-0.831446,
		0,
		-0.902688,
		-0.308442,
		-0.30003,
		0,
		-0.142643,
		0.872338,
		-0.467632,
		0,
		-1.094715,
		0.359233,
		-1.041661,
		1
	},
	[0.883333333333] = {
		0.321307,
		-0.299609,
		-0.89833,
		0,
		-0.924991,
		-0.302514,
		-0.22995,
		0,
		-0.202862,
		0.904831,
		-0.374335,
		0,
		-1.158174,
		0.344031,
		-0.99685,
		1
	},
	[0.8] = {
		0.651372,
		-0.640525,
		-0.406745,
		0,
		-0.73628,
		-0.404067,
		-0.54279,
		0,
		0.183318,
		0.653037,
		-0.734804,
		0,
		-0.679247,
		0.453858,
		-1.320292,
		1
	},
	[0.916666666667] = {
		0.152342,
		-0.141661,
		-0.978123,
		0,
		-0.941122,
		-0.323001,
		-0.099799,
		0,
		-0.301797,
		0.935736,
		-0.182527,
		0,
		-1.210846,
		0.330646,
		-0.962626,
		1
	},
	[0.933333333333] = {
		0.152408,
		-0.141607,
		-0.97812,
		0,
		-0.941052,
		-0.323191,
		-0.099842,
		0,
		-0.301982,
		0.935679,
		-0.182516,
		0,
		-1.210878,
		0.330421,
		-0.962663,
		1
	},
	[0.95] = {
		0.152585,
		-0.14146,
		-0.978114,
		0,
		-0.940862,
		-0.323709,
		-0.099958,
		0,
		-0.302484,
		0.935522,
		-0.182487,
		0,
		-1.210964,
		0.329808,
		-0.962764,
		1
	},
	[0.966666666667] = {
		0.152847,
		-0.141242,
		-0.978105,
		0,
		-0.940581,
		-0.324471,
		-0.100128,
		0,
		-0.303224,
		0.935291,
		-0.182444,
		0,
		-1.211091,
		0.328905,
		-0.962914,
		1
	},
	[0.983333333333] = {
		0.153164,
		-0.140979,
		-0.978093,
		0,
		-0.94024,
		-0.325396,
		-0.100335,
		0,
		-0.304122,
		0.935009,
		-0.182393,
		0,
		-1.211244,
		0.327809,
		-0.963095,
		1
	},
	[0.9] = {
		0.235475,
		-0.219369,
		-0.946799,
		0,
		-0.937767,
		-0.307125,
		-0.162069,
		0,
		-0.255233,
		0.926041,
		-0.278037,
		0,
		-1.198134,
		0.334175,
		-0.969276,
		1
	},
	[1.01666666667] = {
		0.153854,
		-0.140404,
		-0.978067,
		0,
		-0.939493,
		-0.327408,
		-0.100786,
		0,
		-0.306076,
		0.934393,
		-0.182281,
		0,
		-1.211573,
		0.325422,
		-0.963491,
		1
	},
	[1.03333333333] = {
		0.154171,
		-0.14014,
		-0.978055,
		0,
		-0.939148,
		-0.328332,
		-0.100993,
		0,
		-0.306973,
		0.934109,
		-0.182231,
		0,
		-1.211722,
		0.324325,
		-0.963674,
		1
	},
	[1.05] = {
		0.154431,
		-0.139922,
		-0.978045,
		0,
		-0.938863,
		-0.329092,
		-0.101164,
		0,
		-0.307712,
		0.933874,
		-0.18219,
		0,
		-1.211844,
		0.323421,
		-0.963824,
		1
	},
	[1.06666666667] = {
		0.154608,
		-0.139774,
		-0.978039,
		0,
		-0.93867,
		-0.329608,
		-0.10128,
		0,
		-0.308213,
		0.933714,
		-0.182162,
		0,
		-1.211926,
		0.322808,
		-0.963927,
		1
	},
	[1.08333333333] = {
		0.154673,
		-0.13972,
		-0.978036,
		0,
		-0.938598,
		-0.329798,
		-0.101322,
		0,
		-0.308398,
		0.933655,
		-0.182152,
		0,
		-1.211956,
		0.322582,
		-0.963964,
		1
	}
}

return spline_matrices