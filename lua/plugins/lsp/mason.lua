return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import de mason
    local mason = require("mason")
    -- import de mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- Active mason et personnalise les icônes
    mason.setup({
      registries = {
        'github:Crashdummyy/mason-registry',
        'github:mason-org/mason-registry',
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_enable = true,
      -- Liste des serveurs à installer par défaut
      -- List des serveurs possibles : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      -- Vous pouvez ne pas en mettre ici et tout installer en utilisant :Mason
      -- Mais au lieu de passer par :Mason pour installer, je vous recommande d'ajouter une entrée à cette liste
      -- Ça permettra à votre configuration d'être plus portable
      ensure_installed = {
        "cssls",
        "elmls",
        "graphql",
        "html",
        "lua_ls",
        "pylsp",
        "ruff",
        "rust_analyzer",
        "sqlls",
        "svelte",
        "ts_ls",
        "yamlls",
        --"roslyn",
        "lemminx"
      },
    })
    local registry = require("mason-registry")
    if not registry.is_installed("roslyn") then
      vim.cmd("MasonInstall roslyn")
    end
  end,
}
