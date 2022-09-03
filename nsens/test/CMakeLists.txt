add_executable(nsensunittests nsenstests.cpp)

find_package(GTest REQUIRED)

target_link_libraries(nsensunittests
  PRIVATE
  nsens::nsens
  GTest::gtest_main
)

include(GoogleTest)

gtest_discover_tests(nsensunittests)
