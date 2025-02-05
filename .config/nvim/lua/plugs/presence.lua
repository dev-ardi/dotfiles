local function workspace(name)
  if name == "nvim" then
    return "Wasting time on my config"
  end

  if name == "rust" then
    return "Hacking away at the compiler!"
  end

  local pwd = vim.fn.getcwd()
  local is_work = pwd:match("/work[/$]")
  if is_work then
    return "Working on protonmail"
  end

  if name == "" or name == nil then
    local ws = pwd:match("^.+/(.+)/?$")
    if ws == "" then
      return "I hope you're having a great day :)"
    end
    return workspace(ws)
  end
  return "Working on " .. name
end

return {
  'IogaMaster/neocord',
  opts = {
    -- General options
    auto_update         = true,
    neovim_image_text   = "Average neovim enjoyer",
    main_image          = "neovim",             -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371", -- Use your own Discord application client id (not recommended)
    log_level           = "warn",              -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 5,                   -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                -- Displays the current line number instead of the current project
    blacklist           = {},                   -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                 -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                   -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                 -- Show the timer

    -- Rich Presence text options
    editing_text        = function(filename)
    local pwd = vim.fn.getcwd()
    local is_work = pwd:match("/work[/$]")
      if is_work then
        return "Check us out at proton.me!"
      end

      if string.sub(filename, -3) == ".rs" then
        return "Oxidizing " .. filename
      end
      if filename == "Cargo.toml" then
        return "Oxidizing the configuration"
      end

      if string.sub(filename, -4) == ".lua" then
        return "Configuring " .. filename
      end

      if string.sub(filename, -3) == ".md" then
        return "Writing docs " .. filename
      end
      return "Editing " .. filename
    end,

    file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = function(name) 
      if name == "nvim" then
        return "Wasting time on my config"
      end

      if name == "rust" then
        return "Hacking away at the compiler!"
      end

      if name == "" or name == nil then
        local pwd = vim.fn.getcwd()
        local ws = pwd:match("^.+/(.+)/?$")
        if ws == "" then
          return "I hope you're having a great day :)"
        end
        return workspace(ws)
      end
      return "Working on " .. name

    end,
    line_number_text    = "Line %s/%s",
  }
}
