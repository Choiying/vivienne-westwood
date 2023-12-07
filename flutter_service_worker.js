'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "e0a5eb9a1e76002fa9e3545454d66820",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"index.html": "02166f69a262ea9b2be42e8f1c4923f1",
"/": "02166f69a262ea9b2be42e8f1c4923f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "266924085cc670bfb4d77fff9faa17f7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "fd882e21bda406fa0a42a109382bea46",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/NOTICES": "056a333e92dcc4983cce5332400ed722",
"assets/AssetManifest.json": "1d3ccb791dd2d3fa1d509d70434f5b3f",
"assets/AssetManifest.bin.json": "6ac3d90515ab501e3dd4a08de082ae2f",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/VW_WOMAN_AW2324_Xmas_1_v2.jpg": "a54381dfd4cd28f0cbb8cf7f9cd65766",
"assets/assets/images/_2023-12-03_4.30.34.png": "c42b569169a4efc944a3ce0f1a024744",
"assets/assets/images/81040002-K002B-_DARK-BLUE_2_large.jpg": "eec541821fd087f0a238e4719455a8c1",
"assets/assets/images/52020003-W00BX-PF_BURGUNDY_2_large.jpeg": "7ed36d1c88aba09c7612b3e96008ea5b",
"assets/assets/images/8201006MU-L004F-LA_BLACK-_2_large.jpg": "91e8f68a7f2f24b2945c3202437a241f",
"assets/assets/images/StorySoFar_1.jpg": "ff0b411c26277ebea5ca593b66369089",
"assets/assets/images/4302002IU-W00BX-PF_BURGUNDY_1_large.jpg": "afec0fda2b699d4836393b622bc04cce",
"assets/assets/images/Vivienne-Westwood-Logo.jpg": "1ab1f20772b801e85a8e55260d3fad29",
"assets/assets/images/63020096-02R001-CN_GOLD_0_large.jpeg": "12f3857515c4ab1b5e0fcf0834c58307",
"assets/assets/images/6103007T-02P391-IM_PLATINUM-BLACK-OFF-WHITE-GREEN-RED_1_large.jpg": "d8f8922b92f5b1e2e3dbc6cfbcf4cd8d",
"assets/assets/images/53020084U-W001Y-LA_BLACK_2_large.jpg": "4597b43871d388dd540ef75175346bfa",
"assets/assets/images/8201006MU-L004F-LA_BLACK-_1_large.jpg": "1267f05d692d1a3f20d35e471c76ac75",
"assets/assets/images/8103014S-W00Q8-BG_RED_2_large_(1).jpg": "041775240a0224359497992b1a913053",
"assets/assets/images/VW_2023_Xmas_New_Arrivals_BAGS.jpg": "679a25050e7d7bda294e55ba0ceec401",
"assets/assets/images/_2023-12-03_4.54.28.png": "07e4eb399c1e4e270744da0a2192a0de",
"assets/assets/images/1504000A-J006L-_FOLKLORE-FLOWER_1_large.jpg": "ad8bb8dcba508029d3a88ae5b65db361",
"assets/assets/images/8103014S-W00Q8-BG_RED_1_large_(1).jpg": "d3d923009f818a33d11f8534beec77a0",
"assets/assets/images/62020034-02P128-CN_PLATINUM-PEARL-MULTI_2_large.jpg": "b05fe08845c6b5cf8c4e16436a368e30",
"assets/assets/images/52020003-W00BX-PF_BURGUNDY_1_large.jpeg": "55e71f1173717f1bc1fadc559251a67d",
"assets/assets/images/VW_AW2324_Xmas_Gifts_for_her.jpg": "2b643056481854c464b49b545ff5443f",
"assets/assets/images/53020084U-W001Y-LA_BLACK_1_large.jpg": "d2c841514a44afb421d85d9b0e931c25",
"assets/assets/images/VW_AW2324_Xmas_Gifts_for_him.jpg": "2f66a6388b1660cede08d8df9c9c1c44",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/24010005-W009Q-BS_WHITE-_2_large.jpg": "a8bad7af20f888029e15705bee47d838",
"assets/assets/images/74050002W-L0039-_black_2_large.jpg": "9478bdbd062fdacadc8f98c936592b97",
"assets/assets/images/VW_New_Arrivals_AW2324_Xmas_WOMAN.jpg": "828ff71e757f735950d269ab12183b44",
"assets/assets/images/VW_New_Arrivals_AW2324_Xmas_JEWELLERY.jpg": "8bf15e5aa3bfc85e36f9265683e7b1a6",
"assets/assets/images/1K01000Z-W00RP-_COMBAT-TARTAN_1_large.jpg": "02a90abcccb5b4346d8285eb2761d854",
"assets/assets/images/_2023-12-03_5.45.38.png": "71b46ca9f578dbd51f8d5230fdb02fd6",
"assets/assets/images/_2023-12-03_5.31.07.png": "ff4fbeccad0c7a632fe08e30bb9abcff",
"assets/assets/images/VW_AW2324_Xmas_Stocking_Fillers.jpg": "d79da6c6cb0930bc213c47013e304ccb",
"assets/assets/images/2F01000Q-W00F3-LR_BLACK-STRIPE_1_large_(1).jpg": "1ce2f8ddeb3aee2e81bdf18e4517879e",
"assets/assets/images/52020003U-N0007-PF_SILVER-MULTI-ORB_1_large.jpg": "0d4152a987096652d68841ec7a2cf504",
"assets/assets/images/_2023-12-03_2.32.35.png": "77cdf1161576d30f9b6829d63c71b008",
"assets/assets/images/81040002-K002B-_DARK-BLUE_1_large.jpg": "7fcb15d4983a028adc0b8c8709921ea1",
"assets/assets/images/1101035F-W00PL-SW_chilli-red_1_large.jpg": "55494622c8ab80b7adb1bdfd020a6e85",
"assets/assets/images/1101035F-W00PL-SW_chilli-red_2_large.jpg": "71aadac7711f3cb985358429508efe0d",
"assets/assets/images/VW_AW2324_Cat_Xmas_Clothing.jpg": "785af939ad18f9b16104a334db0856a0",
"assets/assets/images/74050002W-L0039-_black_1_large.jpg": "2b96255ec1d80bbd397dd55ca592edfb",
"assets/assets/images/1F010008-W00LI-SI_NAVY_2_large.jpg": "780e4a7bd06f83fa6ac38e85a959917a",
"assets/assets/images/VW_AW2324_Xmas_Festive_Edit.jpg": "8c9cda22b735d584e6230e9fc20e2790",
"assets/assets/images/1101034V-W00F6-SW_black_1_large.jpg": "344922a8c4cddd4c68f7ca700c8d5709",
"assets/assets/images/1F010008-W00LI-SI_NAVY_1_large.jpg": "d2da900ba44815658ad984534af75690",
"assets/assets/images/52020003U-N0007-PF_SILVER-MULTI-ORB_2_large.jpg": "8cfa0d4f97021ebed1fb4c1d11db1749",
"assets/assets/images/62020034-02P128-CN_PLATINUM-PEARL-MULTI_0_large.jpg": "eaeade511379547fb3924359795d3f19",
"assets/assets/images/_2023-12-06_10.16.00.png": "ed139780b0b245bccf4093bcb74e0df9",
"assets/assets/images/vivienne-westwood-with-symbol5824.logowik.com.webp": "bfbd0aa11676c5b9ee5989268a13a39d",
"assets/assets/images/24010005-W009Q-BS_WHITE-_1_large.jpg": "f72a3c092b625b559714fee4eba7f46c",
"assets/assets/images/_2023-12-03_2.43.22.png": "24c5d11369fccf6fe06551dedbf1bdd7",
"assets/assets/images/2F01000Q-W00F3-LR_BLACK-STRIPE_2_large_(1).jpg": "1c6a420fb21e286e967672fb846d5b48",
"assets/assets/images/1803002V-Y0006-_BLACK_2_large.jpg": "581a3aad12dfda6d29b4dab9a89ef169",
"assets/assets/images/1803002V-Y0006-_BLACK_1_large.jpg": "69c06a63ecc52fece2bfd3f0122f6a17",
"assets/assets/images/63020096-02R001-CN_GOLD_2_large.jpg": "677a8856c3b18cad236b03219fb931a4",
"assets/assets/images/VW_AW2324_Cat_Xmas_Jewellery.jpg": "378202a8dfe7ff17c2cb84ff109e688e",
"assets/assets/images/4302002IU-W00BX-PF_BURGUNDY_2_large.jpeg": "06ee7b20238504dabfd4f01dc37a99a1",
"assets/assets/images/VW_HERO_AW2324_Xmas_01_sm_3_v2.jpg": "f732199483038c456a6520884cdc942d",
"assets/assets/images/VW_GIFTS_AW2324_Xmas_1_v2.jpg": "05516ea2f4de7e07fd9ff8d875724123",
"assets/assets/images/VW_AW2324_Cat_Xmas_Hero_sm.jpg": "23c10fd0482c02079eb9c93ef25a2a93",
"assets/assets/images/VW_MAN_AW2324_Xmas_1_v2.jpg": "dd7c328ef895b6db87023cd9025e4670",
"assets/assets/images/1101034V-W00F6-SW_black_2_large.jpg": "98ce417e7078575254b6fc237c8296f0",
"assets/assets/images/VW_2023_Xmas_New_Arrivals_MAN.jpg": "da75c7eec188695e08994f6a0bdba211",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Raleway-Regular.ttf": "20d41940068e45b114d32b48d684ef39",
"assets/assets/fonts/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/AssetManifest.bin": "87b9cf753c07b3d787774a4aaebab397",
"assets/fonts/MaterialIcons-Regular.otf": "f0b5ff0f8bb6e6928b9b7285df772dae",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"main.dart.js": "08f9200ae64ae432e87a960be27f3e33"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
