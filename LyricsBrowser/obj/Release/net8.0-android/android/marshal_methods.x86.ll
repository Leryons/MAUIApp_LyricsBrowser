; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [128 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [256 x i32] [
	i32 39109920, ; 0: Newtonsoft.Json.dll => 0x254c520 => 49
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 118
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 48
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 109
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 54
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 72
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 86
	i32 230752869, ; 10: Microsoft.CSharp.dll => 0xdc10265 => 79
	i32 246610117, ; 11: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 107
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 50
	i32 336156722, ; 15: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 16: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 61
	i32 356389973, ; 17: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 18: System.Threading.Thread.dll => 0x16a510e1 => 118
	i32 385762202, ; 19: System.Memory.dll => 0x16fe439a => 97
	i32 395744057, ; 20: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 21: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 22: System.Collections => 0x1a61054f => 83
	i32 450948140, ; 23: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 60
	i32 459347974, ; 24: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 469710990, ; 25: System.dll => 0x1bff388e => 123
	i32 498788369, ; 26: System.ObjectModel => 0x1dbae811 => 102
	i32 500358224, ; 27: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 28: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 29: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 43
	i32 539058512, ; 30: Microsoft.Extensions.Logging => 0x20216150 => 40
	i32 592146354, ; 31: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 32: Xamarin.AndroidX.CustomView => 0x2568904f => 58
	i32 627931235, ; 33: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 34: System.Collections.Concurrent => 0x2814a96c => 80
	i32 688181140, ; 35: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 36: System.Xml.Linq.dll => 0x29293ff5 => 120
	i32 706645707, ; 37: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 38: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 39: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 100
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 94
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 42
	i32 804715423, ; 44: System.Data.Common => 0x2ff6fb9f => 88
	i32 823281589, ; 45: System.Private.Uri.dll => 0x311247b5 => 103
	i32 830298997, ; 46: System.IO.Compression.Brotli => 0x317d5b75 => 93
	i32 904024072, ; 47: System.ComponentModel.Primitives.dll => 0x35e25008 => 84
	i32 926902833, ; 48: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 49: Newtonsoft.Json => 0x38f24a24 => 49
	i32 967690846, ; 50: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 61
	i32 975874589, ; 51: System.Xml.XDocument => 0x3a2aaa1d => 122
	i32 992768348, ; 52: System.Collections.dll => 0x3b2c715c => 83
	i32 1012816738, ; 53: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 71
	i32 1019214401, ; 54: System.Drawing => 0x3cbffa41 => 92
	i32 1028951442, ; 55: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1029334545, ; 56: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 57: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 51
	i32 1036536393, ; 58: System.Drawing.Primitives.dll => 0x3dc84a49 => 91
	i32 1044663988, ; 59: System.Linq.Expressions.dll => 0x3e444eb4 => 95
	i32 1052210849, ; 60: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 63
	i32 1082857460, ; 61: System.ComponentModel.TypeConverter => 0x408b17f4 => 85
	i32 1084122840, ; 62: Xamarin.Kotlin.StdLib => 0x409e66d8 => 76
	i32 1098259244, ; 63: System => 0x41761b2c => 123
	i32 1118262833, ; 64: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 65: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 66: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 68
	i32 1203215381, ; 67: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 68: CommunityToolkit.Mvvm => 0x4868cc7b => 35
	i32 1234928153, ; 69: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 70: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 59
	i32 1324164729, ; 72: System.Linq => 0x4eed2679 => 96
	i32 1373134921, ; 73: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 74: Xamarin.AndroidX.SavedState => 0x52114ed3 => 71
	i32 1406073936, ; 75: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 55
	i32 1408764838, ; 76: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 112
	i32 1430672901, ; 77: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 78: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 79: System.IO.Compression.dll => 0x57261233 => 94
	i32 1469204771, ; 80: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 52
	i32 1470490898, ; 81: Microsoft.Extensions.Primitives => 0x57a5e912 => 43
	i32 1480492111, ; 82: System.IO.Compression.Brotli.dll => 0x583e844f => 93
	i32 1493001747, ; 83: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 84: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 85: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 117
	i32 1551623176, ; 86: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 65
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 74
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 57
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 98
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 117
	i32 1657153582, ; 92: System.Runtime => 0x62c6282e => 114
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 75
	i32 1677501392, ; 94: System.Net.Primitives.dll => 0x63fca3d0 => 99
	i32 1679769178, ; 95: System.Security.Cryptography => 0x641f3e5a => 115
	i32 1729485958, ; 96: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 53
	i32 1736233607, ; 97: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 98: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 99: System.Diagnostics.TraceSource.dll => 0x69239124 => 90
	i32 1766324549, ; 100: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 72
	i32 1770582343, ; 101: Microsoft.Extensions.Logging.dll => 0x6988f147 => 40
	i32 1780572499, ; 102: Mono.Android.Runtime.dll => 0x6a216153 => 126
	i32 1782862114, ; 103: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 104: Xamarin.AndroidX.Fragment => 0x6a96652d => 60
	i32 1793755602, ; 105: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 106: Xamarin.AndroidX.Loader => 0x6bcd3296 => 65
	i32 1813058853, ; 107: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 76
	i32 1813201214, ; 108: Xamarin.Google.Android.Material => 0x6c13413e => 75
	i32 1818569960, ; 109: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 69
	i32 1824175904, ; 110: System.Text.Encoding.Extensions => 0x6cbab720 => 116
	i32 1824722060, ; 111: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 112
	i32 1828688058, ; 112: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 41
	i32 1842015223, ; 113: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 114: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 115: System.Linq.Expressions => 0x6ec71a65 => 95
	i32 1870277092, ; 116: System.Reflection.Primitives => 0x6f7a29e4 => 108
	i32 1875935024, ; 117: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 118: System.Collections.NonGeneric.dll => 0x71dc7c8b => 81
	i32 1939592360, ; 119: System.Private.Xml.Linq => 0x739bd4a8 => 104
	i32 1968388702, ; 120: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 2003115576, ; 121: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 122: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 63
	i32 2022275042, ; 123: LyricsBrowser.dll => 0x788977e2 => 78
	i32 2025202353, ; 124: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 125: System.Private.Xml => 0x79eb68ee => 105
	i32 2055257422, ; 126: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 62
	i32 2066184531, ; 127: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 128: System.Diagnostics.TraceSource => 0x7b6f419e => 90
	i32 2079903147, ; 129: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 130: System.Numerics.Vectors => 0x7c9bf920 => 101
	i32 2127167465, ; 131: System.Console => 0x7ec9ffe9 => 87
	i32 2142473426, ; 132: System.Collections.Specialized => 0x7fb38cd2 => 82
	i32 2159891885, ; 133: Microsoft.Maui => 0x80bd55ad => 46
	i32 2169148018, ; 134: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 135: Microsoft.Extensions.Options.dll => 0x820d22b3 => 42
	i32 2192057212, ; 136: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 41
	i32 2193016926, ; 137: System.ObjectModel.dll => 0x82b6c85e => 102
	i32 2201107256, ; 138: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 77
	i32 2201231467, ; 139: System.Net.Http => 0x8334206b => 98
	i32 2207618523, ; 140: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 141: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2270573516, ; 142: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 143: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 70
	i32 2303942373, ; 144: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 145: System.Private.CoreLib.dll => 0x896b7878 => 124
	i32 2353062107, ; 146: System.Net.Primitives => 0x8c40e0db => 99
	i32 2368005991, ; 147: System.Xml.ReaderWriter.dll => 0x8d24e767 => 121
	i32 2371007202, ; 148: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2395872292, ; 149: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 150: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 151: System.Console.dll => 0x912896e5 => 87
	i32 2475788418, ; 152: Java.Interop.dll => 0x93918882 => 125
	i32 2477872625, ; 153: LyricsBrowser => 0x93b155f1 => 78
	i32 2480646305, ; 154: Microsoft.Maui.Controls => 0x93dba8a1 => 44
	i32 2538310050, ; 155: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 107
	i32 2550873716, ; 156: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 157: Microsoft.CSharp => 0x98ba5a04 => 79
	i32 2585220780, ; 158: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 116
	i32 2593496499, ; 159: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 160: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 77
	i32 2617129537, ; 161: System.Private.Xml.dll => 0x9bfe3a41 => 105
	i32 2620871830, ; 162: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 57
	i32 2626831493, ; 163: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 164: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2664396074, ; 165: System.Xml.XDocument.dll => 0x9ecf752a => 122
	i32 2665622720, ; 166: System.Drawing.Primitives => 0x9ee22cc0 => 91
	i32 2676780864, ; 167: System.Data.Common.dll => 0x9f8c6f40 => 88
	i32 2724373263, ; 168: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 169: Xamarin.AndroidX.Activity => 0xa2e0939b => 50
	i32 2737747696, ; 170: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 52
	i32 2752995522, ; 171: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 172: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 45
	i32 2764765095, ; 173: Microsoft.Maui.dll => 0xa4caf7a7 => 46
	i32 2778768386, ; 174: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 73
	i32 2785988530, ; 175: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 176: Microsoft.Maui.Graphics => 0xa7008e0b => 48
	i32 2806116107, ; 177: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 178: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 55
	i32 2831556043, ; 179: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 180: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 73
	i32 2861189240, ; 181: Microsoft.Maui.Essentials => 0xaa8a4878 => 47
	i32 2909740682, ; 182: System.Private.CoreLib => 0xad6f1e8a => 124
	i32 2916838712, ; 183: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 74
	i32 2919462931, ; 184: System.Numerics.Vectors.dll => 0xae037813 => 101
	i32 2959614098, ; 185: System.ComponentModel.dll => 0xb0682092 => 86
	i32 2978675010, ; 186: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 59
	i32 3038032645, ; 187: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 188: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 66
	i32 3059408633, ; 189: Mono.Android.Runtime => 0xb65adef9 => 126
	i32 3059793426, ; 190: System.ComponentModel.Primitives => 0xb660be12 => 84
	i32 3077302341, ; 191: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3159123045, ; 192: System.Reflection.Primitives.dll => 0xbc4c6465 => 108
	i32 3178803400, ; 193: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 67
	i32 3220365878, ; 194: System.Threading => 0xbff2e236 => 119
	i32 3258312781, ; 195: Xamarin.AndroidX.CardView => 0xc235e84d => 53
	i32 3305363605, ; 196: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 197: System.Net.Requests.dll => 0xc5b097e4 => 100
	i32 3317135071, ; 198: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 58
	i32 3346324047, ; 199: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 68
	i32 3357674450, ; 200: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 201: Xamarin.AndroidX.Core => 0xc86c06e3 => 56
	i32 3366347497, ; 202: Java.Interop => 0xc8a662e9 => 125
	i32 3374999561, ; 203: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 70
	i32 3381016424, ; 204: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 205: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3463511458, ; 206: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 207: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 85
	i32 3476120550, ; 208: Mono.Android => 0xcf3163e6 => 127
	i32 3479583265, ; 209: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 210: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3509114376, ; 211: System.Xml.Linq => 0xd128d608 => 120
	i32 3580758918, ; 212: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 213: System.Linq.dll => 0xd715a361 => 96
	i32 3641597786, ; 214: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 62
	i32 3643446276, ; 215: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 216: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 67
	i32 3657292374, ; 217: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3672681054, ; 218: Mono.Android.dll => 0xdae8aa5e => 127
	i32 3697841164, ; 219: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 220: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 66
	i32 3748608112, ; 221: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 89
	i32 3786282454, ; 222: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 54
	i32 3792276235, ; 223: System.Collections.NonGeneric => 0xe2098b0b => 81
	i32 3802395368, ; 224: System.Collections.Specialized.dll => 0xe2a3f2e8 => 82
	i32 3823082795, ; 225: System.Security.Cryptography.dll => 0xe3df9d2b => 115
	i32 3841636137, ; 226: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 227: System.Runtime.InteropServices.dll => 0xe56ef253 => 109
	i32 3889960447, ; 228: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 229: System.Collections.Concurrent.dll => 0xe839deed => 80
	i32 3896760992, ; 230: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 56
	i32 3928044579, ; 231: System.Xml.ReaderWriter => 0xea213423 => 121
	i32 3931092270, ; 232: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 69
	i32 3955647286, ; 233: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 51
	i32 3980434154, ; 234: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 235: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 236: System.Memory => 0xeff49a63 => 97
	i32 4046471985, ; 237: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 45
	i32 4054681211, ; 238: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 106
	i32 4068434129, ; 239: System.Private.Xml.Linq.dll => 0xf27f60d1 => 104
	i32 4073602200, ; 240: System.Threading.dll => 0xf2ce3c98 => 119
	i32 4094352644, ; 241: Microsoft.Maui.Essentials.dll => 0xf40add04 => 47
	i32 4099507663, ; 242: System.Drawing.dll => 0xf45985cf => 92
	i32 4100113165, ; 243: System.Private.Uri => 0xf462c30d => 103
	i32 4102112229, ; 244: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 245: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 246: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4147896353, ; 247: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 106
	i32 4150914736, ; 248: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 249: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 250: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 64
	i32 4213026141, ; 251: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 89
	i32 4271975918, ; 252: Microsoft.Maui.Controls.dll => 0xfea12dee => 44
	i32 4274623895, ; 253: CommunityToolkit.Mvvm.dll => 0xfec99597 => 35
	i32 4274976490, ; 254: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959 ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 64
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [256 x i32] [
	i32 49, ; 0
	i32 118, ; 1
	i32 33, ; 2
	i32 48, ; 3
	i32 109, ; 4
	i32 54, ; 5
	i32 72, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 86, ; 9
	i32 79, ; 10
	i32 107, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 50, ; 14
	i32 15, ; 15
	i32 61, ; 16
	i32 14, ; 17
	i32 118, ; 18
	i32 97, ; 19
	i32 34, ; 20
	i32 26, ; 21
	i32 83, ; 22
	i32 60, ; 23
	i32 113, ; 24
	i32 123, ; 25
	i32 102, ; 26
	i32 13, ; 27
	i32 7, ; 28
	i32 43, ; 29
	i32 40, ; 30
	i32 21, ; 31
	i32 58, ; 32
	i32 19, ; 33
	i32 80, ; 34
	i32 1, ; 35
	i32 120, ; 36
	i32 16, ; 37
	i32 4, ; 38
	i32 110, ; 39
	i32 100, ; 40
	i32 94, ; 41
	i32 25, ; 42
	i32 42, ; 43
	i32 88, ; 44
	i32 103, ; 45
	i32 93, ; 46
	i32 84, ; 47
	i32 28, ; 48
	i32 49, ; 49
	i32 61, ; 50
	i32 122, ; 51
	i32 83, ; 52
	i32 71, ; 53
	i32 92, ; 54
	i32 39, ; 55
	i32 3, ; 56
	i32 51, ; 57
	i32 91, ; 58
	i32 95, ; 59
	i32 63, ; 60
	i32 85, ; 61
	i32 76, ; 62
	i32 123, ; 63
	i32 16, ; 64
	i32 22, ; 65
	i32 68, ; 66
	i32 20, ; 67
	i32 35, ; 68
	i32 18, ; 69
	i32 2, ; 70
	i32 59, ; 71
	i32 96, ; 72
	i32 32, ; 73
	i32 71, ; 74
	i32 55, ; 75
	i32 112, ; 76
	i32 0, ; 77
	i32 6, ; 78
	i32 94, ; 79
	i32 52, ; 80
	i32 43, ; 81
	i32 93, ; 82
	i32 10, ; 83
	i32 5, ; 84
	i32 117, ; 85
	i32 25, ; 86
	i32 65, ; 87
	i32 74, ; 88
	i32 57, ; 89
	i32 98, ; 90
	i32 117, ; 91
	i32 114, ; 92
	i32 75, ; 93
	i32 99, ; 94
	i32 115, ; 95
	i32 53, ; 96
	i32 23, ; 97
	i32 1, ; 98
	i32 90, ; 99
	i32 72, ; 100
	i32 40, ; 101
	i32 126, ; 102
	i32 17, ; 103
	i32 60, ; 104
	i32 9, ; 105
	i32 65, ; 106
	i32 76, ; 107
	i32 75, ; 108
	i32 69, ; 109
	i32 116, ; 110
	i32 112, ; 111
	i32 41, ; 112
	i32 29, ; 113
	i32 26, ; 114
	i32 95, ; 115
	i32 108, ; 116
	i32 8, ; 117
	i32 81, ; 118
	i32 104, ; 119
	i32 36, ; 120
	i32 5, ; 121
	i32 63, ; 122
	i32 78, ; 123
	i32 0, ; 124
	i32 105, ; 125
	i32 62, ; 126
	i32 4, ; 127
	i32 90, ; 128
	i32 114, ; 129
	i32 101, ; 130
	i32 87, ; 131
	i32 82, ; 132
	i32 46, ; 133
	i32 12, ; 134
	i32 42, ; 135
	i32 41, ; 136
	i32 102, ; 137
	i32 77, ; 138
	i32 98, ; 139
	i32 14, ; 140
	i32 37, ; 141
	i32 8, ; 142
	i32 70, ; 143
	i32 18, ; 144
	i32 124, ; 145
	i32 99, ; 146
	i32 121, ; 147
	i32 36, ; 148
	i32 13, ; 149
	i32 10, ; 150
	i32 87, ; 151
	i32 125, ; 152
	i32 78, ; 153
	i32 44, ; 154
	i32 107, ; 155
	i32 11, ; 156
	i32 79, ; 157
	i32 116, ; 158
	i32 20, ; 159
	i32 77, ; 160
	i32 105, ; 161
	i32 57, ; 162
	i32 15, ; 163
	i32 110, ; 164
	i32 122, ; 165
	i32 91, ; 166
	i32 88, ; 167
	i32 111, ; 168
	i32 50, ; 169
	i32 52, ; 170
	i32 21, ; 171
	i32 45, ; 172
	i32 46, ; 173
	i32 73, ; 174
	i32 27, ; 175
	i32 48, ; 176
	i32 6, ; 177
	i32 55, ; 178
	i32 19, ; 179
	i32 73, ; 180
	i32 47, ; 181
	i32 124, ; 182
	i32 74, ; 183
	i32 101, ; 184
	i32 86, ; 185
	i32 59, ; 186
	i32 34, ; 187
	i32 66, ; 188
	i32 126, ; 189
	i32 84, ; 190
	i32 12, ; 191
	i32 108, ; 192
	i32 67, ; 193
	i32 119, ; 194
	i32 53, ; 195
	i32 7, ; 196
	i32 100, ; 197
	i32 58, ; 198
	i32 68, ; 199
	i32 24, ; 200
	i32 56, ; 201
	i32 125, ; 202
	i32 70, ; 203
	i32 3, ; 204
	i32 38, ; 205
	i32 11, ; 206
	i32 85, ; 207
	i32 127, ; 208
	i32 24, ; 209
	i32 23, ; 210
	i32 120, ; 211
	i32 31, ; 212
	i32 96, ; 213
	i32 62, ; 214
	i32 28, ; 215
	i32 67, ; 216
	i32 37, ; 217
	i32 127, ; 218
	i32 33, ; 219
	i32 66, ; 220
	i32 89, ; 221
	i32 54, ; 222
	i32 81, ; 223
	i32 82, ; 224
	i32 115, ; 225
	i32 39, ; 226
	i32 109, ; 227
	i32 32, ; 228
	i32 80, ; 229
	i32 56, ; 230
	i32 121, ; 231
	i32 69, ; 232
	i32 51, ; 233
	i32 27, ; 234
	i32 9, ; 235
	i32 97, ; 236
	i32 45, ; 237
	i32 106, ; 238
	i32 104, ; 239
	i32 119, ; 240
	i32 47, ; 241
	i32 92, ; 242
	i32 103, ; 243
	i32 22, ; 244
	i32 17, ; 245
	i32 38, ; 246
	i32 106, ; 247
	i32 29, ; 248
	i32 113, ; 249
	i32 64, ; 250
	i32 89, ; 251
	i32 44, ; 252
	i32 35, ; 253
	i32 111, ; 254
	i32 64 ; 255
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
