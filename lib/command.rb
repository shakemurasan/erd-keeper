require "thor"
require "erd-keeper"

class Command < Thor
  default_command :generate

  desc "generate", "generate ER diagrams."
  method_option :input,
                type: :string,
                default: "erd-keeper.yml",
                desc: "Specify the path of the configuration file"
  method_option :output,
                type: :string,
                default: ".",
                desc: "Specify the path of the output file"
  def generate
    ErdKeeper::GenerateErd.new.exec(options[:input], options[:output])
  end
end
