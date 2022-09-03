find_program(MEMORYCHECK_COMMAND valgrind)
set(MEMORYCHECK_COMMAND_OPTIONS "--trace-children=yes --leak-check=full")

set(CTEST_CUSTOM_COVERAGE_EXCLUDE ${CTEST_CUSTOM_COVERAGE_EXCLUDE} _deps/*)
