return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- Active le plugin au démarrage de Neovim
      execution_message = {
        message = function()
          return "AutoSave: sauvegardé à " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.18,               -- Assombrit le message dans la ligne de commande pour la discrétion
        cleaning_interval = 1000, -- Temps d'affichage du message en millisecondes
      },
      -- Événements Neovim qui déclenchent la tentative de sauvegarde
      trigger_events = { "InsertLeave", "TextChanged" },
      -- Conditions de sécurité pour éviter de sauvegarder n'importe quoi
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        -- On ne sauvegarde que si le buffer est modifiable ET qu'on n'est pas dans un type de fichier exclu
        if fn.getbufvar(buf, "&modifiable") == 1 and
            utils.not_in(fn.getbufvar(buf, "&filetype"), { "gitcommit", "harpoon", "NvimTree" }) then
          return true            -- Sauvegarde autorisée
        end
        return false             -- Sauvegarde refusée
      end,
      write_all_buffers = false, -- Sauvegarde uniquement le fichier sur lequel tu es actif
      debounce_delay = 200,      -- Patiente 200ms après ta frappe avant d'écrire. Crucial pour ne pas spammer le hot-reload de Flutter !
    })
  end,
}
