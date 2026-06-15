local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("servers.lua_ls")(capabilities)
require("servers.bash_ls")(capabilities)
require("servers.ts_ls")(capabilities)

