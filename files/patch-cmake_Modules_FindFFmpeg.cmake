--- cmake/Modules/FindFFmpeg.cmake.orig	2024-05-21 19:41:04 UTC
+++ cmake/Modules/FindFFmpeg.cmake
@@ -80,7 +80,7 @@ function(find_ffmpeg LIBNAME)
     )
   else()
     list(APPEND INCLUDE_PATHS
-      /usr/local/include/ffmpeg
+      /usr/local/ffmpeg3/include
       /usr/local/include/lib${LIBNAME}
       /usr/include/ffmpeg
       /usr/include/lib${LIBNAME}
@@ -88,7 +88,7 @@ function(find_ffmpeg LIBNAME)
     )
 
     list(APPEND LIB_PATHS
-      /usr/local/lib
+      /usr/local/ffmpeg3/lib
       /usr/lib
     )
   endif()
