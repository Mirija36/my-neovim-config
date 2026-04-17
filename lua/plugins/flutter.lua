return {
  'akinsho/flutter-tools.nvim',
  lazy = false, -- On ne veut pas de délai pour Flutter
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- Pour avoir de beaux menus de sélection (UI)
  },
  config = function()
    -- On lance la configuration du plugin
    require("flutter-tools").setup({
      ui = {
        -- Utilise des bordures arrondies pour les fenêtres flottantes
        border = "rounded",
        -- Utilise les notifications natives de Neovim
        notification_style = "native",
      },
      decorations = {
        statusline = {
          -- Affiche la version de l'app et l'appareil dans ta barre de statut
          app_version = true,
          device = true,
        }
      },
      widget_guides = {
        enabled = true, -- Affiche les lignes verticales entre les widgets
      },
      closing_tags = {
        highlight = "ErrorMsg", -- Colore les commentaires de fin de tag (ex: // Container)
        prefix = "> ",          -- Ajoute un petit préfixe
        enabled = true,
      },
      lsp = {
        color_render = true, -- Affiche les couleurs (hex) directement dans l'éditeur
        -- On récupère les capacités par défaut de nvim-cmp pour l'autocomplétion
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "always",
          enableSnippets = true,
        },
      },
    })
  end,
}
