# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# /app/assets
Rails.application.config.assets.precompile += %w( admins_backoffice.js
                                                  admins_backoffice.css
                                                  users_backoffice.js
                                                  users_backoffice.css
                                                  admin_devise.js
                                                  admin_devise.css
                                                  site.js
                                                  site.css)
# /lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.min.js
                                                  sb-admin-2.min.css
                                                  custom.css
                                                  custom.js
                                                  img.jpg
                                                  admin_devise.svg
                                                  user_devise.svg
                                                  styles.css
                                                  scripts.js
                                                  navbar-logo.svg
                                                  close-icon.svg
                                                  concurso.jpg
                                                  Kelvin.jpg
                                                  bootstrap.bundle.min.js)
# /vendor/assets 
Rails.application.config.assets.precompile += %w( jquery-2.2.4/dist/jquery.min.js )
