#include "spdlog/spdlog.h"
#include "nng/nng.h"
#include "qcbor/qcbor.h"
#include "toml11/toml.hpp"

#include "nsensconfig.hpp"
#include "nsens/nsens.hpp"
#include "config.hpp"
#include "utils.hpp"

void nsens::NSens::version()
{
  spdlog::info("libnsens {}.{}.{}",
               NSENS_VERSION_MAJOR, NSENS_VERSION_MINOR, NSENS_VERSION_PATCH);
  spdlog::info("spdlog {}.{}.{}", SPDLOG_VER_MAJOR, SPDLOG_VER_MINOR, SPDLOG_VER_PATCH);
  spdlog::info("nng {}.{}.{}", NNG_MAJOR_VERSION, NNG_MINOR_VERSION, NNG_PATCH_VERSION);
  spdlog::info("toml11 {}.{}.{}", TOML11_VERSION_MAJOR, TOML11_VERSION_MINOR, TOML11_VERSION_PATCH);
  spdlog::info("QCBOR");
}

nsens::NSens::NSens(std::string configFile) : mConfigFile{std::move(configFile)}
{
  nsens::readConfig(mConfigFile);
}
