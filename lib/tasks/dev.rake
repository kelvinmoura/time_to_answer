namespace :dev do
  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      msg = ["Apagando DB....",
            "Criado DB....",
            "Migrando DB....",
            "Adiciona o administrador padrão",
            "Criando novos admins para teste",
            "Criando o usuário padrão",
            "Criando asssuntos",
            "Criando perguntas e respostas"]

      task = [%x(rails db:drop),
              %x(rails db:create),
              %x(rails db:migrate),
              %x(rails dev:add_default_admin),
              %x(rails dev:add_extra_admins),
              %x(rails dev:add_default_user),
              %x(rails dev:add_subjects),
              %x(rails dev:add_answers_and_questions)]

      8.times {|exc| show_spinner(msg[exc]) {task[exc]}}
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

  desc "Adicionar novos admins para teste"
  task add_extra_admins: :environment do
    30.times do |c|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona assuntos pedrões"
  task add_subjects: :environment do
    file_name = "subjects.txt"
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
    Subject.create!(description: line.strip)
    end
  end

  desc "Criando questões e respostas"
  task add_answers_and_questions: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do 
        Question.create!(
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject: subject
        )
      end
    end
  end


  def show_spinner(msg_start, msg_end = "Concluido com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin 
    yield 
    spinner.success("(#{msg_end})")
  end

end
