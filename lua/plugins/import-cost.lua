function OS()
  return package.config:sub(1, 1) == "\\" and "win" or "unix"
end
return {
  "barrett-ruth/import-cost.nvim",
  -- build = "sh install.sh yarn",
  build = OS() == "win" and "pwsh install.ps1 npm" or "sh install.sh npm",
  -- if on windows
  -- build = 'pwsh install.ps1 yarn',
  config = true,
}
