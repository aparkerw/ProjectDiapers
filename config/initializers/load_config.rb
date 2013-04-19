# Load Facebook Configuration
SITE_CONFIG = YAML.load_file(File.join(Rails.root, 'config','site.yml'))[Rails.env]
