// Unique cache name per version
var cacheName = 'service-worker-v1';
// Files to cache
var contentToCache = [
  '/',
  '/css/site.css'
];

// Install service worker
self.addEventListener('install', function(e) {
  console.log('[Service Worker] Install');
  e.waitUntil(
    caches.open(cacheName).then(function(cache) {
      console.log('[Service Worker] Caching all: app shell and content');
      return cache.addAll(contentToCache);
    })
  );
});

// Fetch content using the service worker
self.addEventListener('fetch', function(e) {
  console.log('[Service Worker] fetch called');
  e.respondWith(
    caches.match(e.request).then(function(cachedValue) {
      console.log('[Service Worker] Fetching resource: ' + e.request.url);
      return cachedValue || fetch(e.request).then(function(response) {
        return caches.open(cacheName).then(function(cache) {
          console.log('[Service Worker] Caching new resource: ' + e.request.url);
          cache.put(e.request, response.clone());
          return response;
        });
      });
    })
  );
});

// self.addEventListener('fetch', event => {
//   console.log('[Service Worker] fetch called');
//   event.respondWith(
//     caches.open(cacheName)
//       .then(cache => cache.match(event.request, {ignoreSearch: true}))
//       .then(response => {
//       return response || fetch(event.request);
//     })
//   );
// });
