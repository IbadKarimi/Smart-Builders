'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "f6c2204dea00db2116cfc89ebe148deb",
"assets/DropMessageImages/1.jpg": "5167eb547ceb924a04d2dbbba680730d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FooterImages/Contractor.jpg": "41918a0f8e27529011b174ab54f37a97",
"assets/FooterImages/CostEstimation.jpg": "9bd8d401153708748b9ab1af162fee51",
"assets/FooterImages/MaterialSourcing.jpg": "d88a3088e91d948f6a682c37b57eacdd",
"assets/FooterImages/PreConstruction.jpg": "98264ea090a977782d706750ac486875",
"assets/FooterImages/ProjectTracking.jpg": "a2206af279c0ca482730de84c5511e6e",
"assets/FooterImages/SubContractor.jpg": "83ffff6bb68a791e4a47fcf2aa64412e",
"assets/FooterQuestionLogo/Contact.png": "5a8f25aed0382ae189c097434e810b7f",
"assets/FooterQuestionLogo/Location.png": "6c3256e3ecd7a555febfc8aabd62c7d5",
"assets/FooterQuestionLogo/Mail.png": "6c02d97c2085823d0ed492e7cc7f02e2",
"assets/GoogleLogo/Google.png": "3e26049d9396f49912688a986b4027b8",
"assets/HiringWorkersImages/HiringArcitect.jpg": "4932cd368054c7f0990e1bf2e1bf5316",
"assets/HiringWorkersImages/HiringCivilEngineer.jpg": "3dd3e8bff414db16eb7613fd99818795",
"assets/HiringWorkersImages/HiringContractors.jpeg": "d193e6a6753850f51cfa9fb1eaed7cc6",
"assets/HiringWorkersImages/HiringSubContractors.jpg": "62bd4eaaca27c2a94659943a5d9bc8fa",
"assets/HomeImages/Architect.png": "395d0663a38d87632f0fc22aabf96959",
"assets/HomeImages/BuildDream.jpeg": "67d10a53ff489f0291e878638a04a4e7",
"assets/HomeImages/CivilEngineer.png": "ad05f1472ffea7c07e12585dd3e492a0",
"assets/HomeImages/CompleteProjects.png": "58faff125d57038f46d6a745ad170278",
"assets/HomeImages/ConstructionHouse.jpg": "f83833af845eabf95437b949cac05096",
"assets/HomeImages/Contractor.png": "51bba3e237bbd9a51dd0f861bf22af53",
"assets/HomeImages/CostEstimation.png": "a7d52537c3620135280fccfaa534edf4",
"assets/HomeImages/Engineers.png": "395d0663a38d87632f0fc22aabf96959",
"assets/HomeImages/HappyClient.png": "51bba3e237bbd9a51dd0f861bf22af53",
"assets/HomeImages/HP1Pic.jpeg": "2817e554df9c0e48f3a73e4af1a82a2f",
"assets/HomeImages/HP3Pic.jpg": "83c0bf79878adf13f7bb36b108d50e1a",
"assets/HomeImages/MaterialSourcing.png": "968b135a4dcd66e1869f2e6f3d70a7ba",
"assets/HomeImages/planing.png": "d8adc3f33b2e8cfcb5352b599697f2bc",
"assets/HomeImages/ProjectTracking.png": "78050b8c171f1b8a7eafad79417a410e",
"assets/HomeImages/ServiceProvider.jpeg": "b613c21415dfa7a1d20a5b4a1ceac23e",
"assets/HomeImages/ServiceProvider1.jpg": "536f66e4daa6a80c4a491268388eda1a",
"assets/HomeImages/Staff.png": "51bba3e237bbd9a51dd0f861bf22af53",
"assets/HomeImages/Sub-Contractor.png": "51bba3e237bbd9a51dd0f861bf22af53",
"assets/lib/Presentation%2520Layer/Screens/HomePage/Blogs/BlogImages/Blogs1.jpg": "30e34921955f61ee4bc086189965ac76",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Bricks.jpg": "03274eccb1b0514fed1a15e93b0d69f6",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Cement.jpg": "4feb92c9e9ab96a1b45ea907992d8c1f",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Materials.jpg": "d590c445ead0ba008020c182c5b017ee",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Sand.jpg": "01dd37251574e63050c4499dd329e191",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialRateList/MaterialRateListImages/Steel.jpg": "3890efcb62fda9c8c1950f79ef389605",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialStores/MaterialStoresImages/Map.jpg": "da5bf6f85c0b07567e8c94bee62c319e",
"assets/lib/Presentation%2520Layer/Screens/HomePage/MaterialStores/MaterialStoresImages/MaterialStores.jpg": "cf5e876f9213a944a0861d42d14f8eb2",
"assets/lib/Presentation%2520Layer/Screens/HomePage/SBProjectPortfolio/ProjectPortfolioImages/PP1.jpg": "dd28b98554ff3c556e89e47ade89075c",
"assets/Logo/accept.png": "0ed3d52207dfb6cbcb2f05e6b89eae50",
"assets/Logo/Avatar.png": "6f6bbb16aec97391aefe120ec5a4e6a2",
"assets/Logo/ChatLogo.png": "44d8132740b0a40f587290bf15b2ebb0",
"assets/Logo/CNIC.png": "557c040a1e067ca84a75b6e007d9d71a",
"assets/Logo/coverPhoto.png": "9edebabe75c2b5a0576937da22fac0c6",
"assets/Logo/keys.png": "3007d6d87a94719d784affa29cdd0b32",
"assets/Logo/logout.png": "9973c8071a65dae2724febd2449556c1",
"assets/Logo/NiceWork.png": "e04700a5de506fc7b7559e62c247192f",
"assets/Logo/notification.png": "f81d8671e06b3a5ae4848b2aaf1e4eee",
"assets/Logo/Pakistan.png": "8cc87b0426a5312fa4b0023dbcb8d381",
"assets/Logo/Plus.png": "57cceb014dc13170f56f896058ba099e",
"assets/Logo/portfolio.png": "16e7dcebb5552f0d0c0ac022d9b1932a",
"assets/Logo/question.png": "f2e42872473cd22e2b5e755924b19108",
"assets/Logo/setting.png": "21ed9db7c3062920ff69f75e63ea05a9",
"assets/Logo/setting1.png": "31900cdc5e46630cef5a4580ceaac23f",
"assets/Logo/smartBuilderLogo.png": "55fbd618315ecb2113a5b692569c7b2f",
"assets/Logo/white.jpg": "175eed0dac3b36933f94f5ee11e9c537",
"assets/NOTICES": "072688de1c32708ce057bf4015c654c3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/PreviewProfilePic/edit.png": "8d93b3f5d57408aa3e37dbb222a3732e",
"assets/PreviewProfilePic/placeholder.png": "cfc4da7810da241e0e6b2d8f3772ef84",
"assets/PreviewProfilePic/Welcome.png": "dda791632710329b4b766ca2541455ed",
"assets/ProjectImages/1.jpg": "c4aeea8d4799579e6e9718db8c929a8b",
"assets/ProjectImages/2.jpg": "e5e6b69cfb3d2f4b190a6cc68932f3ab",
"assets/ProjectImages/3.jpg": "12780438e83dfe8627cf3b88b06bb8fb",
"assets/ProjectImages/4.jpg": "61161ca472f1559f53d80ee8df563597",
"assets/ProjectImages/5.jpg": "2e59d77bf455dab23a5c37ae437a11d3",
"assets/ProjectImages/6.jpg": "336d8e1aaf05da8dc78f4552fe550fff",
"assets/ProjectImages/7.jpg": "82d3d0a0de92b6a3a7451616548c297e",
"assets/ProjectImages/8.jpg": "b9431635d7e95ccd1851b6f29f5f1710",
"assets/RecentBlogImages/1.jpg": "98264ea090a977782d706750ac486875",
"assets/RecentBlogImages/2.jpg": "5167eb547ceb924a04d2dbbba680730d",
"assets/RecentBlogImages/3.jpg": "9bd8d401153708748b9ab1af162fee51",
"assets/RecentBlogImages/4.jpg": "83ffff6bb68a791e4a47fcf2aa64412e",
"assets/RecentBlogImages/admin.png": "eb745fe7f3fb6fad59de4de41519a047",
"assets/RecentBlogImages/comments.png": "4e8d947a5a677d39b09c401bbcb1667d",
"assets/TestomonialClientsImages/T-Clients.jpg": "4abb4238f4f938832b2ebcf0e79d12fb",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "11d3477a7c00f9354c71eb5b0d45d688",
"/": "11d3477a7c00f9354c71eb5b0d45d688",
"main.dart.js": "40c8c2ed154c9f5f5903553ca80c7a3d",
"manifest.json": "afb052cd6355cf17e74ccf70efb44e82",
"version.json": "a0b0d91e66a28ed5b25d574bc3691001"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
