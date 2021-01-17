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
    act = Act.create(name: "act_#{j}", chapter: chapter, plot: 'plot ' * 30)
    Enemy.create(name: "enemy_#{i*j}", description: 'description ' * 30, act: act)
    MasterCharacter.create(name: "master_character_#{i*j}", description: 'description ' * 30, act: act, campaign: campaign)
  end
end
