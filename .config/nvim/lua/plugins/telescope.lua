return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup {
				defaults = {
					vimgrep_arguments = {
						'rg',
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--smart-case',
						'--hidden',
						'--glob',
						'!.git/**'
					},
					file_ignore_patterns = { "%.git/" },
				},
				pickers = {
					find_files = {
						find_command = {
							'rg',
							'--files',
							'--hidden',
							'--glob',
							'!.git/**'
						}
					}
				}
			}
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Find files' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<Leader>en', function()
				builtin.find_files {
					cwd = vim.fn.stdpath('config')
				}
			end, { desc = 'open neovim config' })
		end
	}
}
