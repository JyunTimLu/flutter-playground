'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/main.dart.js": "7bab2b297ff51dbdd77d3f9a73368d28",
"/manifest.json": "b2f47b0233d82284b218c5e3a1197150",
"/index.html": "530b16fb5cf1816dceeb8b03cecb6f0e",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "7a0642f488fd6c27e945a0d540e234ac",
"/assets/LICENSE": "24c8b2ffa0d16bcd31f29acc23d4e263",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/assets/image_01.png": "071d6899cde078aeddf6c7b2f4986239",
"/assets/assets/illustration.png": "e3d14113d7c9dd9f60b6dc62bc3d3f6b",
"/assets/assets/starlux_1.jpg": "51c28afbffbe9dadf67e1b98a644840a",
"/assets/assets/starlux_4.jpg": "26d6919934395e59e9c53a318139cab1",
"/assets/assets/starlux_6.jpg": "8cec8f83ca56c2d63cac67f954c28fb8",
"/assets/assets/Poppins-Bold.ttf": "2f55e0d4b3f9eb3ffaefdac379fa3f8b",
"/assets/assets/Montserrat-Medium.ttf": "0098f804fc2d06af52650e0b8ed3390c",
"/assets/assets/starlux_3.jpg": "32d8cb276535fd68536dd3472dea80d7",
"/assets/assets/image_02.png": "36f863a3bfc50ca337836ed6867d34ff",
"/assets/assets/logo.png": "b026db8384b754d05a3e944091380d77",
"/assets/assets/starlux_5.jpg": "545fcc024afad8f6ab3018cd772c4e9d",
"/assets/assets/illustration3.png": "65da3e747772ac4fea5fe0bfa2984134",
"/assets/assets/illustration2.png": "a9ec60143df3c462c4d370a5f8152c0b",
"/assets/assets/starlux_7.jpg": "d5033e7e61cb2d131b96cfc9a5d30f74",
"/assets/assets/CustomIcons.ttf": "64caf37b7f49a015d499d4b2832df9d8",
"/assets/assets/starlux_2.jpg": "f237703f04ad1ffc3b23cc627a9b0144",
"/assets/assets/Montserrat-Black.ttf": "e3242149669bebf6afc4b0b5d22ec6ae",
"/assets/assets/Poppins-Medium.ttf": "5bfdccef795165b1f9ab9a3193b2aca1",
"/assets/AssetManifest.json": "9f85e5ee3258994bb76198a19a3544e7"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
