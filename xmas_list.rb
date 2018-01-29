require 'open-uri'
require 'nokogiri'

def display_list(list)
  return "Your list is empty!" if list.empty?

  string = ""
  list.each do | item, status |
    check = status ? 'X' : ' '
    string << "#{list.keys.index(item) + 1} - [#{check}] #{item}\n"
  end
  string + "\n"
end

def run_xmas_app()
  #welcome user
  puts "Welcome to your Christmas gift list!\n\n"

  action_menu = "Which action [ list | add <item> | delete <item> | idea <item> | quit ]?"
  action_menu_mark = "Which action [ list | add <item> | mark <item> | unmark <item> | delete <item> | idea <item> | quit ]?"

  puts action_menu
  print "> "
  action = gets.chomp

  list = Hash.new(false)

  while action.split(" ")[0] != "quit"
    case action.split(" ")[0]
      when "list"
        puts display_list(list)
      when "add"
        new_item = action.split(" ")[1].capitalize
        list[new_item] = false
        puts "#{new_item.capitalize} added\n\n"
      when "delete"
        del_item = action.split(" ")[1].capitalize
        res = list.delete del_item
        puts res.nil? ? "No #{del_item} present\n\n" : "#{del_item.capitalize} deleted\n\n"
      when "mark"
        mark_item = action.split(" ")[1].capitalize
        if list.key?(mark_item)
          list[mark_item] = true
          puts "#{mark_item.capitalize} marked\n\n"
        else
          puts "No #{mark_item} present\n\n"
        end
      when "unmark"
        unmark_item = action.split(" ")[1].capitalize
        if list.key?(unmark_item)
          list[unmark_item] = false
          puts "#{unmark_item.capitalize} unmarked\n\n"
        else
          puts "No #{unmark_item} present\n\n"
        end
      when "idea"
        idea_item = action.split(" ")[1].capitalize
        items_wanted =  action.split(" ")[2].nil? ? 5 : action.split(" ")[2].to_i
        search = scrape_etsy(idea_item)
        # (0..items_wanted-1).each { |i| list.key?(search[i]) ? list[search[i] + " - (#{i})"] = false : list[search[i]] = false }
        searc_string = ""
        search[0..items_wanted-1].each_with_index do | item, index |
          searc_string  << "#{index + 1} - #{item}\n"
        end
        puts searc_string + "\n"
        # end
        # puts
      else
        puts "Unknown action. Please choose again\n\n"
    end
    puts list.empty? ? action_menu : action_menu_mark
    print "> "
    action = gets.chomp
  end

  puts "Goodbye!"
end

def scrape_etsy(item)
  # puts "What are you searching on Etsy?"

  # 1. We get the HTML page content thanks to open-uri
  html_content = open("https://www.etsy.com/search?q=#{item}").read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)

  returned = []
  # 3. We search for the correct elements containing the items' title in our HTML doc
  doc.search('.text-gray.text-truncate.mb-xs-0.text-body').each do |element|
    # 4. For each item found, we extract its title and print it
    #content > div > div.content.bg-white.col-md-12.pl-xs-1.pr-xs-0.pr-md-1.pl-lg-0.pr-lg-0.bb-xs-1 > div > div > div.col-group.pl-xs-0.search-listings-group > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > a > div.v2-listing-card__info > p.text-gray.text-truncate.mb-xs-0.text-body
    returned << element.text.strip
  end
  returned
end

run_xmas_app
