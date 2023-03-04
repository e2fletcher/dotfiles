local dap = require('dap')
local dap_go = require('dap-go')
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({})

dap_go.setup()

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 80,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 10,
            position = "bottom",
        },
    },
})

vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
    { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

-- Events Listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

local hydra = require("hydra")
local hint = [[
 Nvim DAP
 _d_: Start/Continue  _j_: StepOver _k_: StepOut _l_: StepInto ^
 _b_: Toogle Breakpoint ^
 _?_: log point ^
 _c_: Run To Cursor ^
 _h_: Show information of the variable under the cursor ^
 _x_: Stop Debbuging ^
 ^^                                                      _<Esc>_
]]

hydra({
    name = "dap",
    hint = hint,
    mode = "n",
    config = {
        color = "blue",
        invoke_on_body = true,
        hint = {
            border = "rounded",
            position = "bottom",
        },
    },
    body = "<leader>d",
    heads = {
        { "d", dap.continue },
        { "b", dap.toggle_breakpoint },
        { "l", dap.step_into },
        { "j", dap.step_over },
        { "k", dap.step_out },
        { "h", dapui.eval },
        { "c", dap.run_to_cursor },
        -- {
        --     "bc",
        --     function()
        --         vim.ui.input({ prompt = "Condition: " }, function(condition)
        --             dap.set_breakpoint(condition)
        --         end)
        --     end,
        -- },
        {
            "?",
            function()
                vim.ui.input({ prompt = "Log: " }, function(log)
                    dap.set_breakpoint(nil, nil, log)
                end)
            end,
        },
        {
            "x",
            function()
                dap.terminate()
                dapui.close({})
                dap.clear_breakpoints()
            end,
        },

        { "<Esc>", nil, { exit = true } },
    },
})

-- Rust Adapter
-- ==============
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = "lldb"
}

-- configure the adapter for C Debugging
dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'lldb',
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false
    }
}

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust
