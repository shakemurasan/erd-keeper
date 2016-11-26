require "yaml"
require "fresh_erd/version"

module FreshErd
  def self.exec(input, output)
    if Dir.exist?(output)
      while(output[-1] == "/")
        output.chop!
      end
    else
      puts "--- output: Folder not found!"
      puts "--- Stop the output of ER diagram."
      return
    end

    if File.exist?(input)
      load_yaml = YAML.load_file(input)
      diagrams = load_yaml["diagrams"]

      diagrams.each do |diagram_name , diagram|
        models = diagram.map { |m| m }
        output_erd(diagram_name, models, output)
      end
    else
      puts "--- input: File not found!"
      puts "--- Instead, it outputs for all models."
      system "bundle exec erd --title='All domain model' --filename=project --filetype=png"
    end
  end

  def self.output_erd(diagram_name = "erd", models = nil, folder = ".")
    return if models.nil?
    system "bundle exec erd --only='#{models.join(",")}' "\
           "--inheritance=true "\
           "--title='#{diagram_name}' "\
           "--filename=#{folder}/#{diagram_name} --filetype=png"
  end
end
