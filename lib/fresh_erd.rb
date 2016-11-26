require "yaml"
require "fresh_erd/version"

module FreshErd
  class GenerateErd
    def exec(input, output)
      if Dir.exist?(output)
        while(output[-1] == "/")
          output.chop!
        end
      else
        puts "--- output: Folder not found!"
        puts "--- Stop the output of ERD."
        return
      end

      if File.exist?(input)
        generate_erd_by_setting(input, output)
      else
        puts "--- input: File not found!"
        puts "--- Instead, it outputs for all models."
        generate_project_erd(output)
      end
    end

    private

    def generate_erd_by_setting(input, output)
      load_diagrams(input).each do |diagram_name , diagram|
        puts "--- Generate ERD : #{diagram_name}"
        if diagram.nil?
          puts "--- #{diagram_name}: The models are not described!"
          next
        end
        models = diagram.map { |m| m }
        generate_domain_erd(diagram_name, models, output)
      end
    end

    def load_diagrams(yaml)
      load_yaml = YAML.load_file(yaml)
      load_yaml["diagrams"]
    end

    def generate_domain_erd(diagram_name = "erd", models = nil, folder = ".")
      system "bundle exec erd --only='#{models.join(",")}' "\
             "--inheritance=true "\
             "--title='#{diagram_name}' "\
             "--filename=#{folder}/#{diagram_name} --filetype=png"
    end

    def generate_project_erd(folder)
      system "bundle exec erd --title='All domain model' --filename=#{folder}/project --filetype=png"
    end
  end
end