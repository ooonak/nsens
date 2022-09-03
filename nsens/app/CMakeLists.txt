add_executable(nsensservice main.cpp)

target_link_libraries(nsensservice PRIVATE nsens::nsens)
install(TARGETS nsensservice DESTINATION bin)
