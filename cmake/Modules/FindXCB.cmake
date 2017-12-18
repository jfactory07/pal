set(_XCB_SEARCHES)

# Search XCB_ROOT first if it is set.
if(XCB_ROOT)
  set(_XCB_SEARCH_ROOT PATHS ${XCB_ROOT} NO_DEFAULT_PATH)
  list(APPEND _XCB_SEARCHES _XCB_SEARCH_ROOT)
endif()

list(APPEND _XCB_SEARCHES _XCB_SEARCH_NORMAL)

find_path(XCB_INCLUDE_PATH xcb/xcb.h ${_XCB_SEARCHES})
find_path(XCB_DRI3_INCLUDE_PATH xcb/dri3.h ${_XCB_SEARCHES})
find_path(XCB_DRI2_INCLUDE_PATH xcb/dri2.h ${_XCB_SEARCHES})
find_path(XCB_PRESENT_INCLUDE_PATH xcb/present.h ${_XCB_SEARCHES})

if(XCB_INCLUDE_PATH AND XCB_DRI3_INCLUDE_PATH AND XCB_DRI2_INCLUDE_PATH AND XCB_PRESENT_INCLUDE_PATH)
    set(XCB_FOUND 1)
    set(XCB_INCLUDE_DIRS ${XCB_INCLUDE_PATH} ${XCB_DRI3_INCLUDE_PATH} ${XCB_DRI2_INCLUDE_PATH} ${XCB_PRESENT_INCLUDE_PATH})
    message(STATUS "Found XCB: ${XCB_INCLUDE_DIRS}")
endif ()