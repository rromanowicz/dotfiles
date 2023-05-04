local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

local jdtls_path = "/home/ex/.local/share/nvim/mason/packages/jdtls/"
local config_path = "/home/ex/.config/nvim/ftplugin/"
local path_to_lsp_server = jdtls_path .. "config_linux"
local path_to_plugins = jdtls_path .. "plugins/"
local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local lombok_path = config_path .. "lombok.jar"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {
  autostart = true,
  cmd = {
    '/home/ex/.jdk/jdk-19.0.2/bin/java',
    '-javaagent:/home/ex/.config/nvim/ftplugin/lombok.jar',
    '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1045',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xms2G',
    '-jar', path_to_jar,
    '-configuration', path_to_lsp_server,
    '-data', workspace_dir,
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  },

  root_dir = root_dir,

  settings = {
        ['java.format.settings.url'] = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
    java = {
      home = '~/.jdk/jdk-19.0.2',
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-19",
            path = "~/.jdk/jdk-19.0.2",
          },
          {
            name = "JavaSE-11",
            path = "~/.jdk/amazon-corretto-11.0.16.8.1-linux-x64",
          }
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "jakarta",
        "com",
        "org"
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {
      vim.fn.glob(config_path .. "com.microsoft.java.debug.plugin-*.jar", 1)
    },
  },
}

config['on_attach'] = function(client, bufnr)
  require'jdtls'.setup_dap({ hotcodereplace = 'auto' })
  require'keymap'.map_java_keys(bufnr);
  require'lsp_signature'.on_attach({
    bind = true,
    floating_window_above_cur_line = false,
    padding = '',
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end


require('jdtls').start_or_attach(config)

require('commands')
