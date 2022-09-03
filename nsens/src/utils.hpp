#pragma once

#include "fstream"
#include "filesystem"
#include "spdlog/spdlog.h"
#include "config.hpp"

namespace nsens
{

static bool writeDefaultConfig(std::string &filename)
{
  bool result = false;

  try {
    nsens::Config defaultConfig { .url = "localhost", .port = 443}; // NOLINT
    toml::value data;
    data["config"] = defaultConfig;

    std::ofstream file(filename);
    if (file.good())
    {
      file << data << std::endl;
      file.close();
      result = true;
    }
  }
  catch (const std::exception &e)
  {
    spdlog::error(e.what());
  }

  return result;
}

static bool readConfig(std::string &filename)
{
  bool result = false;

  try {
    const std::string defaultConfigurationFile = "nsens.conf";

    if (filename.empty())
    {
      filename = defaultConfigurationFile;
    }

    if (!std::filesystem::exists(filename))
    {
      if (filename == defaultConfigurationFile && !writeDefaultConfig(filename))
      {
        spdlog::error("Could not write default configuration to {}", filename);
      }

      if (filename != "nsens.conf")
      {
        spdlog::error("Could not read configuration from {}", filename);
      }
    }

    if (std::filesystem::exists(filename))
    {
      auto data = toml::parse(filename);
      const nsens::Config config = toml::find<nsens::Config>(data, "config");
      spdlog::info("Loaded configuration from {}", filename);
      result = true;
    }
  }
  catch (const std::exception &e)
  {
    spdlog::error(e.what());
  }

  return result;
}

}  // namespace nsens
