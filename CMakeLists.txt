cmake_minimum_required(VERSION 2.8)

set(PROJECTNAME Walnut)

project(${PROJECTNAME})
set(CMAKE_LIBRARY_PATH /lib)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

if(WIN32)

endif(WIN32)
if(APPLE)
    include_directories(/usr/local/include)
    link_directories(/usr/local/lib)
        
    SET(CMAKE_FIND_LIBRARY_PREFIXES "cyg" "lib")
    SET(CMAKE_FIND_LIBRARY_SUFFIXES ".dll" ".dll.a" ".a")
    
    set(MACOSX_BUNDLE YES)
    set(MACOSX_BUNDLE_BUNDLE_NAME ${PROJECTNAME})
    set(MACOSX_BUNDLE_INFO_STRING "${PROJECTNAME} 1.0")
    set(MACOSX_BUNDLE_LONG_VERSION_STRING "1.0")
    set(MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0")
    set(MACOSX_BUNDLE_BUNDLE_VERSION "1.0")
    set(EXECUTABLE_TYPE MACOSX_BUNDLE)
endif(APPLE)
if(LINUX)
    set(EXECUTABLE_TYPE "")
endif(LINUX)

file(GLOB FILES_SRC
    "src/*.cpp"
)
file(GLOB FILES_HEADERS
    "include/*.h"
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
set(PROJECT_FILES ${SOURCES} ${HEADERS})

add_library(${PROJECTNAME} STATIC ${SOURCES} ${FILES_SRC} ${FILES_HEADERS})
install(TARGETS ${PROJECTNAME} DESTINATION /usr/lib)
set_target_properties(${PROJECTNAME} PROPERTIES LINKER_LANGUAGE CXX)

add_subdirectory(sample)

if (APPLE)
#set_target_property(${PROJECTNAME} PROPERTIES XCODE_ATTRIBUTE_PRODUCT_NAME ${PROJECTNAME})
endif()
