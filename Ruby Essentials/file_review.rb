require 'fileutils'

class FileReview
  attr_reader :files_here

  def initialize
    @files_here = Dir.entries('.')
    puts "What would you like the archive directory to be named?"
    print "> "
    @folder_name = $stdin.gets.chomp()
    puts "How many days old should a file be before it is archived?"
    print "> "
    # converting days into seconds
    @days_old = $stdin.gets.chomp().to_i * 86400
    until @operation_mode == "1" || @operation_mode == "2" || @operation_mode == "3" 
      puts "Select operation mode:"
      puts "'1' to move files only (no directories)"
      puts "'2' to move directories only (no files)"
      puts "'3' to move files and then directories"
      print "> "
      @operation_mode = $stdin.gets.chomp()
    end

    if @operation_mode == "1"
      puts "> execute in file-only mode"
      puts ""
      move_old_files()
    elsif @operation_mode == "2"
      "> execute in directory-only mode"
      puts ""
      move_old_directories()
    elsif @operation_mode == "3"
      "> execute in file mode, then directory mode"
      puts ""
      move_old_files()
      move_old_directories()
    else
      # there should be no way to get here
    end
  end

  def show_files
    puts ""
    # puts "-------- Files in This Directory -----------"
    # puts "-" * 44
    puts "----- Last Accessed ----- || -- File Name --"
    print "-" * 25
    print " || "
    puts "-" * 15
    @files_here.each do |file|
      if file[0] != '.' && File.file?(file)
        puts File.mtime(file).to_s + " || " + file
      end
    end
    puts ""
  end

  def show_directories
    puts ""
    puts "----- Last Accessed ----- || -- Directory Name --"
    print "-" * 25
    print " || "
    puts "-" * 20
    @files_here.each do |file|
      if file[0] != '.' && File.directory?(file)
        puts File.mtime(file).to_s + " || " + file
      end
    end
    puts ""
  end

  def create_folder
    unless File.exist?("./#{@folder_name}") && File.directory?("./#{@folder_name}")
      Dir.mkdir(@folder_name)
    end
  end

  def move_old_files
    moved_files = 0
    @files_here.each do |file|
      if file[0] != '.' && File.file?(file) && file != __FILE__ && File.mtime(file).to_i <= (Time.now - @days_old).to_i
        create_folder()

        # handle duplicate file names 
        Dir.chdir("./#{@folder_name}")
        if File.exist?(file)
          extension = File.extname(file)
          new_name = File.basename(file, ".*") + "_copy"
          File.rename(file, new_name + extension)
        end
        Dir.chdir("..")

        FileUtils.move(file, "./#{@folder_name}")
        response = "**** Moving file: '#{file}' to the '#{@folder_name}' directory. ****"
        puts "*" * response.length
        puts response
        puts "*" * response.length
        moved_files += 1
      end
    end

    if moved_files == 0
      response = "**** No files were moved at this time ****"
      puts "*" * response.length
      puts response
      puts "*" * response.length
    end
    show_files()
  end

  def move_old_directories
    moved_files = 0
    @files_here.each do |file|
      if file[0] != '.' && File.directory?(file) && file != __FILE__ && File.mtime(file).to_i <= (Time.now - @days_old).to_i
        create_folder()

        # handle duplicate file names 
        Dir.chdir("./#{@folder_name}")
        if File.exist?(file)
          extension = File.extname(file)
          new_name = File.basename(file, ".*") + "_copy"
          File.rename(file, new_name + extension)
        end
        Dir.chdir("..")

        FileUtils.move(file, "./#{@folder_name}")
        response = "**** Moving directory: '#{file}' to the '#{@folder_name}' directory. ****"
        puts "*" * response.length
        puts response
        puts "*" * response.length
        moved_files += 1
      end
    end

    if moved_files == 0
      response = "**** No directories were moved at this time ****"
      puts "*" * response.length
      puts response
      puts "*" * response.length
    end
    show_directories()
  end
end

my_file_review = FileReview.new()