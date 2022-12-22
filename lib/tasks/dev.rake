require 'tty-spinner'
# rails dev:setup
namespace :dev do
    desc 'Setup dev environment'
    task setup: :environment do
        if Rails.env.development?
            spinner = TTY::Spinner.new('[:spinner] Setup Loading ...')
            spinner.auto_spin
            `rails db:drop db:create db:migrate db:seed`
            `rails dev:add_default_admin`
            `rails dev:add_default_user`
            spinner.success('(successful)')
        end
    end

  private

    desc 'Add default admin'
    task add_default_admin: :environment do
      Admin.create!(
        email: 'admin@admin.com',
        password: '123@456@789',
        password_confirmation: '123@456@789'
      )
    end

    desc 'Add default user'
    task add_default_user: :environment do
      User.create!(
        email: 'user@user.com',
        password: '123@456@789',
        password_confirmation: '123@456@789'
      )
    end
end
