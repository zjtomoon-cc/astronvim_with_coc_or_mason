local get_icon = require("astronvim.utils").get_icon

-- TODO:限制启动的高度
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "miversen33/netman.nvim" },
  opts = function(_, opts)
    local event_handlers = {}
    return require("astronvim.utils").extend_tbl(opts, {
      event_handlers = event_handlers,
      close_if_last_window = true,
      sources = {
        "filesystem",
        "netman.ui.neo-tree",
        "git_status",
      },
      source_selector = {
        sources = {
          { source = "filesystem", display_name = get_icon "FolderClosed" .. " File" },
          { source = "remote", display_name = "󰒍 Remote" },
          -- { source = "git_status", display_name = get_icon "Git" .. " Git" },
        },
      },
      filesystem = {
        filtered_items = {
          always_show = { ".github", ".gitignore" },
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            "noder_modules",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },

    })
  end,
}
