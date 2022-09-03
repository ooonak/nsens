#pragma once

#include "toml11/toml.hpp"

namespace nsens
{

struct Config
{
  std::string url;
  int port;
};

}  // namespace nsens

TOML11_DEFINE_CONVERSION_NON_INTRUSIVE(nsens::Config, url, port)
