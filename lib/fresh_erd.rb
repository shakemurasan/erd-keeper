require "yaml"
require "fresh_erd/version"

module FreshErd
  def self.exec(file)
    if File.exist?(file)
      load_yaml = YAML.load_file(file)
      diagrams = load_yaml["diagrams"]

      diagrams.each do |diagram_name , diagram|
        models = diagram.map { |m| m }
        output_erd(diagram_name, models)
      end
    else
      puts "--- File not found!"
      puts "--- Instead, it outputs for all models."
      system "bundle exec erd --title='All domain model' --filename=project --filetype=png"
    end
  end

  def self.output_erd(diagram_name = "erd", models = nil)
    return if models.nil?
    system "bundle exec erd --only='#{models.join(",")}' "\
           "--inheritance=true "\
           "--title='#{diagram_name}' "\
           "--filename=#{diagram_name} --filetype=png"
  end
end
