return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- fzf implémentation en C pour plus de rapidité
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {

        -- Parce que c'est joli
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<C-f>",
      builtin.current_buffer_fuzzy_find,
      { desc = "Fuzzy find dans le fichier actuel (Ctrl+F)" }
    )

    keymap.set(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "Recherche de chaînes de caractères dans les noms de fichiers" }
    )
    keymap.set(
      "n",
      "<leader>fg",
      builtin.live_grep,
      { desc = "Recherche de chaînes de caractères dans le contenu des fichiers" }
    )
    keymap.set(
      "n",
      "<leader>fb",
      builtin.buffers,
      { desc = "Recherche de chaînes de caractères dans les noms de buffers" }
    )
    keymap.set(
      "n",
      "<leader>fx",
      builtin.grep_string,
      { desc = "Recherche de la chaîne de caractères sous le curseur" }
    )
  end,
}
