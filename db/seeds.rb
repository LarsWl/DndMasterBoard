# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#

campaign = Campaign.create(name: 'campaign_1',
                           description: 'description ' * 30,
                           notes: 'notes ' * 30,
                           history: 'history ' * 30)

1.upto 3 do |i|
  chapter = Chapter.create(name: "chapter_#{i}",
                           campaign: campaign,
                           notes: 'notes ' * 30,
                           description: 'description ' * 30)

  1.upto 2 do |j|
    act = Act.create(name: "act_#{j}", chapter: chapter)
    NotPlayableCharacter.create(name: "npc_#{i * j}", act: act, campaign: campaign)
  end
end
