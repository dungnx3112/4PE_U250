#pragma once
/**
 * Minimal boost/any.hpp fallback shim for compiling XRT Native API headers
 * with compilers where __cplusplus < 201703L (such as GCC 6.2.0 on CentOS 7)
 * when system boost-devel is not installed.
 */

#if defined(__has_include)
#  if __has_include(<any>)
#    include <any>
     namespace boost {
         using any = std::any;
         using bad_any_cast = std::bad_any_cast;
         using std::any_cast;
     }
#  elif __has_include(<experimental/any>)
#    include <experimental/any>
     namespace boost {
         using any = std::experimental::any;
         using bad_any_cast = std::experimental::bad_any_cast;
         using std::experimental::any_cast;
     }
#  else
#    error "Neither <any> nor <experimental/any> found. Please use GCC >= 6 or install boost-devel."
#  endif
#else
#  include <experimental/any>
   namespace boost {
       using any = std::experimental::any;
       using bad_any_cast = std::experimental::bad_any_cast;
       using std::experimental::any_cast;
   }
#endif
