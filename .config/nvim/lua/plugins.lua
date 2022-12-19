return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  -- themes
  use {
      'dracula/vim', 
      as = 'dracula',
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'}
  }
}

end)
