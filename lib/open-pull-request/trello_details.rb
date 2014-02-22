require 'trello'
require 'active_support/core_ext/string'
require 'term/ansicolor'

class TrelloDetails
  def initialize(card_id, developer_public_key, member_token)
  	@trello_client = ::Trello::Client.new(
  	  developer_public_key: developer_public_key,
  	  member_token: member_token
  	)
  	@card = @trello_client.find(:card, card_id)
  end

  def pull_request_description
  	log "Finding your project and story "
  	desc = "##### Trello card\n"
  	desc << "**#{@card.name}** - #{@card.url}\n"
  	log "."
  	desc << "#{@card.desc}\n"
  	log "."
  	desc << "\n"
  	desc << "##### Members\n"
  	log "."
    desc << @card.members.map{ |m| "- #{m.full_name}" }.join("\n")
    desc << "\n\n"
    log "."
  	@card.checklists.each do |checklist|
  	  desc << build_checklist_description(checklist)
  	  log ".\n"
  	  desc << "\n"
    end
    desc
  end

  private
  def build_checklist_description(checklist)
  	desc = "##### #{checklist.name}\n"
  	desc << checklist.check_items.map{|c|"- #{c["name"]}"}.join("\n")
  end

  def log(msg)
  	m = Term::ANSIColor.green(msg)
  	print m
  end
end