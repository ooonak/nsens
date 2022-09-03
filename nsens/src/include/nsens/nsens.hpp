#pragma once

#include <string>

namespace nsens
{

class NSens
{
 public:
  explicit NSens(std::string configFile);

  static void version();

 private:
  std::string mConfigFile;
};

}  // namespace nsens
