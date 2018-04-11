# -*- ruby -*-

require 'rake/clean'


CLEAN.include(['*.aux', '*.bcf', '*.blg', '*.out','*.toc', '*.spl',
               '*.fdb_latexmk', '*.fls', '*.nav', '*.snm'])

CLOBBER.include(['*.log', '*.bbl', '*.run.xml', '*.synctex.gz', '*.synctex',
                 'auto/', 'poster.pdf'])

rule ".pdf" => ".tex" do |t|
  # add the folders fig and style with all there sub-folders (recursively) to
  # TEXINPUTS so TeX can find the styles and figures ...
  ENV['TEXINPUTS'] = './fig//' + File::PATH_SEPARATOR + './style//' + File::PATH_SEPARATOR + './code//' + File::PATH_SEPARATOR
  # call latexmk
  sh "latexmk -pdf -pdflatex=\"pdflatex -synctex=1\" #{t.source}"
  # parse log
  pprint_ltx_log("#{t.source}".sub(/\.tex$/, '.log'))
end

task :default do
  puts ""
  puts "Hello from rake"
  puts "Targets are"
  puts " - makepdf : to generate the pdf, the tex file has to be named poster.tex"
  puts " - clean   : to remove most temporary files, except the pdf and logs ..."
  puts " - clobber : to remove most temporary files"
  puts ""
end

# force run of latexmk, will handle dependencies automatically
task :makepdf => 'poster.pdf' do
  Rake::Task['poster.pdf'].execute
end

def pprint_ltx_log(fname)
  file = File.open(fname, "rb")  # if I don't read it binary I get UTF-8 encoding
                                 # errors, this doesn't convert line endings

  puts("\n" * 3)
  puts("#" * 78)
  puts("##   Parsing Log")
  puts("#" * 78)
  puts()

  found = false
  cntr = 0
  box_cntr = 0
  file.each_line do |line|
    if /(((Overfull|Underfull)).*\\[hv]box)/ =~ line
      # puts(line)
      box_cntr += 1
    end
    if /(((Package)|(LaTeX)).*((Warning)|(Error)))/ =~ line
      puts(line)
      found = true
      cntr += 1
    elsif found
      # check for unix and windows line endings
      if line.start_with?("\n") or line.start_with?("\r")
        found = false
        puts()
      else
        puts(line)
      end
    end
  end

  file.close()

  puts("#" * 78)
  puts("##   Done")
  puts("##")
  puts("##   I found %d Warnings and %d Over-/Underfull boxes!!" %[cntr, box_cntr])
  puts("##   FYI: They normally come for a reason.")
  puts("#" * 78)
  puts("\n" * 2)
end
