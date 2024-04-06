## Using the cache framework
Processing HTTP requests to your web application usually entails database access, data manipulation, and template rendering. It is much more expensive in terms of processing than just serving a static website. The overhead in some requests can be significant when your site starts getting more and more traffic. This is where caching becomes precious. By caching queries, calculation results, or rendered content in an HTTP request, you will avoid expensive operations in the following requests that need to return the same data. This translates into shorter response times and less processing on the server side.

Django includes a robust cache system that allows you to cache data with different levels of granularity. You can cache a single query, the output of a specific view, parts of rendered template content, or your entire site. Items are stored in the cache system for a default time, but you can specify the timeout when you cache data.
### This is how you will usually use the cache framework when your application processes an HTTP request:
1- Try to find the requested data in the cache.

2- If found, return the cached data.

3- If not found, perform the following steps:
 - Perform the database query or processing required to generate the data.
 - Save the generated data in the cache.
 - Return the data.

You can read detailed information about Django’s cache system at https://docs.djangoproject.com/en/4.1/topics/cache/.


## Available cache backends
* Django comes with the following cache backends:
backends.memcached.PyMemcacheCache or backends.memcached.PyLibMCCache: Memcached backends. Memcached is a fast and efficient memory-based cache server. The backend to use depends on the Memcached Python bindings you choose.
* backends.redis.RedisCache: A Redis cache backend. This backend has been added in Django 4.0.
* backends.db.DatabaseCache: Use the database as a cache system.
* backends.filebased.FileBasedCache: Use the file storage system. This serializes and stores each cache value as a separate file.
* backends.locmem.LocMemCache: A local memory cache backend. This is the default cache backend.
* backends.dummy.DummyCache: A dummy cache backend intended only for development. It implements the cache interface without actually caching anything. This cache is per-process and thread-safe.