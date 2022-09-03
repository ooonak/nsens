#include "spdlog/spdlog.h"
#include "nng/nng.h"
#include "qcbor/qcbor.h"

#include "nsensconfig.hpp"
#include "nsens/nsens.hpp"

void nsens::NSens::version()
{
  spdlog::info("libnsens {}.{}.{}",
               NSENS_VERSION_MAJOR, NSENS_VERSION_MINOR, NSENS_VERSION_PATCH);
  spdlog::info("spdlog {}.{}.{}", SPDLOG_VER_MAJOR, SPDLOG_VER_MINOR, SPDLOG_VER_PATCH);
  spdlog::info("nng {}.{}.{}", NNG_MAJOR_VERSION, NNG_MINOR_VERSION, NNG_PATCH_VERSION);
  spdlog::info("QCBOR");
}
