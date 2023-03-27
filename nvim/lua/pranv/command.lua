vim.api.nvim_create_user_command(
    'Tsp',
    function(opts)
        if  opts.args=='v' then
            vim.cmd [[vsp | term]]
        elseif opts.args=='h' then
            vim.cmd [[hsp | term]]
        end
    end,
    { nargs = 1 }
)

