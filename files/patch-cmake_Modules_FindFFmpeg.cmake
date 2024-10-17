--- cmake/Modules/FindFFmpeg.cmake.orig	2024-02-04 13:08:02 UTC
+++ cmake/Modules/FindFFmpeg.cmake
@@ -62,33 +62,27 @@ function(find_ffmpeg LIBNAME)
 
   if(FFMPEG_DIR)
     list(APPEND INCLUDE_PATHS
-      ${FFMPEG_DIR}
-      ${FFMPEG_DIR}/ffmpeg
-      ${FFMPEG_DIR}/lib${LIBNAME}
-      ${FFMPEG_DIR}/include/lib${LIBNAME}
-      ${FFMPEG_DIR}/include/ffmpeg
-      ${FFMPEG_DIR}/include
+      /usr/local/ffmpeg3/
+      /usr/local/ffmpeg3/include/lib${LIBNAME}
+      /usr/local/ffmpeg3/include
       NO_DEFAULT_PATH
       NO_CMAKE_FIND_ROOT_PATH
     )
     list(APPEND LIB_PATHS
-      ${FFMPEG_DIR}
-      ${FFMPEG_DIR}/lib
-      ${FFMPEG_DIR}/lib${LIBNAME}
+      /usr/local/ffmpeg3/
+      /usr/local/ffmpeg3/lib
+      /usr/local/ffmpeg3/lib${LIBNAME}
       NO_DEFAULT_PATH
       NO_CMAKE_FIND_ROOT_PATH
     )
   else()
     list(APPEND INCLUDE_PATHS
-      /usr/local/include/ffmpeg
-      /usr/local/include/lib${LIBNAME}
-      /usr/include/ffmpeg
-      /usr/include/lib${LIBNAME}
-      /usr/include/ffmpeg/lib${LIBNAME}
+      /usr/local/ffmpeg3/include
+      /usr/local/ffmpeg3/include/lib${LIBNAME}
     )
 
     list(APPEND LIB_PATHS
-      /usr/local/lib
+      /usr/local/ffmpeg3/lib
       /usr/lib
     )
   endif()
