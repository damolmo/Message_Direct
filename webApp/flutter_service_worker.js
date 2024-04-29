'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "2f9d7c9d6e724481299fc203fd360569",
"/": "2f9d7c9d6e724481299fc203fd360569",
"main.dart.js": "a58933c066f539d03b90fc0294f313c1",
"version.json": "0abc2681256cb73f22b35b108e5a6966",
"sqlite3.wasm": "f08450f1d5a088a01cec0eb541c3aeca",
"icons/Icon-maskable-512.png": "de494c1cc34fef64cbd717d067fb3151",
"icons/Icon-192.png": "2193b67bbba9ad96fa17b69489a6d829",
"icons/Icon-512.png": "de494c1cc34fef64cbd717d067fb3151",
"icons/Icon-maskable-192.png": "2193b67bbba9ad96fa17b69489a6d829",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "4f6acda94c6c0437a2d413488606e1e6",
"assets/NOTICES": "69917c62b93974d25ceb35cceb5de744",
"assets/AssetManifest.bin": "09a6aa8561866c5a37c4d6c67b56e8fc",
"assets/assets/logo/play_banner.png": "fba39006270d35703c9a05c6cdcfd7cc",
"assets/assets/logo/logo.png": "5ffa02f3494c833d581f1f2dffe952b7",
"assets/assets/logo/app_logo.png": "309b60e3d7d8301209e9b7b4e59e6298",
"assets/assets/flags/fo.png": "2c7d9233582e83a86927e634897a2a90",
"assets/assets/flags/kz.png": "cb3b0095281c9d7e7fb5ce1716ef8ee5",
"assets/assets/flags/td.png": "6d35e9d972e29a722bec54452b3cd990",
"assets/assets/flags/pa.png": "bb2140b5a908502c3eb78e6359883280",
"assets/assets/flags/ba.png": "d415bad33b35de3f095177e8e86cbc82",
"assets/assets/flags/hr.png": "ab77c2f85f850ce120f81c4627138dc3",
"assets/assets/flags/ug.png": "9a0f358b1eb19863e21ae2063fab51c0",
"assets/assets/flags/tk.png": "5da01ab0c6ad17cf2433ca51ace5783b",
"assets/assets/flags/lv.png": "99712c75e89fa90652b83c41fac343db",
"assets/assets/flags/gm.png": "7148d3715527544c2e7d8d6f4a445bb6",
"assets/assets/flags/jm.png": "2414f68d9e1b3b9bd1c70abbf00ce99e",
"assets/assets/flags/gp.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/bg.png": "1d24bc616e3389684ed2c9f18bcb0209",
"assets/assets/flags/pg.png": "0f7e03465a93e0b4e3e1c9d3dd5814a4",
"assets/assets/flags/sr.png": "66c6eb40fe7cbc207fc646bcd1b20b58",
"assets/assets/flags/kp.png": "e1c8bb52f31fca22d3368d8f492d8f27",
"assets/assets/flags/az.png": "6ffa766f6883d2d3d350cdc22a062ca3",
"assets/assets/flags/ss.png": "92652bb6538e87bcaec3f36133d1806b",
"assets/assets/flags/eg.png": "311d780e8e3dd43f87e6070f6feb74c7",
"assets/assets/flags/th.png": "11ce0c9f8c738fd217ea52b9bc29014b",
"assets/assets/flags/pf.png": "2f00cd99d184ffe47c6535a0839c184e",
"assets/assets/flags/bv.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/flags/uz.png": "3adad3bac322220cac8abc1c7cbaacac",
"assets/assets/flags/sj.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/flags/lb.png": "f80cde345f0d9bd0086531808ce5166a",
"assets/assets/flags/tc.png": "d728d6763c17c520ad6bcf3c24282a29",
"assets/assets/flags/aw.png": "a93ddf8e32d246dc47f6631f38e0ed92",
"assets/assets/flags/et.png": "57edff61c7fddf2761a19948acef1498",
"assets/assets/flags/gs.png": "419dd57836797a3f1bf6258ea6589f9a",
"assets/assets/flags/fi.png": "3ccd69a842e55183415b7ea2c04b15c8",
"assets/assets/flags/mv.png": "d9245f74e34d5c054413ace4b86b4f16",
"assets/assets/flags/sy.png": "08d6ab96719ea1231c0925fdb1652216",
"assets/assets/flags/me.png": "590284bc85810635ace30a173e615ca4",
"assets/assets/flags/nz.png": "65c811e96eb6c9da65538f899c110895",
"assets/assets/flags/gb-sct.png": "497ce8cd3b0a58ef647b66dc060c37f3",
"assets/assets/flags/se.png": "25dd5434891ac1ca2ad1af59cda70f80",
"assets/assets/flags/ws.png": "f206322f3e22f175869869dbfadb6ce8",
"assets/assets/flags/br.png": "5093e0cd8fd3c094664cd17ea8a36fd1",
"assets/assets/flags/sh.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/flags/ro.png": "85af99741fe20664d9a7112cfd8d9722",
"assets/assets/flags/lt.png": "ab515ec4ccdb894c136b21d1fc9a0e8c",
"assets/assets/flags/af.png": "ba710b50a060b5351381b55366396c30",
"assets/assets/flags/bd.png": "86a0e4bd8787dc8542137a407e0f987f",
"assets/assets/flags/ax.png": "48e3d10da408d18b6b79d6faf72428ff",
"assets/assets/flags/bo.png": "3ccf6fa7f9cbc27949b8418925e4e89c",
"assets/assets/flags/ai.png": "ce5e91ed1725f0499b9231b69a7fd448",
"assets/assets/flags/in.png": "d0f6ff1ca8b3e945f5978c44b32b6cf1",
"assets/assets/flags/fj.png": "1c6a86752578eb132390febf12789cd6",
"assets/assets/flags/by.png": "69be51a4aa792fab712bd1d5739476c6",
"assets/assets/flags/cz.png": "73ecd64c6144786c4d03729b1dd9b1f3",
"assets/assets/flags/gu.png": "2acb614b442e55864411b6e418df6eab",
"assets/assets/flags/is.png": "f546c8f9316fc2010d92a1e8dbdc8fd4",
"assets/assets/flags/be.png": "7e5e1831cdd91935b38415479a7110eb",
"assets/assets/flags/bi.png": "adda8121501f0543f1075244a1acc275",
"assets/assets/flags/sk.png": "1685313d27bd1a210edfd280f13ae881",
"assets/assets/flags/um.png": "8fe7c4fed0a065fdfb9bd3125c6ecaa1",
"assets/assets/flags/tv.png": "c57025ed7ae482210f29b9da86b0d211",
"assets/assets/flags/hm.png": "72be14316f0af3903cdca7a726c0c589",
"assets/assets/flags/bt.png": "3cfe1440e952bc7266d71f7f1454fa23",
"assets/assets/flags/pn.png": "0b0641b356af4c3e3489192ff4b0be77",
"assets/assets/flags/fr.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/hn.png": "0582914a18ec9cfeaf672f00433d817e",
"assets/assets/flags/im.png": "52314fd7ac783912ce7d322ebe4db8b3",
"assets/assets/flags/ga.png": "b0e5b2fa1b7106c7652a955db24c11c4",
"assets/assets/flags/kh.png": "d48d51e8769a26930da6edfc15de97fe",
"assets/assets/flags/fk.png": "da8b0fe48829aae2c8feb4839895de63",
"assets/assets/flags/tj.png": "c73b793f2acd262e71b9236e64c77636",
"assets/assets/flags/ms.png": "9c955a926cf7d57fccb450a97192afa7",
"assets/assets/flags/mq.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/mo.png": "849848a26bbfc87024017418ad7a6233",
"assets/assets/flags/gb-eng.png": "0d9f2a6775fd52b79e1d78eb1dda10cf",
"assets/assets/flags/gr.png": "ec11281d7decbf07b81a23a72a609b59",
"assets/assets/flags/io.png": "ab226831d6901b67aba33a79e733ff87",
"assets/assets/flags/kg.png": "9572be69d94d41346647b9c07b30d721",
"assets/assets/flags/dm.png": "8886b222ed9ccd00f67e8bcf86dadcc2",
"assets/assets/flags/jo.png": "c01cb41f74f9db0cf07ba20f0af83011",
"assets/assets/flags/st.png": "fef62c31713ff1063da2564df3f43eea",
"assets/assets/flags/eh.png": "515a9cf2620c802e305b5412ac81aed2",
"assets/assets/flags/bw.png": "4e223201bbbac6d01f5f644eb00231e7",
"assets/assets/flags/sx.png": "9c19254973d8acf81581ad95b408c7e6",
"assets/assets/flags/ci.png": "7f5ca3779d5ff6ce0c803a6efa0d2da7",
"assets/assets/flags/mg.png": "0ef6271ad284ebc0069ff0aeb5a3ad1e",
"assets/assets/flags/lk.png": "b70a269974449870ca07a624a7ada832",
"assets/assets/flags/tn.png": "6612e9fec4bef022cbd45cbb7c02b2b6",
"assets/assets/flags/cl.png": "6735e0e2d88c119e9ed1533be5249ef1",
"assets/assets/flags/iq.png": "bc3e6f68c5188dbf99b473e2bea066f2",
"assets/assets/flags/gb.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/flags/aq.png": "0c586e7b91aa192758fdd0f03adb84d8",
"assets/assets/flags/si.png": "da453c534e1a374176a56ab0a755ae51",
"assets/assets/flags/do.png": "ed35983a9263bb5713be37d9a52caddc",
"assets/assets/flags/to.png": "1cdd716b5b5502f85d6161dac6ee6c5b",
"assets/assets/flags/tz.png": "56ec99c7e0f68b88a2210620d873683a",
"assets/assets/flags/rw.png": "d1aae0647a5b1ab977ae43ab894ce2c3",
"assets/assets/flags/ml.png": "0c50dfd539e87bb4313da0d4556e2d13",
"assets/assets/flags/tw.png": "0457d069077e07de39913e00fdcea271",
"assets/assets/flags/ee.png": "d00e16b53763c7ce8a42dd02fa411fb8",
"assets/assets/flags/cr.png": "bfd8b41e63fc3cc829c72c4b2e170532",
"assets/assets/flags/km.png": "5554c8746c16d4f482986fb78ffd9b36",
"assets/assets/flags/li.png": "ecdf7b3fe932378b110851674335d9ab",
"assets/assets/flags/cn.png": "4c9a123fedb85d9e86cdcdc7447e1b0e",
"assets/assets/flags/ca.png": "76f2fac1d3b2cc52ba6695c2e2941632",
"assets/assets/flags/ru.png": "5ea1e5949eb325e6fdf00160159e0b8c",
"assets/assets/flags/dk.png": "abcd01bdbcc02b4a29cbac237f29cd1d",
"assets/assets/flags/ve.png": "893391d65cbd10ca787a73578c77d3a7",
"assets/assets/flags/tl.png": "ca6f376172bf3c3fbf3bd5e8de27ce39",
"assets/assets/flags/tf.png": "b2c044b86509e7960b5ba66b094ea285",
"assets/assets/flags/mn.png": "ff2a285bdf836a1ff6f35f78b6ffbb3c",
"assets/assets/flags/as.png": "d9c1da515c6f945c2e2554592a9dfaae",
"assets/assets/flags/bn.png": "ed650de06fff61ff27ec92a872197948",
"assets/assets/flags/bm.png": "b366ba84cbc8286c830f392bb9086be5",
"assets/assets/flags/mc.png": "90c2ad7f144d73d4650cbea9dd621275",
"assets/assets/flags/vc.png": "c61e50116177358d9ecb09c47c4b194a",
"assets/assets/flags/nu.png": "f4169998548e312584c67873e0d9352d",
"assets/assets/flags/zw.png": "d6486e2bf0b8c3a4a1ded4156574f16c",
"assets/assets/flags/mu.png": "c5228d1e94501d846b5bf203f038ae49",
"assets/assets/flags/vg.png": "fc095e11f5b58604d6f4d3c2b43d167f",
"assets/assets/flags/ng.png": "aedbe364bd1543832e88e64b5817e877",
"assets/assets/flags/ma.png": "a08e705105c4bedbb77d887dce1a72c9",
"assets/assets/flags/nr.png": "1316f3a8a419d8be1975912c712535ea",
"assets/assets/flags/cf.png": "cd2b286d2eae150a5aa33743ab264461",
"assets/assets/flags/na.png": "cdc00e9267a873609b0abea944939ff7",
"assets/assets/flags/pl.png": "f20e9ef473a9ed24176f5ad74dd0d50a",
"assets/assets/flags/cv.png": "9b1f31f9fc0795d728328dedd33eb1c0",
"assets/assets/flags/ph.png": "e4025d1395a8455f1ba038597a95228c",
"assets/assets/flags/yt.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/ge.png": "6fbd41f07921fa415347ebf6dff5b0f7",
"assets/assets/flags/ir.png": "37f67c3141e9843196cb94815be7bd37",
"assets/assets/flags/lc.png": "8c1a03a592aa0a99fcaf2b81508a87eb",
"assets/assets/flags/jp.png": "25ac778acd990bedcfdc02a9b4570045",
"assets/assets/flags/mf.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/vi.png": "3f317c56f31971b3179abd4e03847036",
"assets/assets/flags/mp.png": "629e3c5f0df92bb664c9ef71e0b5a4a3",
"assets/assets/flags/sm.png": "8e1e356080c68882f13b557439db7e61",
"assets/assets/flags/ae.png": "fc01978928642b0904d3fa1b8ed0b41e",
"assets/assets/flags/mr.png": "ec08a3fc510204bc6d741d16452c3ac5",
"assets/assets/flags/gq.png": "4286e56f388a37f64b21eb56550c06d9",
"assets/assets/flags/eu.png": "c58ece3931acb87faadc5b940d4f7755",
"assets/assets/flags/ly.png": "8d65057351859065d64b4c118ff9e30e",
"assets/assets/flags/cc.png": "31a475216e12fef447382c97b42876ce",
"assets/assets/flags/uy.png": "d465e7a0c51c63aef606e144d2432f20",
"assets/assets/flags/qa.png": "eb9b3388e554cf85aea1e739247548df",
"assets/assets/flags/pr.png": "f1e1648178c221dd9a9739a28009840e",
"assets/assets/flags/je.png": "288f8dca26098e83ff0455b08cceca1b",
"assets/assets/flags/mw.png": "ffc1f18eeedc1dfbb1080aa985ce7d05",
"assets/assets/flags/pm.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/am.png": "aaa39141fbc80205bebaa0200b55a13a",
"assets/assets/flags/kr.png": "a3b7da3b76b20a70e9cd63cc2315b51b",
"assets/assets/flags/bj.png": "6fdc6449f73d23ad3f07060f92db4423",
"assets/assets/flags/bq.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/flags/ec.png": "c1ae60d080be91f3be31e92e0a2d9555",
"assets/assets/flags/cx.png": "8efa3231c8a3900a78f2b51d829f8c52",
"assets/assets/flags/kn.png": "f318e2fd87e5fd2cabefe9ff252bba46",
"assets/assets/flags/bs.png": "fe732c75505c38f30594b74c43b02633",
"assets/assets/flags/cm.png": "42d52fa71e8b4dbb182ff431749e8d0d",
"assets/assets/flags/tr.png": "27feab1a5ca390610d07e0c6bd4720d5",
"assets/assets/flags/pt.png": "f7c1cc53dbe403ad2b6a21069f2afe8b",
"assets/assets/flags/pw.png": "0e7f32166da73c57187d7fc88961d8d2",
"assets/assets/flags/mx.png": "84b12a569b209e213daccfcbdd1fc799",
"assets/assets/flags/zm.png": "81cec35b715f227328cad8f314acd797",
"assets/assets/flags/cu.png": "f41715bd51f63a9aebf543788543b4c4",
"assets/assets/flags/ie.png": "7861ac704bc87a0a177e9656857eeb15",
"assets/assets/flags/ua.png": "b7df7f812d0109eb09b7c4f836876262",
"assets/assets/flags/za.png": "b28280c6c3eb4624c18b5455d4a1b1ff",
"assets/assets/flags/sc.png": "e969fd5afb1eb5902675b6bcf49a8c2e",
"assets/assets/flags/gg.png": "eed435d25bd755aa7f9cd7004b9ed49d",
"assets/assets/flags/my.png": "204f43310ca121ae267c8b0d5a16ea46",
"assets/assets/flags/gt.png": "706a0c3b5e0b589c843e2539e813839e",
"assets/assets/flags/re.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/lr.png": "b92c75e18dd97349c75d6a43bd17ee94",
"assets/assets/flags/bl.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/hu.png": "df87d805f90359074924a03d8a56955b",
"assets/assets/flags/ps.png": "52a25a48658ca9274830ffa124a8c1db",
"assets/assets/flags/dz.png": "132ceca353a95c8214676b2e94ecd40f",
"assets/assets/flags/fm.png": "d571b8bc4b80980a81a5edbde788b6d2",
"assets/assets/flags/pk.png": "7a6a621f7062589677b3296ca16c6718",
"assets/assets/flags/gy.png": "159a260bf0217128ea7475ba5b272b6a",
"assets/assets/flags/la.png": "e8cd9c3ee6e134adcbe3e986e1974e4a",
"assets/assets/flags/mt.png": "b20145b26552e6457ef94a6ac93043e9",
"assets/assets/flags/cd.png": "5b5f832ed6cd9f9240cb31229d8763dc",
"assets/assets/flags/co.png": "e3b1be16dcdae6cb72e9c238fdddce3c",
"assets/assets/flags/np.png": "6e099fb1e063930bdd00e8df5cef73d4",
"assets/assets/flags/ls.png": "2bca756f9313957347404557acb532b0",
"assets/assets/flags/md.png": "e8a0147ceb71bd458704e446958b275b",
"assets/assets/flags/es.png": "654965f9722f6706586476fb2f5d30dd",
"assets/assets/flags/sz.png": "d1829842e45c2b2b29222c1b7e201591",
"assets/assets/flags/va.png": "c010bf145f695d5c8fb551bafc081f77",
"assets/assets/flags/sg.png": "bc772e50b8c79f08f3c2189f5d8ce491",
"assets/assets/flags/sd.png": "65ce270762dfc87475ea99bd18f79025",
"assets/assets/flags/ag.png": "41c11d5668c93ba6e452f811defdbb24",
"assets/assets/flags/tg.png": "7f91f02b26b74899ff882868bd611714",
"assets/assets/flags/kw.png": "3ca448e219d0df506fb2efd5b91be092",
"assets/assets/flags/cy.png": "7b36f4af86257a3f15f5a5a16f4a2fcd",
"assets/assets/flags/gf.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/bb.png": "a8473747387e4e7a8450c499529f1c93",
"assets/assets/flags/ke.png": "cf5aae3699d3cacb39db9803edae172b",
"assets/assets/flags/gb-wls.png": "d7d7c77c72cd425d993bdc50720f4d04",
"assets/assets/flags/gd.png": "7a4864ccfa2a0564041c2d1f8a13a8c9",
"assets/assets/flags/nl.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/flags/sn.png": "68eaa89bbc83b3f356e1ba2096b09b3c",
"assets/assets/flags/mm.png": "32e5293d6029d8294c7dfc3c3835c222",
"assets/assets/flags/au.png": "72be14316f0af3903cdca7a726c0c589",
"assets/assets/flags/ky.png": "d7b4a69dc210a6375a44826fdda80434",
"assets/assets/flags/tt.png": "a8e1fc5c65dc8bc362a9453fadf9c4b3",
"assets/assets/flags/bz.png": "be51262dcb7f7c05f4ded261340af150",
"assets/assets/flags/gn.png": "b2287c03c88a72d968aa796a076ba056",
"assets/assets/flags/sb.png": "296ecedbd8d1c2a6422c3ba8e5cd54bd",
"assets/assets/flags/at.png": "570c070177a5ea0fe03e20107ebf5283",
"assets/assets/flags/gb-nir.png": "98773db151c150cabe845183241bfe6b",
"assets/assets/flags/ht.png": "4bbbd098423d282807f73c9529fe39a6",
"assets/assets/flags/gw.png": "05606b9a6393971bd87718b809e054f9",
"assets/assets/flags/cw.png": "6c598eb0d331d6b238da57055ec00d33",
"assets/assets/flags/sv.png": "217b691efbef7a0f48cdd53e91997f0e",
"assets/assets/flags/id.png": "a0232ab265d5aae4774ac90a9df79328",
"assets/assets/flags/mk.png": "6b3213bccb9864b2777d5dd6217d5964",
"assets/assets/flags/gl.png": "b79e24ee1889b7446ba3d65564b86810",
"assets/assets/flags/ar.png": "3bd245f8c28f70c9ef9626dae27adc65",
"assets/assets/flags/ne.png": "a20724c177e86d6a27143aa9c9664a6f",
"assets/assets/flags/us.png": "83b065848d14d33c0d10a13e01862f34",
"assets/assets/flags/py.png": "5a9868d3f5c5f8be641252fdb41150e7",
"assets/assets/flags/pe.png": "4d9249aab70a26fadabb14380b3b55d2",
"assets/assets/flags/ki.png": "14db0fc29398730064503907bd696176",
"assets/assets/flags/nf.png": "1c2069b299ce3660a2a95ec574dfde25",
"assets/assets/flags/il.png": "1e06ad7783f24332405d36561024cc4c",
"assets/assets/flags/sa.png": "bf181e09111f39bcfd9dd9d7adeab3d7",
"assets/assets/flags/de.png": "5d9561246523cf6183928756fd605e25",
"assets/assets/flags/no.png": "33bc70259c4908b7b9adeef9436f7a9f",
"assets/assets/flags/sl.png": "2efdc34361931814ddfa5fa33c968312",
"assets/assets/flags/wf.png": "6f1644b8f907d197c0ff7ed2f366ad64",
"assets/assets/flags/rs.png": "19d22d6f6f8ad35da02c9437075a1fda",
"assets/assets/flags/dj.png": "078bd37d41f746c3cb2d84c1e9611c55",
"assets/assets/flags/mz.png": "1ab1ac750fbbb453d33e9f25850ac2a0",
"assets/assets/flags/nc.png": "ef83fdb137c8467dc2e2b879fd192d57",
"assets/assets/flags/lu.png": "72eb0fe6bb97a59f97f1e30d273c4131",
"assets/assets/flags/vn.png": "32ff65ccbf31a707a195be2a5141a89b",
"assets/assets/flags/mh.png": "112b630ee584e74fca0f756f843bf9d5",
"assets/assets/flags/ch.png": "a59f128eba5538288d04888283c65f6e",
"assets/assets/flags/it.png": "302954e632261d7f5b8f13e9181a8505",
"assets/assets/flags/ao.png": "5f0a372aa3aa7150a3dafea97acfc10d",
"assets/assets/flags/ni.png": "e398dc23e79d9ccd702546cc25f126bf",
"assets/assets/flags/vu.png": "3f201fdfb6d669a64c35c20a801016d1",
"assets/assets/flags/hk.png": "72d3d1e95daa8fbc3988389d43cf840b",
"assets/assets/flags/tm.png": "523bda0442cdbe873f831429925157ff",
"assets/assets/flags/ye.png": "4cf73209d90e9f02ead1565c8fdf59e5",
"assets/assets/flags/al.png": "722cf9e5c7a1d9c9e4608fb44dbb427d",
"assets/assets/flags/gh.png": "b35464dca793fa33e51bf890b5f3d92b",
"assets/assets/flags/so.png": "1ce20d052f9d057250be96f42647513b",
"assets/assets/flags/xk.png": "079259fbcb1f3c78dafa944464295c16",
"assets/assets/flags/gi.png": "446aa44aaa063d240adab88243b460d3",
"assets/assets/flags/er.png": "8ca78e10878a2e97c1371b38c5d258a7",
"assets/assets/flags/bh.png": "a1acd86ef0e19ea5f0297bbe1de6cfd4",
"assets/assets/flags/om.png": "978e5be1e8156c3b80b6167b14cc14b8",
"assets/assets/flags/cg.png": "eca97338cc1cb5b5e91bec72af57b3d4",
"assets/assets/flags/ck.png": "39f343868a8dc8ca95d27b27a5caf480",
"assets/assets/flags/bf.png": "63f1c67fca7ce8b52b3418a90af6ad37",
"assets/assets/flags/ad.png": "384e9845debe9aca8f8586d9bedcb7e6",
"assets/fonts/MaterialIcons-Regular.otf": "98b4a85fe7f8e6db71880da4e39f05d9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.json": "17bed7867b252814a8659a1aebec9d8e",
"sqflite_sw.js": "8d894780f6ae7c7da7ae1e259e6d240d",
"favicon.png": "aaf073fd13b5796bd06e32935b99e3bf",
"manifest.json": "c890c081e4235ab1df6ad38df62d883e",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
