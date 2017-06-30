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
#Adicionei site/profile.js e site/profile.css pois são arquivos criados manualmente
Rails.application.config.assets.precompile += %w( site/profile/appointment.js
 												  site/profile.js
                                                  site.js 
                                                  backoffice.js ) #%w( site.js backoffice.js )

Rails.application.config.assets.precompile += %w( site/profile/appointment.css
												  site/profile.css 
												  site.css
												  backoffice.css )#%w( site.css backoffice.css )