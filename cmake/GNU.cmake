
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fcray-pointer -ffree-line-length-none -fno-range-check -fbacktrace")

if(${CMAKE_Fortran_COMPILER_VERSION} VERSION_GREATER_EQUAL 10)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fallow-argument-mismatch -fallow-invalid-boz")
endif()

if(DEBUG)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O0 -ggdb -fno-unsafe-math-optimizations -frounding-math -fsignaling-nans -ffpe-trap=invalid,zero,overflow -fbounds-check")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -ggdb")
    add_definitions(-DDEBUG)
elseif(REPRO)
    if (APPLE)
        set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O0 -ggdb -fno-range-check")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -ggdb")
    else()
        set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2 -ggdb -fno-range-check")
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -ggdb")
    endif()
    add_definitions(-DREPRO)
else()
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2 -fno-range-check")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2")
endif()

if(NOT 32BIT)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fdefault-real-8 -fdefault-double-8")
endif()
