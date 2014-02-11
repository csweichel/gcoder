
module GCoder

  class Parser

    #
    # Rudimentary GCode parser that also maps the commands to their respective classes according to the dialect.
    #
    # Returns a GCode::Program containing the commands.
    #
    def parse(code, dialect = GCoder::Dialects::default)
      code = code.split("\n") unless code.is_a? Array

      commands = code.map do |caa|
        r = nil
        caa.strip!
        unless caa.empty?
          cmd, *args = caa.strip.split(" ")
          root_code = cmd[0...1]
          child_code = cmd[1..-1]
          args = args.inject({}) {|m,e| m[e[0...1].to_sym] = e[1..-1]; m }

          if root_code == '('
            r = GCoder::GCode::Comment.new(caa.strip[1...-1], {})
          else
            commands = dialect[root_code.to_sym]
            throw "Dialect does not support #{root_code} commands" if commands.nil?

            unless child_code.nil? or child_code.empty?
              cmd_class = commands[child_code.to_i]
              throw "Dialect does not support command: #{child_code}" if cmd_class.nil?

              r = eval("GCoder::GCode::#{cmd_class}").new(cmd, args)
            end
          end
        end
        r
      end.compact

      GCode::Program.new(commands)
    end

  end

end