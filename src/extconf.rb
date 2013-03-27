#!ruby -s

require 'mkmf'
require 'rbconfig'

def main
  unless find_executable('bison')
    unless File.exist?('ripper.c') or File.exist?("#{$srcdir}/ripper.c")
      raise 'missing bison; abort'
    end
  end
  $objs = %w(ripper.o)
  $cleanfiles.concat %w(ripper.y ripper.c ripper.E ripper.output y.output eventids1.c eventids2table.c)
  $defs << '-DRIPPER'
  $defs << '-DRIPPER_DEBUG' if $debug
  $VPATH << '$(srcdir)/tools'
  $INCFLAGS << ' -I$(srcdir)'
  create_makefile 'ripper'
end

main
