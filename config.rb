###
# Compass
###

# Bootstrap
# First:
#    gem install sass-rails
#    gem install bootstrap-sass

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
compass_config do |config|
#   config.output_style = :compact
  config.http_path = "/"
  config.images_dir = "img"
  config.javascripts_dir = "js"
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def nav_li(text, url)
    trailurl = url
    trailurl += '/' unless url == '/'
    if trailurl == current_page.url
      active = 'active'
    end
    content_tag :li, class: active do
      link_to(text, url)
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'js'

set :images_dir, 'img'

activate :directory_indexes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  set :http_path, "/img/"
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host = "cepheus.uberspace.de"
  deploy.path = "html"
  deploy.clean = true
  deploy.user = "ffddorf"
end
