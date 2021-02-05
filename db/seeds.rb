1.upto 10 do |i|
  user = User.new
  user.email = "email_#{i}@mail.ru"
  user.nickname = "nick_#{i}"
  user.password = '123123'
  user.save
end

user = User.first

campaign = Campaign.create(name: 'campaign_1',
                           description: 'description ' * 30,
                           notes: 'notes ' * 30,
                           history: 'history ' * 30)

campaign_member = CampaignMember.create(role: 'master', user: user, campaign: campaign)

1.upto 3 do |i|
  chapter = Chapter.create(name: "chapter_#{i}",
                           campaign: campaign,
                           notes: 'notes ' * 30,
                           description: 'description ' * 30)


  1.upto 2 do |j|
    act = Act.create(name: "act_#{j}", chapter: chapter, plot: 'plot ' * 30)
    e = Enemy.create(name: "enemy_#{i*j}", description: 'description ' * 30, campaign: campaign)
    mc = MasterCharacter.create(name: "master_character_#{i*j}", description: 'description ' * 30, campaign: campaign)
    act.enemies << e
    act.master_characters << mc
  end
end
