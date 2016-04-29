require 'yaml'

def output_erd(diagram_name = "erd", models = nil)
  if models.nil?
    system "bundle exec erd --filetype=png"
  else
    system "bundle exec erd --only='#{models.join(",")}' --filename=#{diagram_name} --filetype=png"
  end
end

load_yaml = YAML.load_file("erd.yml")

diagrams = load_yaml["diagrams"]

diagrams.each do |diagram_name , diagram|
  models = diagram.map { |m| m }
  output_erd(diagram_name, models)
end
