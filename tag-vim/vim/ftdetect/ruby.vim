augroup RubySyn
  autocmd!
  autocmd BufNewFile,BufRead {Gemfile,Brewfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set filetype=ruby
augroup END
