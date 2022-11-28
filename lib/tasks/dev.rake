namespace :dev do
  DEFAULT_PASSWORD = 123456

  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      msg = ["Apagando DB....","Criado DB....","Migrando DB....","Adiciona o administrador padrão","Adiciona o usuário padrão"]
      task = [%x(rails db:drop),%x(rails db:create),%x(rails db:migrate),%x(rails dev:add_default_admin),%x(rails dev:add_default_user)]
      5.times {|exc| show_spinner(msg[exc]) {task[exc]}}
    else
      puts "Você não está em modo de desenvolvimento"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  def show_spinner(msg_start, msg_end = "Concluido com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin 
    yield 
    spinner.success("(#{msg_end})")
  end

end
